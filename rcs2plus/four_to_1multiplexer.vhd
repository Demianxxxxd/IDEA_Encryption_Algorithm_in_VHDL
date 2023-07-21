----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:14:23 06/29/2023 
-- Design Name: 
-- Module Name:    four_to_1multiplexer - Behavioral 
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

entity four_to_1multiplexer is
    Port ( i1 : in  STD_LOGIC_VECTOR (15 downto 0);
           i2 : in  STD_LOGIC_VECTOR (15 downto 0);
           i3 : in  STD_LOGIC_VECTOR (15 downto 0);
           i4 : in  STD_LOGIC_VECTOR (15 downto 0);
           s : in  STD_LOGIC_VECTOR (1 downto 0);
          
           o : out  STD_LOGIC_VECTOR (15 downto 0));
end four_to_1multiplexer;

architecture Behavioral of four_to_1multiplexer is

begin
      process(i1,i2,i3,i4,s)
        begin 
        case s is 
                 when"00"=>       o<=i1;
                 when"01"=>       o<=i2;
                 when"10"=>       o<=i3;         	
					  when"11"=>       o<=i4;
					  when others=>    o<=x"0000";
					  
			end case;		 

       end process;





end Behavioral;

