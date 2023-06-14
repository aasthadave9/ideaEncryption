--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:18:02 05/10/2023
-- Design Name:   
-- Module Name:   /home/ise/vhdl/submit/rcs1/tb_keygen.vhd
-- Project Name:  idea_rcs1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: keygen
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_keygen IS
END tb_keygen;
 
ARCHITECTURE behavior OF tb_keygen IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT keygen
    PORT(
         round_counter : IN  std_logic_vector(3 downto 0);
         key : IN  std_logic_vector(127 downto 0);
         y1 : OUT  std_logic_vector(15 downto 0);
         y2 : OUT  std_logic_vector(15 downto 0);
         y3 : OUT  std_logic_vector(15 downto 0);
         y4 : OUT  std_logic_vector(15 downto 0);
         y5 : OUT  std_logic_vector(15 downto 0);
         y6 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal round_counter : std_logic_vector(3 downto 0) := (others => '0');
   signal key : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal y1 : std_logic_vector(15 downto 0);
   signal y2 : std_logic_vector(15 downto 0);
   signal y3 : std_logic_vector(15 downto 0);
   signal y4 : std_logic_vector(15 downto 0);
   signal y5 : std_logic_vector(15 downto 0);
   signal y6 : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: keygen PORT MAP (
          round_counter => round_counter,
          key => key,
          y1 => y1,
          y2 => y2,
          y3 => y3,
          y4 => y4,
          y5 => y5,
          y6 => y6
        );
	
		key <= x"00010002000300040005000600070008";
		round_counter <= "ZZZZ", "0000" after 10 ns, "0001" after 20 ns, "0010" after 30 ns, "0011" after 40 ns, "0100" after 50 ns, 
							  "0101" after 60 ns,  "0110" after 70 ns, "0111" after 80 ns, "1000" after 90 ns, "XXXX" after 100 ns;


END;
