--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.15xf
--  \   \         Application: netgen
--  /   /         Filename: aufgabe1_map.vhd
-- /___/   /\     Timestamp: Thu Nov 10 10:09:40 2016
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 5 -pcf aufgabe1.pcf -rpw 100 -tpw 0 -ar Structure -tm aufgabe1 -w -dir netgen/map -ofmt vhdl -sim aufgabe1_map.ncd aufgabe1_map.vhd 
-- Device	: 3s200ft256-5 (PRODUCTION 1.39 2012-04-23)
-- Input file	: aufgabe1_map.ncd
-- Output file	: C:\Users\edc10.IN\Desktop\Projekte-KDS\VHDL\src\Aufgabe1\netgen\map\aufgabe1_map.vhd
-- # of Entities	: 1
-- Design Name	: aufgabe1
-- Xilinx	: C:\Xilinx\14.1\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity aufgabe1 is
  port (
    clk : in STD_LOGIC := 'X'; 
    dp : out STD_LOGIC; 
    rst : in STD_LOGIC := 'X'; 
    btn0 : in STD_LOGIC := 'X'; 
    btn1 : in STD_LOGIC := 'X'; 
    an : out STD_LOGIC_VECTOR ( 3 downto 0 ); 
    seg : out STD_LOGIC_VECTOR ( 7 downto 1 ); 
    sw : in STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end aufgabe1;

architecture Structure of aufgabe1 is
  signal clk_BUFGP : STD_LOGIC; 
  signal rst_IBUF_280 : STD_LOGIC; 
  signal u1_Mcount_div_cnt_cy_1_Q : STD_LOGIC; 
  signal u1_Mcount_div_cnt_cy_3_Q : STD_LOGIC; 
  signal u1_Mcount_div_cnt_cy_5_Q : STD_LOGIC; 
  signal u1_Mcount_div_cnt_cy_7_Q : STD_LOGIC; 
  signal u1_Mcount_div_cnt_cy_9_Q : STD_LOGIC; 
  signal btn0_IBUF_301 : STD_LOGIC; 
  signal btn1_IBUF_302 : STD_LOGIC; 
  signal sw_0_IBUF_311 : STD_LOGIC; 
  signal sw_1_IBUF_313 : STD_LOGIC; 
  signal sw_2_IBUF_315 : STD_LOGIC; 
  signal sw_3_IBUF_317 : STD_LOGIC; 
  signal sw_4_IBUF_319 : STD_LOGIC; 
  signal sw_5_IBUF_321 : STD_LOGIC; 
  signal sw_6_IBUF_322 : STD_LOGIC; 
  signal sw_7_IBUF_323 : STD_LOGIC; 
  signal u1_select_cnt_not0001_inv12_O : STD_LOGIC; 
  signal u1_select_cnt_not0001_inv25_0 : STD_LOGIC; 
  signal u1_select_cnt_not0001_inv49_0 : STD_LOGIC; 
  signal u1_select_cnt_not0001_inv53_0 : STD_LOGIC; 
  signal u1_output_digit_tmp_1_0 : STD_LOGIC; 
  signal u1_div_cnt_13_DXMUX_383 : STD_LOGIC; 
  signal u1_div_cnt_13_XORF_381 : STD_LOGIC; 
  signal u1_div_cnt_13_LOGIC_ONE_380 : STD_LOGIC; 
  signal u1_div_cnt_13_CYINIT_379 : STD_LOGIC; 
  signal u1_div_cnt_13_CYSELF_370 : STD_LOGIC; 
  signal u1_div_cnt_13_BXINV_368 : STD_LOGIC; 
  signal u1_div_cnt_13_DYMUX_361 : STD_LOGIC; 
  signal u1_div_cnt_13_XORG_359 : STD_LOGIC; 
  signal u1_div_cnt_13_CYMUXG_358 : STD_LOGIC; 
  signal u1_Mcount_div_cnt_cy_0_Q : STD_LOGIC; 
  signal u1_div_cnt_13_LOGIC_ZERO_356 : STD_LOGIC; 
  signal u1_div_cnt_13_CYSELG_347 : STD_LOGIC; 
  signal u1_div_cnt_13_G : STD_LOGIC; 
  signal u1_div_cnt_13_SRINV_345 : STD_LOGIC; 
  signal u1_div_cnt_13_CLKINV_344 : STD_LOGIC; 
  signal u1_div_cnt_11_DXMUX_439 : STD_LOGIC; 
  signal u1_div_cnt_11_XORF_437 : STD_LOGIC; 
  signal u1_div_cnt_11_CYINIT_436 : STD_LOGIC; 
  signal u1_div_cnt_11_F : STD_LOGIC; 
  signal u1_div_cnt_11_DYMUX_420 : STD_LOGIC; 
  signal u1_div_cnt_11_XORG_418 : STD_LOGIC; 
  signal u1_Mcount_div_cnt_cy_2_Q : STD_LOGIC; 
  signal u1_div_cnt_11_CYSELF_416 : STD_LOGIC; 
  signal u1_div_cnt_11_CYMUXFAST_415 : STD_LOGIC; 
  signal u1_div_cnt_11_CYAND_414 : STD_LOGIC; 
  signal u1_div_cnt_11_FASTCARRY_413 : STD_LOGIC; 
  signal u1_div_cnt_11_CYMUXG2_412 : STD_LOGIC; 
  signal u1_div_cnt_11_CYMUXF2_411 : STD_LOGIC; 
  signal u1_div_cnt_11_LOGIC_ZERO_410 : STD_LOGIC; 
  signal u1_div_cnt_11_CYSELG_401 : STD_LOGIC; 
  signal u1_div_cnt_11_G : STD_LOGIC; 
  signal u1_div_cnt_11_SRINV_399 : STD_LOGIC; 
  signal u1_div_cnt_11_CLKINV_398 : STD_LOGIC; 
  signal u1_div_cnt_9_DXMUX_495 : STD_LOGIC; 
  signal u1_div_cnt_9_XORF_493 : STD_LOGIC; 
  signal u1_div_cnt_9_CYINIT_492 : STD_LOGIC; 
  signal u1_div_cnt_9_F : STD_LOGIC; 
  signal u1_div_cnt_9_DYMUX_476 : STD_LOGIC; 
  signal u1_div_cnt_9_XORG_474 : STD_LOGIC; 
  signal u1_Mcount_div_cnt_cy_4_Q : STD_LOGIC; 
  signal u1_div_cnt_9_CYSELF_472 : STD_LOGIC; 
  signal u1_div_cnt_9_CYMUXFAST_471 : STD_LOGIC; 
  signal u1_div_cnt_9_CYAND_470 : STD_LOGIC; 
  signal u1_div_cnt_9_FASTCARRY_469 : STD_LOGIC; 
  signal u1_div_cnt_9_CYMUXG2_468 : STD_LOGIC; 
  signal u1_div_cnt_9_CYMUXF2_467 : STD_LOGIC; 
  signal u1_div_cnt_9_LOGIC_ZERO_466 : STD_LOGIC; 
  signal u1_div_cnt_9_CYSELG_457 : STD_LOGIC; 
  signal u1_div_cnt_9_G : STD_LOGIC; 
  signal u1_div_cnt_9_SRINV_455 : STD_LOGIC; 
  signal u1_div_cnt_9_CLKINV_454 : STD_LOGIC; 
  signal u1_div_cnt_7_DXMUX_551 : STD_LOGIC; 
  signal u1_div_cnt_7_XORF_549 : STD_LOGIC; 
  signal u1_div_cnt_7_CYINIT_548 : STD_LOGIC; 
  signal u1_div_cnt_7_F : STD_LOGIC; 
  signal u1_div_cnt_7_DYMUX_532 : STD_LOGIC; 
  signal u1_div_cnt_7_XORG_530 : STD_LOGIC; 
  signal u1_Mcount_div_cnt_cy_6_Q : STD_LOGIC; 
  signal u1_div_cnt_7_CYSELF_528 : STD_LOGIC; 
  signal u1_div_cnt_7_CYMUXFAST_527 : STD_LOGIC; 
  signal u1_div_cnt_7_CYAND_526 : STD_LOGIC; 
  signal u1_div_cnt_7_FASTCARRY_525 : STD_LOGIC; 
  signal u1_div_cnt_7_CYMUXG2_524 : STD_LOGIC; 
  signal u1_div_cnt_7_CYMUXF2_523 : STD_LOGIC; 
  signal u1_div_cnt_7_LOGIC_ZERO_522 : STD_LOGIC; 
  signal u1_div_cnt_7_CYSELG_513 : STD_LOGIC; 
  signal u1_div_cnt_7_G : STD_LOGIC; 
  signal u1_div_cnt_7_SRINV_511 : STD_LOGIC; 
  signal u1_div_cnt_7_CLKINV_510 : STD_LOGIC; 
  signal u1_div_cnt_5_DXMUX_607 : STD_LOGIC; 
  signal u1_div_cnt_5_XORF_605 : STD_LOGIC; 
  signal u1_div_cnt_5_CYINIT_604 : STD_LOGIC; 
  signal u1_div_cnt_5_F : STD_LOGIC; 
  signal u1_div_cnt_5_DYMUX_588 : STD_LOGIC; 
  signal u1_div_cnt_5_XORG_586 : STD_LOGIC; 
  signal u1_Mcount_div_cnt_cy_8_Q : STD_LOGIC; 
  signal u1_div_cnt_5_CYSELF_584 : STD_LOGIC; 
  signal u1_div_cnt_5_CYMUXFAST_583 : STD_LOGIC; 
  signal u1_div_cnt_5_CYAND_582 : STD_LOGIC; 
  signal u1_div_cnt_5_FASTCARRY_581 : STD_LOGIC; 
  signal u1_div_cnt_5_CYMUXG2_580 : STD_LOGIC; 
  signal u1_div_cnt_5_CYMUXF2_579 : STD_LOGIC; 
  signal u1_div_cnt_5_LOGIC_ZERO_578 : STD_LOGIC; 
  signal u1_div_cnt_5_CYSELG_569 : STD_LOGIC; 
  signal u1_div_cnt_5_G : STD_LOGIC; 
  signal u1_div_cnt_5_SRINV_567 : STD_LOGIC; 
  signal u1_div_cnt_5_CLKINV_566 : STD_LOGIC; 
  signal u1_div_cnt_3_DXMUX_663 : STD_LOGIC; 
  signal u1_div_cnt_3_XORF_661 : STD_LOGIC; 
  signal u1_div_cnt_3_CYINIT_660 : STD_LOGIC; 
  signal u1_div_cnt_3_F : STD_LOGIC; 
  signal u1_div_cnt_3_DYMUX_644 : STD_LOGIC; 
  signal u1_div_cnt_3_XORG_642 : STD_LOGIC; 
  signal u1_Mcount_div_cnt_cy_10_Q : STD_LOGIC; 
  signal u1_div_cnt_3_CYSELF_640 : STD_LOGIC; 
  signal u1_div_cnt_3_CYMUXFAST_639 : STD_LOGIC; 
  signal u1_div_cnt_3_CYAND_638 : STD_LOGIC; 
  signal u1_div_cnt_3_FASTCARRY_637 : STD_LOGIC; 
  signal u1_div_cnt_3_CYMUXG2_636 : STD_LOGIC; 
  signal u1_div_cnt_3_CYMUXF2_635 : STD_LOGIC; 
  signal u1_div_cnt_3_LOGIC_ZERO_634 : STD_LOGIC; 
  signal u1_div_cnt_3_CYSELG_625 : STD_LOGIC; 
  signal u1_div_cnt_3_G : STD_LOGIC; 
  signal u1_div_cnt_3_SRINV_623 : STD_LOGIC; 
  signal u1_div_cnt_3_CLKINV_622 : STD_LOGIC; 
  signal u1_div_cnt_1_DXMUX_712 : STD_LOGIC; 
  signal u1_div_cnt_1_XORF_710 : STD_LOGIC; 
  signal u1_div_cnt_1_LOGIC_ZERO_709 : STD_LOGIC; 
  signal u1_div_cnt_1_CYINIT_708 : STD_LOGIC; 
  signal u1_div_cnt_1_CYSELF_699 : STD_LOGIC; 
  signal u1_div_cnt_1_F : STD_LOGIC; 
  signal u1_div_cnt_1_DYMUX_691 : STD_LOGIC; 
  signal u1_div_cnt_1_XORG_689 : STD_LOGIC; 
  signal u1_Mcount_div_cnt_cy_12_Q : STD_LOGIC; 
  signal u1_div_cnt_0_rt_686 : STD_LOGIC; 
  signal u1_div_cnt_1_SRINV_678 : STD_LOGIC; 
  signal u1_div_cnt_1_CLKINV_677 : STD_LOGIC; 
  signal btn0_INBUF : STD_LOGIC; 
  signal btn1_INBUF : STD_LOGIC; 
  signal an_0_O : STD_LOGIC; 
  signal an_1_O : STD_LOGIC; 
  signal an_2_O : STD_LOGIC; 
  signal an_3_O : STD_LOGIC; 
  signal dp_O : STD_LOGIC; 
  signal clk_INBUF : STD_LOGIC; 
  signal seg_1_O : STD_LOGIC; 
  signal seg_2_O : STD_LOGIC; 
  signal sw_0_INBUF : STD_LOGIC; 
  signal seg_3_O : STD_LOGIC; 
  signal sw_1_INBUF : STD_LOGIC; 
  signal seg_4_O : STD_LOGIC; 
  signal sw_2_INBUF : STD_LOGIC; 
  signal seg_5_O : STD_LOGIC; 
  signal sw_3_INBUF : STD_LOGIC; 
  signal seg_6_O : STD_LOGIC; 
  signal sw_4_INBUF : STD_LOGIC; 
  signal seg_7_O : STD_LOGIC; 
  signal sw_5_INBUF : STD_LOGIC; 
  signal sw_6_INBUF : STD_LOGIC; 
  signal sw_7_INBUF : STD_LOGIC; 
  signal rst_INBUF : STD_LOGIC; 
  signal clk_BUFGP_BUFG_S_INVNOT : STD_LOGIC; 
  signal clk_BUFGP_BUFG_I0_INV : STD_LOGIC; 
  signal u1_select_cnt_not0001_inv : STD_LOGIC; 
  signal u1_select_cnt_not0001_inv12_O_pack_1 : STD_LOGIC; 
  signal u1_select_cnt_1_DXMUX_957 : STD_LOGIC; 
  signal an_0_OBUF_954 : STD_LOGIC; 
  signal u1_select_cnt_1_DYMUX_939 : STD_LOGIC; 
  signal u1_select_cnt_1_SRINV_929 : STD_LOGIC; 
  signal u1_select_cnt_1_CLKINV_928 : STD_LOGIC; 
  signal u1_select_cnt_1_CEINV_927 : STD_LOGIC; 
  signal seg_4_OBUF_986 : STD_LOGIC; 
  signal seg_2_OBUF_979 : STD_LOGIC; 
  signal an_1_OBUF_1010 : STD_LOGIC; 
  signal an_2_OBUF_1001 : STD_LOGIC; 
  signal an_3_OBUF_1026 : STD_LOGIC; 
  signal u1_select_cnt_not0001_inv25_1046 : STD_LOGIC; 
  signal u1_select_cnt_not0001_inv53_1058 : STD_LOGIC; 
  signal u1_select_cnt_not0001_inv49_1070 : STD_LOGIC; 
  signal dp_OBUF_1082 : STD_LOGIC; 
  signal seg_7_OBUF_1106 : STD_LOGIC; 
  signal seg_1_OBUF_1099 : STD_LOGIC; 
  signal seg_6_OBUF_1130 : STD_LOGIC; 
  signal u1_output_digit_tmp_0_pack_1 : STD_LOGIC; 
  signal seg_3_OBUF_1154 : STD_LOGIC; 
  signal u1_output_digit_tmp_2_pack_1 : STD_LOGIC; 
  signal seg_5_OBUF_1178 : STD_LOGIC; 
  signal u1_output_digit_tmp_3_pack_1 : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal u1_div_cnt : STD_LOGIC_VECTOR ( 13 downto 0 ); 
  signal u1_select_cnt : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal u1_output_digit_tmp : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal u1_Mcount_div_cnt_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal u1_Result : STD_LOGIC_VECTOR ( 1 downto 1 ); 
begin
  u1_div_cnt_13_LOGIC_ZERO : X_ZERO
    port map (
      O => u1_div_cnt_13_LOGIC_ZERO_356
    );
  u1_div_cnt_13_LOGIC_ONE : X_ONE
    port map (
      O => u1_div_cnt_13_LOGIC_ONE_380
    );
  u1_div_cnt_13_DXMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_13_XORF_381,
      O => u1_div_cnt_13_DXMUX_383
    );
  u1_div_cnt_13_XORF : X_XOR2
    port map (
      I0 => u1_div_cnt_13_CYINIT_379,
      I1 => u1_Mcount_div_cnt_lut(0),
      O => u1_div_cnt_13_XORF_381
    );
  u1_div_cnt_13_CYMUXF : X_MUX2
    port map (
      IA => u1_div_cnt_13_LOGIC_ONE_380,
      IB => u1_div_cnt_13_CYINIT_379,
      SEL => u1_div_cnt_13_CYSELF_370,
      O => u1_Mcount_div_cnt_cy_0_Q
    );
  u1_div_cnt_13_CYINIT : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_13_BXINV_368,
      O => u1_div_cnt_13_CYINIT_379
    );
  u1_div_cnt_13_CYSELF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_Mcount_div_cnt_lut(0),
      O => u1_div_cnt_13_CYSELF_370
    );
  u1_div_cnt_13_BXINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => '0',
      O => u1_div_cnt_13_BXINV_368
    );
  u1_div_cnt_13_DYMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_13_XORG_359,
      O => u1_div_cnt_13_DYMUX_361
    );
  u1_div_cnt_13_XORG : X_XOR2
    port map (
      I0 => u1_Mcount_div_cnt_cy_0_Q,
      I1 => u1_div_cnt_13_G,
      O => u1_div_cnt_13_XORG_359
    );
  u1_div_cnt_13_COUTUSED : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_13_CYMUXG_358,
      O => u1_Mcount_div_cnt_cy_1_Q
    );
  u1_div_cnt_13_CYMUXG : X_MUX2
    port map (
      IA => u1_div_cnt_13_LOGIC_ZERO_356,
      IB => u1_Mcount_div_cnt_cy_0_Q,
      SEL => u1_div_cnt_13_CYSELG_347,
      O => u1_div_cnt_13_CYMUXG_358
    );
  u1_div_cnt_13_CYSELG : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_13_G,
      O => u1_div_cnt_13_CYSELG_347
    );
  u1_div_cnt_13_SRINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => rst_IBUF_280,
      O => u1_div_cnt_13_SRINV_345
    );
  u1_div_cnt_13_CLKINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => clk_BUFGP,
      O => u1_div_cnt_13_CLKINV_344
    );
  u1_div_cnt_11_LOGIC_ZERO : X_ZERO
    port map (
      O => u1_div_cnt_11_LOGIC_ZERO_410
    );
  u1_div_cnt_11_DXMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_11_XORF_437,
      O => u1_div_cnt_11_DXMUX_439
    );
  u1_div_cnt_11_XORF : X_XOR2
    port map (
      I0 => u1_div_cnt_11_CYINIT_436,
      I1 => u1_div_cnt_11_F,
      O => u1_div_cnt_11_XORF_437
    );
  u1_div_cnt_11_CYMUXF : X_MUX2
    port map (
      IA => u1_div_cnt_11_LOGIC_ZERO_410,
      IB => u1_div_cnt_11_CYINIT_436,
      SEL => u1_div_cnt_11_CYSELF_416,
      O => u1_Mcount_div_cnt_cy_2_Q
    );
  u1_div_cnt_11_CYMUXF2 : X_MUX2
    port map (
      IA => u1_div_cnt_11_LOGIC_ZERO_410,
      IB => u1_div_cnt_11_LOGIC_ZERO_410,
      SEL => u1_div_cnt_11_CYSELF_416,
      O => u1_div_cnt_11_CYMUXF2_411
    );
  u1_div_cnt_11_CYINIT : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_Mcount_div_cnt_cy_1_Q,
      O => u1_div_cnt_11_CYINIT_436
    );
  u1_div_cnt_11_CYSELF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_11_F,
      O => u1_div_cnt_11_CYSELF_416
    );
  u1_div_cnt_11_DYMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_11_XORG_418,
      O => u1_div_cnt_11_DYMUX_420
    );
  u1_div_cnt_11_XORG : X_XOR2
    port map (
      I0 => u1_Mcount_div_cnt_cy_2_Q,
      I1 => u1_div_cnt_11_G,
      O => u1_div_cnt_11_XORG_418
    );
  u1_div_cnt_11_COUTUSED : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_11_CYMUXFAST_415,
      O => u1_Mcount_div_cnt_cy_3_Q
    );
  u1_div_cnt_11_FASTCARRY : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_Mcount_div_cnt_cy_1_Q,
      O => u1_div_cnt_11_FASTCARRY_413
    );
  u1_div_cnt_11_CYAND : X_AND2
    port map (
      I0 => u1_div_cnt_11_CYSELG_401,
      I1 => u1_div_cnt_11_CYSELF_416,
      O => u1_div_cnt_11_CYAND_414
    );
  u1_div_cnt_11_CYMUXFAST : X_MUX2
    port map (
      IA => u1_div_cnt_11_CYMUXG2_412,
      IB => u1_div_cnt_11_FASTCARRY_413,
      SEL => u1_div_cnt_11_CYAND_414,
      O => u1_div_cnt_11_CYMUXFAST_415
    );
  u1_div_cnt_11_CYMUXG2 : X_MUX2
    port map (
      IA => u1_div_cnt_11_LOGIC_ZERO_410,
      IB => u1_div_cnt_11_CYMUXF2_411,
      SEL => u1_div_cnt_11_CYSELG_401,
      O => u1_div_cnt_11_CYMUXG2_412
    );
  u1_div_cnt_11_CYSELG : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_11_G,
      O => u1_div_cnt_11_CYSELG_401
    );
  u1_div_cnt_11_SRINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => rst_IBUF_280,
      O => u1_div_cnt_11_SRINV_399
    );
  u1_div_cnt_11_CLKINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => clk_BUFGP,
      O => u1_div_cnt_11_CLKINV_398
    );
  u1_div_cnt_9_LOGIC_ZERO : X_ZERO
    port map (
      O => u1_div_cnt_9_LOGIC_ZERO_466
    );
  u1_div_cnt_9_DXMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_9_XORF_493,
      O => u1_div_cnt_9_DXMUX_495
    );
  u1_div_cnt_9_XORF : X_XOR2
    port map (
      I0 => u1_div_cnt_9_CYINIT_492,
      I1 => u1_div_cnt_9_F,
      O => u1_div_cnt_9_XORF_493
    );
  u1_div_cnt_9_CYMUXF : X_MUX2
    port map (
      IA => u1_div_cnt_9_LOGIC_ZERO_466,
      IB => u1_div_cnt_9_CYINIT_492,
      SEL => u1_div_cnt_9_CYSELF_472,
      O => u1_Mcount_div_cnt_cy_4_Q
    );
  u1_div_cnt_9_CYMUXF2 : X_MUX2
    port map (
      IA => u1_div_cnt_9_LOGIC_ZERO_466,
      IB => u1_div_cnt_9_LOGIC_ZERO_466,
      SEL => u1_div_cnt_9_CYSELF_472,
      O => u1_div_cnt_9_CYMUXF2_467
    );
  u1_div_cnt_9_CYINIT : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_Mcount_div_cnt_cy_3_Q,
      O => u1_div_cnt_9_CYINIT_492
    );
  u1_div_cnt_9_CYSELF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_9_F,
      O => u1_div_cnt_9_CYSELF_472
    );
  u1_div_cnt_9_DYMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_9_XORG_474,
      O => u1_div_cnt_9_DYMUX_476
    );
  u1_div_cnt_9_XORG : X_XOR2
    port map (
      I0 => u1_Mcount_div_cnt_cy_4_Q,
      I1 => u1_div_cnt_9_G,
      O => u1_div_cnt_9_XORG_474
    );
  u1_div_cnt_9_COUTUSED : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_9_CYMUXFAST_471,
      O => u1_Mcount_div_cnt_cy_5_Q
    );
  u1_div_cnt_9_FASTCARRY : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_Mcount_div_cnt_cy_3_Q,
      O => u1_div_cnt_9_FASTCARRY_469
    );
  u1_div_cnt_9_CYAND : X_AND2
    port map (
      I0 => u1_div_cnt_9_CYSELG_457,
      I1 => u1_div_cnt_9_CYSELF_472,
      O => u1_div_cnt_9_CYAND_470
    );
  u1_div_cnt_9_CYMUXFAST : X_MUX2
    port map (
      IA => u1_div_cnt_9_CYMUXG2_468,
      IB => u1_div_cnt_9_FASTCARRY_469,
      SEL => u1_div_cnt_9_CYAND_470,
      O => u1_div_cnt_9_CYMUXFAST_471
    );
  u1_div_cnt_9_CYMUXG2 : X_MUX2
    port map (
      IA => u1_div_cnt_9_LOGIC_ZERO_466,
      IB => u1_div_cnt_9_CYMUXF2_467,
      SEL => u1_div_cnt_9_CYSELG_457,
      O => u1_div_cnt_9_CYMUXG2_468
    );
  u1_div_cnt_9_CYSELG : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_9_G,
      O => u1_div_cnt_9_CYSELG_457
    );
  u1_div_cnt_9_SRINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => rst_IBUF_280,
      O => u1_div_cnt_9_SRINV_455
    );
  u1_div_cnt_9_CLKINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => clk_BUFGP,
      O => u1_div_cnt_9_CLKINV_454
    );
  u1_div_cnt_7_LOGIC_ZERO : X_ZERO
    port map (
      O => u1_div_cnt_7_LOGIC_ZERO_522
    );
  u1_div_cnt_7_DXMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_7_XORF_549,
      O => u1_div_cnt_7_DXMUX_551
    );
  u1_div_cnt_7_XORF : X_XOR2
    port map (
      I0 => u1_div_cnt_7_CYINIT_548,
      I1 => u1_div_cnt_7_F,
      O => u1_div_cnt_7_XORF_549
    );
  u1_div_cnt_7_CYMUXF : X_MUX2
    port map (
      IA => u1_div_cnt_7_LOGIC_ZERO_522,
      IB => u1_div_cnt_7_CYINIT_548,
      SEL => u1_div_cnt_7_CYSELF_528,
      O => u1_Mcount_div_cnt_cy_6_Q
    );
  u1_div_cnt_7_CYMUXF2 : X_MUX2
    port map (
      IA => u1_div_cnt_7_LOGIC_ZERO_522,
      IB => u1_div_cnt_7_LOGIC_ZERO_522,
      SEL => u1_div_cnt_7_CYSELF_528,
      O => u1_div_cnt_7_CYMUXF2_523
    );
  u1_div_cnt_7_CYINIT : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_Mcount_div_cnt_cy_5_Q,
      O => u1_div_cnt_7_CYINIT_548
    );
  u1_div_cnt_7_CYSELF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_7_F,
      O => u1_div_cnt_7_CYSELF_528
    );
  u1_div_cnt_7_DYMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_7_XORG_530,
      O => u1_div_cnt_7_DYMUX_532
    );
  u1_div_cnt_7_XORG : X_XOR2
    port map (
      I0 => u1_Mcount_div_cnt_cy_6_Q,
      I1 => u1_div_cnt_7_G,
      O => u1_div_cnt_7_XORG_530
    );
  u1_div_cnt_7_COUTUSED : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_7_CYMUXFAST_527,
      O => u1_Mcount_div_cnt_cy_7_Q
    );
  u1_div_cnt_7_FASTCARRY : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_Mcount_div_cnt_cy_5_Q,
      O => u1_div_cnt_7_FASTCARRY_525
    );
  u1_div_cnt_7_CYAND : X_AND2
    port map (
      I0 => u1_div_cnt_7_CYSELG_513,
      I1 => u1_div_cnt_7_CYSELF_528,
      O => u1_div_cnt_7_CYAND_526
    );
  u1_div_cnt_7_CYMUXFAST : X_MUX2
    port map (
      IA => u1_div_cnt_7_CYMUXG2_524,
      IB => u1_div_cnt_7_FASTCARRY_525,
      SEL => u1_div_cnt_7_CYAND_526,
      O => u1_div_cnt_7_CYMUXFAST_527
    );
  u1_div_cnt_7_CYMUXG2 : X_MUX2
    port map (
      IA => u1_div_cnt_7_LOGIC_ZERO_522,
      IB => u1_div_cnt_7_CYMUXF2_523,
      SEL => u1_div_cnt_7_CYSELG_513,
      O => u1_div_cnt_7_CYMUXG2_524
    );
  u1_div_cnt_7_CYSELG : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_7_G,
      O => u1_div_cnt_7_CYSELG_513
    );
  u1_div_cnt_7_SRINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => rst_IBUF_280,
      O => u1_div_cnt_7_SRINV_511
    );
  u1_div_cnt_7_CLKINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => clk_BUFGP,
      O => u1_div_cnt_7_CLKINV_510
    );
  u1_div_cnt_5_LOGIC_ZERO : X_ZERO
    port map (
      O => u1_div_cnt_5_LOGIC_ZERO_578
    );
  u1_div_cnt_5_DXMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_5_XORF_605,
      O => u1_div_cnt_5_DXMUX_607
    );
  u1_div_cnt_5_XORF : X_XOR2
    port map (
      I0 => u1_div_cnt_5_CYINIT_604,
      I1 => u1_div_cnt_5_F,
      O => u1_div_cnt_5_XORF_605
    );
  u1_div_cnt_5_CYMUXF : X_MUX2
    port map (
      IA => u1_div_cnt_5_LOGIC_ZERO_578,
      IB => u1_div_cnt_5_CYINIT_604,
      SEL => u1_div_cnt_5_CYSELF_584,
      O => u1_Mcount_div_cnt_cy_8_Q
    );
  u1_div_cnt_5_CYMUXF2 : X_MUX2
    port map (
      IA => u1_div_cnt_5_LOGIC_ZERO_578,
      IB => u1_div_cnt_5_LOGIC_ZERO_578,
      SEL => u1_div_cnt_5_CYSELF_584,
      O => u1_div_cnt_5_CYMUXF2_579
    );
  u1_div_cnt_5_CYINIT : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_Mcount_div_cnt_cy_7_Q,
      O => u1_div_cnt_5_CYINIT_604
    );
  u1_div_cnt_5_CYSELF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_5_F,
      O => u1_div_cnt_5_CYSELF_584
    );
  u1_div_cnt_5_DYMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_5_XORG_586,
      O => u1_div_cnt_5_DYMUX_588
    );
  u1_div_cnt_5_XORG : X_XOR2
    port map (
      I0 => u1_Mcount_div_cnt_cy_8_Q,
      I1 => u1_div_cnt_5_G,
      O => u1_div_cnt_5_XORG_586
    );
  u1_div_cnt_5_COUTUSED : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_5_CYMUXFAST_583,
      O => u1_Mcount_div_cnt_cy_9_Q
    );
  u1_div_cnt_5_FASTCARRY : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_Mcount_div_cnt_cy_7_Q,
      O => u1_div_cnt_5_FASTCARRY_581
    );
  u1_div_cnt_5_CYAND : X_AND2
    port map (
      I0 => u1_div_cnt_5_CYSELG_569,
      I1 => u1_div_cnt_5_CYSELF_584,
      O => u1_div_cnt_5_CYAND_582
    );
  u1_div_cnt_5_CYMUXFAST : X_MUX2
    port map (
      IA => u1_div_cnt_5_CYMUXG2_580,
      IB => u1_div_cnt_5_FASTCARRY_581,
      SEL => u1_div_cnt_5_CYAND_582,
      O => u1_div_cnt_5_CYMUXFAST_583
    );
  u1_div_cnt_5_CYMUXG2 : X_MUX2
    port map (
      IA => u1_div_cnt_5_LOGIC_ZERO_578,
      IB => u1_div_cnt_5_CYMUXF2_579,
      SEL => u1_div_cnt_5_CYSELG_569,
      O => u1_div_cnt_5_CYMUXG2_580
    );
  u1_div_cnt_5_CYSELG : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_5_G,
      O => u1_div_cnt_5_CYSELG_569
    );
  u1_div_cnt_5_SRINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => rst_IBUF_280,
      O => u1_div_cnt_5_SRINV_567
    );
  u1_div_cnt_5_CLKINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => clk_BUFGP,
      O => u1_div_cnt_5_CLKINV_566
    );
  u1_div_cnt_3_LOGIC_ZERO : X_ZERO
    port map (
      O => u1_div_cnt_3_LOGIC_ZERO_634
    );
  u1_div_cnt_3_DXMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_3_XORF_661,
      O => u1_div_cnt_3_DXMUX_663
    );
  u1_div_cnt_3_XORF : X_XOR2
    port map (
      I0 => u1_div_cnt_3_CYINIT_660,
      I1 => u1_div_cnt_3_F,
      O => u1_div_cnt_3_XORF_661
    );
  u1_div_cnt_3_CYMUXF : X_MUX2
    port map (
      IA => u1_div_cnt_3_LOGIC_ZERO_634,
      IB => u1_div_cnt_3_CYINIT_660,
      SEL => u1_div_cnt_3_CYSELF_640,
      O => u1_Mcount_div_cnt_cy_10_Q
    );
  u1_div_cnt_3_CYMUXF2 : X_MUX2
    port map (
      IA => u1_div_cnt_3_LOGIC_ZERO_634,
      IB => u1_div_cnt_3_LOGIC_ZERO_634,
      SEL => u1_div_cnt_3_CYSELF_640,
      O => u1_div_cnt_3_CYMUXF2_635
    );
  u1_div_cnt_3_CYINIT : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_Mcount_div_cnt_cy_9_Q,
      O => u1_div_cnt_3_CYINIT_660
    );
  u1_div_cnt_3_CYSELF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_3_F,
      O => u1_div_cnt_3_CYSELF_640
    );
  u1_div_cnt_3_DYMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_3_XORG_642,
      O => u1_div_cnt_3_DYMUX_644
    );
  u1_div_cnt_3_XORG : X_XOR2
    port map (
      I0 => u1_Mcount_div_cnt_cy_10_Q,
      I1 => u1_div_cnt_3_G,
      O => u1_div_cnt_3_XORG_642
    );
  u1_div_cnt_3_FASTCARRY : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_Mcount_div_cnt_cy_9_Q,
      O => u1_div_cnt_3_FASTCARRY_637
    );
  u1_div_cnt_3_CYAND : X_AND2
    port map (
      I0 => u1_div_cnt_3_CYSELG_625,
      I1 => u1_div_cnt_3_CYSELF_640,
      O => u1_div_cnt_3_CYAND_638
    );
  u1_div_cnt_3_CYMUXFAST : X_MUX2
    port map (
      IA => u1_div_cnt_3_CYMUXG2_636,
      IB => u1_div_cnt_3_FASTCARRY_637,
      SEL => u1_div_cnt_3_CYAND_638,
      O => u1_div_cnt_3_CYMUXFAST_639
    );
  u1_div_cnt_3_CYMUXG2 : X_MUX2
    port map (
      IA => u1_div_cnt_3_LOGIC_ZERO_634,
      IB => u1_div_cnt_3_CYMUXF2_635,
      SEL => u1_div_cnt_3_CYSELG_625,
      O => u1_div_cnt_3_CYMUXG2_636
    );
  u1_div_cnt_3_CYSELG : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_3_G,
      O => u1_div_cnt_3_CYSELG_625
    );
  u1_div_cnt_3_SRINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => rst_IBUF_280,
      O => u1_div_cnt_3_SRINV_623
    );
  u1_div_cnt_3_CLKINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => clk_BUFGP,
      O => u1_div_cnt_3_CLKINV_622
    );
  u1_div_cnt_1_LOGIC_ZERO : X_ZERO
    port map (
      O => u1_div_cnt_1_LOGIC_ZERO_709
    );
  u1_div_cnt_1_DXMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_1_XORF_710,
      O => u1_div_cnt_1_DXMUX_712
    );
  u1_div_cnt_1_XORF : X_XOR2
    port map (
      I0 => u1_div_cnt_1_CYINIT_708,
      I1 => u1_div_cnt_1_F,
      O => u1_div_cnt_1_XORF_710
    );
  u1_div_cnt_1_CYMUXF : X_MUX2
    port map (
      IA => u1_div_cnt_1_LOGIC_ZERO_709,
      IB => u1_div_cnt_1_CYINIT_708,
      SEL => u1_div_cnt_1_CYSELF_699,
      O => u1_Mcount_div_cnt_cy_12_Q
    );
  u1_div_cnt_1_CYINIT : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_3_CYMUXFAST_639,
      O => u1_div_cnt_1_CYINIT_708
    );
  u1_div_cnt_1_CYSELF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_1_F,
      O => u1_div_cnt_1_CYSELF_699
    );
  u1_div_cnt_1_DYMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_div_cnt_1_XORG_689,
      O => u1_div_cnt_1_DYMUX_691
    );
  u1_div_cnt_1_XORG : X_XOR2
    port map (
      I0 => u1_Mcount_div_cnt_cy_12_Q,
      I1 => u1_div_cnt_0_rt_686,
      O => u1_div_cnt_1_XORG_689
    );
  u1_div_cnt_1_SRINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => rst_IBUF_280,
      O => u1_div_cnt_1_SRINV_678
    );
  u1_div_cnt_1_CLKINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => clk_BUFGP,
      O => u1_div_cnt_1_CLKINV_677
    );
  btn0_IBUF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => btn0,
      O => btn0_INBUF
    );
  btn0_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => btn0_INBUF,
      O => btn0_IBUF_301
    );
  btn1_IBUF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => btn1,
      O => btn1_INBUF
    );
  btn1_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => btn1_INBUF,
      O => btn1_IBUF_302
    );
  an_0_OBUF : X_OBUF
    port map (
      I => an_0_O,
      O => an(0)
    );
  an_1_OBUF : X_OBUF
    port map (
      I => an_1_O,
      O => an(1)
    );
  an_2_OBUF : X_OBUF
    port map (
      I => an_2_O,
      O => an(2)
    );
  an_3_OBUF : X_OBUF
    port map (
      I => an_3_O,
      O => an(3)
    );
  dp_OBUF : X_OBUF
    port map (
      I => dp_O,
      O => dp
    );
  clk_BUFGP_IBUFG : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => clk,
      O => clk_INBUF
    );
  seg_1_OBUF : X_OBUF
    port map (
      I => seg_1_O,
      O => seg(1)
    );
  seg_2_OBUF : X_OBUF
    port map (
      I => seg_2_O,
      O => seg(2)
    );
  sw_0_IBUF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => sw(0),
      O => sw_0_INBUF
    );
  sw_0_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => sw_0_INBUF,
      O => sw_0_IBUF_311
    );
  seg_3_OBUF : X_OBUF
    port map (
      I => seg_3_O,
      O => seg(3)
    );
  sw_1_IBUF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => sw(1),
      O => sw_1_INBUF
    );
  sw_1_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => sw_1_INBUF,
      O => sw_1_IBUF_313
    );
  seg_4_OBUF : X_OBUF
    port map (
      I => seg_4_O,
      O => seg(4)
    );
  sw_2_IBUF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => sw(2),
      O => sw_2_INBUF
    );
  sw_2_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => sw_2_INBUF,
      O => sw_2_IBUF_315
    );
  seg_5_OBUF : X_OBUF
    port map (
      I => seg_5_O,
      O => seg(5)
    );
  sw_3_IBUF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => sw(3),
      O => sw_3_INBUF
    );
  sw_3_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => sw_3_INBUF,
      O => sw_3_IBUF_317
    );
  seg_6_OBUF : X_OBUF
    port map (
      I => seg_6_O,
      O => seg(6)
    );
  sw_4_IBUF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => sw(4),
      O => sw_4_INBUF
    );
  sw_4_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => sw_4_INBUF,
      O => sw_4_IBUF_319
    );
  seg_7_OBUF : X_OBUF
    port map (
      I => seg_7_O,
      O => seg(7)
    );
  sw_5_IBUF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => sw(5),
      O => sw_5_INBUF
    );
  sw_5_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => sw_5_INBUF,
      O => sw_5_IBUF_321
    );
  sw_6_IBUF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => sw(6),
      O => sw_6_INBUF
    );
  sw_6_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => sw_6_INBUF,
      O => sw_6_IBUF_322
    );
  sw_7_IBUF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => sw(7),
      O => sw_7_INBUF
    );
  rst_IBUF : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => rst,
      O => rst_INBUF
    );
  clk_BUFGP_BUFG : X_BUFGMUX
    port map (
      I0 => clk_BUFGP_BUFG_I0_INV,
      I1 => GND,
      S => clk_BUFGP_BUFG_S_INVNOT,
      O => clk_BUFGP
    );
  clk_BUFGP_BUFG_SINV : X_INV
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => '1',
      O => clk_BUFGP_BUFG_S_INVNOT
    );
  clk_BUFGP_BUFG_I0_USED : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => clk_INBUF,
      O => clk_BUFGP_BUFG_I0_INV
    );
  u1_select_cnt_not0001_inv_YUSED : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_select_cnt_not0001_inv12_O_pack_1,
      O => u1_select_cnt_not0001_inv12_O
    );
  u1_select_cnt_1_DXMUX : X_INV
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_select_cnt(1),
      O => u1_select_cnt_1_DXMUX_957
    );
  u1_select_cnt_1_DYMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_Result(1),
      O => u1_select_cnt_1_DYMUX_939
    );
  u1_select_cnt_1_SRINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => rst_IBUF_280,
      O => u1_select_cnt_1_SRINV_929
    );
  u1_select_cnt_1_CLKINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => clk_BUFGP,
      O => u1_select_cnt_1_CLKINV_928
    );
  u1_select_cnt_1_CEINV : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_select_cnt_not0001_inv,
      O => u1_select_cnt_1_CEINV_927
    );
  u1_output_digit_tmp_1_XUSED : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_output_digit_tmp(1),
      O => u1_output_digit_tmp_1_0
    );
  u1_select_cnt_not0001_inv25_XUSED : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_select_cnt_not0001_inv25_1046,
      O => u1_select_cnt_not0001_inv25_0
    );
  u1_select_cnt_not0001_inv53_XUSED : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_select_cnt_not0001_inv53_1058,
      O => u1_select_cnt_not0001_inv53_0
    );
  u1_select_cnt_not0001_inv49_XUSED : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_select_cnt_not0001_inv49_1070,
      O => u1_select_cnt_not0001_inv49_0
    );
  seg_6_OBUF_YUSED : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_output_digit_tmp_0_pack_1,
      O => u1_output_digit_tmp(0)
    );
  seg_3_OBUF_YUSED : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_output_digit_tmp_2_pack_1,
      O => u1_output_digit_tmp(2)
    );
  seg_5_OBUF_YUSED : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => u1_output_digit_tmp_3_pack_1,
      O => u1_output_digit_tmp(3)
    );
  u1_div_cnt_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => u1_div_cnt_1_DXMUX_712,
      CE => VCC,
      CLK => u1_div_cnt_1_CLKINV_677,
      SET => GND,
      RST => u1_div_cnt_1_SRINV_678,
      O => u1_div_cnt(1)
    );
  u1_div_cnt_12 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => u1_div_cnt_13_DYMUX_361,
      CE => VCC,
      CLK => u1_div_cnt_13_CLKINV_344,
      SET => GND,
      RST => u1_div_cnt_13_SRINV_345,
      O => u1_div_cnt(12)
    );
  u1_Mcount_div_cnt_lut_0_INV_0 : X_LUT4
    generic map(
      INIT => X"5555"
    )
    port map (
      ADR0 => u1_div_cnt(13),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => u1_Mcount_div_cnt_lut(0)
    );
  u1_div_cnt_13 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => u1_div_cnt_13_DXMUX_383,
      CE => VCC,
      CLK => u1_div_cnt_13_CLKINV_344,
      SET => GND,
      RST => u1_div_cnt_13_SRINV_345,
      O => u1_div_cnt(13)
    );
  u1_div_cnt_10 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => u1_div_cnt_11_DYMUX_420,
      CE => VCC,
      CLK => u1_div_cnt_11_CLKINV_398,
      SET => GND,
      RST => u1_div_cnt_11_SRINV_399,
      O => u1_div_cnt(10)
    );
  u1_div_cnt_11 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => u1_div_cnt_11_DXMUX_439,
      CE => VCC,
      CLK => u1_div_cnt_11_CLKINV_398,
      SET => GND,
      RST => u1_div_cnt_11_SRINV_399,
      O => u1_div_cnt(11)
    );
  u1_div_cnt_8 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => u1_div_cnt_9_DYMUX_476,
      CE => VCC,
      CLK => u1_div_cnt_9_CLKINV_454,
      SET => GND,
      RST => u1_div_cnt_9_SRINV_455,
      O => u1_div_cnt(8)
    );
  u1_div_cnt_9 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => u1_div_cnt_9_DXMUX_495,
      CE => VCC,
      CLK => u1_div_cnt_9_CLKINV_454,
      SET => GND,
      RST => u1_div_cnt_9_SRINV_455,
      O => u1_div_cnt(9)
    );
  u1_div_cnt_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => u1_div_cnt_7_DYMUX_532,
      CE => VCC,
      CLK => u1_div_cnt_7_CLKINV_510,
      SET => GND,
      RST => u1_div_cnt_7_SRINV_511,
      O => u1_div_cnt(6)
    );
  u1_div_cnt_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => u1_div_cnt_7_DXMUX_551,
      CE => VCC,
      CLK => u1_div_cnt_7_CLKINV_510,
      SET => GND,
      RST => u1_div_cnt_7_SRINV_511,
      O => u1_div_cnt(7)
    );
  u1_div_cnt_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => u1_div_cnt_5_DYMUX_588,
      CE => VCC,
      CLK => u1_div_cnt_5_CLKINV_566,
      SET => GND,
      RST => u1_div_cnt_5_SRINV_567,
      O => u1_div_cnt(4)
    );
  u1_div_cnt_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => u1_div_cnt_5_DXMUX_607,
      CE => VCC,
      CLK => u1_div_cnt_5_CLKINV_566,
      SET => GND,
      RST => u1_div_cnt_5_SRINV_567,
      O => u1_div_cnt(5)
    );
  u1_div_cnt_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => u1_div_cnt_3_DYMUX_644,
      CE => VCC,
      CLK => u1_div_cnt_3_CLKINV_622,
      SET => GND,
      RST => u1_div_cnt_3_SRINV_623,
      O => u1_div_cnt(2)
    );
  u1_div_cnt_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => u1_div_cnt_3_DXMUX_663,
      CE => VCC,
      CLK => u1_div_cnt_3_CLKINV_622,
      SET => GND,
      RST => u1_div_cnt_3_SRINV_623,
      O => u1_div_cnt(3)
    );
  u1_div_cnt_0_rt : X_LUT4
    generic map(
      INIT => X"AAAA"
    )
    port map (
      ADR0 => u1_div_cnt(0),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => u1_div_cnt_0_rt_686
    );
  u1_div_cnt_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => u1_div_cnt_1_DYMUX_691,
      CE => VCC,
      CLK => u1_div_cnt_1_CLKINV_677,
      SET => GND,
      RST => u1_div_cnt_1_SRINV_678,
      O => u1_div_cnt(0)
    );
  sw_7_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => sw_7_INBUF,
      O => sw_7_IBUF_323
    );
  rst_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => rst_INBUF,
      O => rst_IBUF_280
    );
  u1_select_cnt_not0001_inv12 : X_LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      ADR0 => u1_div_cnt(11),
      ADR1 => u1_div_cnt(10),
      ADR2 => u1_div_cnt(9),
      ADR3 => u1_div_cnt(8),
      O => u1_select_cnt_not0001_inv12_O_pack_1
    );
  u1_select_cnt_not0001_inv64 : X_LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      ADR0 => u1_select_cnt_not0001_inv12_O,
      ADR1 => u1_select_cnt_not0001_inv25_0,
      ADR2 => u1_select_cnt_not0001_inv49_0,
      ADR3 => u1_select_cnt_not0001_inv53_0,
      O => u1_select_cnt_not0001_inv
    );
  u1_Mcount_select_cnt_xor_1_11 : X_LUT4
    generic map(
      INIT => X"6666"
    )
    port map (
      ADR0 => u1_select_cnt(0),
      ADR1 => u1_select_cnt(1),
      ADR2 => VCC,
      ADR3 => VCC,
      O => u1_Result(1)
    );
  u1_select_cnt_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => u1_select_cnt_1_DYMUX_939,
      CE => u1_select_cnt_1_CEINV_927,
      CLK => u1_select_cnt_1_CLKINV_928,
      SET => GND,
      RST => u1_select_cnt_1_SRINV_929,
      O => u1_select_cnt(0)
    );
  u1_Mrom_an_x_tmp11 : X_LUT4
    generic map(
      INIT => X"7777"
    )
    port map (
      ADR0 => u1_select_cnt(1),
      ADR1 => u1_select_cnt(0),
      ADR2 => VCC,
      ADR3 => VCC,
      O => an_0_OBUF_954
    );
  u1_select_cnt_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => u1_select_cnt_1_DXMUX_957,
      CE => u1_select_cnt_1_CEINV_927,
      CLK => u1_select_cnt_1_CLKINV_928,
      SET => GND,
      RST => u1_select_cnt_1_SRINV_929,
      O => u1_select_cnt(1)
    );
  u1_Mrom_seg_x_tmp111 : X_LUT4
    generic map(
      INIT => X"5910"
    )
    port map (
      ADR0 => u1_output_digit_tmp(0),
      ADR1 => u1_output_digit_tmp_1_0,
      ADR2 => u1_output_digit_tmp(2),
      ADR3 => u1_output_digit_tmp(3),
      O => seg_2_OBUF_979
    );
  u1_Mrom_seg_x_tmp31 : X_LUT4
    generic map(
      INIT => X"9806"
    )
    port map (
      ADR0 => u1_output_digit_tmp_1_0,
      ADR1 => u1_output_digit_tmp(3),
      ADR2 => u1_output_digit_tmp(0),
      ADR3 => u1_output_digit_tmp(2),
      O => seg_4_OBUF_986
    );
  u1_Mrom_an_x_tmp21 : X_LUT4
    generic map(
      INIT => X"DDDD"
    )
    port map (
      ADR0 => u1_select_cnt(1),
      ADR1 => u1_select_cnt(0),
      ADR2 => VCC,
      ADR3 => VCC,
      O => an_2_OBUF_1001
    );
  u1_Mrom_an_x_tmp111 : X_LUT4
    generic map(
      INIT => X"DDDD"
    )
    port map (
      ADR0 => u1_select_cnt(0),
      ADR1 => u1_select_cnt(1),
      ADR2 => VCC,
      ADR3 => VCC,
      O => an_1_OBUF_1010
    );
  u1_Mrom_an_x_tmp31 : X_LUT4
    generic map(
      INIT => X"EEEE"
    )
    port map (
      ADR0 => u1_select_cnt(0),
      ADR1 => u1_select_cnt(1),
      ADR2 => VCC,
      ADR3 => VCC,
      O => an_3_OBUF_1026
    );
  u1_Mmux_output_digit_tmp21 : X_LUT4
    generic map(
      INIT => X"E4E4"
    )
    port map (
      ADR0 => u1_select_cnt(1),
      ADR1 => sw_6_IBUF_322,
      ADR2 => sw_2_IBUF_315,
      ADR3 => VCC,
      O => u1_output_digit_tmp(1)
    );
  u1_select_cnt_not0001_inv25 : X_LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      ADR0 => u1_div_cnt(7),
      ADR1 => u1_div_cnt(6),
      ADR2 => u1_div_cnt(5),
      ADR3 => u1_div_cnt(4),
      O => u1_select_cnt_not0001_inv25_1046
    );
  u1_select_cnt_not0001_inv53 : X_LUT4
    generic map(
      INIT => X"1111"
    )
    port map (
      ADR0 => u1_div_cnt(13),
      ADR1 => u1_div_cnt(12),
      ADR2 => VCC,
      ADR3 => VCC,
      O => u1_select_cnt_not0001_inv53_1058
    );
  u1_select_cnt_not0001_inv49 : X_LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      ADR0 => u1_div_cnt(3),
      ADR1 => u1_div_cnt(2),
      ADR2 => u1_div_cnt(1),
      ADR3 => u1_div_cnt(0),
      O => u1_select_cnt_not0001_inv49_1070
    );
  u1_Mmux_dp_tmp11 : X_LUT4
    generic map(
      INIT => X"1B1B"
    )
    port map (
      ADR0 => u1_select_cnt(0),
      ADR1 => btn1_IBUF_302,
      ADR2 => btn0_IBUF_301,
      ADR3 => VCC,
      O => dp_OBUF_1082
    );
  u1_Mrom_seg_x_tmp11 : X_LUT4
    generic map(
      INIT => X"4109"
    )
    port map (
      ADR0 => u1_output_digit_tmp(0),
      ADR1 => u1_output_digit_tmp_1_0,
      ADR2 => u1_output_digit_tmp(2),
      ADR3 => u1_output_digit_tmp(3),
      O => seg_1_OBUF_1099
    );
  u1_Mrom_seg_x_tmp61 : X_LUT4
    generic map(
      INIT => X"6102"
    )
    port map (
      ADR0 => u1_output_digit_tmp_1_0,
      ADR1 => u1_output_digit_tmp(2),
      ADR2 => u1_output_digit_tmp(0),
      ADR3 => u1_output_digit_tmp(3),
      O => seg_7_OBUF_1106
    );
  u1_Mmux_output_digit_tmp11 : X_LUT4
    generic map(
      INIT => X"E4E4"
    )
    port map (
      ADR0 => u1_select_cnt(1),
      ADR1 => sw_7_IBUF_323,
      ADR2 => sw_3_IBUF_317,
      ADR3 => VCC,
      O => u1_output_digit_tmp_0_pack_1
    );
  u1_Mrom_seg_x_tmp51 : X_LUT4
    generic map(
      INIT => X"B860"
    )
    port map (
      ADR0 => u1_output_digit_tmp(2),
      ADR1 => u1_output_digit_tmp(3),
      ADR2 => u1_output_digit_tmp_1_0,
      ADR3 => u1_output_digit_tmp(0),
      O => seg_6_OBUF_1130
    );
  u1_Mmux_output_digit_tmp31 : X_LUT4
    generic map(
      INIT => X"E4E4"
    )
    port map (
      ADR0 => u1_select_cnt(1),
      ADR1 => sw_5_IBUF_321,
      ADR2 => sw_1_IBUF_313,
      ADR3 => VCC,
      O => u1_output_digit_tmp_2_pack_1
    );
  u1_Mrom_seg_x_tmp21 : X_LUT4
    generic map(
      INIT => X"223A"
    )
    port map (
      ADR0 => u1_output_digit_tmp(3),
      ADR1 => u1_output_digit_tmp(0),
      ADR2 => u1_output_digit_tmp_1_0,
      ADR3 => u1_output_digit_tmp(2),
      O => seg_3_OBUF_1154
    );
  u1_Mmux_output_digit_tmp41 : X_LUT4
    generic map(
      INIT => X"E4E4"
    )
    port map (
      ADR0 => u1_select_cnt(1),
      ADR1 => sw_4_IBUF_319,
      ADR2 => sw_0_IBUF_311,
      ADR3 => VCC,
      O => u1_output_digit_tmp_3_pack_1
    );
  u1_Mrom_seg_x_tmp41 : X_LUT4
    generic map(
      INIT => X"8098"
    )
    port map (
      ADR0 => u1_output_digit_tmp(0),
      ADR1 => u1_output_digit_tmp_1_0,
      ADR2 => u1_output_digit_tmp(2),
      ADR3 => u1_output_digit_tmp(3),
      O => seg_5_OBUF_1178
    );
  u1_div_cnt_13_G_X_LUT4 : X_LUT4
    generic map(
      INIT => X"AAAA"
    )
    port map (
      ADR0 => u1_div_cnt(12),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => u1_div_cnt_13_G
    );
  u1_div_cnt_11_F_X_LUT4 : X_LUT4
    generic map(
      INIT => X"AAAA"
    )
    port map (
      ADR0 => u1_div_cnt(11),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => u1_div_cnt_11_F
    );
  u1_div_cnt_11_G_X_LUT4 : X_LUT4
    generic map(
      INIT => X"AAAA"
    )
    port map (
      ADR0 => u1_div_cnt(10),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => u1_div_cnt_11_G
    );
  u1_div_cnt_9_F_X_LUT4 : X_LUT4
    generic map(
      INIT => X"AAAA"
    )
    port map (
      ADR0 => u1_div_cnt(9),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => u1_div_cnt_9_F
    );
  u1_div_cnt_9_G_X_LUT4 : X_LUT4
    generic map(
      INIT => X"AAAA"
    )
    port map (
      ADR0 => u1_div_cnt(8),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => u1_div_cnt_9_G
    );
  u1_div_cnt_7_F_X_LUT4 : X_LUT4
    generic map(
      INIT => X"AAAA"
    )
    port map (
      ADR0 => u1_div_cnt(7),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => u1_div_cnt_7_F
    );
  u1_div_cnt_7_G_X_LUT4 : X_LUT4
    generic map(
      INIT => X"AAAA"
    )
    port map (
      ADR0 => u1_div_cnt(6),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => u1_div_cnt_7_G
    );
  u1_div_cnt_5_F_X_LUT4 : X_LUT4
    generic map(
      INIT => X"AAAA"
    )
    port map (
      ADR0 => u1_div_cnt(5),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => u1_div_cnt_5_F
    );
  u1_div_cnt_5_G_X_LUT4 : X_LUT4
    generic map(
      INIT => X"AAAA"
    )
    port map (
      ADR0 => u1_div_cnt(4),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => u1_div_cnt_5_G
    );
  u1_div_cnt_3_F_X_LUT4 : X_LUT4
    generic map(
      INIT => X"AAAA"
    )
    port map (
      ADR0 => u1_div_cnt(3),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => u1_div_cnt_3_F
    );
  u1_div_cnt_3_G_X_LUT4 : X_LUT4
    generic map(
      INIT => X"AAAA"
    )
    port map (
      ADR0 => u1_div_cnt(2),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => u1_div_cnt_3_G
    );
  u1_div_cnt_1_F_X_LUT4 : X_LUT4
    generic map(
      INIT => X"AAAA"
    )
    port map (
      ADR0 => u1_div_cnt(1),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => u1_div_cnt_1_F
    );
  an_0_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => an_0_OBUF_954,
      O => an_0_O
    );
  an_1_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => an_1_OBUF_1010,
      O => an_1_O
    );
  an_2_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => an_2_OBUF_1001,
      O => an_2_O
    );
  an_3_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => an_3_OBUF_1026,
      O => an_3_O
    );
  dp_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => dp_OBUF_1082,
      O => dp_O
    );
  seg_1_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => seg_1_OBUF_1099,
      O => seg_1_O
    );
  seg_2_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => seg_2_OBUF_979,
      O => seg_2_O
    );
  seg_3_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => seg_3_OBUF_1154,
      O => seg_3_O
    );
  seg_4_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => seg_4_OBUF_986,
      O => seg_4_O
    );
  seg_5_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => seg_5_OBUF_1178,
      O => seg_5_O
    );
  seg_6_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => seg_6_OBUF_1130,
      O => seg_6_O
    );
  seg_7_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 526 ps
    )
    port map (
      I => seg_7_OBUF_1106,
      O => seg_7_O
    );
  NlwBlock_aufgabe1_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlock_aufgabe1_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

