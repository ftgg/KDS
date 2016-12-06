
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY sync_buffer IS
   GENERIC(RSTDEF:  std_logic := '1');
   PORT(rst:    IN  std_logic;  -- reset, RSTDEF active
        clk:    IN  std_logic;  -- clock, rising edge
        en:     IN  std_logic;  -- enable, high active
        swrst:  IN  std_logic;  -- software reset, RSTDEF active
        din:    IN  std_logic;  -- data bit, input
        dout:   OUT std_logic;  -- data bit, output
        redge:  OUT std_logic;  -- rising  edge on din detected
        fedge:  OUT std_logic); -- falling edge on din detected
END sync_buffer;

--
-- Im Rahmen der 2. Aufgabe soll hier die Architekturbeschreibung
-- zur Entity sync_buffer implementiert werden.
--

ARCHITECTURE struktur of sync_buffer IS
   constant NR_OF_SAMPLES : natural := 5;
   
   COMPONENT dff IS
   GENERIC(RSTDEF:  std_logic := '1');
   PORT( rst:  IN std_logic;  -- reset, RSTDEF active
         clk:  IN std_logic;  -- clock, rising edge
         din:  IN std_logic;  -- data input
         en:   IN std_logic;
         dout: OUT std_logic); -- data output
   END COMPONENT;
   
   COMPONENT hysteresys IS
   GENERIC(RSTDEF:  std_logic := '1';
           SAMPLES: natural := NR_OF_SAMPLES);
   PORT( rst:  IN std_logic;  -- reset, RSTDEF active
         clk:  IN std_logic;  -- clock, rising edge
         din_hys:  IN std_logic;  -- data input
         dout_hys: OUT std_logic; -- data output, Ausgang Hysterese-Schaltwerk
         en:   IN std_logic;   -- enable, high active
         swrst:  IN  std_logic);  -- software reset, RSTDEF active
   END COMPONENT;
   
   
   COMPONENT edge_detector IS
   GENERIC (RSTDEF: std_logic);
   PORT    (rst: IN std_logic;   -- RESET
            clk: IN std_logic;   -- CLOCK
            din: IN std_logic;   -- DATA IN SIGNAL TO OBSERVE
            dout: OUT std_logic; -- DATA OUT SIGNAL TO OBSERVE
            redge: OUT std_logic;   -- RISING EDGE
            fedge: OUT std_logic);  -- FALLING EDGE
   END COMPONENT;
   
   
   signal dff_1_out: std_logic;
   signal dff_2_out: std_logic;
   signal hys_out: std_logic;
  
BEGIN
   
   dff_1: dff
   GENERIC MAP(RSTDEF => RSTDEF)
   PORT MAP (rst => rst,
             clk => clk,
             din => din,
             en => en,
             dout => dff_1_out);
   
   
   dff_2: dff
   GENERIC MAP(RSTDEF => RSTDEF)
   PORT MAP (rst => rst,
             clk => clk,
             din => dff_1_out,
             en => en,
             dout => dff_2_out);
             
             
    
   -- HYSTERESE
   hys: hysteresys
   GENERIC MAP(RSTDEF => RSTDEF,
               SAMPLES => NR_OF_SAMPLES)
   PORT MAP (  rst => rst,
               clk => clk,
               din_hys => dff_2_out,
               dout_hys => hys_out,
               en => en,
               swrst => swrst);
   
   
   edge_event: edge_detector
   GENERIC MAP(RSTDEF => RSTDEF)
   PORT MAP    (rst => rst,
                clk => clk,
                din => hys_out,
                dout => dout,
                redge => redge,
                fedge => fedge);

END struktur;

