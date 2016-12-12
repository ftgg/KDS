
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY sync_module IS
   GENERIC(RSTDEF: std_logic := '1');
   PORT(rst:   IN  std_logic;  -- reset, active RSTDEF
        clk:   IN  std_logic;  -- clock, risign edge
        swrst: IN  std_logic;  -- software reset, active RSTDEF
        BTN0:  IN  std_logic;  -- push button -> load
        BTN1:  IN  std_logic;  -- push button -> dec
        BTN2:  IN  std_logic;  -- push button -> inc
        load:  OUT std_logic;  -- load,      high active
        dec:   OUT std_logic;  -- decrement, high active
        inc:   OUT std_logic); -- increment, high active
END sync_module;

--
-- Im Rahmen der 2. Aufgabe soll hier die Architekturbeschreibung
-- zur Entity sync_module implementiert werden.
--

ARCHITECTURE sync_module_behaviour OF sync_module IS
   CONSTANT FREQ_DIVISOR_LEN: natural := 15;
   
   COMPONENT freq_divisor IS
   GENERIC (RSTDEF:  std_logic :='1';
            CNTLEN:  natural   := FREQ_DIVISOR_LEN);
   PORT(rst:   IN    std_logic;
        clk:   IN    std_logic;
        swrst: IN    std_logic;
        en:    IN    std_logic;
        cout:  OUT   std_logic);
   END COMPONENT;
   
   COMPONENT sync_buffer IS
   GENERIC(RSTDEF:  std_logic := '1');
   PORT(rst:    IN  std_logic;  -- reset, RSTDEF active
        clk:    IN  std_logic;  -- clock, rising edge
        en:     IN  std_logic;  -- enable, high active
        swrst:  IN  std_logic;  -- software reset, RSTDEF active
        din:    IN  std_logic;  -- data bit, input
        dout:   OUT std_logic;  -- data bit, output
        redge:  OUT std_logic;  -- rising  edge on din detected
        fedge:  OUT std_logic); -- falling edge on din detected
   END COMPONENT;
   
   signal enable: std_logic;
   
BEGIN

   freq_div: freq_divisor
   GENERIC MAP (  RSTDEF => RSTDEF,
                  CNTLEN => FREQ_DIVISOR_LEN)
   PORT MAP    (  rst => rst,
                  clk => clk,
                  swrst => swrst,
                  en => '1',
                  cout => enable);
                  
   
   sync_buf_1: sync_buffer
   GENERIC MAP (  RSTDEF => RSTDEF)
   PORT MAP    (  rst => rst,
                  clk => clk,
                  en => enable,
                  swrst => swrst,
                  din => BTN0,
                  dout => open,
                  redge => open,
                  fedge => load);
   
   
   sync_buf_2: sync_buffer
   GENERIC MAP (  RSTDEF => RSTDEF)
   PORT MAP    (  rst => rst,
                  clk => clk,
                  en => enable,
                  swrst => swrst,
                  din => BTN1,
                  dout => open,
                  redge => open,
                  fedge => dec);
                  
   sync_buf_3: sync_buffer
   GENERIC MAP (  RSTDEF => RSTDEF)
   PORT MAP    (  rst => rst,
                  clk => clk,
                  en => enable,
                  swrst => swrst,
                  din => BTN2,
                  dout => open, -- inc
                  redge => open,
                  fedge => inc);
   
   
END sync_module_behaviour;
