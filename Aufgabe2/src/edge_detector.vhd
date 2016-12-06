-- 
-- Edge Detector
--
library ieee;
use ieee.std_logic_1164.all;

ENTITY edge_detector IS
   GENERIC(RSTDEF: std_logic := '1');
   PORT(rst:   IN std_logic;
        clk:   IN std_logic;
        din:   IN std_logic;
        dout:  OUT std_logic;
        redge: OUT std_logic;
        fedge: OUT std_logic);
END edge_detector;


ARCHITECTURE edge_detector_behaviour OF edge_detector IS
   COMPONENT dff IS
      GENERIC(RSTDEF:  std_logic := '1');
      PORT( rst:  IN std_logic;  -- reset, RSTDEF active
            clk:  IN std_logic;  -- clock, rising edge
            din:  IN std_logic;  -- data input
            en:   IN std_logic;
            dout: OUT std_logic); -- data output
   END COMPONENT;
  
  signal reg_out: std_logic;
  
BEGIN
   reg: dff
   GENERIC MAP(RSTDEF => RSTDEF)
   PORT MAP   (rst => rst,
               clk => clk,
               din => din,
               en => '1',
               dout => reg_out);
   
   redge <= (not reg_out) and din;
   fedge <= reg_out and (not din);
   dout <= reg_out;
   
END edge_detector_behaviour;