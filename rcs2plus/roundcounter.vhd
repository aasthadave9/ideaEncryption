----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    roundcounter - Behavioral 
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

entity roundcounter is
    Port ( CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           RESULT : in  STD_LOGIC;
           READY : out  STD_LOGIC;
           S_i : out  STD_LOGIC;
           INIT : out  STD_LOGIC;
           TRAFO : out  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0));
end roundcounter;

architecture Behavioral of roundcounter is

type fsmState is  (sleep, setup, calc);
	signal st, nst : fsmState := sleep;
	signal count : STD_LOGIC_VECTOR(3 downto 0) := "1000";
begin
	
	nextStateLogic: process(CLK)
	begin
		if rising_edge(CLK) then
			st <= nst;
		end if;
	end process;
	
	outputLogic: process(st, START, RESULT, count)
	begin
		case st is
			when sleep => INIT <= '0';
							  READY <= '1';
							  if START = '1' then
									nst <= setup;
							  else
									nst <= sleep;
							  end if;
			when setup => INIT <= '1';
							  READY <= '0';
							  nst <= calc;
			when calc => INIT <= '0';
							 if RESULT = '0' then
								nst <= calc;
							 elsif RESULT = '1' and count /= "1000" then
									nst <= setup;
							 elsif RESULT = '1' and count = "1000" then
									nst <= sleep;
							 end if;
			when others => nst <= sleep;
		end case;
		
		if count = "0000" then
				S_i <= '1';
		else 
				S_i <= '0';
		end if;
		
		TRAFO <= count(3);
		ROUND <= count;
	end process;
	
	counterLogic: process(CLK)
	begin
		if rising_edge (CLK) then
			if count /= "1000" then
				if RESULT = '1' then
					count <= count+1;
				end if;
			
			else
				if START = '1' then
					count <= "0000";
				end if;
			end if;
		end if;
	end process;
end Behavioral;


