----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:30:06 06/01/2023 
-- Design Name: 
-- Module Name:    mux2x1 - Behavioral 
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

entity mux2x1 is
    Port ( D0 : in  STD_LOGIC_vector(15 DOWNTO 0);
           D1 : in  STD_LOGIC_vector(15 DOWNTO 0);
           s : in  STD_LOGIC;
           O : out  STD_LOGIC_vector(15 DOWNTO 0));
end mux2x1;

architecture Behavioral of mux2x1 is

begin
    process(D0,D1,s)
	 begin
	   case s is 
	             when '0' => O <=D0;
	             when '1' => O <=D1;
	             when others => O <="XXXXXXXXXXXXXXXX";
		end case;		
	 
	 

    end process;



end Behavioral;

