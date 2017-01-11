LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
library unisim;
use unisim.vcomponents.all;
use ieee.numeric_std.all;

ENTITY multiplizierer IS
   GENERIC(RSTDEF: std_logic := '0';
           OPLEN: natural := 16);
   PORT(rst:   IN  std_logic;                      -- reset,          RSTDEF active
        clk:   IN  std_logic;                      -- clock,          rising edge
        swrst: IN  std_logic;                      -- software reset, RSTDEF active
        en:    IN std_logic;
        op1:   IN std_logic_vector(OPLEN-1 DOWNTO 0);
        op2:   IN std_logic_vector(OPLEN-1 DOWNTO 0);
        dout:  OUT std_logic_vector(35 DOWNTO 0)); -- output Skalar
END multiplizierer;


ARCHITECTURE behaviour OF multiplizierer IS

signal reset : std_logic; 
signal opA : std_logic_vector(17 DOWNTO 0);
signal opB : std_logic_vector(17 DOWNTO 0);

BEGIN

   reset <= '1' WHEN rst=RSTDEF ELSE
            '0';

   opA <= std_logic_vector(resize(signed(op1), opA'length)); -- op1(OPLEN-1) & op1(OPLEN-1) & op1;
   opB <= std_logic_vector(resize(signed(op2), opB'length)); -- op2(OPLEN-1) & op2(OPLEN-1) & op2;   
      
   MULT18X18S_inst : MULT18X18S
   PORT MAP ( P => dout,      -- OUTPUT
              A => opA, -- OP1
              B => opB, -- OP2
              C => clk,        -- CLK
              CE => en,       -- ENABLE
              R => reset); -- RESET synchronous

              
END behaviour;