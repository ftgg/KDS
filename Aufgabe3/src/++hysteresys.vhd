--
--Hysterese-Schaltung:
--

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;


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
   --signal count : integer range 0 to SAMPLES;
   signal count: std_logic_vector(4 downto 0); --TODO 4 = SAMPLES
   --(cnt_reg'range => '0')
   
BEGIN
   
   dout_hys <= state;
   
   process(rst, clk) begin
		if rst = RSTDEF then
			state <= '0';
			count <= (others => '0');
		elsif rising_edge(clk) then
			if en = '1' then
				if state ='0' then
						if din_hys = '0' then
							if count = (count'range => '0') then --alles 0 ?
                        --nix
							else
                        count <= count + SAMPLES;
							end if;
						else
							if count = (count'range => '1') then
                        state <= '1';
							else
								count <= count + 1;
							end if;
						end if;
				else
						if din_hys = '0' then
							if count = (count'range => '0') then
								state <= '0';
							else
                        count <= count + SAMPLES;
							end if;
						else
							if count = (count'range => '1') then
                        --nix
							else
                        count <= count + 1;
							end if;
						end if;
				end if;     
			end if;
		end if;
	end process;
   
END hysteresys_behaviour;