--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:51:42 01/04/2022
-- Design Name:   
-- Module Name:   /home/randy/Documents/VHDL_praktikum/IDEA/rcs1/tb_idea_single.vhd
-- Project Name:  idea_rcs1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: idea_single
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
 
ENTITY tb_idea_single IS
END tb_idea_single;
 
ARCHITECTURE behavior OF tb_idea_single IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT idea_single
    PORT(
         CLOCK : IN  std_logic;
         START : IN  std_logic;
         KEY : IN  std_logic_vector(127 downto 0);
         X_1 : IN  std_logic_vector(15 downto 0);
         X_2 : IN  std_logic_vector(15 downto 0);
         X_3 : IN  std_logic_vector(15 downto 0);
         X_4 : IN  std_logic_vector(15 downto 0);
         Y_1 : OUT  std_logic_vector(15 downto 0);
         Y_2 : OUT  std_logic_vector(15 downto 0);
         Y_3 : OUT  std_logic_vector(15 downto 0);
         Y_4 : OUT  std_logic_vector(15 downto 0);
         READY : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLOCK : std_logic := '0';
   signal START : std_logic := '0';
   signal KEY : std_logic_vector(127 downto 0) := (others => '0');
   signal X_1 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_2 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_3 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_4 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Y_1 : std_logic_vector(15 downto 0);
   signal Y_2 : std_logic_vector(15 downto 0);
   signal Y_3 : std_logic_vector(15 downto 0);
   signal Y_4 : std_logic_vector(15 downto 0);
   signal READY : std_logic;

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: idea_single PORT MAP (
          CLOCK => CLOCK,
          START => START,
          KEY => KEY,
          X_1 => X_1,
          X_2 => X_2,
          X_3 => X_3,
          X_4 => X_4,
          Y_1 => Y_1,
          Y_2 => Y_2,
          Y_3 => Y_3,
          Y_4 => Y_4,
          READY => READY
        );

		CLOCK <= not CLOCK after 1ns;
		Start <= '0','1' after 0.5ns,
						 '0' after 1.5ns,
						 '1' after 25ns,
						 '0' after 26.5ns;
		KEY <= x"00010002000300040005000600070008", 
				 x"00000000000000000000000000000000" after 25ns;
			 
		X_1 <= x"1111",x"0000" after 25ns;
		X_2 <= x"2222",x"0000" after 25ns;
		X_3 <= x"4444",x"0000" after 25ns;
		X_4 <= x"8888",x"0000" after 25ns;
		
		

END;
