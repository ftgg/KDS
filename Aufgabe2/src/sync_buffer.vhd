
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


--
--Hysterese-Schaltung:
--

ENTITY hysteresys IS
   GENERIC(RSTDEF:  std_logic := '1'
           SAMPLES: natural := 32);
   PORT( rst:  IN std_logic;  -- reset, RSTDEF active
         clk:  IN std_logic;  -- clock, rising edge
         din_hys:  IN std_logic;  -- data input
         dout_hys: OUT std_logic; -- data output
         en:   IN std_logic; -- enable, high active
         swrst:  IN  std_logic);  -- software reset, RSTDEF active
END hysteresys;


ARCHITECTURE hysteresys_behaviour OF hysteresys IS

      COMPONENT std_counter IS
      GENERIC(RSTDEF: std_logic;
              CNTLEN: natural);
      PORT(rst:   IN  std_logic;  -- reset,           RSTDEF active
           clk:   IN  std_logic;  -- clock,           rising edge
           en:    IN  std_logic;  -- enable,          high active
           inc:   IN  std_logic;  -- increment,       high active
           dec:   IN  std_logic;  -- decrement,       high active
           load:  IN  std_logic;  -- load value,      high active
           swrst: IN  std_logic;  -- software reset,  RSTDEF active
           cout:  OUT std_logic;  -- carry,           high active
           din:   IN  std_logic_vector(CNTLEN-1 DOWNTO 0);
           dout:  OUT std_logic_vector(CNTLEN-1 DOWNTO 0));
   END COMPONENT;
   
   type TState IS (LOW_STATE,HIGH_STATE);
   signal state: TState;
   signal carry: std_logic;
   signal inc_hys: std_logic;
   signal dec_hys: std_logic;
   signal load_hys: std_logic;
   signal out_cnt_hys: std_logic;
BEGIN
   
   hys_cnt: std_counter
   GENERIC MAP(RSTDEF => RSTDEF,
               CNTLEN => SAMPLES)
   PORT MAP(rst   => rst,
            clk   => clk,
            en    => en,
            inc   => inc_hys,
            dec   => dec_hys,
            load  => load_hys,
            swrst => swrst,
            cout  => carry,
            din   => '0',
            dout  => out_cnt_hys);

   
   -- TODO Frq. Teiler enable signal =?!
   process (rst, clk) begin
      if rst=RSTDEF then
			state := LOW_STATE
      elsif rising_edge(clk) then
         if swrst=RSTDEF then
            state := LOW_STATE
         elsif en='0' then
            state := state -- TODO is this necessary
         elsif state=LOW_STATE then
            if carry=1 then
               if out_cnt_hys(SAMPLES-1)=1 then -- TODO Auslagern State mit 1 bit und invert
                  load_hys<='1' -- load Counter with 0
               else
                  state := HIGH_STATE;
                  dout_hys <= '1'
               end if;
            else
               if din_hys <= '0' then
                  dec_hys <= '1'
                  inc_hys <= '0'
               else
                  dec_hys <= '0'
                  inc_hys <= '1'
               end if;
               -- TODO evtl, zähler erst jetzt clk geben, da evt wir zu langsam
            end if;
         else
            if carry=1 then
               if out_cnt_hys(SAMPLES-1)=1 then -- TODO Auslagern State mit 1 bit und invert
                  load_hys<='1'
               else
                  state := LOW_STATE;
                  dout_hys <= '0'
               end if;
            else
               if din_hys = '1' then -- = '1' ist state, sobald std_logic umgesetzt ist
                  dec_hys <= '1'
                  inc_hys <= '0'
               else
                  dec_hys <= '0'
                  inc_hys <= '1'
               end if;
            end if;
         end if;
      end if;
      
   end process;


--
--Flipflop:
--

ENTITY dff IS
   GENERIC(RSTDEF:  std_logic := '1');
   PORT( rst:  IN std_logic;  -- reset, RSTDEF active
         clk:  IN std_logic;  -- clock, rising edge
         din:  IN std_logic;  -- data input
         dout: OUT std_logic); -- data output
END dff;


ARCHITECTURE dff_behaviour OF dff IS
   signal dff: std_logic;
BEGIN

   dout <= dff;
   
   PROCESS (rst, clk) IS
   BEGIN
      IF rst=RSTDEF THEN
         dff <= '0';
      ELSIF rising_edge(clk) THEN
         dff <= din;
      END IF;
   END PROCESS;
END dff_behaviour;

