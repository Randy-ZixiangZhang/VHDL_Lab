--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:34:52 11/27/2021
-- Design Name:   
-- Module Name:   /home/randy/Documents/VHDL_System_Design/IDEA/tb_addop.vhd
-- Project Name:  IDEA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: addop
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
 
 
ENTITY tb_addop IS
END tb_addop;
 
architecture STIMULI of tb_addop is
component addop
	port( A,B: in std_logic_vector (15 downto 0);
			SUM: out std_logic_vector (15 downto 0));
end component;

signal X,Y,Z: std_logic_vector(15 downto 0):="0000000000000000";

		 
begin
	UUT:addop port map(X,Y,Z);

	X <= x"0000",
			x"7ce3" after 10ns,
			x"7ce3" after 15ns,
			x"fce3" after 20ns,
			x"fce3" after 25ns,
			x"7ce3" after 30ns;
	Y <= x"0000",
			x"0000" after 10ns,
			x"2db6" after 15ns,
			x"2db6" after 20ns,
			x"edb6" after 25ns,
			x"edb6" after 30ns;
	
end STIMULI;