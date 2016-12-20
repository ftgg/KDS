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
	signal cnt_reg: std_logic_vector(CNTLEN-1 downto 0); 
   signal cnt_sig: std_logic_vector(CNTLEN downto 0); 
BEGIN

	process (rst, clk) begin
      if rst = RSTDEF then
         cnt_sig <= (others => '0');
      elsif rising_edge(clk) then
         if swrst=RSTDEF then
            cnt_sig <= (others => '0');
         elsif en='1' then
            cnt_sig <= '0' & cnt_reg + 1;
         end if;
      end if;
      cout <= cnt_sig(CNTLEN);
      cnt_reg <= cnt_sig(CNTLEN-1 downto 0);   
   end process;
END struktur;