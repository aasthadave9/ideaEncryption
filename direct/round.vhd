----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:11:29 05/09/2023 
-- Design Name: 
-- Module Name:    round - Behavioral 
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

entity round is
    Port ( x1 : in  STD_LOGIC_VECTOR (15 downto 0);
           x2 : in  STD_LOGIC_VECTOR (15 downto 0);
           x3 : in  STD_LOGIC_VECTOR (15 downto 0);
           x4 : in  STD_LOGIC_VECTOR (15 downto 0);
           z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           z2 : in  STD_LOGIC_VECTOR (15 downto 0);
           z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           z4 : in  STD_LOGIC_VECTOR (15 downto 0);
           z5 : in  STD_LOGIC_VECTOR (15 downto 0);
           z6 : in  STD_LOGIC_VECTOR (15 downto 0);
           y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           y4 : out  STD_LOGIC_VECTOR (15 downto 0));
end round;

architecture Behavioral of round is
	component xorop is
        port (
            a : in  std_logic_vector(15 downto 0);
            b : in  std_logic_vector(15 downto 0);
            c : out std_logic_vector(15 downto 0)
        );
    end component;
	 
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
	 
	 signal xor_1_sig, xor_2_sig : std_logic_vector(15 downto 0);
    signal add_1_sig, add_2_sig, add_3_sig, add_4_sig : std_logic_vector(15 downto 0); 
	 signal mull_1_sig, mull_2_sig, mull_3_sig, mull_4_sig : std_logic_vector(15 downto 0); 
	
begin
	xor_1 : xorop
        port map (
            a => mull_1_sig,
            b => add_2_sig,
            c => xor_1_sig
        );	  
    xor_2 : xorop
        port map (
            a => add_1_sig,
            b => mull_2_sig,
            c => xor_2_sig
        );		  
    xor_3 : xorop  --check connections once again
        port map (
            a => mull_1_sig,
            b => mull_4_sig,
            c => y1
        ); 
    xor_4 : xorop
        port map (
            a => add_2_sig,
            b => mull_4_sig,
            c => y2
        );	
    xor_5 : xorop
        port map (
            a => add_1_sig,
            b => add_4_sig,
            c => y3
        );	
    xor_6 : xorop
        port map (
            a => add_4_sig,
            b => mull_2_sig,
            c => y4
        );		  

    add_1 : addop
        port map (
            a => x2,
            b => z2,
            sum => add_1_sig
        );
    add_2 : addop
        port map (
            a => x3,
            b => z3,
            sum => add_2_sig
        );
    add_3 : addop
        port map (
            a => mull_3_sig,
            b => xor_2_sig,
            sum => add_3_sig
        );
    add_4 : addop
        port map (
            a => mull_3_sig,
            b => mull_4_sig,
            sum => add_4_sig
        );
    mull_1 : mulop
        port map (
            I_1 => x1,
            I_2 => z1,
            O_1 => mull_1_sig
        );
    mull_2 : mulop
        port map (
            I_1 => x4,
            I_2 => z4,
            O_1 => mull_2_sig
        );
    mull_3 : mulop
        port map (
            I_1 => z5,
            I_2 => xor_1_sig,
            O_1 => mull_3_sig
        );
    mull_4 : mulop
        port map (
            I_1 => add_3_sig,
            I_2 => z6,
            O_1 => mull_4_sig
        );

end Behavioral;

