
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY ram_block IS
   PORT (addra: IN std_logic_VECTOR(9 DOWNTO 0);
         addrb: IN std_logic_VECTOR(9 DOWNTO 0);
         clka:  IN std_logic;
         clkb:  IN std_logic;
         douta: OUT std_logic_VECTOR(15 DOWNTO 0);
         doutb: OUT std_logic_VECTOR(15 DOWNTO 0);
         ena:   IN std_logic;
         enb:   IN std_logic);
END ram_block;

library unisim;
use unisim.vcomponents.all;

architecture low_level_definition of ram_block is

begin

-- The synchronous set/reset input, SSR, forces the data output latches to value specified by the
-- SRVAL attribute. When SSR and the enable signal, EN, are High, the data output latches for
-- the DO and DOP outputs are synchronously set to a '0' or '1' according to the SRVAL parameter.

   --Instantiate the Xilinx primitive for a block RAM
   uprom: RAMB16_S18_S18
   --INIT values repeated to define contents for functional simulation
   generic map( INIT_A  => X"00000",
                INIT_B  => X"00000",
                SRVAL_A => X"00000",
                SRVAL_B => X"00000",
                INIT_00 => X"002E0038FFA9006BFF93006C003CFFA1FFB90070FFA90021003800050063FFD7",
                INIT_01 => X"003F0052FFBBFFB8FF81004000480064006BFF81FFAFFFB6004600080013FFC8",
                INIT_02 => X"0028FFE6001D0047FF890060FF87006BFFB9FFF1000A006AFFB2FFBB007AFFCB",
                INIT_03 => X"0061002CFFC9FFFD00230004FFF1FFEB001BFFF7FFB2FFF5FFF40056FF8FFF98",
                INIT_04 => X"0062005D004B0064FFC60065FF7E001E0045FFCC00610010007C0012004CFFE5",
                INIT_05 => X"FFA3FFB0FFDAFFEF0014FFBA0025FFE6FFFBFFA7FFC90072FFD90026FFA7006C",
                INIT_06 => X"FF9B005D00300055000B003CFFE0FFFC0068FFC00027FFD3006CFFCAFF99FFE4",
                INIT_07 => X"003DFF9DFFAF004EFF9C0021FFA50017FFCA004FFFB3FFEBFFB50037001A0006",
                INIT_08 => X"FF93FFA6004E006D0016FFA4006DFFF0FF97FF8D00630073002CFFA30021FF88",
                INIT_09 => X"FF83FFB30006FFDA000D00380030003E0048FFB10030002300490049FFA80024",
                INIT_0A => X"000BFFF9FFCFFFDD0056005DFFE5FFB90054FFF30011FFB1007C005EFFA5FF92",
                INIT_0B => X"FFA2FFB2FFA10054FFB20004FF8600190035FF8C0000FFD70054001C0011FF89",
                INIT_0C => X"FFC100150074FFF6FF840027000900170061FFB3FFF3004C0032FFBAFFE4FFC1",
                INIT_0D => X"FFE0005B003F007BFF98FFFE0067006A0051FFA0FFE3FFC8FF9600710015FFF2",
                INIT_0E => X"0077FFBAFFFCFF9B0065FFC2FF98FFCAFF7DFF8CFFC80004FFF80077FF9EFFD5",
                INIT_0F => X"FFFE006CFFA1000F0065FFABFF94FFF0005DFFAEFF9AFFB7FFCF000600750021",
                INIT_10 => X"0048FFED0050FFFA00260056005CFFE6FFD5FFE40063001B006C0052FFC70007",
                INIT_11 => X"0042FF940056FFE7FFFFFFF1FFE90024FF87FFAC005DFF9DFF9FFF900083FFAE",
                INIT_12 => X"004AFFEE0078003CFF8FFFB8005B0065FFBF00590046FFFBFFFA006E0078004B",
                INIT_13 => X"0039FF93000C0010FFAF0044000BFFBF007FFF860076004C0038FFE4003E000B",
                INIT_14 => X"FFE5001B006C007B0038002D0050004AFF91FFC90045FFA9FFF1006B006DFFC5",
                INIT_15 => X"0027001C00120069FF8B000A00810020FFCEFFBB000B002AFFFEFF9B001DFFD2",
                INIT_16 => X"FFD70031FFEC007AFFE10073FFF80056000C000D0020001AFFC8000B00660035",
                INIT_17 => X"FFCEFFF0FFBD003CFFB10001000C00070024000AFFDDFFF500750054FFA10006",
                INIT_18 => X"FFE2000E0047000A004A004C0015004800110069FF98FF90FF8F000E0024005C",
                INIT_19 => X"FFEDFFCE0038FFBF0083FFEB006A003400430033FFAA006F005DFFD00048004F",
                INIT_1A => X"FFC5001CFF92FFB0003300770065001FFFFA0075006C000AFFB700320066FFF9",
                INIT_1B => X"FFBC0012001FFFE10034FF88005D0067FFEAFFF6003400570074FFCDFFD4006F",
                INIT_1C => X"0040007200370069005DFFB5FFABFFDFFFED004EFFA40071006EFFC7FFECFFCC",
                INIT_1D => X"FF93FFA800320061007AFF96FFA50061FFDA0014FFC5FF92FF84000D00050025",
                INIT_1E => X"0014004F006800200079FFC4FFA40004FF88FFE1002800660076FFE20076FF95",
                INIT_1F => X"FF9B0025FFCE0001FFC800290000FFE1002FFFB4007D00720034004FFF990032",
                INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
               INITP_00 => X"3CCCCFC0C00F333FFF33FCCC00CC30030F0F3FCF30CCF0F30FC03F030CC3CC03",
               INITP_01 => X"FCCC33033F0F330FF300300CF033F0333CCCCFC0C00F333FFF33FCCC00CC3003",
               INITP_02 => X"CC3F3FC03F3FFCCFC0F03FC3C3C03C3FFCCC33033F0F330FF300300CF033F033",
               INITP_03 => X"30C3303030F0C3C033FCF3F33303F00CCC3F3FC03F3FFCCFC0F03FC3C3C03C3F",
               INITP_04 => X"FCC00F0CCCCC00C000C0F0F3C000F3C330C3303030F0C3C033FCF3F33303F00C",
               INITP_05 => X"C330F03CCF00C0C3F3300C30C0000FC0FCC00F0CCCCC00C000C0F0F3C000F3C3",
               INITP_06 => X"CCC3300C003CF033F03CCFC0003FCC3FC330F03CCF00C0C3F3300C30C0000FC0",
               INITP_07 => X"00000000000000000000000000000000CCC3300C003CF033F03CCFC0003FCC3F")

     PORT MAP (DOA   => douta,
               DOB   => doutb,
               DOPA  => open,
               DOPB  => open,
               ADDRA => addra,
               ADDRB => addrb,
               CLKA  => clka,
               CLKB  => clkb,
               DIA   => (OTHERS => '0'),
               DIB   => (OTHERS => '0'),
               DIPA  => (OTHERS => '0'),
               DIPB  => (OTHERS => '0'),
               ENA   => ena,
               ENB   => enb,
               SSRA  => '0',
               SSRB  => '0',
               WEA   => '0',
               WEB   => '0');


end low_level_definition;

