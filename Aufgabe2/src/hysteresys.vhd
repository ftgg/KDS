--
--Hysterese-Schaltung:
--

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY hysteresys IS
   GENERIC(RSTDEF:  std_logic := '1';
           SAMPLES: natural := 31);
   PORT( rst:  IN std_logic;  -- reset, RSTDEF active
         clk:  IN std_logic;  -- clock, rising edge
         din_hys:  IN std_logic;  -- data input
         dout_hys: OUT std_logic; -- data output, Ausgang Hysterese-Schaltwerk
         en:   IN std_logic; -- enable, high active
         swrst:  IN  std_logic);  -- software reset, RSTDEF active
END hysteresys;


ARCHITECTURE hysteresys_behaviour OF hysteresys IS
   
   signal state: std_logic;
   signal count : integer range 0 to SAMPLES;
   
BEGIN
   
   dout_hys <= state;
   
   process(rst, clk) begin
		if rst = RSTDEF then
			state <= '0';
			count <= 0;
		elsif rising_edge(clk) then
			if en = '1' then
				if state ='0' then
						if din_hys = '0' then
							if count > 0 then
								count <= count - 1;
							end if;
						else
							if count < 31 then
								count <= count + 1;
							elsif count = 31 then	
								state <= '1';
							end if;
						end if;
				else
						if din_hys = '0' then
							if count > 0 then
								count <= count - 1;
							else
								state <= '0';
							end if;
						else
							if count < 31 then
								count <= count + 1;
							end if;
						end if;
				end if;     
			end if;
		end if;
	end process;
   
END hysteresys_behaviour;