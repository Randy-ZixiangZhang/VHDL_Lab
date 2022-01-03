----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:44:00 11/28/2021 
-- Design Name: 
-- Module Name:    mulop - Behavioral 
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

entity mulop is
    Port ( I_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           I_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           O_1 : out  STD_LOGIC_VECTOR (15 downto 0));
end mulop;

architecture Behavioral of mulop is
signal Operand_1,Operand_2:std_logic_vector(16 downto 0);

begin
sub1:process(I_1)
	begin
		if I_1 = x"0000" then
			Operand_1 <= '1' & x"0000";--17bits
		else
			Operand_1 <= '0' & I_1;
		end if;	
	end process sub1;

	--replacement for some reason has to be seperated into one process
	sub2:process(I_2) 
	begin
		if I_2 = x"0000" then
			Operand_2 <= '1' & x"0000"; --17bits
		else
			Operand_2 <= '0' & I_2;
		end if;
	end process sub2;

	mulop_operation:process(Operand_1,Operand_2) is
		variable product:std_logic_vector(33 downto 0);
		variable	mod_result: std_logic_vector (16 downto 0);
		variable div_result: std_logic_vector (16 downto 0);
		variable Result: std_logic_vector (16 downto 0);
	begin

		product:= Operand_1*Operand_2;  --34bits
		mod_result := '0' & product (15 downto 0);--1bit + 16bits
		div_result :=  product (32 downto 16);--17bits
		if mod_result >= div_result then
			Result:= mod_result - div_result;
		else
			Result:= mod_result - div_result + ('1' & x"0000") + x"0001" ;-- have to use "()"
		end if;
		
		O_1 <= Result(15 downto 0);
	end process mulop_operation;
	

end Behavioral;
