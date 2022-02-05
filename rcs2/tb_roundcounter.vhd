--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:55:04 02/03/2022
-- Design Name:   
-- Module Name:   /home/randy/Documents/VHDL_praktikum/IDEA/rcs2/tb_roundcounter.vhd
-- Project Name:  idea_rcs2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: roundcounter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_roundcounter IS
END tb_roundcounter;
 
ARCHITECTURE behavior OF tb_roundcounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT roundcounter
    PORT(
         CLK : IN  std_logic;
         START : IN  std_logic;
         RESULT : IN  std_logic;
         READY : OUT  std_logic;
         S_i : OUT  std_logic;
         INIT : OUT  std_logic;
         TRAFO : OUT  std_logic;
         ROUND : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal START : std_logic := '0';
   signal RESULT : std_logic := '0';

 	--Outputs
   signal READY : std_logic;
   signal S_i : std_logic;
   signal INIT : std_logic;
   signal TRAFO : std_logic;
   signal ROUND : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: roundcounter PORT MAP (
          CLK => CLK,
          START => START,
          RESULT => RESULT,
          READY => READY,
          S_i => S_i,
          INIT => INIT,
          TRAFO => TRAFO,
          ROUND => ROUND
        );

   -- Clock process definitions
	Clk <= not Clk after 10ns;
 

	START <= '1','0' after 25ns;
--	RESULT <= '0','1' after 200ns,
--						'0' after 215ns,
--						'1' after 400ns,
--						'0' after 415ns,
--						'1' after 600ns,
--						'0' after 615ns,
--						'1' after 800ns,
--						'0' after 815ns,
--						'1' after 1000ns,
--						'0' after 1015ns,
--						'1' after 1200ns,
--						'0' after 1215ns,
--						'1' after 1400ns,
--						'0' after 1415ns,
--						'1' after 1600ns,
--						'0' after 1615ns,
--						'1' after 1800ns,
--						'0' after 1815ns;

END;
