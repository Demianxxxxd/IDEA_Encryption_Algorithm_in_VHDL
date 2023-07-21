----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:57:29 06/02/2023 
-- Design Name: 
-- Module Name:    trafo - Behavioral 
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

entity trafo is
    Port ( x1 : in  STD_LOGIC_VECTOR (15 downto 0);
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
           y4 : out  STD_LOGIC_VECTOR (15 downto 0));
end trafo;

architecture Behavioral of trafo is
  component addop
   Port( i1 : in std_logic_vector(15 downto 0);
	      i2 : in std_logic_vector(15 downto 0);
         o : out std_logic_vector(15 downto 0)
	 );
   end component;

   component mulop
   port(i1 :in std_logic_vector(15 downto 0);
        i2 :in std_logic_vector(15 downto 0); 
        o :out std_logic_vector(15 downto 0)
       );
   end component;
  

    
begin


 mulop1 : mulop port map (i1=>x1,i2=>z1,o=>y1 );
 adder1 : addop port map (i1=>x3,i2=>z2,o=>y2);
 adder2 : addop port map (i1=>x2,i2=>z3,o=>y3); 
 mulop2 : mulop port map (i1=>x4,i2=>z4,o=>y4);



end Behavioral;

