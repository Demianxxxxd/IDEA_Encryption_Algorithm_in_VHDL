----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    mulop - Behavioral 
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mulop is
    Port ( I_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           I_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           O_1 : out  STD_LOGIC_VECTOR (15 downto 0));
end mulop;


architecture Behavioral of mulop is


signal result_33bit:STD_LOGIC_VECTOR (33 downto 0);
signal modulo:STD_LOGIC_VECTOR (15 downto 0);
signal div:STD_LOGIC_VECTOR (16 downto 0);
signal result_17bit:STD_LOGIC_VECTOR (16 downto 0);
signal a:STD_LOGIC_VECTOR (16 downto 0);
signal b:STD_LOGIC_VECTOR (16 downto 0);

begin

  process(I_1,I_2)
  begin
        
       a<="0"&I_1;
       b<="0"&I_2;
       if (I_1="0000000000000000" )then
	   	  a<="10000000000000000";
			 end if;
			 
		 if (I_2="0000000000000000" )then
	   	  b<="10000000000000000";
			 end if;
			 
  end process;			 
			 
			
	   result_33bit <= a*b;
      modulo<=result_33bit(15 downto 0);
	   div<=result_33bit(32 downto 16);  
	  
	  
	  
	process(modulo,div)	
   begin	
	
		  if(modulo>=div)then
		       result_17bit<=("0" & modulo)-div;
		  else
		       result_17bit<=("0"& modulo)-div+"10000000000000001";
	     end if ;
			 
   end process;
	
      O_1 <= result_17bit(15 downto 0); 
 	  
end Behavioral;

