----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:23:50 11/27/2021 
-- Design Name: 
-- Module Name:    addop - Behavioral 
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
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addop is
	port( A,B: in std_logic_vector (15 downto 0);
			SUM: out std_logic_vector (15 downto 0));
end addop;


architecture Behavioral of addop is

begin

	addop_operation:process(A,B) is
	begin
		SUM <= A + B;
	end process addop_operation;

end Behavioral;

