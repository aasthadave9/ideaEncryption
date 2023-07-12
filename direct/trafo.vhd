----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:12:16 05/09/2023 
-- Design Name: 
-- Module Name:    trafo - Behavioral 
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

entity trafo is
    Port ( x1 : in  STD_LOGIC_VECTOR (15 downto 0);
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
           y4 : out  STD_LOGIC_VECTOR (15 downto 0));
end trafo;

architecture Behavioral of trafo is 

	component addop is
        port (
            a : in  std_logic_vector(15 downto 0);
            b : in  std_logic_vector(15 downto 0);
            sum : out std_logic_vector(15 downto 0)
        );
    end component;
	 
	 component mulop is
        port (
            I_1 : in  std_logic_vector(15 downto 0);
            I_2 : in  std_logic_vector(15 downto 0);
            O_1 : out std_logic_vector(15 downto 0)
        );
    end component;

begin

	traf_mull_1 : mulop
        port map (
            I_1 => x1,
            I_2 => z1,
            O_1 => y1
        );
	traf_add_1 : addop
        port map (
            a => x3,
            b => z2,
            sum => y2
        );
	traf_add_2 : addop
        port map (
            a => x2,
            b => z3,
            sum => y3
        );
	traf_mull_2 : mulop
        port map (
            I_1 => x4,
            I_2 => z4,
            O_1 => y4
        );

end Behavioral;
