-- 
-- Frequenzteiler
-- period: 6.859ns 69 Slices
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;

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

   COMPONENT ADSU IS
      GENERIC(N: natural := CNTLEN);
      PORT(sub:   IN std_logic; -- = 0 for ADD, =1 for SUB
           cout:  OUT std_logic; -- carry output
           op1:   IN std_logic_vector(N-1 DOWNTO 0);
           op2:   IN std_logic_vector(N-1 DOWNTO 0);
           dout:  OUT std_logic_vector(N-1 DOWNTO 0));
   END COMPONENT;

	signal cnt_reg: std_logic_vector(CNTLEN-1 downto 0) := (others => '0');
   signal data: std_logic_vector(CNTLEN-1 downto 0);
   signal carry: std_logic;
   
BEGIN

   u1: ADSU
   GENERIC MAP(N => CNTLEN)
   PORT MAP(sub => '0',
            cout => carry,
            op1 => cnt_reg,
            op2 => std_logic_vector(to_unsigned(1,cnt_reg'length)),
            dout => data);

	process (rst, clk) begin
      if rst = RSTDEF then
         cnt_reg <= (others => '0');
      elsif rising_edge(clk) then
         if swrst=RSTDEF then
            cnt_reg <= (others => '0');
         elsif en='1' then
            cnt_reg <= data;
         end if;
         cout <= carry;  
      end if;
         
   end process;
END struktur;