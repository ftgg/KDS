LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY steuerwerk IS
   GENERIC(RSTDEF: std_logic := '0');
   PORT(rst:   IN  std_logic;                      -- reset,          RSTDEF active
        clk:   IN  std_logic;                      -- clock,          rising edge
        swrst: IN  std_logic;                      -- software reset, RSTDEF active
        rnrst: OUT std_logic;                      -- Reset Signal for ALU
        strt:  IN  std_logic;                      -- start,syncModul high active
        sw:    IN  std_logic_vector( 7 DOWNTO 0);  -- length counter, input schalter
        enable:OUT std_logic_vector(2 DOWNTO 0);   -- enable Rechenwerk
        scalar_index :OUT std_logic_vector(7 DOWNTO 0);   -- scalar_index Adresse
        done:  OUT std_logic);                     -- done,           high active
END steuerwerk;

ARCHITECTURE structure OF steuerwerk IS

   type TState IS (S0,S1,S2,S3,S4,S5,S6);
   signal state : TState;
   signal enable_int : std_logic_vector(2 DOWNTO 0);
   signal index: std_logic_vector(7 DOWNTO 0);

BEGIN
   enable <= enable_int;
   scalar_index <= index;

   process(clk, rst) IS
   BEGIN
      if rst = RSTDEF then
         state <= S0;
         enable_int <= "000";
         index <= sw;
         done <= '0';
      elsif rising_edge(clk) then
         rnrst <= not RSTDEF; -- hier ein slice weniger als in den zwei Methoden
         if swrst = RSTDEF then
            state <= S0;
            enable_int <= "000";
            index <= sw;
            done <= '0';
         else
            case state IS
               WHEN S0 =>
                  enable_int <= "000";
                  index <= sw;
                  if enable_int(0) = '1' then
                     done <= '1';
                  end if;
                  
                  if strt = '1' then
                     done <= '0';
                     rnrst <= RSTDEF;
                     if sw = X"00" then
                        done <= '1';
                     else
                        state <= S1;
                     end if;
                  end if;

               WHEN S1 =>
                  index <= index - 1;
                  enable_int <= "100";
                  if index = X"01" then
                     state <= S6;
                  else
                     state <= S2;
                  end if;
               WHEN S2 =>
                  index <= index - 1;
                  enable_int <= "110";
                  if index = X"01" then
                     state <= S4;
                  else
                     state <= S3;
                  end if;
               WHEN S3 =>
                  enable_int <= "111";
                  index <= index - 1;
                  if index = X"01" then
                     state <= S4;
                  end if;
               WHEN S4 =>
                  enable_int <= "011";
                  state <= S5;
               WHEN S5 =>
                  enable_int <= "001";
                  state <= S0;
               WHEN S6 =>
                  enable_int <= "010";
                  state <= S5;
            end case;
         end if;
      end if;
   end process;

END structure;