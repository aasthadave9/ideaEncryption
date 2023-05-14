--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:37:45 05/08/2023
-- Design Name:   
-- Module Name:   /home/ise/vhdl/submit/direct/tb_mullop.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mullop
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
LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_mullop IS
END tb_mullop;
 
ARCHITECTURE behavior OF tb_mullop IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mullop
    PORT(
         a : IN  std_logic_vector(15 downto 0);
         b : IN  std_logic_vector(15 downto 0);
         o : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(15 downto 0) := (others => '0');
   signal b : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal o : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mullop PORT MAP (
          a => a,
          b => b,
          o => o
        );
 
   -- Stimulus process
   stim_proc_a : process
   begin		
		a <= x"0000";
		b <= x"0000";
		--report "a =" & std_logic_vector'image(a)
		--report "b =" &
		wait for 10 ns;
		
		a <= x"0001";
		b <= x"0000";
		wait for 10 ns;
		
		a <= x"0001";
		b <= x"0001";
		wait for 10 ns;

		a <= x"0003";  
		b <= x"0001";
		wait for 10 ns;
		
		a <= x"0003";  
		b <= x"0003";
		wait for 10 ns;
		
		a <= x"7fff";  
		b <= x"0003";
		wait for 10 ns;
		
		a <= x"7fff";  
		b <= x"7fff";
		wait for 10 ns;
		
		a <= x"ffff";  
		b <= x"7fff";
		wait for 10 ns;
		
		a <= x"ffff";  
		b <= x"ffff";
		wait for 10 ns;
		
		a <= x"8000";  
		b <= x"ffff";
		wait for 10 ns;
		
		a <= x"8000";  
		b <= x"8000";
      wait;
   end process;

END;
