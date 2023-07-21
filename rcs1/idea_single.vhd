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


    component round 
	 port(  x1 : in  STD_LOGIC_VECTOR (15 downto 0);
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
	

	
	 component trafo 
	     port(x1 : in  STD_LOGIC_VECTOR (15 downto 0);
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
	 
	 	 
	 component control 
	     port(CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0);
           READY : out  STD_LOGIC;
           EN : out  STD_LOGIC;
           S : out  STD_LOGIC);
		  
	 end component;
	 

	 
    component key_generator 
	     port(key : in  STD_LOGIC_VECTOR(127 DOWNTO 0);
           ROUND : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           Z1 : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           Z2 : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           Z3 : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           Z4 : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           Z5 : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           Z6 : out  STD_LOGIC_VECTOR(15 DOWNTO 0)
		  );
	 
    end component;



    component mux2x1
	     port(D0 : in  STD_LOGIC_vector;
             D1 : in  STD_LOGIC_vector;
             s : in  STD_LOGIC;
             O : out  STD_LOGIC_vector
		  
		    );
	 
    end component;
	 
	 
	 	 
	 component sixteen_bit_register 
	     port(Clock : in  STD_LOGIC;
             ENABLE : in  STD_LOGIC;
             D: in  STD_LOGIC_vector(15 downto 0);
             Q: out  STD_LOGIC_vector(15 downto 0)
		  		  );
	 
	 end component;




signal round_ref:std_logic_vector(3 downto 0);
signal enable_ref,s_ref:std_logic;
signal z1_ref,z2_ref,z3_ref,z4_ref,z5_ref,z6_ref,
       R1_out,R2_out,R3_out,R4_out,
		 R1_in, R2_in, R3_in, R4_in,
       round_input1,round_input2,round_input3,round_input4:std_logic_vector(15 downto 0);
           


begin

   control_module : control port map (CLK=>CLOCK,START=>START,READY=>READY,ROUND=>round_ref,EN=>enable_ref,S=>s_ref);
	
	key_gen_module : key_generator port map (key=>KEY,ROUND=>round_ref,Z1=>z1_ref , Z2=>z2_ref  ,Z3=>z3_ref  ,Z4=>z4_ref  ,Z5=>z5_ref  ,Z6=>z6_ref  );
	
	mux1: mux2x1 port map (D0=>X_1, D1=>R1_out,  s=>s_ref, O=>round_input1 );
	mux2: mux2x1 port map (D0=>X_2, D1=>R2_out,  s=>s_ref, O=>round_input2 );
	mux3: mux2x1 port map (D0=>X_3, D1=>R3_out,  s=>s_ref, O=>round_input3 );
	mux4: mux2x1 port map (D0=>X_4, D1=>R4_out,  s=>s_ref, O=>round_input4 );
	
	
	round_module : round port map (x1=>round_input1, x2=>round_input2, x3=>round_input3, x4=>round_input4,
                                  y1=>R1_in,  y2=>R2_in,  y3=>R3_in,  y4=>R4_in,
                                  z1=>z1_ref, z2=>z2_ref, z3=>z3_ref, z4=>z4_ref, z5=>z5_ref, z6=>z6_ref);
	reg1:sixteen_bit_register port map (Clock=>CLOCK,ENABLE=>enable_ref,D=>R1_in  , Q=>R1_OUT);      
	reg2:sixteen_bit_register port map (Clock=>CLOCK,ENABLE=>enable_ref,D=>R2_in  , Q=>R2_OUT); 
	reg3:sixteen_bit_register port map (Clock=>CLOCK,ENABLE=>enable_ref,D=>R3_in  , Q=>R3_OUT); 
	reg4:sixteen_bit_register port map (Clock=>CLOCK,ENABLE=>enable_ref,D=>R4_in  , Q=>R4_OUT);

   output_module:trafo port map (x1=>R1_OUT, x2=>R2_OUT,x3=>R3_OUT,x4=>R4_OUT,
                                 z1=>z1_ref, z2=>z2_ref, z3=>z3_ref, z4=>z4_ref,
											y1=>Y_1,	y2=>Y_2,	y3=>Y_3,	y4=>Y_4); 	
    











end Structural;




