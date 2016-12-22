LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY addierer_akku IS
   GENERIC(RSTDEF: std_logic := '0';
           OPLEN: natural := 36);
   PORT(rst:   IN  std_logic;                      -- reset,          RSTDEF active
        clk:   IN  std_logic;                      -- clock,          rising edge
        swrst: IN  std_logic;                      -- software reset, RSTDEF active
        en:    IN std_logic;
        op:   IN std_logic_vector(OPLEN-1 DOWNTO 0);
        dout:  OUT std_logic_vector(43 DOWNTO 0)); -- output Skalar
END addierer_akku;

ARCHITECTURE structure OF addierer_akku IS
   
COMPONENT ADSU IS
   GENERIC(N: natural := 8);
   PORT(sub:   IN std_logic; -- = 0 for ADD, =1 for SUB
        cout:  OUT std_logic; -- carry output
        op1:   IN std_logic_vector(N-1 DOWNTO 0);
        op2:   IN std_logic_vector(N-1 DOWNTO 0);
        dout:  OUT std_logic_vector(N-1 DOWNTO 0));
END COMPONENT;
   
   signal akkumulator: std_logic_vector(43 DOWNTO 0);
   signal next_akku: std_logic_vector(43 DOWNTO 0);

BEGIN

addierer: adsu
GENERIC MAP(N <= 44)
PORT MAP(sub <= '0',
         cout <= next_akku,
         op1 <= akkumulator,
         op2 <= op,
         dout <= next_akku);



dout <= akkumulator;




   process (rst, clk, swrst) is
      begin
         if rst = RSTDEF then
            akkumulator <= (others => '0');
         elsif rising_edge(clk) then
            if swrst = RSTDEF then
               akkumulator <= (others => '0');
            elseif en = '1' then
               akkumulator <= next_akku;
            end if;
         end if;
   end process;

END structure;