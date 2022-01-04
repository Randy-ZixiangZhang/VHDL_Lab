----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea_single - Structural 
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

entity idea_single is
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
end idea_single;

architecture Structural of idea_single is

    COMPONENT key_generator
    PORT(
         Round : IN  std_logic_vector(3 downto 0);
         Key : IN  std_logic_vector(127 downto 0);
         Z1 : OUT  std_logic_vector(15 downto 0);
         Z2 : OUT  std_logic_vector(15 downto 0);
         Z3 : OUT  std_logic_vector(15 downto 0);
         Z4 : OUT  std_logic_vector(15 downto 0);
         Z5 : OUT  std_logic_vector(15 downto 0);
         Z6 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;

    COMPONENT mux2x1
    PORT(
         S : IN  std_logic;
         D0 : IN  std_logic_vector(15 downto 0);
         D1 : IN  std_logic_vector(15 downto 0);
         O : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	 
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
	 
    COMPONENT control
    PORT(
         CLK : IN  std_logic;
         START : IN  std_logic;
         ROUND : OUT  std_logic_vector(3 downto 0);
         READY : OUT  std_logic;
         EN : OUT  std_logic;
         S : OUT  std_logic
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

    COMPONENT register16bit
    PORT(
         ENABLE : IN  std_logic;
         Clock : IN  std_logic;
         D : IN  std_logic_vector(15 downto 0);
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;


	signal round_count_signal: std_logic_vector(3 downto 0);
	signal enable_signal: std_logic;
	signal S_mux_control_signal: std_logic;
	
	signal z_1,z_2,z_3,z_4,z_5,z_6: std_logic_vector(15 downto 0);
	signal reg_out1,reg_out2,reg_out3,reg_out4:std_logic_vector(15 downto 0);
	signal mux_out1,mux_out2,mux_out3,mux_out4:std_logic_vector(15 downto 0);
	signal round_out1,round_out2,round_out3,round_out4:std_logic_vector(15 downto 0);
	
begin
	controlunit: control port map(
					CLK => CLOCK,
					START => START,
					ROUND => round_count_signal,
					READY => READY,
					EN => enable_signal,
					S => S_mux_control_signal
					);
		
	key_g: key_generator port map(
					Round => round_count_signal,
					Key => Key,
					Z1 => z_1,
					Z2 => z_2,
					Z3 => z_3,
					Z4 => z_4,
					Z5 => z_5,
					Z6 => z_6
					);
					
	
	mux1:mux2x1 port map(
					S => S_mux_control_signal,
					D0 => x_1,
					D1 => reg_out1,
					O => mux_out1
					);
					
	mux2:mux2x1 port map(
					S => S_mux_control_signal,
					D0 => x_2,
					D1 => reg_out2,
					O => mux_out2
					);					
	mux3:mux2x1 port map(
					S => S_mux_control_signal,
					D0 => x_3,
					D1 => reg_out3,
					O => mux_out3
					);
	mux4:mux2x1 port map(
					S => S_mux_control_signal,
					D0 => x_4,
					D1 => reg_out4,
					O => mux_out4
					);		
	
	reg1:register16bit port map(
					ENABLE => enable_signal,
					Clock => CLOCK,
					D => round_out1,
					Q => reg_out1
					);
	reg2:register16bit port map(
					ENABLE => enable_signal,
					Clock => CLOCK,
					D => round_out2,
					Q => reg_out2
					);
	reg3:register16bit port map(
					ENABLE => enable_signal,
					Clock => CLOCK,
					D => round_out3,
					Q => reg_out3
					);
	reg4:register16bit port map(
					ENABLE => enable_signal,
					Clock => CLOCK,
					D => round_out4,
					Q => reg_out4
					);		

	round_unit:round port map(
         Z1 => z_1,
         Z2 => z_2,
         Z3 => z_3,
         Z4 => z_4,
         Z5 => z_5,
         Z6 => z_6,
         X1 => mux_out1,
         X2 => mux_out2,
         X3 => mux_out3,
         X4 => mux_out4,
         Y1 => round_out1,
         Y2 => round_out2,
         Y3 => round_out3,
         Y4 => round_out4
	);

	trans_unit: trafo port map(
			X1 => reg_out1,
         X2 => reg_out2,
         X3 => reg_out3,
         X4 => reg_out4,
         Z1 => z_1,
         Z2 => z_2,
         Z3 => z_3,
         Z4 => z_4,
         Y1 => Y_1,
         Y2 => Y_2,
         Y3 => Y_3,
         Y4 => Y_4
					);
					
end Structural;

