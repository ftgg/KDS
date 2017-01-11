
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY core_scalar IS
   GENERIC(RSTDEF: std_logic := '0');
   PORT(rst:   IN  std_logic;                      -- reset,          RSTDEF active
        clk:   IN  std_logic;                      -- clock,          rising edge
        swrst: IN  std_logic;                      -- software reset, RSTDEF active
        strt:  IN  std_logic;                      -- start,          high active
        sw:    IN  std_logic_vector( 7 DOWNTO 0);  -- length counter, input
        sc_adr: IN std_logic_vector(7 DOWNTO 0);    -- Adress of scalar in matrix i.e. 4X3
        res:   OUT std_logic_vector(43 DOWNTO 0);  -- result
        done:  OUT std_logic);                     -- done,           high active
END core_scalar;


ARCHITECTURE behaviour of core_scalar IS

   COMPONENT rechenwerk IS
      GENERIC(RSTDEF: std_logic := '0');
      PORT(rst:   IN  std_logic;                      -- reset,          RSTDEF active
           clk:   IN  std_logic;                      -- clock,          rising edge
           swrst: IN  std_logic;                      -- software reset, RSTDEF active
           enable:IN std_logic_vector(2 DOWNTO 0);
           adr1:  IN std_logic_vector(9 DOWNTO 0);
           adr2:  IN std_logic_vector(9 DOWNTO 0);
           dout:   OUT std_logic_vector(43 DOWNTO 0)); -- output Skalar
   END COMPONENT;
   
   COMPONENT steuerwerk_scalar IS
   GENERIC(RSTDEF: std_logic := '0');
   PORT(rst:   IN  std_logic;                      -- reset,          RSTDEF active
        clk:   IN  std_logic;                      -- clock,          rising edge
        swrst: IN  std_logic;                      -- software reset, RSTDEF active
        rnrst: OUT std_logic;                      -- Reset Signal for ALU
        strt:  IN  std_logic;                      -- start,syncModul high active
        sw:    IN  std_logic_vector( 7 DOWNTO 0);  -- length counter, input schalter
        enable:OUT std_logic_vector(2 DOWNTO 0);   -- enable Rechenwerk
        e_ad1 : OUT std_logic_vector( 9 DOWNTO 0);
        e_ad2 : OUT std_logic_vector( 9 DOWNTO 0);
        scalar_index : IN std_logic_vector(7 DOWNTO 0);   -- scalar_index Adresse
        done:  OUT std_logic);                     -- done,           high active
   END COMPONENT;

   SIGNAL enable : std_logic_vector(2 DOWNTO 0);
   SIGNAL internal_rst : std_logic;
   SIGNAL rnrst : std_logic;
   SIGNAL e_ad1 : std_logic_vector(9 DOWNTO 0);
   SIGNAL e_ad2 : std_logic_vector(9 DOWNTO 0);
   
BEGIN

   -- internal_rst <= rnrst or rst;
   internal_rst <= RSTDEF WHEN rnrst = RSTDEF ELSE
                   RSTDEF WHEN rst = RSTDEF ELSE
                   not RSTDEF;
   
   rn : rechenwerk
   GENERIC MAP ( RSTDEF => RSTDEF )
   PORT MAP    ( rst => internal_rst,
                 clk => clk,
                 swrst => swrst,
                 enable => enable,
                 adr1 => e_ad1,
                 adr2 => e_ad2,
                 dout => res);

   stw : steuerwerk_scalar
   GENERIC MAP(RSTDEF => RSTDEF)
   PORT MAP    (rst => rst,
                clk => clk,
                swrst => swrst,
                rnrst => rnrst,
                strt => strt,
                sw => sw,
                enable => enable,
                scalar_index => sc_adr,
                e_ad1 => e_ad1,
                e_ad2 => e_ad2,
                done => done);

END behaviour;