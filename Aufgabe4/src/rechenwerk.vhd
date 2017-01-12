LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY rechenwerk IS
   GENERIC(RSTDEF: std_logic := '0');
   PORT(rst:   IN  std_logic;                      -- reset,          RSTDEF active
        clk:   IN  std_logic;                      -- clock,          rising edge
        swrst: IN  std_logic;                      -- software reset, RSTDEF active
        akkurst: IN std_logic;                     -- akku reset         
        adr1:  IN std_logic_vector(9 DOWNTO 0);
        adr2:  IN std_logic_vector(9 DOWNTO 0);
        enable: IN std_logic_vector(2 DOWNTO 0);
        dout:   OUT std_logic_vector(43 DOWNTO 0)); -- output Skalar
END rechenwerk;


ARCHITECTURE behaviour OF rechenwerk IS

   COMPONENT rom_block IS
      PORT (addra: IN std_logic_VECTOR(9 DOWNTO 0);
            addrb: IN std_logic_VECTOR(9 DOWNTO 0);
            clka:  IN std_logic;
            clkb:  IN std_logic;
            douta: OUT std_logic_VECTOR(15 DOWNTO 0);
            doutb: OUT std_logic_VECTOR(15 DOWNTO 0);
            ena:   IN std_logic;
            enb:   IN std_logic);
   END COMPONENT;

   COMPONENT multiplizierer IS
      GENERIC(RSTDEF: std_logic := '0';
              OPLEN: natural := 16);
      PORT(rst:   IN  std_logic;                      -- reset,          RSTDEF active
           clk:   IN  std_logic;                      -- clock,          rising edge
           swrst: IN  std_logic;                      -- software reset, RSTDEF active
           en:IN std_logic;
           op1:   IN std_logic_vector(OPLEN-1 DOWNTO 0);
           op2:   IN std_logic_vector(OPLEN-1 DOWNTO 0);
           dout:  OUT std_logic_vector(35 DOWNTO 0)); -- output Skalar
   END COMPONENT;
   
   COMPONENT addierer_akku IS
   GENERIC(RSTDEF: std_logic := '0';
           OPLEN: natural := 36);
   PORT(rst:   IN  std_logic;                      -- reset,          RSTDEF active
        clk:   IN  std_logic;                      -- clock,          rising edge
        swrst: IN  std_logic;                      -- software reset, RSTDEF active
        en:IN std_logic;
        op:   IN std_logic_vector(OPLEN-1 DOWNTO 0);
        dout:  OUT std_logic_vector(43 DOWNTO 0)); -- output Skalar
   END COMPONENT;
   
   signal rom_data_a : std_logic_vector(15 DOWNTO 0);
   signal rom_data_b : std_logic_vector(15 DOWNTO 0);
   signal mult_out : std_logic_vector(35 DOWNTO 0); 
	signal akku_reset : std_logic;
BEGIN

	
   ROMBLOCK : rom_block
   PORT MAP( addra => adr1,
             addrb => adr2,
             clka => clk,
             clkb => clk,
             douta => rom_data_a,
             doutb => rom_data_b,
             ena => enable(2),
             enb => enable(2));
   
   
   MULTI_18x18: multiplizierer
   GENERIC MAP(RSTDEF => RSTDEF,
               OPLEN => 16)
   PORT MAP    (rst => rst,
                clk => clk,
                swrst => swrst,
                en => enable(1),
                op1 => rom_data_a,
                op2 => rom_data_b,
                dout => mult_out);

   
   akku_reset <= RSTDEF WHEN akkurst = RSTDEF ELSE
                 RSTDEF WHEN rst = RSTDEF ELSE
                 not RSTDEF;              
   
   ADD_AKKU: addierer_akku
   GENERIC MAP ( RSTDEF => RSTDEF,
                 OPLEN => 36)
   PORT MAP ( rst => rst,
              -- akkurst => akkurst,
				  swrst => akku_reset,
              clk => clk,
              en => enable(0),
              op => mult_out,
              dout => dout);
              
END behaviour;





