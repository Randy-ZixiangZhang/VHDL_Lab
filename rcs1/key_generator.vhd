----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:43:30 01/04/2022 
-- Design Name: 
-- Module Name:    key_generator - Behavioral 
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

entity key_generator is
	port(Round: in STD_LOGIC_VECTOR(3 downto 0);
		  Key: in STD_LOGIC_VECTOR(127 downto 0);
		  Z1: out STD_LOGIC_VECTOR(15 downto 0);
		  Z2: out STD_LOGIC_VECTOR(15 downto 0);
		  Z3: out STD_LOGIC_VECTOR(15 downto 0);
		  Z4: out STD_LOGIC_VECTOR(15 downto 0);
		  Z5: out STD_LOGIC_VECTOR(15 downto 0);
		  Z6: out STD_LOGIC_VECTOR(15 downto 0));
end key_generator;

architecture Behavioral of key_generator is
 signal	key_shift_1, key_shift_2,
			key_shift_3, key_shift_4,
			key_shift_5, key_shift_6: std_logic_vector(127 downto 0);
begin
	key_shift_1 <= (KEY(102 downto 0) & KEY(127 downto 103));
	key_shift_2 <= (key_shift_1(102 downto 0) & key_shift_1(127 downto 103));
	key_shift_3 <= (key_shift_2(102 downto 0) & key_shift_2(127 downto 103));
	key_shift_4 <= (key_shift_3(102 downto 0) & key_shift_3(127 downto 103));
	key_shift_5 <= (key_shift_4(102 downto 0) & key_shift_4(127 downto 103));
	key_shift_6 <= (key_shift_5(102 downto 0) & key_shift_5(127 downto 103));
	process(Round) is
	begin
		case Round is
			when "0000" =>
				Z1 <= Key(127 downto 112);
				Z2 <= Key(111 downto 96);
				Z3 <= Key(95 downto 80);
				Z4 <= Key(79 downto 64);
				Z5 <= Key(63 downto 48);
				Z6 <= Key(47 downto 32);
			when "0001" =>
				Z1 <= KEY(31 downto 16);
				Z2 <= KEY(15 downto 0);
				Z3 <= KEY_shift_1(127 downto 112);
				Z4 <= KEY_shift_1(111 downto 96);
				Z5 <= KEY_shift_1(95 downto 80);
				Z6 <= KEY_shift_1(79 downto 64);
			when "0010" =>
				Z1 <= KEY_shift_1(63 downto 48);
				Z2 <= KEY_shift_1(47 downto 32);
				Z3 <= KEY_shift_1(31 downto 16);
				Z4 <= KEY_shift_1(15 downto 0);
				Z5 <= KEY_shift_2(127 downto 112);
				Z6 <= KEY_shift_2(111 downto 96);
			when "0011" =>
				Z1 <= KEY_shift_2(95 downto 80);
				Z2 <= KEY_shift_2(79 downto 64);
				Z3 <= KEY_shift_2(63 downto 48);
				Z4 <= KEY_shift_2(47 downto 32);
				Z5 <= KEY_shift_2(31 downto 16);
				Z6 <= KEY_shift_2(15 downto 0);
			when "0100" =>
				Z1 <= KEY_shift_3(127 downto 112);
				Z2 <= KEY_shift_3(111 downto 96);
				Z3 <= KEY_shift_3(95 downto 80);
				Z4 <= KEY_shift_3(79 downto 64);
				Z5 <= KEY_shift_3(63 downto 48);
				Z6 <= KEY_shift_3(47 downto 32);
			when "0101" =>
				Z1 <= KEY_shift_3(31 downto 16);
				Z2 <= KEY_shift_3(15 downto 0);
				Z3 <= KEY_shift_4(127 downto 112);
				Z4 <= KEY_shift_4(111 downto 96);
				Z5 <= KEY_shift_4(95 downto 80);
				Z6 <= KEY_shift_4(79 downto 64);
			when "0110" =>
				Z1 <= KEY_shift_4(63 downto 48);
				Z2 <= KEY_shift_4(47 downto 32);
				Z3 <= KEY_shift_4(31 downto 16);
				Z4 <= KEY_shift_4(15 downto 0);
				Z5 <= KEY_shift_5(127 downto 112);
				Z6 <= KEY_shift_5(111 downto 96);
			when "0111" =>
				Z1 <= KEY_shift_5(95 downto 80);
				Z2 <= KEY_shift_5(79 downto 64);
				Z3 <= KEY_shift_5(63 downto 48);
				Z4 <= KEY_shift_5(47 downto 32);
				Z5 <= KEY_shift_5(31 downto 16);
				Z6 <= KEY_shift_5(15 downto 0);
			when "1000" =>
				Z1 <= KEY_shift_6(127 downto 112);
				Z2 <= KEY_shift_6(111 downto 96);
				Z3 <= KEY_shift_6(95 downto 80);
				Z4 <= KEY_shift_6(79 downto 64);
				Z5 <= "XXXXXXXXXXXXXXXX";
				Z6 <= "XXXXXXXXXXXXXXXX";
			when others =>
				Z1 <= "XXXXXXXXXXXXXXXX"; --must use ""; error using ''
				Z2 <= "XXXXXXXXXXXXXXXX";
				Z3 <= "XXXXXXXXXXXXXXXX";
				Z4 <= "XXXXXXXXXXXXXXXX";
				Z5 <= "XXXXXXXXXXXXXXXX";
				Z6 <= "XXXXXXXXXXXXXXXX";
		end case;
	end process;

end Behavioral;

