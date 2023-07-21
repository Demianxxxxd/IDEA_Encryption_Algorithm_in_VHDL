----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:58:30 06/01/2023 
-- Design Name: 
-- Module Name:    sixteen_bit_register - Behavioral 
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

entity sixteen_bit_register is
    Port ( Clock : in  STD_LOGIC;
           ENABLE : in  STD_LOGIC;
            D: in  STD_LOGIC_vector(15 downto 0);
            Q : out  STD_LOGIC_vector(15 downto 0));
end sixteen_bit_register;

architecture Behavioral of sixteen_bit_register is

begin

  process(Clock)
  begin
    if(Clock='1' and Clock'EVENT ) then 
      if(ENABLE ='1') then
        	  Q <= D;
	   end if;
	 end if;
	
   end process;	
  


end Behavioral;

