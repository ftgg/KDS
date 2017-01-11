-- Adress Generator

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;

ENTITY addressgenerator IS
   GENERIC (RSTDEF:  std_logic :='1');
   PORT(rst:       IN    std_logic;
        clk:       IN    std_logic;
        swrst:     IN    std_logic;
        next_addr: IN    std_logic;     --nächste generieren
        hasNext:      OUT   std_logic;
        addr_out:  OUT   std_logic_vector (7 DOWNTO 0));    --addresse im format ZeileSpalte
END addressgenerator;

ARCHITECTURE struktur OF addressgenerator IS

   signal addr: std_logic_vector(7 DOWNTO 0); -- 8 BIT Adresse

BEGIN

   addr_out <= addr;

   process (rst, clk) is
      begin
         if rst = RSTDEF then
            addr <= (others => '0');
            hasNext <= '1';
         elsif rising_edge(clk) then
            if swrst = RSTDEF then
               addr <= (others => '0');
            elsif next_addr = '1' then
               if(addr = X"FE") then
                  hasNext <= '0';
               end if;
               addr <= addr + 1;
            end if;
         end if;
   end process;

END struktur;