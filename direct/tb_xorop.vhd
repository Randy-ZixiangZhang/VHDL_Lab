--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:59:26 11/27/2021
-- Design Name:   
-- Module Name:   /home/randy/Documents/VHDL_System_Design/IDEA/tb_xorop.vhd
-- Project Name:  IDEA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: xorop
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
 
ENTITY tb_xorop IS
END tb_xorop;
 
architecture STIMULI of tb_xorop is
component xorop
	port( A,B: in std_logic_vector (15 downto 0);
			O: out std_logic_vector (15 downto 0));
end component;

signal X,Y,Z: std_logic_vector(15 downto 0):="0000000000000000";

		 
begin
	UUT:xorop port map(X,Y,Z);
	X <= x"0000",x"1234" after 5ns;
	Y <= x"0000",x"5678" after 5ns,
		 x"0000" after 10ns;
	
end STIMULI;