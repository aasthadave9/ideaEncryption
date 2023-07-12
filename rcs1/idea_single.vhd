----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea_single - Structural 
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

entity idea_single is
    Port ( CLOCK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           X_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y_1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_4 : out  STD_LOGIC_VECTOR (15 downto 0);
           READY : out  STD_LOGIC);
end idea_single;

architecture Structural of idea_single is
	component round is
        port (
           x1 : in  STD_LOGIC_VECTOR (15 downto 0);
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
           y4 : out  STD_LOGIC_VECTOR (15 downto 0)
			);
    end component;
	 
	 component trafo is
			port ( 
			  x1 : in  STD_LOGIC_VECTOR (15 downto 0);
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
           y4 : out  STD_LOGIC_VECTOR (15 downto 0)
			 );
	  end component;
	  
	  component keygen is
			port ( 
			  round_counter : in  STD_LOGIC_VECTOR (3 downto 0);
           key : in  STD_LOGIC_VECTOR (127 downto 0);
           y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           y4 : out  STD_LOGIC_VECTOR (15 downto 0);
			  y5 : out  STD_LOGIC_VECTOR (15 downto 0);
           y6 : out  STD_LOGIC_VECTOR (15 downto 0)
			 );
	  end component;
	  
	  component control is
			port ( 
			  CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0);
           READY : out  STD_LOGIC;
           EN : out  STD_LOGIC;
           S : out  STD_LOGIC
			 );
	  end component;
	  
	  component mux2x1 is
			port ( 
			  S : in  STD_LOGIC;
           D0 : in  STD_LOGIC_VECTOR (15 downto 0);
           D1 : in  STD_LOGIC_VECTOR (15 downto 0);
           O : out  STD_LOGIC_VECTOR (15 downto 0)
			 );
	  end component;
	  
	  component reg16bit is
			port ( 
			  clock : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (15 downto 0);
           Q : out  STD_LOGIC_VECTOR (15 downto 0)
			 );
	  end component;

	signal s_round : std_logic_vector (3 downto 0);
	signal s_enable, s_sel : std_logic;
	signal s_mux1, s_mux2, s_mux3, s_mux4, sk1, sk2, sk3, sk4, sk5, sk6, sr1, sr2, sr3, sr4, sro1, sro2, sro3, sro4 : std_logic_vector(15 downto 0);
	
begin
	c1 : control
        port map (
				CLK => CLOCK,
				START => START,
				ROUND => s_round,
				READY => READY,
				EN => s_enable,
				S => s_sel		
        );
	k1 : keygen
        port map (
				round_counter => s_round,
				key => KEY,
				y1 => sk1,
				y2 => sk2,
				y3 => sk3,
				y4 => sk4,
				y5 => sk5,
				y6 => sk6		
        );
	r1 : round
        port map (
				x1 => s_mux1,
				x2 => s_mux2,
				x3 => s_mux3,
				x4 => s_mux4,
				z1 => sk1,
				z2 => sk2,
				z3 => sk3,
				z4 => sk4,
				z5 => sk5,
				z6 => sk6,
				y1 => sr1,
				y2 => sr2,
				y3 => sr3,
				y4 =>	sr4		
        );
		  
	t1 : trafo
        port map (
				x1 => sro1,
				x2 => sro2,
				x3 => sro3,
				x4 => sro4,
				z1 => sk1,
				z2 => sk2,
				z3 => sk3,
				z4 => sk4,
				y1 => Y_1,
				y2 => Y_2,
				y3 => Y_3,
				y4 =>	Y_4		
        );
		  
	m1 : mux2x1
        port map (
				S => s_sel,
				D0 => X_1,
				D1 => sro1,
				O => s_mux1		
        );
	m2 : mux2x1
        port map (
				S => s_sel,
				D0 => X_2,
				D1 => sro2,
				O => s_mux2		
        );
	m3 : mux2x1
        port map (
				S => s_sel,
				D0 => X_3,
				D1 => sro3,
				O => s_mux3		
        );
	m4 : mux2x1
        port map (
				S => s_sel,
				D0 => X_4,
				D1 => sro4,
				O => s_mux4		
        );
	
	reg1 : reg16bit
        port map (
				clock => CLOCK,
				enable => s_enable,
				D => sr1,
				Q => sro1		
        );
	reg2 : reg16bit
        port map (
				clock => CLOCK,
				enable => s_enable,
				D => sr2,
				Q => sro2		
        );
	reg3 : reg16bit
        port map (
				clock => CLOCK,
				enable => s_enable,
				D => sr3,
				Q => sro3		
        );
	reg4 : reg16bit
        port map (
				clock => CLOCK,
				enable => s_enable,
				D => sr4,
				Q => sro4		
        );
	-- control unit gets start signal, it generates ready, round, enable, select signals
	-- round signal goes to key generator who generates appropriate key
	-- key goes to round module
	-- select signal set to 0 selects plain text to go through mux to round module in 1st round
	-- 4 outputs of round module are stored in 4 registers. Enable from control unit goes to these regs 
	-- In successive control unit states, select is 1, so output from register travels back up through mux to round module
	-- last round output goes to trafo
	-- when round_counter = 1000 -> send key to trafo and get final output
	
end Structural;

