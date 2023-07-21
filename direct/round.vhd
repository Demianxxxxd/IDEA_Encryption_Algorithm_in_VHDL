----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:58:24 05/16/2023 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity round is
   Port(x1 : in std_logic_vector(15 downto 0);
	     x2 : in std_logic_vector(15 downto 0);
        x3 : in std_logic_vector(15 downto 0);
		  x4 : in std_logic_vector(15 downto 0);  
		  z1 : in std_logic_vector(15 downto 0); 
		  z2 : in std_logic_vector(15 downto 0); 
		  z3 : in std_logic_vector(15 downto 0); 
		  z4 : in std_logic_vector(15 downto 0);
        z5 : in std_logic_vector(15 downto 0); 
		  z6 : in std_logic_vector(15 downto 0);  
		  y1 : out std_logic_vector(15 downto 0); 
		  y2 : out std_logic_vector(15 downto 0); 
		  y3 : out std_logic_vector(15 downto 0); 
		  y4 : out std_logic_vector(15 downto 0)	  
	 );
	 
end round;

architecture Behavioral of round is



  component mulop
  port(I_1:in std_logic_vector(15 downto 0);
       I_2:in std_logic_vector(15 downto 0); 
       O_1:out std_logic_vector(15 downto 0)
       );
  end component;
  
  component xorop
  port(a:in std_logic_vector(15 downto 0); 
       b:in std_logic_vector(15 downto 0); 
       O:out std_logic_vector(15 downto 0)
		 );
  end component;
  
  component addop
  port(a:in std_logic_vector(15 downto 0);
       b:in std_logic_vector(15 downto 0); 
       o:out std_logic_vector(15 downto 0)
  );
  end component;
  
signal p1,p2,p3,p4,s1,s2,q1,q2,q3,q4 :std_logic_vector(15 downto 0);  

begin  
  
    mul_1 : mulop port map (I_1=>x1,I_2=>z1,O_1=>p1);
	 add_1 : addop port map (a=>x2,b=>z2,o=>p2);
 	 add_2 : addop port map (a=>x3,b=>z3,o=>p3);
	 mul_2 : mulop port map (I_1=>x4,I_2=>z4,O_1=>p4);                     	 
	 
	 xor_1 : xorop port map (a=>p1,b=>p3,O=>s1);
	 xor_2 : xorop port map (a=>p2,b=>p4,O=>s2);
	 
	 
	 mul_3 : mulop port map (I_1=>s1,I_2=>z5,O_1=>q1);
	 add_3 : addop port map (a=>s2,b=>q1,o=>q2);
	 mul_4 : mulop port map (I_1=>q2,I_2=>z6,O_1=>q3); 
	 add_4 : addop port map (a=>q1,b=>q3,o=>q4);
	 
	 xor_3 : xorop port map (a=>p1,b=>q3,O=>y1);
	 xor_4 : xorop port map (b=>q3,a=>p3,O=>y2);

    xor_5 : xorop port map (a=>p2,b=>q4,O=>y3);
    xor_6 : xorop port map (a=>p4,b=>q4,O=>y4);


end Behavioral;

















