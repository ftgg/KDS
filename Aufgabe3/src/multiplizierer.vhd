LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
library unisim;
use unisim.vcomponents.all;

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

BEGIN

reset <= (rst = RSTDEF) or (swrst = RSTDEF)

MULT18X18S_inst : MULT18X18S
PORT MAP ( P => dout,      -- OUTPUT
           A => op1(OPLEN-1) & op1(OPLEN-1) & op1, -- OP1
           B => op2(OPLEN-1) & op2(OPLEN-1) & op2, -- OP2
           C => clk,        -- CLK
           CE => en,       -- ENABLE
           R => reset); -- RESET synchronous





           
END behaviour;