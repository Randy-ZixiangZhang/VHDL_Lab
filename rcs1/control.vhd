----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    control - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control is
    Port ( CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0);
           READY : out  STD_LOGIC;
           EN : out  STD_LOGIC;
           S : out  STD_LOGIC);
end control;

architecture Structural of control is


	
	

	

begin

	--using one process
	process(start,CLK) 
		--define variable here, make it signal would have strange simulation results
		variable isready:std_logic := '1';
		variable round_count: STD_LOGIC_VECTOR (3 downto 0):= "1000";  
		begin
		if (CLK = '1' and CLK'EVENT)--rising edge
		then
			if isready = '0' then
			
				case round_count is
					when "1000" =>
						
						Ready <= '0';
						S <= '0';
						EN <= '1';
						round_count := "0000";
						ROUND <= round_count;
					when "0111" =>
						isready := '1';
						ready <= isready;
						EN <= '0';
						round_count := round_count + "0001";
						ROUND <= round_count;
					when others =>
						S <= '1';
						round_count := round_count + "0001";
						ROUND <= round_count;
				end case;		
				
			elsif (start = '1') and (isready = '1') then
				isready := '0';--internal signal is ready
				--initialize all outputs
				round <= "1000";
				READY <= '1';
				EN <= '0';
				S <= '1';
			end if;
			
			
		end if;

	end process;



end structural;

