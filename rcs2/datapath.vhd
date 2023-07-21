----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:41:57 07/03/2023 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
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

entity datapath is
    Port ( CLK : in  STD_LOGIC;
           X1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z5 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z6 : in  STD_LOGIC_VECTOR (15 downto 0);
           EN125 : in  STD_LOGIC ;
           EN346 : in  STD_LOGIC ;
           EN78 : in  STD_LOGIC ;
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y1_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           S_T : in  STD_LOGIC_VECTOR (1 downto 0));
end datapath;

architecture Behavioral of datapath is
    component four_to_1multiplexer	 
	     Port ( i1 : in  STD_LOGIC_VECTOR (15 downto 0);
               i2 : in  STD_LOGIC_VECTOR (15 downto 0);
               i3 : in  STD_LOGIC_VECTOR (15 downto 0);
               i4 : in  STD_LOGIC_VECTOR (15 downto 0);
                s : in  STD_LOGIC_VECTOR (1 downto 0);
                o : out  STD_LOGIC_VECTOR (15 downto 0));
	 end component;
	  
	 
	 component mulop
	     Port ( i1 : in  STD_LOGIC_VECTOR (15 downto 0);
               i2 : in  STD_LOGIC_VECTOR (15 downto 0);
                o : out  STD_LOGIC_VECTOR (15 downto 0));
	 end component;
	 
	 
	 component adder
	     Port ( i1 : in  STD_LOGIC_VECTOR (15 downto 0);
               i2 : in  STD_LOGIC_VECTOR (15 downto 0);
               o : out  STD_LOGIC_VECTOR (15 downto 0));
	 end component;

	 component xorop
	     Port ( i1 : in  STD_LOGIC_VECTOR (15 downto 0);
               i2 : in  STD_LOGIC_VECTOR (15 downto 0);
                o : out  STD_LOGIC_VECTOR (15 downto 0));
	 end component;
	 
	 component reg16bit
	     Port ( CLK : in  STD_LOGIC;
                EN : in  STD_LOGIC;
                 D : in  STD_LOGIC_VECTOR (15 downto 0);
                 Q : out  STD_LOGIC_VECTOR (15 downto 0));
	 end component;


signal mux1_o,mux2_o,mux3_o,mux4_o,q1,q2,q3,q4,q5,q6,q7,q8,mulop_o,addop_o,xorop_o: std_logic_vector(15 downto 0);


begin

mux1:four_to_1multiplexer port map(i1=>X1,i2=>X4,i3=>Z5,i4=>Z6,s=>S,o=>mux1_o);
mux2:four_to_1multiplexer port map(i1=>Z1,i2=>Z4,i3=>q5,i4=>q8,s=>S,o=>mux2_o);
mux3:four_to_1multiplexer port map(i1=>X3,i2=>X2,i3=>q6,i4=>q7,s=>S,o=>mux3_o);
mux4:four_to_1multiplexer port map(i1=>Z3,i2=>Z2,i3=>mulop_o,i4=>mulop_o,s=>S_T,o=>mux4_o);


reg1:reg16bit port map (CLK=>CLK ,EN=>EN125,D=>mulop_o ,Q=>q1 );
reg2:reg16bit port map (CLK=>CLK ,EN=>EN125,D=>addop_o ,Q=>q2 );
reg3:reg16bit port map (CLK=>CLK ,EN=>EN346,D=>addop_o ,Q=>q3 );
reg4:reg16bit port map (CLK=>CLK ,EN=>EN346,D=>mulop_o ,Q=>q4 );
reg5:reg16bit port map (CLK=>CLK ,EN=>EN125,D=>xorop_o ,Q=>q5 );
reg6:reg16bit port map (CLK=>CLK ,EN=>EN346,D=>xorop_o ,Q=>q6 );
reg7:reg16bit port map (CLK=>CLK ,EN=>EN78, D=>mulop_o  ,Q=>q7  );
reg8:reg16bit port map (CLK=>CLK ,EN=>EN78, D=>addop_o  ,Q=>q8  );

mul:mulop port map (i1=>mux1_o,i2=>mux2_o,o=>mulop_o);
xorop1:xorop port map (i1=>mulop_o,i2=>addop_o,o=>xorop_o);
add:adder port map (i1=>mux3_o,i2=>mux4_o,o=>addop_o);


xorop2:xorop port map (i1=>q3,i2=>addop_o,o=>Y3);
xorop3:xorop port map (i1=>q2,i2=>mulop_o,o=>Y2);
xorop4:xorop port map (i1=>q4,i2=>addop_o,o=>Y4);
xorop5:xorop port map (i1=>q1,i2=>mulop_o,o=>Y1);


Y3_TRAFO<=q3;
Y2_TRAFO<=q2;
Y4_TRAFO<=q4;
Y1_TRAFO<=q1;



end Behavioral;

