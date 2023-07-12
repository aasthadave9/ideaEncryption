----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:34:38 05/10/2023 
-- Design Name: 
-- Module Name:    keygen - Behavioral 
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

entity keygen is
    Port ( round_counter : in  STD_LOGIC_VECTOR (3 downto 0);
           key : in  STD_LOGIC_VECTOR (127 downto 0);
           y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           y4 : out  STD_LOGIC_VECTOR (15 downto 0);
           y5 : out  STD_LOGIC_VECTOR (15 downto 0);
           y6 : out  STD_LOGIC_VECTOR (15 downto 0));
end keygen;

architecture Behavioral of keygen is
	signal parkey : std_logic_vector(95 downto 0);
	
begin
	process(round_counter, key)
	begin
		case round_counter is
			when "0000" => parkey <= key(127 downto 32);
			when "0001" => parkey <= key(31 downto 0) & key(102 downto 39);
			when "0010" => parkey <= key(38 downto 0) & key(127 downto 103) & key(77 downto 46);
			when "0011" => parkey <= key(45 downto 0) & key(127 downto 78);
			when "0100" => parkey <= key(52 downto 0) & key(127 downto 85);
			when "0101" => parkey <= key(84 downto 53) & key(27 downto 0) & key(127 downto 92);
			when "0110" => parkey <= key(91 downto 28) & key(2 downto 0) & key(127 downto 99);
			when "0111" => parkey <= key(98 downto 3);
			when "1000" => parkey <= key(105 downto 42) & x"00000000";
			when others => parkey <= x"000000000000000000000000";
		end case;
	end process;
	y1 <= parkey(95 downto 80);
	y2 <= parkey(79 downto 64);
	y3 <= parkey(63 downto 48);
	y4 <= parkey(47 downto 32);
	y5 <= parkey(31 downto 16);
	y6 <= parkey(15 downto 0);
	
end Behavioral;

