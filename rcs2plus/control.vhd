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
		variable internal_state:std_logic_vector(1 downto 0):="00";
		variable isready:std_logic:='1'; --default ready
		variable isResult:std_logic:='0';
		
		
		begin
		if (CLK = '1' and CLK'EVENT)
		then
			case TRAFO is
				when '0' =>
					if isready = '1' and INIT = '1' then
						isready := '0';
						
					elsif isready = '0' then
						
						case internal_state is
								when "00" =>
									if isResult = '0' then
										S <= "00";
										S_T <= "00";
										EN125 <= '1';
									elsif isResult = '1' then
										isready := '1';
										isResult := '0';
										RESULT <= isResult;	
										internal_state:= "11";
									end if;
									
								when "01" =>
									EN125 <= '0';
									S <= "01";
									S_T <= "01";
									EN346 <= '1';
								when "10" =>
									EN346 <= '0';
									S <= "10";
									S_T <= "10";
									EN78 <= '1';									
								when "11" =>
									EN78 <= '0';
									S <= "11";
									S_T <= "11";
									isResult:= '1';
									RESULT <= isResult;									
								when others => --"00"
									
							end case;

						internal_state:= internal_state + "01";
					end if;

					
				when '1' =>
					if isready = '1' and INIT = '1' then
						isready := '0';
						
					elsif isready = '0' then
						
						case internal_state is
								when "00" =>
									if isResult = '0' then
										S <= "00";
										S_T <= "01";
										EN125 <= '1';
									elsif isResult = '1' then
										isready := '1';
										isResult := '0';
										RESULT <= isResult;
										internal_state:= "11";										
									end if;

								when "01" =>
									EN125 <= '0';
									S <= "01";
									S_T <= "00";
									EN346 <= '1';									
									internal_state:= internal_state + "01";
								--two internal states removed	
								when "11" =>
									EN346 <= '0';
									S <= "11";
									S_T <= "10";
									isResult:= '1';
									RESULT <= isResult;									
								when others => --
									
							end case;

						internal_state:= internal_state + "01";
					end if;		
				when others => --"00"
						if isready = '1' and INIT = '1' then
							isready := '0';
							isResult:= '0';
						end if;
			end case;
		end if;
	end process;

end Behavioral;

