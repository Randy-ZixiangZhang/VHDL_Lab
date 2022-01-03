----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea - Structural 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity idea is
    Port ( KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           X_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y_1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_4 : out  STD_LOGIC_VECTOR (15 downto 0));
end idea;

architecture Structural of idea is
 COMPONENT round
 PORT(
      Z1 : IN  std_logic_vector(15 downto 0);
      Z2 : IN  std_logic_vector(15 downto 0);
      Z3 : IN  std_logic_vector(15 downto 0);
      Z4 : IN  std_logic_vector(15 downto 0);
      Z5 : IN  std_logic_vector(15 downto 0);
      Z6 : IN  std_logic_vector(15 downto 0);
      X1 : IN  std_logic_vector(15 downto 0);
      X2 : IN  std_logic_vector(15 downto 0);
      X3 : IN  std_logic_vector(15 downto 0);
      X4 : IN  std_logic_vector(15 downto 0);
      Y1 : OUT  std_logic_vector(15 downto 0);
      Y2 : OUT  std_logic_vector(15 downto 0);
      Y3 : OUT  std_logic_vector(15 downto 0);
      Y4 : OUT  std_logic_vector(15 downto 0)
     );
 END COMPONENT;
 
 COMPONENT trafo
 PORT(
      X1 : IN  std_logic_vector(15 downto 0);
      X2 : IN  std_logic_vector(15 downto 0);
      X3 : IN  std_logic_vector(15 downto 0);
      X4 : IN  std_logic_vector(15 downto 0);
      Z1 : IN  std_logic_vector(15 downto 0);
      Z2 : IN  std_logic_vector(15 downto 0);
      Z3 : IN  std_logic_vector(15 downto 0);
      Z4 : IN  std_logic_vector(15 downto 0);
      Y1 : OUT  std_logic_vector(15 downto 0);
      Y2 : OUT  std_logic_vector(15 downto 0);
      Y3 : OUT  std_logic_vector(15 downto 0);
      Y4 : OUT  std_logic_vector(15 downto 0)
     );
 END COMPONENT;
 signal	key_shift_1, key_shift_2, 
			key_shift_3, key_shift_4,
			key_shift_5, key_shift_6: std_logic_vector(127 downto 0);
 signal Y1_1, Y1_2, Y1_3, Y1_4, Y1_5, Y1_6, Y1_7, Y1_8,
        Y2_1, Y2_2, Y2_3, Y2_4, Y2_5, Y2_6, Y2_7, Y2_8,
        Y3_1, Y3_2, Y3_3, Y3_4, Y3_5, Y3_6, Y3_7, Y3_8,
        Y4_1, Y4_2, Y4_3, Y4_4, Y4_5, Y4_6, Y4_7, Y4_8: std_logic_vector(15 downto 0);
