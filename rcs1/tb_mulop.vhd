--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:17:25 11/27/2021
-- Design Name:   
-- Module Name:   /home/randy/Documents/VHDL_System_Design/IDEA/tb_mulop.vhd
-- Project Name:  IDEA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mulop
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
 
 
ENTITY tb_mulop IS
END tb_mulop;
 
architecture STIMULI of tb_mulop is
component mulop
	port( I_1,I_2: in std_logic_vector (15 downto 0);
			O_1: out std_logic_vector (15 downto 0));
end component;

signal X,Y,Z: std_logic_vector(15 downto 0):=x"0000";
	constant wait_interval:time:=2ns;
		 
begin
	UUT:mulop port map(X,Y,Z);
	X <= x"0000",
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
	Y <= x"0000",
			x"0000" after 10ns,
			x"0001" after 15ns,
			x"0001" after 20ns,
			x"0003" after 25ns,
			x"0003" after 30ns,
			x"7fff" after 35ns,
			x"7fff" after 40ns,
			x"ffff" after 45ns,
			x"ffff" after 50ns,
			x"8000" after 55ns;
end STIMULI;