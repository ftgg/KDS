LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY steuerwerk_scalar IS
   GENERIC(RSTDEF: std_logic := '0');
   PORT(rst:   IN  std_logic;                      -- reset,          RSTDEF active
        clk:   IN  std_logic;                      -- clock,          rising edge
        swrst: IN  std_logic;                      -- software reset, RSTDEF active
        akkurst: OUT std_logic;                      -- Reset Signal for ALU
        strt:  IN  std_logic;                      -- start,syncModul high active
        sw:    IN  std_logic_vector( 7 DOWNTO 0);  -- length counter, input schalter
        e_ad1 : OUT std_logic_vector( 9 DOWNTO 0);
        e_ad2 : OUT std_logic_vector( 9 DOWNTO 0);
        enable: OUT std_logic_vector(2 DOWNTO 0);   -- enable Rechenwerk
        scalar_index : IN std_logic_vector(7 DOWNTO 0);   -- scalar_index Adresse
        idle_rom: OUT std_logic;
        done:  OUT std_logic);                     -- done,           high active
END steuerwerk_scalar;

ARCHITECTURE structure OF steuerwerk_scalar IS

   type TState IS (S0,S1,S2,S3);
   signal state : TState;
   signal index: std_logic_vector(3 DOWNTO 0); --sw'RANGE
   signal test: std_logic;

BEGIN

   -- hier adressen erzeugen
   e_ad1 <= "00" & scalar_index(7 DOWNTO 4) & index;
   e_ad2 <= "01" & index & scalar_index(3 DOWNTO 0);
   
   

   process(clk, rst) IS
   BEGIN
      if rst = RSTDEF then
         state <= S0;
         enable <= "000";
         index <= X"F";
         done <= '0';
      elsif rising_edge(clk) then
         akkurst <= not RSTDEF; -- hier ein slice weniger als in den zwei Methoden
         if swrst = RSTDEF then
            state <= S0;
            enable <= "000";
            index <= X"F";
            done <= '0';
         else
            case state IS
               WHEN S0 =>
                  test <= '0';
                  done <= '0';
                  idle_rom <= '0';
                  enable <= "000";
                  index <= X"F";
                  if strt = '1' then
                     akkurst <= RSTDEF;
                     state <= S1;
                  end if;
               WHEN S1 =>
                  enable <= "100";
                  state <= S2;
               WHEN S2 =>
                  index <= index - 1;
                  enable <= "110";
                  state <= S3;
               WHEN S3 =>
                  enable <= "111";
                  index <= index - 1;
                  if index = X"2" then
                     idle_rom <= '1';
                  elsif index = X"E" then
                     if strt = '0' then
                        state <= S0;
                     end if;

                     if test = '0' then
                        test <= '1';
                     else
                        done <= '1';
                        if strt = '1' then
                           akkurst <= RSTDEF;
                        end if;
                     end if;
                     
                  else 
                     idle_rom <= '0';
                     done <= '0';
                  end if;
                  
                  
            end case;
         end if;
      end if;
   end process;

END structure;