begin
  key_shift_1 <= (KEY(102 downto 0) & KEY(127 downto 103));
  key_shift_2 <= (key_shift_1(102 downto 0) & key_shift_1(127 downto 103));
  key_shift_3 <= (key_shift_2(102 downto 0) & key_shift_2(127 downto 103));
  key_shift_4 <= (key_shift_3(102 downto 0) & key_shift_3(127 downto 103));
  key_shift_5 <= (key_shift_4(102 downto 0) & key_shift_4(127 downto 103));
  key_shift_6 <= (key_shift_5(102 downto 0) & key_shift_5(127 downto 103));
  -- round 1
  round1: round PORT MAP (
          Z1 => KEY(127 downto 112),
          Z2 => KEY(111 downto 96),
          Z3 => KEY(95 downto 80),
          Z4 => KEY(79 downto 64),
          Z5 => KEY(63 downto 48),
          Z6 => KEY(47 downto 32),
          X1 => X_1,
          X2 => X_2,
          X3 => X_3,
          X4 => X_4,
          Y1 => Y1_1,
          Y2 => Y2_1,
          Y3 => Y3_1,
          Y4 => Y4_1
        );
  -- round 2
  round2: round PORT MAP (
          Z1 => KEY(31 downto 16),
          Z2 => KEY(15 downto 0),
          Z3 => KEY_shift_1(127 downto 112),
          Z4 => KEY_shift_1(111 downto 96),
          Z5 => KEY_shift_1(95 downto 80),
          Z6 => KEY_shift_1(79 downto 64),
          X1 => Y1_1,
          X2 => Y2_1,
          X3 => Y3_1,
          X4 => Y4_1,
          Y1 => Y1_2,
          Y2 => Y2_2,
          Y3 => Y3_2,
          Y4 => Y4_2
        );
  -- round 3
  round3: round PORT MAP (
          Z1 => KEY_shift_1(63 downto 48),
          Z2 => KEY_shift_1(47 downto 32),
          Z3 => KEY_shift_1(31 downto 16),
          Z4 => KEY_shift_1(15 downto 0),
          Z5 => KEY_shift_2(127 downto 112),
          Z6 => KEY_shift_2(111 downto 96),
          X1 => Y1_2,
          X2 => Y2_2,
          X3 => Y3_2,
          X4 => Y4_2,
          Y1 => Y1_3,
          Y2 => Y2_3,
          Y3 => Y3_3,
          Y4 => Y4_3
        );
  -- round 4
  round4: round PORT MAP (
          Z1 => KEY_shift_2(95 downto 80),
          Z2 => KEY_shift_2(79 downto 64),
          Z3 => KEY_shift_2(63 downto 48),
          Z4 => KEY_shift_2(47 downto 32),
          Z5 => KEY_shift_2(31 downto 16),
          Z6 => KEY_shift_2(15 downto 0),
          X1 => Y1_3,
          X2 => Y2_3,
          X3 => Y3_3,
          X4 => Y4_3,
          Y1 => Y1_4,
          Y2 => Y2_4,
          Y3 => Y3_4,
          Y4 => Y4_4
        );
  -- round 5
  round5: round PORT MAP (
          Z1 => KEY_shift_3(127 downto 112),
          Z2 => KEY_shift_3(111 downto 96),
          Z3 => KEY_shift_3(95 downto 80),
          Z4 => KEY_shift_3(79 downto 64),
          Z5 => KEY_shift_3(63 downto 48),
          Z6 => KEY_shift_3(47 downto 32),
          X1 => Y1_4,
          X2 => Y2_4,
          X3 => Y3_4,
          X4 => Y4_4,
          Y1 => Y1_5,
          Y2 => Y2_5,
          Y3 => Y3_5,
          Y4 => Y4_5
        );
  -- round 6
  round6: round PORT MAP (
          Z1 => KEY_shift_3(31 downto 16),
          Z2 => KEY_shift_3(15 downto 0),
          Z3 => KEY_shift_4(127 downto 112),
          Z4 => KEY_shift_4(111 downto 96),
          Z5 => KEY_shift_4(95 downto 80),
          Z6 => KEY_shift_4(79 downto 64),
          X1 => Y1_5,
          X2 => Y2_5,
          X3 => Y3_5,
          X4 => Y4_5,
          Y1 => Y1_6,
          Y2 => Y2_6,
          Y3 => Y3_6,
          Y4 => Y4_6
        );
  -- round 7
  round7: round PORT MAP (
          Z1 => KEY_shift_4(63 downto 48),
          Z2 => KEY_shift_4(47 downto 32),
          Z3 => KEY_shift_4(31 downto 16),
          Z4 => KEY_shift_4(15 downto 0),
          Z5 => KEY_shift_5(127 downto 112),
          Z6 => KEY_shift_5(111 downto 96),
          X1 => Y1_6,
          X2 => Y2_6,
          X3 => Y3_6,
          X4 => Y4_6,
          Y1 => Y1_7,
          Y2 => Y2_7,
          Y3 => Y3_7,
          Y4 => Y4_7
        );
  -- round 8
  round8: round PORT MAP (
          Z1 => KEY_shift_5(95 downto 80),
          Z2 => KEY_shift_5(79 downto 64),
          Z3 => KEY_shift_5(63 downto 48),
          Z4 => KEY_shift_5(47 downto 32),
          Z5 => KEY_shift_5(31 downto 16),
          Z6 => KEY_shift_5(15 downto 0),
          X1 => Y1_7,
          X2 => Y2_7,
          X3 => Y3_7,
          X4 => Y4_7,
          Y1 => Y1_8,
          Y2 => Y2_8,
          Y3 => Y3_8,
          Y4 => Y4_8
        );
  -- output
  output: trafo PORT MAP (
          Z1 => KEY_shift_6(127 downto 112),
          Z2 => KEY_shift_6(111 downto 96),
          Z3 => KEY_shift_6(95 downto 80),
          Z4 => KEY_shift_6(79 downto 64),
          X1 => Y1_8,
          X2 => Y2_8,
          X3 => Y3_8,
          X4 => Y4_8,
          Y1 => Y_1,
          Y2 => Y_2,
          Y3 => Y_3,
          Y4 => Y_4
        );

end Structural;
