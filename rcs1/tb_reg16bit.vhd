--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:21:10 05/09/2023
-- Design Name:   
-- Module Name:   /home/ise/vhdl/submit/rcs1/tb_reg16bit.vhd
-- Project Name:  idea_rcs1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg16bit
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
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_reg16bit IS
END tb_reg16bit;
 
ARCHITECTURE behavior OF tb_reg16bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg16bit
    PORT(
         clock : IN  std_logic;
         enable : IN  std_logic;
         D : IN  std_logic_vector(15 downto 0);
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal enable : std_logic := '0';
   signal D : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg16bit PORT MAP (
          clock => clock,
          enable => enable,
          D => D,
          Q => Q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clock <= '0';
		wait for clk_period/2;
		clock <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		enable <= '0';
		D <= x"0000";
		wait for clk_period;
		enable <= '1';
		wait for clk_period;
		D <= x"0001";
		wait for clk_period;
		D <= x"0002";
		wait for clk_period;
		D <= x"0003";
		wait for 2*clk_period;
		enable <= '0';
		D <= x"0004";
		wait;
   end process;

END;
