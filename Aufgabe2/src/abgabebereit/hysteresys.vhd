--
--Hysterese-Schaltung:
--

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY hysteresys IS
   GENERIC(RSTDEF:  std_logic := '1';
           SAMPLES: natural := 5);
   PORT( rst:  IN std_logic;  -- reset, RSTDEF active
         clk:  IN std_logic;  -- clock, rising edge
         din_hys:  IN std_logic;  -- data input
         dout_hys: OUT std_logic; -- data output, Ausgang Hysterese-Schaltwerk
         en:   IN std_logic; -- enable, high active
         swrst:  IN  std_logic);  -- software reset, RSTDEF active
END hysteresys;


ARCHITECTURE hysteresys_behaviour OF hysteresys IS
   constant ZERO_VECTOR: std_logic_vector(SAMPLES-1 DOWNTO 0) := (others => '0');
   
      COMPONENT std_counter IS
      GENERIC(RSTDEF: std_logic;
              CNTLEN: natural);
      PORT(rst:   IN  std_logic;  -- reset,           RSTDEF active
           clk:   IN  std_logic;  -- clock,           rising edge
           en:    IN  std_logic;  -- enable,          high active
           inc:   IN  std_logic;  -- increment,       high active
           dec:   IN  std_logic;  -- decrement,       high active
           load:  IN  std_logic;  -- load value,      high active
           swrst: IN  std_logic;  -- software reset,  RSTDEF active
           cout:  OUT std_logic;  -- carry,           high active
           din:   IN  std_logic_vector(CNTLEN-1 DOWNTO 0);
           dout:  OUT std_logic_vector(CNTLEN-1 DOWNTO 0));
   END COMPONENT;
   
   signal state: std_logic;
   signal carry: std_logic;
   signal inc_hys: std_logic;
   signal dec_hys: std_logic;
   signal load_hys: std_logic;
   signal out_cnt_hys: std_logic_vector(SAMPLES-1 DOWNTO 0);
   
BEGIN
   
   hys_cnt: std_counter
   GENERIC MAP(RSTDEF => RSTDEF,
               CNTLEN => SAMPLES)
   PORT MAP(rst   => rst,
            clk   => clk,
            en    => en,
            inc   => inc_hys,
            dec   => dec_hys,
            load  => load_hys,
            swrst => swrst,
            cout  => carry,
            din   => ZERO_VECTOR,
            dout  => out_cnt_hys);
               
   dec_hys <= din_hys xnor state;       
   inc_hys <= din_hys xor state;        
   dout_hys <= state;
   
   
   process (rst, clk) begin
      if rst=RSTDEF then
			state <= '0';
      elsif rising_edge(clk) then
         if swrst=RSTDEF then
            state <= '0';
         elsif en='1' then
            if carry='1' then
               if out_cnt_hys(SAMPLES-1)='1' then 
                  load_hys<='1'; -- load Counter with 0
               else
                  state <= not state;
               end if;
            end if;
         else
            load_hys<='0';
         end if;
      end if;
   end process;
   
END hysteresys_behaviour;