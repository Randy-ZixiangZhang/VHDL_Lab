----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea_rcs2 - Structural 
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

entity idea_rcs2 is
    Port ( CLOCK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           X_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y_1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_4 : out  STD_LOGIC_VECTOR (15 downto 0);
           READY : out  STD_LOGIC);
end idea_rcs2;

architecture Structural of idea_rcs2 is
 
    COMPONENT mux2x1
    PORT(
         S : IN  std_logic;
         D0 : IN  std_logic_vector(15 downto 0);
         D1 : IN  std_logic_vector(15 downto 0);
         O : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;

	component roundcounter is
		 Port ( CLK : in  STD_LOGIC;
				  START : in  STD_LOGIC;
				  RESULT : in  STD_LOGIC;
				  READY : out  STD_LOGIC;
				  S_i : out  STD_LOGIC;
				  INIT : out  STD_LOGIC;
				  TRAFO : out  STD_LOGIC;
				  ROUND : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;

	component key_generator is
		port(Round: in STD_LOGIC_VECTOR(3 downto 0);
			  Key: in STD_LOGIC_VECTOR(127 downto 0);
			  Z1: out STD_LOGIC_VECTOR(15 downto 0);
			  Z2: out STD_LOGIC_VECTOR(15 downto 0);
			  Z3: out STD_LOGIC_VECTOR(15 downto 0);
			  Z4: out STD_LOGIC_VECTOR(15 downto 0);
			  Z5: out STD_LOGIC_VECTOR(15 downto 0);
			  Z6: out STD_LOGIC_VECTOR(15 downto 0));
	end component;
	
	COMPONENT register16bit
	PORT(
		ENABLE : IN  std_logic;
		Clock : IN  std_logic;
		D : IN  std_logic_vector(15 downto 0);
		Q : OUT  std_logic_vector(15 downto 0)
	  );
	END COMPONENT;



	component clockedround is
		 Port ( CLK : in  STD_LOGIC;
				  INIT : in  STD_LOGIC;
				  TRAFO : in STD_LOGIC;
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
				  Y4 : out  STD_LOGIC_VECTOR (15 downto 0);
				  RESULT : out STD_LOGIC;
				  Y1_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
				  Y2_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
				  Y3_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
				  Y4_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;

	signal signal_round:std_logic_vector(3 downto 0);
	signal z_1,z_2,z_3,z_4,z_5,z_6:std_logic_vector(15 downto 0);
	signal result:std_logic;
	signal s_i:std_logic;
	signal init:std_logic;
	signal trafo:std_logic;
	signal y1_out,y2_out,y3_out,y4_out:std_logic_vector(15 downto 0); 
	signal reg1_out,reg2_out,reg3_out,reg4_out:std_logic_vector(15 downto 0);
	signal mux1_out,mux2_out,mux3_out,mux4_out:std_logic_vector(15 downto 0);
begin
	key_gen:key_generator port map(
			  Round => signal_round,
			  Key => KEY,
			  Z1 => z_1,
			  Z2 => z_2,
			  Z3 => z_3,
			  Z4 => z_4,
			  Z5 => z_5,
			  Z6 => z_6
	);
	
	round_ctrl:roundcounter port map(
				CLK => CLOCK,
				START => START,
				RESULT => result,
				READY => READY,
				S_i => s_i,
				INIT => init,
				TRAFO => trafo,
				ROUND => signal_round
	);

	extended_round:clockedround port map(
				CLK => CLOCK,
				INIT => init,
				TRAFO => trafo,
				X1 => mux1_out,
				X2 => mux2_out,
				X3 => mux3_out,
				X4 => mux4_out,
				Z1 => z_1,
				Z2 => z_2,
				Z3 => z_3,
				Z4 => z_4,
				Z5 => z_5,
				Z6 => z_6,
--	         Y1 => Y_1,
--				Y2 => Y_2,
--				Y3 => Y_3,
--				Y4 => Y_4,			
--				Y1 => y1_out,
--				Y2 => y2_out,
--				Y3 => y3_out,
--				Y4 => y4_out,
				RESULT => result
--				Y1_TRAFO => Y_1,
--				Y2_TRAFO => Y_2,
--				Y3_TRAFO => Y_3,
--				Y4_TRAFO => Y_4
	);

	reg1:register16bit port map(
		ENABLE => result,
		Clock => CLOCK,
		D => y1_out,
		Q => reg1_out
	);
	reg2:register16bit port map(
		ENABLE => result,
		Clock => CLOCK,
		D => y2_out,
		Q => reg2_out
	);
	
	reg3:register16bit port map(
		ENABLE => result,
		Clock => CLOCK,
		D => y3_out,
		Q => reg3_out
	);
	reg4:register16bit port map(
		ENABLE => result,
		Clock => CLOCK,
		D => y4_out,
		Q => reg4_out
	);
	
	mux1:mux2x1 port map(
		S => s_i,
		D0 => reg1_out,
		D1 => X_1,
		O => mux1_out
	);

	mux2:mux2x1 port map(
		S => s_i,
		D0 => reg2_out,
		D1 => X_2,
		O => mux2_out
	);

	mux3:mux2x1 port map(
		S => s_i,
		D0 => reg3_out,
		D1 => X_3,
		O => mux3_out
	);

	mux4:mux2x1 port map(
		S => s_i,
		D0 => reg4_out,
		D1 => X_4,
		O => mux4_out
	);

	Y_1 => y1_out;
	Y_2 => y2_out;
	Y_3 => y3_out;
	Y_4 => y4_out;

	y1_out => X_1;
	y2_out => X_2;
	y3_out => X_3;
	y4_out => X_4;
end Structural;

