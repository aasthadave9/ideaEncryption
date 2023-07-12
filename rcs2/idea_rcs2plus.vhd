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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity idea_rcs2plus is
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
end idea_rcs2plus;

architecture Structural of idea_rcs2plus is

	component reg16bit is
        port (
           clock : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (15 downto 0);
           Q : out  STD_LOGIC_VECTOR (15 downto 0)
			);
    end component;
	 
	 component mux2x1 is
        port (
           S : in  STD_LOGIC;
           D0 : in  STD_LOGIC_VECTOR (15 downto 0);
           D1 : in  STD_LOGIC_VECTOR (15 downto 0);
           O : out  STD_LOGIC_VECTOR (15 downto 0)
			);
	end component;
	
	 component clockedround is
		port (
			  CLK : in  STD_LOGIC;
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
           Y4_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0)
			);
	 end component;
			
	 component roundcounter is
			port (
			  CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           RESULT : in  STD_LOGIC;
           READY : out  STD_LOGIC;
           S_i : out  STD_LOGIC;
           INIT : out  STD_LOGIC;
           TRAFO : out  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0)
			);
	 end component;
	 
	 component keygen is
			port (
			  round_counter : in  STD_LOGIC_VECTOR (3 downto 0);
           key : in  STD_LOGIC_VECTOR (127 downto 0);
           y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           y4 : out  STD_LOGIC_VECTOR (15 downto 0);
           y5 : out  STD_LOGIC_VECTOR (15 downto 0);
           y6 : out  STD_LOGIC_VECTOR (15 downto 0)
			);
	 end component;
		
	signal sm1, sm2, sm3, sm4, sr1, sr2, sr3, sr4, sy1, sy2, sy3, sy4, k1, k2, k3, k4, k5, k6 : STD_LOGIC_VECTOR(15 downto 0);
	signal res_enable, init, trafo, s_i : STD_LOGIC;
	signal sround : STD_LOGIC_VECTOR(3 downto 0);
	
begin

	m1 : mux2x1
		port map (
			S => s_i,
         D0 => sr1,
         D1 => X_1,
         O => sm1
		);
	m2 : mux2x1
		port map (
			S => s_i,
         D0 => sr2,
         D1 => X_2,
         O => sm2
		);
	m3 : mux2x1
		port map (
			S => s_i,
         D0 => sr3,
         D1 => X_3,
         O => sm3
		);
	m4 : mux2x1
		port map (
			S => s_i,
         D0 => sr4,
         D1 => X_4,
         O => sm4
		);
	
	r1 : reg16bit
		port map (
			clock => CLOCK,
         enable => res_enable,
         D => sy1,
         Q => sr1
		);
	r2 : reg16bit
		port map (
			clock => CLOCK,
         enable => res_enable,
         D => sy2,
         Q => sr2
		);
	r3 : reg16bit
		port map (
			clock => CLOCK,
         enable => res_enable,
         D => sy3,
         Q => sr3
		);
	r4 : reg16bit
		port map (
			clock => CLOCK,
         enable => res_enable,
         D => sy4,
         Q => sr4
		);
	round : clockedround
		port map (
			  CLK => CLOCK,
           INIT => init,
           TRAFO => trafo,
           X1 => sm1,
           X2 => sm2, 
           X3 => sm3,
           X4 => sm4,
           Z1 => k1,
           Z2 => k2,
           Z3 => k3,
           Z4 => k4,
           Z5 => k5,
           Z6 => k6,
           Y1 => sy1,
           Y2 => sy2,
           Y3 => sy3,
           Y4 => sy4,
           RESULT => res_enable,
           Y1_TRAFO => Y_1,
           Y2_TRAFO => Y_2,
           Y3_TRAFO => Y_3,
           Y4_TRAFO => Y_4
		);
		
	counter : roundcounter
		port map (
			  CLK => CLOCK,
           START => START,
           RESULT => res_enable,
           READY => READY,
           S_i => s_i,
           INIT => init,
           TRAFO => trafo,
           ROUND => sround
		);
	
	key1 : keygen
		port map (
			  round_counter => sround,
           key => KEY, 
           y1 => k1,
           y2 => k2,
           y3 => k3,
           y4 => k4,
           y5 => k5,
           y6 => k6
		);

end Structural;

