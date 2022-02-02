--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:20:37 02/02/2022
-- Design Name:   
-- Module Name:   /home/randy/Documents/VHDL_praktikum/IDEA/rcs2/tb_mux4x1.vhd
-- Project Name:  idea_rcs2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux4x1
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
 
ENTITY tb_mux4x1 IS
END tb_mux4x1;
 
ARCHITECTURE behavior OF tb_mux4x1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux4x1
    PORT(
         S : IN  std_logic_vector(1 downto 0);
         D0 : IN  std_logic_vector(15 downto 0);
         D1 : IN  std_logic_vector(15 downto 0);
         D2 : IN  std_logic_vector(15 downto 0);
         D3 : IN  std_logic_vector(15 downto 0);
         O : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal S : std_logic_vector(1 downto 0) := "00";
   signal D0 : std_logic_vector(15 downto 0) := (others => '0');
   signal D1 : std_logic_vector(15 downto 0) := (others => '0');
   signal D2 : std_logic_vector(15 downto 0) := (others => '0');
   signal D3 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal O : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux4x1 PORT MAP (
          S => S,
          D0 => D0,
          D1 => D1,
          D2 => D2,
          D3 => D3,
          O => O
        );
 
 
		 S <= "00","01" after 10ns,
						"10" after 20ns,
						"11" after 45ns;
			
			D0 <= x"0000",
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
			
			D1 <= x"0000",
			x"0022" after 10ns,
			x"0024" after 15ns,
			x"0026" after 20ns,
			x"0038" after 25ns,
			x"00aa" after 30ns,
			x"00bb" after 35ns,
			x"0088" after 40ns,
			x"00cc" after 45ns,
			x"0008" after 50ns,
			x"0009" after 55ns;
			
			
						
			D2 <= x"0200",
			x"2022" after 10ns,
			x"2024" after 15ns,
			x"2026" after 20ns,
			x"2038" after 25ns,
			x"20aa" after 30ns,
			x"20bb" after 35ns,
			x"2088" after 40ns,
			x"20cc" after 45ns,
			x"2008" after 50ns,
			x"2009" after 55ns;
			
						
			D3 <= x"3000",
			x"3022" after 10ns,
			x"3024" after 15ns,
			x"3026" after 20ns,
			x"3038" after 25ns,
			x"30aa" after 30ns,
			x"30bb" after 35ns,
			x"3088" after 40ns,
			x"30cc" after 45ns,
			x"3008" after 50ns,
			x"3009" after 55ns;


END;
