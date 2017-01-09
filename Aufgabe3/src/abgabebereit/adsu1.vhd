LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY unisim;
USE unisim.vcomponents.ALL;

-- SB=0 for ADD
-- SB=1 for SUB

ENTITY ADSU1 IS
   PORT( SB: IN std_logic;
         A0: IN std_logic;
         B0: IN std_logic;
         CI: IN std_logic;
         SO: OUT std_logic;
         CO: OUT std_logic);
END ADSU1;

ARCHITECTURE structure OF ADSU1 IS
   SIGNAL SEL: std_logic;
BEGIN
   u1: XOR3
   PORT MAP(O => SEL,
            I0 => A0,
            I1 => B0,
            I2 => SB);
   
   u2: MUXCY
   PORT MAP(O => CO,
            CI => CI,
            DI => A0,
            S => SEL);
            
   u3: XORCY
   PORT MAP(O => SO,
            CI => CI,
            LI => SEL);

END structure;