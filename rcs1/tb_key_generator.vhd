--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:14:06 01/04/2022
-- Design Name:   
-- Module Name:   /home/randy/Documents/VHDL_praktikum/IDEA/rcs1/tb_key_generator.vhd
-- Project Name:  idea_rcs1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: key_generator
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
 
ENTITY tb_key_generator IS
END tb_key_generator;
 
ARCHITECTURE behavior OF tb_key_generator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT key_generator
    PORT(
         Round : IN  std_logic_vector(3 downto 0);
         Key : IN  std_logic_vector(127 downto 0);
         Z1 : OUT  std_logic_vector(15 downto 0);
         Z2 : OUT  std_logic_vector(15 downto 0);
         Z3 : OUT  std_logic_vector(15 downto 0);
         Z4 : OUT  std_logic_vector(15 downto 0);
         Z5 : OUT  std_logic_vector(15 downto 0);
         Z6 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Round : std_logic_vector(3 downto 0) := (others => '0');
   signal Key : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal Z1 : std_logic_vector(15 downto 0);
   signal Z2 : std_logic_vector(15 downto 0);
   signal Z3 : std_logic_vector(15 downto 0);
   signal Z4 : std_logic_vector(15 downto 0);
   signal Z5 : std_logic_vector(15 downto 0);
   signal Z6 : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: key_generator PORT MAP (
          Round => Round,
          Key => Key,
          Z1 => Z1,
          Z2 => Z2,
          Z3 => Z3,
          Z4 => Z4,
          Z5 => Z5,
          Z6 => Z6
        );
		
		KEY <= x"00010002000300040005000600070008";
		Round <= "0000",
			"0001" after 10ns,
			"0010" after 15ns,
			"0011" after 20ns,
			"0100" after 25ns,
			"0101" after 30ns,
			"0110" after 35ns,
			"0111" after 40ns,
			"1000" after 45ns;

END;
