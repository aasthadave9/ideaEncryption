--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:51:30 05/10/2023
-- Design Name:   
-- Module Name:   /home/ise/vhdl/submit/rcs1/tb_mux2x1.vhd
-- Project Name:  idea_rcs1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux2x1
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
 
ENTITY tb_mux2x1 IS
END tb_mux2x1;
 
ARCHITECTURE behavior OF tb_mux2x1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux2x1
    PORT(
         S : IN  std_logic;
         D0 : IN  std_logic_vector(15 downto 0);
         D1 : IN  std_logic_vector(15 downto 0);
         O : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal S : std_logic := '0';
   signal D0 : std_logic_vector(15 downto 0) := (others => '0');
   signal D1 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal O : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux2x1 PORT MAP (
          S => S,
          D0 => D0,
          D1 => D1,
          O => O
        );

   -- Stimulus process
   stim_proc: process
   begin
		S <= '0';
		D0 <= x"0001";
		D1 <= x"0002";
		wait for 10 ns;
		S <= '1';
		wait for 10 ns;
		S <= '0';
		D0 <= x"0003";
		D1 <= x"0004";
		wait for 10 ns;
		S <= '0';
		D0 <= x"0005";
		D1 <= x"0006";
		wait for 10 ns;
		S <= '0';
		D0 <= "XXXXXXXXXXXXXXXX";
		D1 <= x"0006";
		wait for 10 ns;
		S <= '0';
		D0 <= "ZZZZZZZZXXXXXXXX";
		D1 <= x"0006";
		wait for 10 ns;
		S <= '1';
		D0 <= "ZZZZZZZZXXXXXXXX";
		D1 <= "XXXXZZZZXXXXZZZZ";
		wait for 10 ns;
		S <= '1';
		D0 <= "ZZZZZZZZXXXXXXXX";
		D1 <= "UUUUUUUUUUUUUUUU";
		wait;
   end process;

END;
