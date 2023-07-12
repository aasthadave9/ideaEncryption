--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:00:15 05/10/2023
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


   -- Stimulus process
   stim_proc: process
   begin		
		round_counter <= "ZZZZ";
		key <= x"00010002000300040005000600070008";
		wait for 10 ns;
		round_counter <= "0000";
		key <= x"00010002000300040005000600070008";
		wait for 10 ns;
		round_counter <= "0001";
		key <= x"00010002000300040005000600070008";
		wait for 10 ns;
		round_counter <= "0010";
		key <= x"00010002000300040005000600070008";
		wait for 10 ns;
		round_counter <= "0011";
		key <= x"00010002000300040005000600070008";
		wait for 10 ns;
		round_counter <= "0100";
		key <= x"00010002000300040005000600070008";
		wait for 10 ns;
		round_counter <= "0101";
		key <= x"00010002000300040005000600070008";
		wait for 10 ns;
		round_counter <= "0110";
		key <= x"00010002000300040005000600070008";
		wait for 10 ns;
		round_counter <= "0111";
		key <= x"00010002000300040005000600070008";
		wait for 10 ns;
		round_counter <= "1000";  --output transformation keys
		key <= x"00010002000300040005000600070008";
		wait for 10 ns;
		round_counter <= "XXXX";
		key <= x"00010002000300040005000600070008";
      wait for 10 ns;
   end process;

END;
