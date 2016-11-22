
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY hex4x7seg IS
   GENERIC(RSTDEF:  std_logic := '0');
   PORT(rst:   IN  std_logic;                       -- reset,           active RSTDEF
        clk:   IN  std_logic;                       -- clock,           rising edge
        en:    IN  std_logic;                       -- enable,          active high
        swrst: IN  std_logic;                       -- software reset,  active RSTDEF
        data:  IN  std_logic_vector(15 DOWNTO 0);   -- data input,      positiv logic
        dpin:  IN  std_logic_vector( 3 DOWNTO 0);   -- 4 decimal point, active high
        an:    OUT std_logic_vector( 3 DOWNTO 0);   -- 4 digit enable (anode control) signals,      active low
        dp:    OUT std_logic;                       -- 1 decimal point output,                      active low
        seg:   OUT std_logic_vector( 7 DOWNTO 1));  -- 7 FPGA connections to seven-segment display, active low
END hex4x7seg;


ARCHITECTURE struktur OF hex4x7seg IS
  -- hier sind benutzerdefinierte Konstanten und Signale einzutragen
	constant DIV_MAX : natural := 14;
	signal div_cnt : std_logic_vector(0 to DIV_MAX-1);
	signal select_cnt : std_logic_vector(0 to 1);
	
	signal an_x_tmp : std_logic_vector(0 to 3);
	signal output_digit : std_logic_vector(0 to 3);
	signal output_digit_tmp: std_logic_vector(0 to 3);
	signal seg_x_tmp : std_logic_vector(0 to 6);
	signal dp_tmp : std_logic;
	
BEGIN

   -- Modulo-2**14-Zaehler als Prozess
	process (rst,clk) begin
		if rst=RSTDEF then
			div_cnt <= (others => '0');
		elsif rising_edge(clk) then
			if swrst=RSTDEF then
				div_cnt <= (others => '0');
			elsif en='1' then
				div_cnt <= div_cnt + 1;
			end if;
		end if;
	end process;
   
   -- Modulo-4-Zaehler als Prozess
	process (rst, clk) begin
		if rst=RSTDEF then
			select_cnt <= (others => '0');
		elsif rising_edge(clk) then
			if swrst=RSTDEF then
				select_cnt <= (others => '0');
			elsif en='1' and div_cnt = 0 then
				select_cnt <= select_cnt + 1;
			else
				select_cnt <= select_cnt;
			end if;
		else
			select_cnt <= select_cnt;
		end if;
	end process;
		

   -- 1-aus-4-Dekoder als selektierte Signalzuweisung
	with select_cnt select
		an_x_tmp <= "0111" when "00",
					"1011" when "01",
					"1101" when "10",
					"1110" when others;
	an <= an_x_tmp when en='1' AND rst = NOT RSTDEF else (others => '1');
		
	
   -- 1-aus-4-Multiplexer als selektierte Signalzuweisung
	with select_cnt select
		output_digit_tmp <= data(3 downto 0) when "11",
							data(7 downto 4) when "10",
							data(11 downto 8) when "01",
							data(15 downto 12) when others;
	
	output_digit <= output_digit_tmp when en='1' else (others => '1');
   
   -- 7-aus-4-Dekoder als selektierte Signalzuweisung
	with output_digit select
		seg_x_tmp <= "0000001" when "0000",
					 "1001111" when "0001",
					 "0010010" when "0010",
					 "0000110" when "0011",
					 "1001100" when "0100",
					 "0100100" when "0101",
					 "0100000" when "0110",
					 "0001111" when "0111",
					 "0000000" when "1000",
					 "0000100" when "1001",
					 "0001000" when "1010",
					 "1100000" when "1011",
					 "0110001" when "1100",
					 "1000010" when "1101",
					 "0110000" when "1110",
					 "0111000" when "1111",
					 "0111110" when others;
   
   seg <= seg_x_tmp when en='1' else (others => '1');
   
   -- 1-aus-4-Multiplexer als selektierte Signalzuweisung
   -- 0 = DISP3 1=DISP2 ...
   --btn1 & btn1 & btn0 & btn0
   -- 2		3		0		1
   -- btn1 = DIsp 2,3
	with select_cnt select
		dp_tmp <= (NOT dpin(0)) when "11",
				  (NOT dpin(1)) when "10",
				  (NOT dpin(2)) when "01",
				  (NOT dpin(3)) when others;
	dp <= dp_tmp when en = '1' else '0';
	

END struktur;