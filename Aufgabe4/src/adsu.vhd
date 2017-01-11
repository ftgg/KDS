LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY unisim;
USE unisim.vcomponents.ALL;

ENTITY ADSU IS
   GENERIC(N: natural := 8);
   PORT(sub:   IN std_logic; -- = 0 for ADD, =1 for SUB
        cout:  OUT std_logic; -- carry output
        op1:   IN std_logic_vector(N-1 DOWNTO 0);
        op2:   IN std_logic_vector(N-1 DOWNTO 0);
        dout:  OUT std_logic_vector(N-1 DOWNTO 0));
END ADSU;
   
   
ARCHITECTURE behaviour OF ADSU IS
   COMPONENT ADSU1 IS
   PORT( SB: IN std_logic;
         A0: IN std_logic;
         B0: IN std_logic;
         CI: IN std_logic;
         SO: OUT std_logic;
         CO: OUT std_logic);
   END COMPONENT;
   SIGNAL CY: std_logic_vector(N DOWNTO 0);
BEGIN
   CY(0) <= SUB;
   u1: FOR i In 0 TO N-1 GENERATE
       u4: ADSU1
       PORT MAP(SB => SUB,
                A0 => op1(i),
                B0 => op2(i),
                CI => CY(i),
                SO => dout(i),
                CO => CY(i+1));
   END GENERATE;
   
   u2: XOR2
   PORT MAP( O => cout,
             I0 => CY(N),
             I1 => SUB);
           
END behaviour;