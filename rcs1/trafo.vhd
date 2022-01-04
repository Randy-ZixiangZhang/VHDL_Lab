----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:07:23 11/28/2021 
-- Design Name: 
-- Module Name:    trafo - Behavioral 
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


entity trafo is
    Port ( X1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0));
end trafo;

architecture Behavioral of trafo is
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
 signal W1, W2, W3, W4: std_logic_vector(15 downto 0);
begin
  uut1: mulop PORT MAP (
          I_1 => X1,
          I_2 => Z1,
          O_1 => Y1
        );
  uut2: addop PORT MAP (
          A => X2,
          B => Z3,
          SUM => Y3
        );
  uut3: addop PORT MAP (
          A => X3,
          B => Z2,
          SUM => Y2
        );
  uut4: mulop PORT MAP (
          I_1 => X4,
          I_2 => Z4,
          O_1 => Y4
        );
end Behavioral;


