----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:35:07 06/02/2023 
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
    Port ( i1 : in STD_LOGIC_vector (15 downto 0);
           i2 : in STD_LOGIC_vector (15 downto 0);
           o : out STD_LOGIC_vector (15 downto 0));
end xorop;

architecture Behavioral of xorop is

begin
process (i1,i2)
begin
O <= i1 xor i2;
end process;

end Behavioral;

