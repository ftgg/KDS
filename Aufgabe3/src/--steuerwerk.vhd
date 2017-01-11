LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;
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

   -- type TState IS (S0,S1,S2,S3,S4,S5,S6,S7,S8);
   -- signal state : TState;
   signal index: std_logic_vector(7 DOWNTO 0);
   signal next_state : std_logic_vector(3 DOWNTO 0);
   signal state : std_logic_vector(3 DOWNTO 0);
   signal condition : std_logic_vector(4 DOWNTO 0);
   signal n_eq_not_zero : std_logic;
   signal n_eq_one : std_logic;
   signal cond_sel : std_logic;
   
BEGIN

   n_eq_not_zero <= '0' WHEN(index = X"00") ELSE '1';
   n_eq_one <= '1' WHEN(index = X"00") ELSE '0'; --01

   -- n condition select
   with state select
      cond_sel <= strt WHEN X"0",
                n_eq_not_zero WHEN X"7",
                n_eq_one WHEN others;
   
   condition <= state & cond_sel;
   
   -- next state
   with condition select
      next_state <= X"0" WHEN "00000", -- 0
                    X"0" WHEN "10000", -- 8
                    X"0" WHEN "10001", -- 8
                    X"1" WHEN "01111", -- 7
                    X"2" WHEN "00010", -- 1
                    X"3" WHEN "00100", -- 2,3
                    X"3" WHEN "00110", -- 2,3
                    X"4" WHEN "00101", -- 2,3
                    X"4" WHEN "00111", -- 2,3
                    X"5" WHEN "01000", -- 4,6
                    X"5" WHEN "01001", -- 4,6
                    X"5" WHEN "01100", -- 4,6
                    X"5" WHEN "01101", -- 4,6
                    X"6" WHEN "00011", -- 1
                    X"7" WHEN "00001", -- 0
                    X"8" WHEN "01010", -- 5
                    X"8" WHEN "01011", -- 5
                    X"8" WHEN "01110", -- 7
                    X"0" WHEN others;
                    

   with state select
      enable <= "100" WHEN X"1",
                "010" WHEN X"6",
                "110" WHEN X"2",
                "001" WHEN X"5",
                "011" WHEN X"4",
                "111" WHEN X"3",
                "000" WHEN others;
                    
   
   done <= state(3); -- msb
   scalar_index <= index;

   process(clk, rst) IS
   BEGIN
      if rst = RSTDEF then
         state <= X"0";
         index <= sw;
      elsif rising_edge(clk) then
         rnrst <= not RSTDEF; -- hier ein slice weniger als in den zwei Methoden
         if swrst = RSTDEF then
            index <= sw;
            state <= X"0";
         else 
            if next_state = X"1" or next_state = X"2" or next_state = X"3" then
               if index /= X"00" then 
                  index <= index - 1;
               end if;
            elsif state = X"0" then
                  index <= sw;
                  rnrst <= RSTDEF;
            end if;
            state <= next_state;
         end if;
      end if;
   end process;

END structure;