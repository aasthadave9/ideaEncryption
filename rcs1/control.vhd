----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    control - Behavioral 
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

entity control is
    Port ( CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0);
           READY : out  STD_LOGIC;
           EN : out  STD_LOGIC;
           S : out  STD_LOGIC);
end control;

architecture Behavioral of control is
	type fsmState is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9);
	signal st, nst : fsmState;

begin
	process(CLK, START)
	begin
		if rising_edge(CLK) then
			st <= nst;
		end if;
	end process;
	
	process(START, st) 
	begin
		case st is
			when s0 =>   READY <= '1';
							 S <= '1';
							 EN <= '0';
							 ROUND <= "1000";
							 if START = '1' then
								nst <= s1;
							 elsif START = '0' then
								nst <= s0;
							 end if;
			when s1 =>   READY <= '0';
							 S <= '0';
							 EN <= '1';
							 ROUND <= "0000";
							 nst <= s2;
			when s2 =>   READY <= '0';
							 S <= '1';
							 EN <= '1';
							 ROUND <= "0001";
							 nst <= s3;
			when s3 =>   READY <= '0';
							 S <= '1';
							 EN <= '1';
							 ROUND <= "0010";
							 nst <= s4;
			when s4 =>   READY <= '0';
							 S <= '1';
							 EN <= '1';
							 ROUND <= "0011";
							 nst <= s5;
			when s5 =>   READY <= '0';
							 S <= '1';
							 EN <= '1';
							 ROUND <= "0100";
							 nst <= s6;
			when s6 =>   READY <= '0';
							 S <= '1';
							 EN <= '1';
							 ROUND <= "0101";
							 nst <= s7;
			when s7 =>   READY <= '0';
							 S <= '1';
							 EN <= '1';
							 ROUND <= "0110";
							 nst <= s8;
			when s8 =>   READY <= '0';
							 S <= '1';
							 EN <= '1';
							 ROUND <= "0111";
							 nst <= s9;
			when s9 => READY <= '1';
						  S <= '1';
						  EN <= '0';
						  ROUND <= "1000";
						  nst <= s0;
		end case;
		
	end process;

end Behavioral;

