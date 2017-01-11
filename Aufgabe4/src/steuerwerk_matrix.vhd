LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY steuerwerk_matrix IS
   GENERIC(RSTDEF: std_logic := '0');
   PORT(rst:          IN  std_logic;                      -- reset,          RSTDEF active
        clk:          IN  std_logic;                      -- clock,          rising edge
        swrst:        IN  std_logic;                      -- software reset, RSTDEF active
        addr_out:     OUT std_logic_vector (7 DOWNTO 0);
        strt:         IN std_logic;
        done:         OUT std_logic;
        w_en:         OUT std_logic;
        strt_scalar:  OUT  std_logic;                      -- start scalar calculation
        done_scalar:  IN std_logic);                     -- done scalar calculation done
END steuerwerk_matrix;

ARCHITECTURE structure OF steuerwerk_matrix IS
   COMPONENT addressgenerator IS
   GENERIC (RSTDEF:  std_logic :='1');
   PORT(rst:       IN    std_logic;
        clk:       IN    std_logic;
        swrst:     IN    std_logic;
        next_addr: IN    std_logic;     --nächste generieren
        hasNext:      OUT   std_logic; -- überlauf addressgenerator
        addr_out:  OUT   std_logic_vector (7 DOWNTO 0));    --addresse im format ZeileSpalte
   END COMPONENT;
   
   SIGNAL get_next_addr : std_logic;
   SIGNAL address: std_logic_vector (7 DOWNTO 0);
   SIGNAL hasNext_address : std_logic;
BEGIN

   add_gen : addressgenerator
   GENERIC MAP (RSTDEF => RSTDEF)
   PORT MAP ( rst => rst,
              clk => clk,
              swrst => swrst,
              next_addr => get_next_addr,
              hasNext => hasNext_address,
              addr_out => address);
   
   w_en <= done_scalar;
   addr_out <= address;
   
   process (clk, rst) begin
		if rst = RSTDEF then
			strt_scalar <= '0';
         get_next_addr <= '0';
         done <= '0';
		elsif rising_edge(clk) then
         strt_scalar <= '0';
         get_next_addr <= '0';
         if swrst = RSTDEF then
            done <= '0';
         elsif(strt = '1') then
            strt_scalar <= '1';
         elsif(done_scalar = '1') then
            if(hasNext_address = '1') then -- wenn wir nicht beim letzten angekommen sind
               strt_scalar <= '1';
               get_next_addr <= '1';
            else
               done <= '1';
            end if;
         end if;
      end if;
   end process;

END structure;