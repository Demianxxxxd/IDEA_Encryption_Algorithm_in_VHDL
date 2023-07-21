----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:47:45 06/02/2023 
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

  component mulop
  port(i1:in std_logic_vector(15 downto 0);
       i2:in std_logic_vector(15 downto 0); 
       o:out std_logic_vector(15 downto 0)
       );
  end component;
  
  component xorop
  port(i1:in std_logic_vector(15 downto 0); 
       i2:in std_logic_vector(15 downto 0); 
       o:out std_logic_vector(15 downto 0)
		 );
  end component;
  
  component addop
  port(i1:in std_logic_vector(15 downto 0);
       i2:in std_logic_vector(15 downto 0); 
       o:out std_logic_vector(15 downto 0)
  );
  end component;
  
signal p1,p2,p3,p4,s1,s2,q1,q2,q3,q4 :std_logic_vector(15 downto 0);  


begin
    mul_1 : mulop port map (i1=>x1,i2=>z1,o=>p1);
	 add_1 : addop port map (i1=>x2,i2=>z2,o=>p2);
 	 add_2 : addop port map (i1=>x3,i2=>z3,o=>p3);
	 mul_2 : mulop port map (i1=>x4,i2=>z4,o=>p4);                     	 
	 
	 xor_1 : xorop port map (i1=>p1,i2=>p3,o=>s1);
	 xor_2 : xorop port map (i1=>p2,i2=>p4,o=>s2);
	 
	 
	 mul_3 : mulop port map (i1=>s1,i2=>z5,o=>q1);
	 add_3 : addop port map (i1=>s2,i2=>q1,o=>q2);
	 mul_4 : mulop port map (i1=>q2,i2=>z6,o=>q3); 
	 add_4 : addop port map (i1=>q1,i2=>q3,o=>q4);
	 
	 xor_3 : xorop port map (i1=>p1,i2=>q3,o=>y1);
	 xor_4 : xorop port map (i2=>q3,i1=>p3,o=>y2);

    xor_5 : xorop port map (i1=>p2,i2=>q4,o=>y3);
    xor_6 : xorop port map (i1=>p4,i2=>q4,o=>y4);








end Behavioral;

