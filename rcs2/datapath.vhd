----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:04:42 02/02/2022 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
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

entity datapath is


    Port ( CLK : in  STD_LOGIC;
			  EN125 : in  STD_LOGIC;
           EN346 : in  STD_LOGIC;
           EN78 : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR(1 downto 0);

           X1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z5 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z6 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0)
			  
			);
			  
end datapath;

architecture Structural of datapath is

    COMPONENT mux4x1
    PORT(
         S : IN  std_logic_vector(1 downto 0);
         D0 : IN  std_logic_vector(15 downto 0);
         D1 : IN  std_logic_vector(15 downto 0);
         D2 : IN  std_logic_vector(15 downto 0);
         D3 : IN  std_logic_vector(15 downto 0);
         O : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	component xorop
		port( A,B: in std_logic_vector (15 downto 0);
				O: out std_logic_vector (15 downto 0));
	end component;

	component mulop
	port( I_1,I_2: in std_logic_vector (15 downto 0);
			O_1: out std_logic_vector (15 downto 0));
	end component;
	
	component addop
	port( A,B: in std_logic_vector (15 downto 0);
			SUM: out std_logic_vector (15 downto 0));
	end component;

	COMPONENT register16bit
	PORT(
		ENABLE : IN  std_logic;
		Clock : IN  std_logic;
		D : IN  std_logic_vector(15 downto 0);
		Q : OUT  std_logic_vector(15 downto 0)
	  );
	END COMPONENT;
	
	
	
	signal mux1_output, mux2_output, mux3_output, mux4_output: std_logic_vector(15 downto 0);
	signal register1_output, register2_output, register3_output, register4_output,
			 register5_output, register6_output, register7_output, register8_output: 
			 std_logic_vector(15 downto 0);
	signal mulop_output: std_logic_vector(15 downto 0);
	signal addop_output: std_logic_vector(15 downto 0);
	signal xorop_output: std_logic_vector(15 downto 0);
	
begin
	mux1:mux4x1 port map(
		D0 => X1,
		D1 => X4,
		D2 => Z5,
		D3 => Z6,
		S => S,
		O => mux1_output);
	mux2:mux4x1 port map(
		D0 => X3,
		D1 => X2,
		D2 => register6_output,
		D3 => register7_output,
		S => S,
		O => mux2_output);
	mux3:mux4x1 port map(
		D0 => Z1,
		D1 => Z4,
		D2 => register5_output,
		D3 => register8_output,
		S => S,
		O => mux3_output);
	mux4:mux4x1 port map(
		D0 => Z3,
		D1 => Z2,
		D2 => mulop_output,
		D3 => mulop_output,
		S => S,
		O => mux4_output);
		
	mulop1:mulop port map(
		I_1 => mux1_output,
		I_2 => mux3_output,
		O_1 => mulop_output
		);
		
	addop1:addop port map(
		A => mux2_output,
		B => mux4_output,
		SUM => addop_output
		);
		
	xorop1:xorop port map(
		A => mulop_output,
		B => addop_output,
		O => xorop_output
	);
	
	xorop2:xorop port map(
		A => register3_output,
		B => addop_output,
		O => Y3
	);	
	xorop3:xorop port map(
		A => register2_output,
		B => mulop_output,
		O => Y2
	);	
	xorop4:xorop port map(
		A => register4_output,
		B => addop_output,
		O => Y4
	);	
	xorop5:xorop port map(
		A => register1_output,
		B => mulop_output,
		O => Y1
	);
	
	
	reg1:register16bit port map(
		ENABLE => EN125 ,
		Clock =>CLK,
		D =>mulop_output,
		Q =>register1_output
	);

	reg2:register16bit port map(
		ENABLE =>EN125 ,
		Clock =>CLK,
		D =>addop_output,
		Q =>register2_output
	);

	reg3:register16bit port map(
		ENABLE =>EN346,
		Clock =>CLK,
		D =>addop_output,
		Q =>register3_output
	);

	reg4:register16bit port map(
		ENABLE =>EN346,
		Clock =>CLK,
		D =>mulop_output,
		Q =>register4_output
	);

	reg5:register16bit port map(
		ENABLE =>EN125 ,
		Clock =>CLK,
		D =>xorop_output,
		Q =>register5_output
	);

	reg6:register16bit port map(
		ENABLE =>EN346,
		Clock =>CLK,
		D =>xorop_output,
		Q =>register6_output
	);

	reg7:register16bit port map(
		ENABLE =>EN78,
		Clock =>CLK,
		D =>mulop_output,
		Q =>register7_output
	);

	reg8:register16bit port map(
		ENABLE =>EN78,
		Clock =>CLK,
		D =>addop_output,
		Q =>register8_output
	);
	
	

end Structural;

