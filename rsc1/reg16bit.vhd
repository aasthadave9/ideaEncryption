----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:11:17 05/09/2023 
-- Design Name: 
-- Module Name:    reg16bit - Behavioral 
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

entity reg16bit is
    Port ( clock : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (15 downto 0);
           Q : out  STD_LOGIC_VECTOR (15 downto 0));
end reg16bit;

architecture Behavioral of reg16bit is
begin
	reg : process(clock)
	begin
		if rising_edge(clock) then
			if (enable = '1') then
				Q <= D;
			end if;
		end if;
	end process;

end Behavioral;

