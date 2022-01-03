----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:24:15 11/27/2021 
-- Design Name: 
-- Module Name:    xorop - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity xorop is
	port( A,B: in std_logic_vector (15 downto 0);
			O: out std_logic_vector (15 downto 0));
end xorop;

architecture Behavioral of xorop is

begin

	xor_operation:process(A,B) is
	begin
		O <= A xor B;
	end process xor_operation;

end Behavioral;

