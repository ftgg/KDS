
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY core IS
   GENERIC(RSTDEF: std_logic := '0');
   PORT(rst:   IN  std_logic;                      -- reset,          RSTDEF active
        clk:   IN  std_logic;                      -- clock,          rising edge
        swrst: IN  std_logic;                      -- software reset, RSTDEF active
        strt:  IN  std_logic;                      -- start,          high active
        sw:    IN  std_logic_vector( 7 DOWNTO 0);  -- length counter, input
        res:   OUT std_logic_vector(43 DOWNTO 0);  -- result
        done:  OUT std_logic);                     -- done,           high active
END core;


ARCHITECTURE behaviour of core IS

   COMPONENT rechenwerk IS
      GENERIC(RSTDEF: std_logic := '0');
      PORT(rst:   IN  std_logic;                      -- reset,          RSTDEF active
           clk:   IN  std_logic;                      -- clock,          rising edge
           swrst: IN  std_logic;                      -- software reset, RSTDEF active
           index: IN std_logic_vector(7 DOWNTO 0);
           enable: IN std_logic_vector(2 DOWNTO 0);
           dout:   OUT std_logic_vector(43 DOWNTO 0)); -- output Skalar
   END COMPONENT;
   
   COMPONENT steuerwerk IS
   GENERIC(RSTDEF: std_logic := '0');
   PORT(rst:   IN  std_logic;                      -- reset,          RSTDEF active
        clk:   IN  std_logic;                      -- clock,          rising edge
        swrst: IN  std_logic;                      -- software reset, RSTDEF active
        strt:  IN  std_logic;                      -- start,syncModul high active
        sw:    IN  std_logic_vector( 7 DOWNTO 0);  -- length counter, input schalter
        enable:OUT std_logic_vector(2 DOWNTO 0);   -- enable Rechenwerk
        scalar_index :OUT std_logic_vector(7 DOWNTO 0);   -- scalar_index Adresse
        done:  OUT std_logic);                     -- done,           high active
   END COMPONENT;

   SIGNAL scalar_index : std_logic_vector(7 DOWNTO 0);
   SIGNAL enable : std_logic_vector(2 DOWNTO 0);
   
BEGIN

   rn : rechenwerk
   GENERIC MAP ( RSTDEF => RSTDEF )
   PORT MAP    ( rst => rst,
                 clk => clk,
                 swrst => swrst,
                 index => scalar_index,
                 enable => enable,
                 dout => res);

   stw : steuerwerk
   GENERIC MAP(RSTDEF => RSTDEF)
   PORT MAP    (rst => rst,
                clk => clk,
                swrst => swrst,
                strt => strt,
                sw => sw,
                enable => enable,
                scalar_index => scalar_index,
                done => done);

END behaviour;