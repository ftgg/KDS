LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;

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

   signal akkumulator: std_logic_vector(43 DOWNTO 0);
   signal next_akku: std_logic_vector(43 DOWNTO 0) := (others => '0');
   signal op_extension: std_logic_vector(43 DOWNTO 0);
   
BEGIN

   op_extension <= std_logic_vector(resize(signed(op), op_extension'length));
   --next_akku <= akkumulator + op_extension;
   dout <= akkumulator;

   process (rst, clk) is
      begin
         if rst = RSTDEF then
            akkumulator <= (others => '0');
         elsif rising_edge(clk) then
            if swrst = RSTDEF then
               akkumulator <= (others => '0');
            elsif en = '1' then
               akkumulator <= akkumulator + op_extension;
            end if;
         end if;
   end process;

END structure;