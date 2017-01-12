
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY core IS
   GENERIC(RSTDEF: std_logic := '0');
   PORT(rst:   IN  std_logic;                      -- reset,          RSTDEF active
        clk:   IN  std_logic;                      -- clock,          rising edge
        swrst: IN  std_logic;                      -- software reset, RSTDEF active
        -- handshake signals
        strt:  IN  std_logic;                      -- start,          high active
        rdy:   OUT std_logic;                      -- ready,          high active
        -- address/data signals
        sw:    IN  std_logic_vector( 7 DOWNTO 0);  -- address input
        dout:  OUT std_logic_vector(15 DOWNTO 0)); -- result output
END core;

-- Erweiterung um die Architekturbeschreibung
ARCHITECTURE structure OF core IS

COMPONENT core_scalar IS
   GENERIC(RSTDEF: std_logic := '0');
   PORT(rst:   IN  std_logic;                      -- reset,          RSTDEF active
        clk:   IN  std_logic;                      -- clock,          rising edge
        swrst: IN  std_logic;                      -- software reset, RSTDEF active
        strt:  IN  std_logic;                      -- start,          high active
        sw:    IN  std_logic_vector( 7 DOWNTO 0);  -- length counter, input
        sc_adr: IN std_logic_vector(7 DOWNTO 0);    -- Adress of scalar in matrix i.e. 4X3
        res:   OUT std_logic_vector(43 DOWNTO 0);  -- result
        idle_rom: OUT std_logic;
        done:  OUT std_logic);                     -- done,           high active
END COMPONENT;


COMPONENT steuerwerk_matrix IS
   GENERIC(RSTDEF: std_logic := '0');
   PORT(rst:          IN  std_logic;                      -- reset,          RSTDEF active
        clk:          IN  std_logic;                      -- clock,          rising edge
        swrst:        IN  std_logic;                      -- software reset, RSTDEF active
        addr_out:     OUT std_logic_vector (7 DOWNTO 0);
        ram_addr:     OUT std_logic_vector (7 DOWNTO 0);
        strt:         IN std_logic;
        done:         OUT std_logic;
        w_en:         OUT std_logic;
        strt_scalar:  OUT  std_logic;                      -- start scalar calculation
        idle_rom:     IN std_logic;
        new_rst:      OUT std_logic;
        done_scalar:  IN std_logic);                     -- done scalar calculation done
END COMPONENT;


COMPONENT ram_block IS
   PORT (addra: IN  std_logic_VECTOR(9 DOWNTO 0);
         addrb: IN  std_logic_VECTOR(9 DOWNTO 0);
         clka:  IN  std_logic;
         clkb:  IN  std_logic;
         dina:  IN  std_logic_VECTOR(15 downto 0);
         douta: OUT std_logic_VECTOR(15 DOWNTO 0);
         doutb: OUT std_logic_VECTOR(15 DOWNTO 0);
         ena:   IN  std_logic;
         enb:   IN  std_logic;
         wea:   IN  std_logic);
END COMPONENT;

   signal strt_scalar: std_logic;
   signal done_scalar: std_logic;
   signal scalar: std_logic_vector(43 DOWNTO 0);
   signal sc_adr: std_logic_vector(7 DOWNTO 0);
	signal ex_addra: std_logic_vector(9 DOWNTO 0);
	signal ex_addrb: std_logic_vector(9 DOWNTO 0);
   signal ram_addr: std_logic_vector(7 DOWNTO 0);
   signal w_en: std_logic;
   signal idle_rom: std_logic;
   signal new_rst: std_logic;
   signal scalar_rst: std_logic;
   
   
BEGIN

   scalar_rst <= RSTDEF WHEN new_rst='1' ELSE
                 RSTDEF WHEN rst=RSTDEF ELSE
                 not RSTDEF;

   scalar_core : core_scalar
   GENERIC MAP(RSTDEF => RSTDEF)
   PORT MAP ( rst => scalar_rst,
              clk => clk,
              swrst => swrst,
              strt => strt_scalar,
              sw => X"10",
              sc_adr => sc_adr,
              res => scalar,
              idle_rom => idle_rom,
              done => done_scalar);


   
   stw_mtx : steuerwerk_matrix
   GENERIC MAP (RSTDEF => RSTDEF)
   PORT MAP (rst => rst,
             clk => clk,
             swrst => swrst,
             addr_out => sc_adr,
             strt => strt,
             ram_addr => ram_addr,
             done => rdy,
             w_en => w_en,
             strt_scalar => strt_scalar,
             idle_rom => idle_rom,
             new_rst => new_rst,
             done_scalar => done_scalar);
         
	ex_addra <= "00" & ram_addr;
	ex_addrb <= "00" & sw;
			
   RAMBLOCK : ram_block
   PORT MAP( addra => ex_addra,
             addrb => ex_addrb,
             clka => clk,
             clkb => clk,
             dina => scalar(15 DOWNTO 0),
             douta => open,
             doutb => dout,
             ena => w_en,
             enb => '1',
             wea => w_en);
             


END structure;