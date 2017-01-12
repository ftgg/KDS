--
--Flipflop:
--
library ieee;
use ieee.std_logic_1164.all;

ENTITY dff IS
   GENERIC(RSTDEF:  std_logic := '1');
   PORT( rst:  IN std_logic;  -- reset, RSTDEF active
         clk:  IN std_logic;  -- clock, rising edge
         din:  IN std_logic;  -- data input
         en:   IN std_logic;
         dout: OUT std_logic); -- data output
END dff;


ARCHITECTURE dff_behaviour OF dff IS
   signal reg_content: std_logic;
BEGIN

	dout <= reg_content;
   PROCESS(rst, clk) IS
   BEGIN
      IF rst=RSTDEF THEN
         reg_content <= '0';
      ELSIF rising_edge(clk) THEN
         if en='1' then
            reg_content <= din;
         END IF;
      END IF;
   END PROCESS;
	
END dff_behaviour;

