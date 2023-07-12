----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:19:35 06/20/2023 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

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
           S : in  STD_LOGIC_VECTOR (1 downto 0);
			  S_T : in STD_LOGIC_VECTOR (1 downto 0);
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
			  Y1_TRAFO : out STD_LOGIC_VECTOR (15 downto 0);
			  Y2_TRAFO : out STD_LOGIC_VECTOR (15 downto 0);
			  Y3_TRAFO : out STD_LOGIC_VECTOR (15 downto 0);
			  Y4_TRAFO : out STD_LOGIC_VECTOR (15 downto 0));

end datapath;

architecture Behavioral of datapath is
	component mux4x1 is
        port (
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           D0 : in  STD_LOGIC_VECTOR (15 downto 0);
           D1 : in  STD_LOGIC_VECTOR (15 downto 0);
           D2 : in  STD_LOGIC_VECTOR (15 downto 0);
           D3 : in  STD_LOGIC_VECTOR (15 downto 0);
           O : out  STD_LOGIC_VECTOR (15 downto 0)
			);
    end component;
	 
	 component reg16bit is
        port (
           clock : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (15 downto 0);
           Q : out  STD_LOGIC_VECTOR (15 downto 0)
			);
    end component;
	 
	 component mulop is
        port (
           I_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           I_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           O_1 : out  STD_LOGIC_VECTOR (15 downto 0)
			);
    end component;
	 
	 component addop is
        port (
           a : in  STD_LOGIC_VECTOR (15 downto 0);
			  b : in  STD_LOGIC_VECTOR (15 downto 0);
           sum : out  STD_LOGIC_VECTOR (15 downto 0)
			);
    end component;
	 
	 component xorop is
        port (
           a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           c : out  STD_LOGIC_VECTOR (15 downto 0)
			);
    end component;
	
	signal sm1, sm2, sm3, sm4, sr1, sr2, sr3, sr4, sr5, sr6, sr7, sr8, smul, sadd, sxor : std_logic_vector(15 downto 0);
	
begin

	mux1 : mux4x1
        port map (
				S => S,
				D0 => X1,
				D1 => X4,
				D2 => Z5,
				D3 => Z6,
				O => sm1
        );
	mux2 : mux4x1
			port map (
				S => S,
				D0 => Z1,
				D1 => Z4,
				D2 => sr5,
				D3 => sr8,
				O => sm2
			);
	mux3 : mux4x1
			port map (
				S => S,
				D0 => X3,
				D1 => X2,
				D2 => sr6,
				D3 => sr7,
				O => sm3
			);
	mux4 : mux4x1
			port map (
				S => S_T,
				D0 => Z3,
				D1 => Z2,
				D2 => smul,
				D3 => smul,
				O => sm4
			);
	r1 : reg16bit
			port map (
				clock => CLK,
				enable => EN125,
				D => smul,
				Q => sr1
			);
	r2 : reg16bit
			port map (
				clock => CLK,
				enable => EN125,
				D => sadd,
				Q => sr2
			);
	r3 : reg16bit
			port map (
				clock => CLK,
				enable => EN346,
				D => sadd,
				Q => sr3
			);
			
	r4 : reg16bit
			port map (
				clock => CLK,
				enable => EN346,
				D => smul,
				Q => sr4
			);
			
	r5 : reg16bit
			port map (
				clock => CLK,
				enable => EN125,
				D => sxor,
				Q => sr5
			);
			
	r6 : reg16bit
			port map (
				clock => CLK,
				enable => EN346,
				D => sxor,
				Q => sr6
			);
			
	r7 : reg16bit
			port map (
				clock => CLK,
				enable => EN78,
				D => smul,
				Q => sr7
			);
			
	r8 : reg16bit
			port map (
				clock => CLK,
				enable => EN78,
				D => sadd,
				Q => sr8
			);
			
	m1 : mulop
			port map (
				I_1 => sm1,
				I_2 => sm2, 
				O_1 => smul
			);
	
	xo1 : xorop
			port map (
				a => smul,
				b => sadd,
				c => sxor
			);
	
	xo2 : xorop
			port map (
				a => sr1,
				b => smul,
				c => Y1
			);
	
	xo3 : xorop
			port map (
				a => sr4,
				b => sadd,
				c => Y4
			);
			
	xo4 : xorop
			port map (
				a => sr2,
				b => smul,
				c => Y2
			);
			
	x5 : xorop
			port map (
				a => sr3,
				b => sadd,
				c => Y3
			);
	
	a1 : addop
			port map (
				a => sm3,
				b => sm4,
				sum => sadd
			);
	
	Y1_TRAFO <= sr1;
	Y2_TRAFO <= sr2;
	Y3_TRAFO <= sr3;
	Y4_TRAFO <= sr4;
	
end Behavioral;

