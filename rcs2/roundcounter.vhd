----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    roundcounter - Behavioral 
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

entity roundcounter is
    Port ( CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           RESULT : in  STD_LOGIC;
           READY : out  STD_LOGIC;
           S_i : out  STD_LOGIC;
           INIT : out  STD_LOGIC;
           TRAFO : out  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0));
end roundcounter;

architecture Behavioral of roundcounter is

begin
process(CLK,START,RESULT) --TRAFO as input signal?
	
	variable state:std_logic_vector(1 downto 0) := "00"; --sleep state
	variable internal_state:std_logic_vector(3 downto 0):="0000";
	variable isReady:std_logic:='1';

	begin
	if (CLK = '1' and CLK'EVENT) then
		case state is
			when "00" =>
				if isReady = '1' then
					if START = '1' then
						state:= "01";--transfers to 01 setup
					elsif START = '0' then
						INIT <= '0';
						READY <= '1';
						state:= "00";--stay in sleep
					end if;
				end if;
			when "01" =>
				INIT <= '1';
				READY <= '0';
				state:= "10";
			when "10" =>
				INIT <= '0';
				if RESULT = '0' then
					case internal_state is
						when "0000" =>
							S_i <= '1';
							TRAFO <= '0';
						when "1000" =>
							S_i <= '0';
							TRAFO <= '1';
						when others =>
							S_i <= '0';
							TRAFO <= '0';
					end case;
					ROUND <= internal_state;
				elsif RESULT = '1' and internal_state /= "1000" then
					state:= "01";
					internal_state:= internal_state + "0001";
				elsif RESULT = '1' and internal_state = "1000" then
					state:= "00";
					internal_state:= "0000";
				end if;
			when others => --"11"
		end case;
	end if;

	end process;

end Behavioral;

