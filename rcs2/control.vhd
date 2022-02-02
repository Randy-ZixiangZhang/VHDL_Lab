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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control is
    Port ( CLK : in  STD_LOGIC;
           INIT : in  STD_LOGIC;
           TRAFO : in STD_LOGIC;
           EN125 : out  STD_LOGIC;
           EN346 : out  STD_LOGIC;
           EN78 : out  STD_LOGIC;
           RESULT : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(1 downto 0);
           S_T: out STD_LOGIC_VECTOR(1 downto 0));	
end control;

architecture Behavioral of control is

begin

	process(CLK,INIT,TRAFO) --TRAFO as input signal?
		variable internal_state:std_logic_vector(2 downto 0):="000";
		variable isready:std_logic:='1'; --default ready
		
		begin
		if (CLK = '1' and CLK'EVENT)
		then
			case TRAFO is
				when '0' =>
					if isready = '1' and INIT = '1' then
						isready := '0';
						
					elsif isready = '0' then
						
						case internal_state is
								when "000" =>
									S <= "00";
									S_T <= "00";
									EN125 <= '1';
								when "001" =>
									EN125 <= '0';
								when "010" =>
									S <= "01";
									S_T <= "01";
									EN346 <= '1';
								when "011" =>
									EN346 <= '0';
								when "100" =>
									S <= "10";
									S_T <= "10";
									EN78 <= '1';
								when "101" =>
									EN78 <= '0';
								when "110" =>
									S <= "11";
									S_T <= "11";
									RESULT <= '1';
								when "111" =>
									isready := '1';
									RESULT <= '0';
									
								when others => --"000"
									
							end case;

						internal_state:= internal_state + "001";
					end if;

					
				when '1' =>
					if isready = '1' and INIT = '1' then
						isready := '0';
						
					elsif isready = '0' then
						
						case internal_state is
								when "000" =>
									S <= "00";
									S_T <= "01";
									EN125 <= '1';
								when "001" =>
									EN125 <= '0';
								when "010" =>
									S <= "01";
									S_T <= "00";
									EN346 <= '1';
								when "011" =>
									EN346 <= '0';
									internal_state:= internal_state + "010";
								--two internal states removed	
								when "110" =>
									S <= "11";
									S_T <= "10";
									RESULT <= '1';
								when "111" =>
									isready := '1';
									RESULT <= '0';
									
								when others => --"000"
									
							end case;

						internal_state:= internal_state + "001";
					end if;		
				when others => --"000"
					
			end case;
		

			
		
		end if;
	end process;

end Behavioral;

