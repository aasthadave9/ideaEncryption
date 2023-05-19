----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    mulop - Behavioral 
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

entity mulop is
    Port ( I_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           I_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           O_1 : out  STD_LOGIC_VECTOR (15 downto 0));
end mulop;

architecture Behavioral of mulop is
begin
	--check if inputs are =0x0000 then make it 2^16 (add a 17th bit and make it 1)
	--do low high algo, get 33 bits worst case, 
	
	modify_inputs: process(I_1, I_2)
	variable temp_a : std_logic_vector (16 downto 0);
	variable temp_b : std_logic_vector (16 downto 0);
	variable temp_o : std_logic_vector (33 downto 0);
	variable temp_out : std_logic_vector (16 downto 0);
	variable quotient : std_logic_vector (16 downto 0);
	variable remainder : std_logic_vector(15 downto 0);
	begin
	
		if I_1 = x"0000" then 
			temp_a := "10000000000000000";
		else
			temp_a := '0' & I_1;
		end if;
		
		if I_2 = x"0000" then 
			temp_b := "10000000000000000";
		else
			temp_b := '0' & I_2;
		end if;

		--abmod(2^16) is lower 16bits of output, abdiv(2^16) is upper 16 bits of output
		temp_o := temp_a * temp_b;
		quotient := temp_o(32 downto 16);
		remainder := temp_o(15 downto 0);

		if remainder >= quotient then
			temp_out := ('0' & remainder) - quotient;
		else
			temp_out := ('0' & remainder) - quotient + "10000000000000001";
		end if;
		O_1 <= temp_out(15 downto 0);
	end process;

end Behavioral;

