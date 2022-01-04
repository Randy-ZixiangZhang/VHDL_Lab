--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:46:24 01/02/2022
-- Design Name:   
-- Module Name:   /home/randy/Documents/IDEA/rcs1/tb_register16bit.vhd
-- Project Name:  idea_rcs1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: register16bit
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
 
ENTITY tb_register16bit IS
END tb_register16bit;
 
ARCHITECTURE behavior OF tb_register16bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register16bit
    PORT(
         ENABLE : IN  std_logic;
         Clock : IN  std_logic;
         D : IN  std_logic_vector(15 downto 0);
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ENABLE : std_logic := '0';
   signal Clock : std_logic := '0';
   signal D : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
	-- put clock here, not in the process
	Clock <= not Clock after 1ns;
	
	
	-- Instantiate the Unit Under Test (UUT)
   uut: register16bit PORT MAP (
          ENABLE => ENABLE,
          Clock => Clock,
          D => D,
          Q => Q	
        );

	-- not include them in process, or error
	ENABLE <= '0','1' after 10ns,
						'0' after 20ns,
						'1' after 45ns;
						

			D <= x"0000",
				x"0001" after 10ns,
				x"0001" after 15ns,
				x"0003" after 20ns,
				x"0003" after 25ns,
				x"7fff" after 30ns,
				x"7fff" after 35ns,
				x"ffff" after 40ns,
				x"ffff" after 45ns,
				x"8000" after 50ns,
				x"8000" after 55ns;

END behavior;
