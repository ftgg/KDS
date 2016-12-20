LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

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