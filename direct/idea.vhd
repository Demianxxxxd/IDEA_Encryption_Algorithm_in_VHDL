----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea - Structural 
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

entity idea is
    Port ( KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           X_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y_1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_4 : out  STD_LOGIC_VECTOR (15 downto 0));
end idea;

architecture Structural of idea is

     component round 
	  port (x1 : in std_logic_vector(15 downto 0);
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
      end component;
		
		component trafo
  
     Port (x1 : in  STD_LOGIC_vector(15 downto 0);
           x2 : in  STD_LOGIC_vector(15 downto 0);
    	     x3 : in  STD_LOGIC_vector(15 downto 0);
           x4 : in  STD_LOGIC_vector(15 downto 0);
           z1 : in  STD_LOGIC_vector(15 downto 0);
           z2 : in  STD_LOGIC_vector(15 downto 0);
           z3 : in  STD_LOGIC_vector(15 downto 0);
           z4 : in  STD_LOGIC_vector(15 downto 0);
           y1 : out  STD_LOGIC_vector(15 downto 0);
           y2 : out  STD_LOGIC_vector(15 downto 0);
           y3 : out  STD_LOGIC_vector(15 downto 0);
           y4 : out  STD_LOGIC_vector(15 downto 0)
			  );
        
    END COMPONENT;

--8 round parameters
signal r1_1,r1_2,r1_3,r1_4,
       r2_1,r2_2,r2_3,r2_4, 
       r3_1,r3_2,r3_3,r3_4, 
       r4_1,r4_2,r4_3,r4_4, 
       r5_1,r5_2,r5_3,r5_4, 
       r6_1,r6_2,r6_3,r6_4, 
       r7_1,r7_2,r7_3,r7_4, 
		 r8_1,r8_2,r8_3,r8_4 :std_logic_vector(15 downto 0);
		 
--52 partial key 16bit		 
type key_array is array(51 downto 0) of std_logic_vector(15 downto 0);		 
signal z:key_array;
		 		 
		 
begin
     
	 --key generator 
    process(KEY)
	 
    variable temp_key:std_logic_vector(127 downto 0 );
    variable index:integer;	 
	 
	 begin 
	 temp_key:=KEY;
	 index:=0;
	 
	 key_gen_loop: for i in 0 to 6 loop 
	                   for j in 0 to 7 loop --8 key 1 loop
                        z(index)<=temp_key(127-j*16 downto 112-j*16);
                          index:=index+1;
								  
                            if index > 51 then 
                                  exit key_gen_loop; --break until 52 key all generate
                            end if;
																		
                      end loop;

                          temp_key:=temp_key(102 downto 0)&temp_key(127 downto 103);--shift left 25 bit
	 
	               end loop;
	 
	 end process ;

    round_1: round port map (x1=>X_1,x2=>X_2,x3=>X_3,x4=>X_4,
	                          z1=>z(0),z2=>z(1),z3=>z(2),z4=>z(3),z5=> z(4),z6=> z(5),
	                          y1=>r1_1,y2=>r1_2,y3=>r1_3,y4=>r1_4);
									  
    round_2: round port map (x1=>r1_1,x2=>r1_2,x3=>r1_3,x4=>r1_4,
	                          z1=>z(6),z2=>z(7),z3=>z(8),z4=>z(9),z5=>z(10),z6=>z(11),
	                          y1=>r2_1,y2=>r2_2,y3=>r2_3,y4=>r2_4);
									  
    round_3: round port map (x1=>r2_1,x2=>r2_2,x3=>r2_3,x4=>r2_4,
	                          z1=>z(12),z2=>z(13),z3=>z(14),z4=>z(15),z5=>z(16),z6=>z(17),
	                          y1=>r3_1,y2=>r3_2,y3=>r3_3,y4=>r3_4);
									  
    round_4: round port map (x1=>r3_1,x2=>r3_2,x3=>r3_3,x4=>r3_4,
	                          z1=>z(18),z2=>z(19),z3=>z(20),z4=>z(21),z5=>z(22),z6=> z(23),
	                          y1=>r4_1,y2=>r4_2,y3=>r4_3,y4=>r4_4);
									  
    round_5: round port map (x1=>r4_1,x2=>r4_2,x3=>r4_3,x4=>r4_4,
	                          z1=> z(24),z2=> z(25),z3=>z(26),z4=>z(27),z5=>z(28),z6=>z(29),
	                          y1=>r5_1,y2=>r5_2,y3=>r5_3,y4=>r5_4);
									  
    round_6: round port map (x1=>r5_1,x2=>r5_2,x3=>r5_3,x4=>r5_4,
	                          z1=> z(30),z2=> z(31),z3=>z(32),z4=>z(33),z5=>z(34),z6=>z(35),
	                          y1=>r6_1,y2=>r6_2,y3=>r6_3,y4=>r6_4);
									  
    round_7: round port map (x1=>r6_1,x2=>r6_2,x3=>r6_3,x4=>r6_4,
	                          z1=>z(36),z2=>z(37),z3=>z(38),z4=>z(39),z5=>z(40),z6=>z(41),
	                          y1=>r7_1,y2=>r7_2,y3=>r7_3,y4=>r7_4);
									  
    round_8: round port map (x1=>r7_1,x2=>r7_2,x3=>r7_3,x4=>r7_4,
	                          z1=>z(42),z2=> z(43),z3=>z(44),z4=>z(45),z5=> z(46),z6=>z(47),
	                          y1=>r8_1,y2=>r8_2,y3=>r8_3,y4=>r8_4);
									  
    output : trafo port map (x1=>r8_1,x2=>r8_2,x3=>r8_3,x4=>r8_4,
	                          z1=>z(48),z2=>z(49),z3=>z(50),z4=>z(51),
	                          y1=>Y_1,y2=>Y_2,y3=>Y_3,y4=>Y_4); 


end Structural;

