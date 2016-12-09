
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY std_counter IS
   GENERIC(RSTDEF: std_logic := '1';
           CNTLEN: natural   := 4);
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
END std_counter;

--
-- Funktionstabelle
-- rst clk swrst en  load dec inc | Aktion
----------------------------------+-------------------------
--  V   -    -    -    -   -   -  | cnt := 000..0, asynchrones Reset
--  N   r    V    -    -   -   -  | cnt := 000..0, synchrones  Reset
--  N   r    N    0    -   -   -  | keine Aenderung
--  N   r    N    1    1   -   -  | cnt := din, paralleles Laden
--  N   r    N    1    0   1   -  | cnt := cnt - 1, dekrementieren
--  N   r    N    1    0   0   1  | cnt := cnt + 1, inkrementieren
--  N   r    N    1    0   0   0  | keine Aenderung
--
-- Legende:
-- V = valid, = RSTDEF
-- N = not valid, = NOT RSTDEF
-- r = rising egde
-- din = Dateneingang des Zaehlers
-- cnt = Wert des Zaehlers
--

--
-- Im Rahmen der 2. Aufgabe soll hier die Architekturbeschreibung
-- zur Entity std_counter implementiert werden
--
ARCHITECTURE struktur OF std_counter IS

   COMPONENT edge_detector IS
   GENERIC (RSTDEF: std_logic);
   PORT    (rst: IN std_logic;   -- RESET
            clk: IN std_logic;   -- CLOCK
            din: IN std_logic;   -- DATA IN SIGNAL TO OBSERVE
            dout: OUT std_logic; -- DATA OUT SIGNAL TO OBSERVE
            redge: OUT std_logic;   -- RISING EDGE
            fedge: OUT std_logic);  -- FALLING EDGE
   END COMPONENT;
    
   signal cnt_sig : std_logic_vector(CNTLEN   downto 0);
	signal cnt_reg : std_logic_vector(CNTLEN-1 downto 0);
   signal internal_carry : std_logic;
   signal fedge : std_logic;
   signal redge : std_logic;
BEGIN

   cnt_sig <= ('0' & cnt_reg)+1 WHEN inc='1' ELSE
              ('0' & cnt_reg)-1 WHEN dec='1' ELSE
              ('0' & cnt_reg);
   

	process (rst, clk) begin
		if rst=RSTDEF then
			cnt_reg <= (others => '0');
		elsif rising_edge(clk) then
			if swrst=RSTDEF then
				cnt_reg <= (others => '0');
         else
            if en='1' then
               cnt_reg <= cnt_reg;
               if load='1' then
                  cnt_reg <= din;
                  cout <= '0';
               elsif dec='1' then
                  cnt_reg <= cnt_reg - 1;
                  cout <= cnt_sig(CNTLEN);
               elsif inc='1' then
                  cnt_reg <= cnt_reg + 1;
                  cout <= cnt_sig(CNTLEN);
               end if;
            end if;
			end if;
         dout <= cnt_reg(CNTLEN-1 downto 0);
		end if;
    
	end process;
END struktur;		
