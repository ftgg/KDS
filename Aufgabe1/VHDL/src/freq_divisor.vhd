-- 
-- Frequenzteiler
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;


ENTITY freq_divisor IS
   GENERIC (RSTDEF:  std_logic :='1';
            CNTLEN:  natural   := 15);
   PORT(rst:   IN    std_logic;
        clk:   IN    std_logic;
        swrst: IN    std_logic;
        en:    IN    std_logic;
        cout:  OUT   std_logic);
END freq_divisor;


ARCHITECTURE struktur OF freq_divisor IS


   COMPONENT edge_detector IS
   GENERIC (RSTDEF: std_logic);
   PORT    (rst: IN std_logic;   -- RESET
            clk: IN std_logic;   -- CLOCK
            din: IN std_logic;   -- DATA IN SIGNAL TO OBSERVE
            dout: OUT std_logic; -- DATA OUT SIGNAL TO OBSERVE
            redge: OUT std_logic;   -- RISING EDGE
            fedge: OUT std_logic);  -- FALLING EDGE
   END COMPONENT;
   
	signal cnt_reg: std_logic_vector(CNTLEN downto 0);
   signal redge: std_logic;
   signal fedge: std_logic;
   
BEGIN

   edge_event: edge_detector
   GENERIC MAP(RSTDEF => RSTDEF)
   PORT MAP    (rst => rst,
                clk => clk,
                din => cnt_reg(CNTLEN - 1),
                dout => open,
                redge => redge,
                fedge => fedge);

	process (rst, clk) begin
      if rst = RSTDEF then
         cnt_reg <= (others => '0');
      elsif rising_edge(clk) then
         if swrst=RSTDEF then
            cnt_reg <= (others => '0');
         elsif en='1' then
            cnt_reg <= cnt_reg + 1;
         end if;
         cout <= redge or fedge;  
      end if;
         
   end process;
END struktur;