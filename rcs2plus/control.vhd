----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    control - Behavioral 
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

entity control is
    Port ( CLK : in  STD_LOGIC;
           INIT : in  STD_LOGIC;
           TRAFO : in STD_LOGIC;
           EN125 : out  STD_LOGIC;
           EN346 : out  STD_LOGIC;
           EN78 : out  STD_LOGIC;
           RESULT : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(1 downto 0);
           S_T: out STD_LOGIC_VECTOR(1 downto 0));	
end control;

architecture Behavioral of control is
	signal state : STD_LOGIC_VECTOR(2 downto 0) := "111";
begin
	fsm_state: process(CLK, TRAFO)
	begin
		if TRAFO = '0' then
			if rising_edge(CLK) then 
				if state /= "111" and state /= "110" then
					state <= state + 2;
				elsif state = "110" then
					state <= state + 1;
				elsif state = "111" then
					if INIT = '1' then
						state <= "000";
					else 
						state <= "111";
					end if;
				end if;
			end if;
			
		else
			if rising_edge(CLK) then
				if state /= "111" and state /= "110" then
						state <= state + 2;
				elsif state = "110" then
						state <= state + 1;
				elsif state = "111" then
					if INIT = '1' then
						state <= "000";
					else 
						state <= "111";
					end if;
				end if;
			end if;
		end if;
	end process;
	
	output_gen : process(trafo, state)	
	begin
		case state is
			when "000" => EN125 <= '1';
							  EN346 <= '0';
							  EN78 <= '0';
							  RESULT <= '0';
							  S <= "00";
							  if TRAFO = '1' then
									S_T <= "01";
							  else
									S_T <= "00";
							  end if;
			when "001" => EN125 <= '0';
							  EN346 <= '0';
							  EN78 <= '0';
							  RESULT <= '0';
							  S <= "00";
							  if TRAFO = '1' then
									S_T <= "01";
							  else
									S_T <= "00";
							  end if;
			when "010" => EN125 <= '0';
							  EN346 <= '1';
							  EN78 <= '0';
							  RESULT <= '0';
							  S <= "01";
							  if TRAFO = '1' then
									S_T <= "00";
							  else
									S_T <= "01";
							  end if;
			when "011" => EN125 <= '0';
							  EN346 <= '0';
							  EN78 <= '0';
							  RESULT <= '0';
							  S <= "01";
							  if TRAFO = '1' then
									S_T <= "00";
							  else
									S_T <= "01";
							  end if;
			when "100" => EN125 <= '0';
							  EN346 <= '0';
							  EN78 <= '1';
							  RESULT <= '0';
							  S <= "10";
							  S_T <= "10";
			when "101" => EN125 <= '0';
							  EN346 <= '0';
							  EN78 <= '0';
							  RESULT <= '0';
							  S <= "10";
							  S_T <= "10";
			when "110" => EN125 <= '0';
							  EN346 <= '0';
							  EN78 <= '0';
							  RESULT <= '1';	
							  S <= "11";
							  if TRAFO = '1' then
									S_T <= "10";
							  else
									S_T <= "11";
							  end if;
			when "111" => EN125 <= '0';
							  EN346 <= '0';
							  EN78 <= '0';
							  RESULT <= '0';	
							  S <= "11";
							  if TRAFO = '1' then
									S_T <= "10";
							  else
									S_T <= "11";
							  end if;
			when others =>
		end case;
	end process;
end Behavioral;

