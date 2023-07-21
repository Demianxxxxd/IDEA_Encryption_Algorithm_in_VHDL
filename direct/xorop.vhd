----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:17:01 05/12/2023 
-- Design Name: 
-- Module Name:    xorop - Behavioral 
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

entity xorop is
    Port ( a : in  STD_LOGIC_vector (15 downto 0);
	        b : in  STD_LOGIC_vector (15 downto 0);
           O : out  STD_LOGIC_vector (15 downto 0));
end xorop;

architecture Behavioral of xorop is

begin

--O <= a xor b; -- XOR operation
process (a,b)
begin
O <= a xor b;
end process;

end Behavioral;










