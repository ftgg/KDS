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


ARCHITECTURE behavioral OF sync_buffer IS
	
   COMPONENT hysteresys IS
         
   GENERIC( RSTDEF:  std_logic := '1';
            SAMPLES: natural := 31);
   PORT( rst:  IN std_logic;  -- reset, RSTDEF active
         clk:  IN std_logic;  -- clock, rising edge
         din_hys:  IN std_logic;  -- data input
         dout_hys: OUT std_logic; -- data output, Ausgang Hysterese-Schaltwerk
         en:   IN std_logic; -- enable, high active
         swrst:  IN  std_logic);  -- software reset, RSTDEF active
   END COMPONENT;

   
   SIGNAL out_hys: std_logic := '0';
   SIGNAL ff1_out : std_logic := '0';
   SIGNAL ff2_out : std_logic := '0';
   SIGNAL ff3_out : std_logic := '0';
    

BEGIN
    
   --flipflops:
   -- ff1 -> ff2 -> hys -> ff3
	process(rst,clk) begin
		if rst = RSTDEF then
			ff1_out <= '0';
			ff2_out <= '0';
         ff3_out <= '0';
		elsif rising_edge(clk) then
			ff1_out <= din;
			ff2_out <= ff1_out;
         ff3_out <= out_hys;
			if swrst = RSTDEF then
				ff1_out <= '0';
				ff2_out <= '0';
			end if;
		end if;	
	end process;
    
  hys: hysteresys
  GENERIC MAP (RSTDEF => RSTDEF,
               SAMPLES => 31)
   PORT MAP(rst => rst,
            clk => clk,
            din_hys => ff2_out,
         dout_hys => out_hys,
         en=>en,
         swrst=>swrst);
	
   --flanken detector
	dout <= ff3_out;
   redge <= out_hys and (not ff3_out);
   fedge <= (not out_hys) and ff3_out;

	
    
END behavioral;
