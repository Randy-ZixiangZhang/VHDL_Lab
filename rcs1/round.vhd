----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:26:06 11/28/2020 
-- Design Name: 
-- Module Name:    round - Behavioral 
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

entity round is
    Port ( Z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z5 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z6 : in  STD_LOGIC_VECTOR (15 downto 0);
           X1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0));
end round;

architecture Behavioral of round is
 COMPONENT xorop
 PORT(
      A : IN  std_logic_vector(15 downto 0);
      B : IN  std_logic_vector(15 downto 0);
      O : OUT  std_logic_vector(15 downto 0)
     );
 END COMPONENT;
 COMPONENT addop
 PORT(
      A : IN  std_logic_vector(15 downto 0);
      B : IN  std_logic_vector(15 downto 0);
      SUM : OUT  std_logic_vector(15 downto 0)
     );
 END COMPONENT;
 COMPONENT mulop
 PORT(
      I_1 : IN  std_logic_vector(15 downto 0);
      I_2 : IN  std_logic_vector(15 downto 0);
      O_1 : OUT  std_logic_vector(15 downto 0)
     );
 END COMPONENT;
 signal W1, W2, W3, W4, W5,
        W6, W7, W8, W9, W10: std_logic_vector(15 downto 0);  
begin

  uut1: mulop PORT MAP (
          I_1 => X1,
          I_2 => Z1,
          O_1 => W1
        );
  uut2: addop PORT MAP (
          A => X2,
          B => Z2,
          SUM => W2
        );
  uut3: addop PORT MAP (
          A => X3,
          B => Z3,
          SUM => W3
        );
  uut4: mulop PORT MAP (
          I_1 => X4,
          I_2 => Z4,
          O_1 => W4
        );
  uut5: xorop PORT MAP (
          A => W1,
          B => W3,
          O => W5
        );
  uut6: xorop PORT MAP (
          A => W2,
          B => W4,
          O => W6
        );
  uut7: mulop PORT MAP (
          I_1 => W5,
          I_2 => Z5,
          O_1 => W7
        );
  uut8: addop PORT MAP (
          A => W6,
          B => W7,
          SUM => W8
        );
  uut9: mulop PORT MAP (
          I_1 => W8,
          I_2 => Z6,
          O_1 => W9
        );
  uut10: addop PORT MAP (
          A => W7,
          B => W9,
          SUM => W10
        );
  uut11: xorop PORT MAP (
          A => W1,
          B => W9,
          O => Y1
        );
  uut12: xorop PORT MAP (
          A => W2,
          B => W10,
          O => Y3
        );
  uut13: xorop PORT MAP (
          A => W3,
          B => W9,
          O => Y2
        );
  uut14: xorop PORT MAP (
          A => W4,
          B => W10,
          O => Y4
        );
end Behavioral;
