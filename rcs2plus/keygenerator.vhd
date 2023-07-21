----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:12:22 07/06/2023 
-- Design Name: 
-- Module Name:    keygenerator - Behavioral 
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

entity keygenerator is
    Port ( key : in  STD_LOGIC_VECTOR (127 downto 0);
           round : in  STD_LOGIC_VECTOR (3 downto 0);
           Z1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Z2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Z3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Z4 : out  STD_LOGIC_VECTOR (15 downto 0);
           Z5 : out  STD_LOGIC_VECTOR (15 downto 0);
           Z6 : out  STD_LOGIC_VECTOR (15 downto 0));
end keygenerator;

architecture Behavioral of keygenerator is

begin
  process(key,ROUND) 
 variable temp_key:STD_LOGIC_VECTOR(127 downto 0);
	  begin
	  
	     --temp_key<=key;
		   temp_key:=key;
		
                case ROUND is 
                          when"0000"=>  --round 1
                              Z1<=temp_key(127 downto 112);
									   Z2<=temp_key(111 downto 96);
									   Z3<=temp_key(95 downto 80);
									   Z4<=temp_key(79 downto 64);
									   Z5<=temp_key(63 downto 48);
									   Z6<=temp_key(47 downto 32);
											
								  when"0001"=>	--round 2	
									   Z1<=temp_key(31 downto 16);
									   Z2<=temp_key(15 downto 0);
										
										--temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
--				
									   Z3<=temp_key(127 downto 112);
									   Z4<=temp_key(111 downto 96);
									   Z5<=temp_key(95 downto 80);
									   Z6<=temp_key(79 downto 64);
									 								 
								  when"0010"=>  --round 3	
								      --temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
									   temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
				
										Z1<=temp_key(63 downto 48);
									   Z2<=temp_key(47 downto 32);
										Z3<=temp_key(31 downto 16);
									   Z4<=temp_key(15 downto 0);
										 
										
										--temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
				
										Z5<=temp_key(127 downto 112);
									   Z6<=temp_key(111 downto 96);
										 
                          when"0011"=> --round 4
								      --temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
										--temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
				
								       Z1<=temp_key(95 downto 80);
									   Z2<=temp_key(79 downto 64);
									   Z3<=temp_key(63 downto 48);
									   Z4<=temp_key(47 downto 32);
									   Z5<=temp_key(31 downto 16);
									   Z6<=temp_key(15 downto 0);
								  
								  
								  when"0100"=> --round 5
								      --temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
										--temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
								      --temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
	                           temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
				                  temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
				
										Z1<=temp_key(127 downto 112);
									   Z2<=temp_key(111 downto 96);
									   Z3<=temp_key(95 downto 80);
									   Z4<=temp_key(79 downto 64);
									   Z5<=temp_key(63 downto 48);
									   Z6<=temp_key(47 downto 32);
										
								  when"0101"=>--round 6
								      --temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
										--temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
										--temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
	                           temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
				                  temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
								  
								      Z1<=temp_key(31 downto 16);
									   Z2<=temp_key(15 downto 0);
										--temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
									   temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
									   Z3<=temp_key(127 downto 112);
									   Z4<=temp_key(111 downto 96);
									   Z5<=temp_key(95 downto 80);
									   Z6<=temp_key(79 downto 64);
								  
                          when"0110"=> --round 7
								      --temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
										--temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
										--temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
								      --temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
									   temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
								  
								  
									   Z1<=temp_key(63 downto 48);
									   Z2<=temp_key(47 downto 32);
										Z3<=temp_key(31 downto 16);
									   Z4<=temp_key(15 downto 0);
										--temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
                              Z5<=temp_key(127 downto 112);
									   Z6<=temp_key(111 downto 96);
										  										
											
											
                          when"0111"=>--round 8
								      --temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
									   --temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
									   --temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
								      --temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
								      --temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
									   temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
								  
								  
								  
										Z1<=temp_key(95 downto 80);
									   Z2<=temp_key(79 downto 64);
									   Z3<=temp_key(63 downto 48);
									   Z4<=temp_key(47 downto 32);
									   Z5<=temp_key(31 downto 16);
									   Z6<=temp_key(15 downto 0);
										 
                          when"1000"=>--output
								      --temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
										--temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
										--temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
								      --temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
								      --temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
                              --temp_key<=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
								 	   temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
										temp_key:=temp_key(102 downto 0 )&temp_key(127 downto 103);
										Z1<=temp_key(127 downto 112);
									   Z2<=temp_key(111 downto 96);
									   Z3<=temp_key(95 downto 80);
									   Z4<=temp_key(79 downto 64);
										
                          when others=>
                        --      ROUND<="0000";
                              Z1<=x"0000";
									   Z2<=x"0000";
									   Z3<=x"0000";
									   Z4<=x"0000";
									   Z5<=x"0000";
									   Z6<=x"0000";




                         end case;

     end process;



















end Behavioral;

