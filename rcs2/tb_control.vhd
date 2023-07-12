
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use std.env.finish;

ENTITY tb_control IS
END tb_control;

ARCHITECTURE behavior OF tb_control IS 

  -- Component Declaration
	COMPONENT control
		PORT(
			CLK : in  STD_LOGIC;
			INIT : in  STD_LOGIC;
			TRAFO : in STD_LOGIC;
			EN125 : out  STD_LOGIC;
			EN346 : out  STD_LOGIC;
			EN78 : out  STD_LOGIC;
			RESULT : out  STD_LOGIC;
			S : out  STD_LOGIC_VECTOR(1 downto 0);
			S_T: out STD_LOGIC_VECTOR(1 downto 0)
         );
   END COMPONENT;
	
			 --Inputs
   SIGNAL   CLK : STD_LOGIC := '0';
	SIGNAL	INIT : STD_LOGIC := '0';
	SIGNAL	TRAFO : STD_LOGIC;
	SIGNAL	EN125 : STD_LOGIC := '0';
	SIGNAL	EN346 : STD_LOGIC := '0';
	SIGNAL	EN78 : STD_LOGIC := '0';
	SIGNAL	RESULT : STD_LOGIC;
	SIGNAL	S : STD_LOGIC_VECTOR(1 downto 0);
	SIGNAL	S_T: STD_LOGIC_VECTOR(1 downto 0);
	 
	constant clk_period : time := 10 ns;
          

BEGIN

  -- Component Instantiation
          uut: control PORT MAP(
                  CLK => CLK,
						INIT => INIT,
						TRAFO => TRAFO,
						EN125 => EN125,
						EN346 => EN346,
						EN78 => EN78,
						RESULT => RESULT,
						S => S,
						S_T => S_T
          );

	
		clock_gen: process
		begin
			CLK <= '0';
			wait for clk_period/2;
			CLK <= '1';
			wait for clk_period/2;
		end process;
		
  --  Test Bench Statements
     stim_proc: PROCESS
     BEGIN
		TRAFO <= '0';
		INIT <= '0';
		wait for clk_period/2;
		INIT <= '1';
		wait for clk_period;
		INIT <= '0';
		wait for 10*clk_period;
		TRAFO <= '1';
		INIT <= '1';
		wait for clk_period;
		INIT <= '0';
		wait for 10*clk_period;
		report "Calling 'finish'";
		finish;
     END PROCESS;

END;