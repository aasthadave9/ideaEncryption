----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Aastha Dave
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

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
	component round is
        port (
           x1 : in  STD_LOGIC_VECTOR (15 downto 0);
           x2 : in  STD_LOGIC_VECTOR (15 downto 0);
           x3 : in  STD_LOGIC_VECTOR (15 downto 0);
           x4 : in  STD_LOGIC_VECTOR (15 downto 0);
           z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           z2 : in  STD_LOGIC_VECTOR (15 downto 0);
           z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           z4 : in  STD_LOGIC_VECTOR (15 downto 0);
           z5 : in  STD_LOGIC_VECTOR (15 downto 0);
           z6 : in  STD_LOGIC_VECTOR (15 downto 0);
           y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           y4 : out  STD_LOGIC_VECTOR (15 downto 0)
			);
    end component; 
	 
	 component trafo is
			port ( 
			  x1 : in  STD_LOGIC_VECTOR (15 downto 0);
           x2 : in  STD_LOGIC_VECTOR (15 downto 0);
           x3 : in  STD_LOGIC_VECTOR (15 downto 0);
           x4 : in  STD_LOGIC_VECTOR (15 downto 0);
           z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           z2 : in  STD_LOGIC_VECTOR (15 downto 0);
           z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           z4 : in  STD_LOGIC_VECTOR (15 downto 0);
           y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           y4 : out  STD_LOGIC_VECTOR (15 downto 0)
			 );
	  end component;
	 
	 type keyArray is array (51 downto 0) of std_logic_vector(15 downto 0);
	 signal parKey : keyArray;
	 signal s11, s12, s13, s14, s21, s22, s23, s24, s31, s32, s33, s34, s41, s42, s43, s44, s51, s52, s53, s54, s61, s62, s63, s64, s71, s72, s73, s74, s81, s82, s83, s84 : std_logic_vector(15 downto 0);

begin

	gen_keys: process(KEY)
		variable fullKey : std_logic_vector(127 downto 0);
		variable count : integer range 0 to 51;
	begin
		fullKey := KEY;
		count := 0;
		--6 times for the 6 cyclic shifts to get parKeys for round modules
		for i in 0 to 5 loop 
			for j in 0 to 7 loop
				parKey(count) <= fullKey(127-(16*j) downto 128-(16*(j+1)));
				count := count+1;
			end loop;
			fullKey := fullKey(102 downto 0) & fullKey(127 downto 103);
		end loop;
		
		--1 time for the last cyclic shift to get 4 parKeys for output transformation
		for k in 0 to 3 loop
			parKey(count) <= fullKey(127-(16*k) downto 128-(16*(k+1)));
			count := count+1;
		end loop;
	end process;
	
	--instantiations of 8 round modules & output transformation module
	r1 : round
        port map (
				x1 => X_1,
				x2 => X_2,
				x3 => X_3,
				x4 => X_4,
				z1 => parKey(0),
				z2 => parKey(1),
				z3 => parKey(2),
				z4 => parKey(3),
				z5 => parKey(4),
				z6 => parKey(5),
				y1 => s11,
				y2 => s12,
				y3 => s13,
				y4 =>	s14		
        );
	r2 : round
        port map (
				x1 => s11,
				x2 => s12,
				x3 => s13,
				x4 => s14,
				z1 => parKey(6),
				z2 => parKey(7),
				z3 => parKey(8),
				z4 => parKey(9),
				z5 => parKey(10),
				z6 => parKey(11),
				y1 => s21,
				y2 => s22,
				y3 => s23,
				y4 =>	s24			
        );
	r3 : round
        port map (
				x1 => s21,
				x2 => s22,
				x3 => s23,
				x4 => s24,
				z1 => parKey(12),
				z2 => parKey(13),
				z3 => parKey(14),
				z4 => parKey(15),
				z5 => parKey(16),
				z6 => parKey(17),
				y1 => s31,
				y2 => s32,
				y3 => s33,
				y4 =>	s34		
        );
	r4 : round
        port map (
				x1 => s31,
				x2 => s32,
				x3 => s33,
				x4 => s34,
				z1 => parKey(18),
				z2 => parKey(19),
				z3 => parKey(20),
				z4 => parKey(21),
				z5 => parKey(22),
				z6 => parKey(23),
				y1 => s41,
				y2 => s42,
				y3 => s43,
				y4 =>	s44		
        );
	r5 : round
        port map (
				x1 => s41,
				x2 => s42,
				x3 => s43,
				x4 => s44,
				z1 => parKey(24),
				z2 => parKey(25),
				z3 => parKey(26),
				z4 => parKey(27),
				z5 => parKey(28),
				z6 => parKey(29),
				y1 => s51,
				y2 => s52,
				y3 => s53,
				y4 =>	s54			
        );
	r6 : round
        port map (
				x1 => s51,
				x2 => s52,
				x3 => s53,
				x4 => s54,
				z1 => parKey(30),
				z2 => parKey(31),
				z3 => parKey(32),
				z4 => parKey(33),
				z5 => parKey(34),
				z6 => parKey(35),
				y1 => s61,
				y2 => s62,
				y3 => s63,
				y4 => s64			
        );
	r7 : round
        port map (
				x1 => s61,
				x2 => s62,
				x3 => s63,
				x4 => s64,
				z1 => parKey(36),
				z2 => parKey(37),
				z3 => parKey(38),
				z4 => parKey(39),
				z5 => parKey(40),
				z6 => parKey(41),
				y1 => s71,
				y2 => s72,
				y3 => s73,
				y4 =>	s74		
        );
	r8 : round
        port map (
				x1 => s71,
				x2 => s72,
				x3 => s73,
				x4 => s74,
				z1 => parKey(42),
				z2 => parKey(43),
				z3 => parKey(44),
				z4 => parKey(45),
				z5 => parKey(46),
				z6 => parKey(47),
				y1 => s81,
				y2 => s82,
				y3 => s83,
				y4 =>	s84		
        );

	t1 : trafo
        port map (
				x1 => s81,
				x2 => s82,
				x3 => s83,
				x4 => s84,
				z1 => parKey(48),
				z2 => parKey(49),
				z3 => parKey(50),
				z4 => parKey(51),
				y1 => Y_1,
				y2 => Y_2,
				y3 => Y_3,
				y4 =>	Y_4		
        );

end Structural;

