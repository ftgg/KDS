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
         dout: OUT std_logic); -- data output
END dff;


ARCHITECTURE dff_behaviour OF dff IS
   signal dff: std_logic;
BEGIN

	dout <= dff;
	
   PROCESS(rst, clk) IS
   BEGIN
      IF rst=RSTDEF THEN
         dff <= '0';
      ELSIF rising_edge(clk) THEN
         dff <= din;
      END IF;
   END PROCESS;
	
END dff_behaviour;