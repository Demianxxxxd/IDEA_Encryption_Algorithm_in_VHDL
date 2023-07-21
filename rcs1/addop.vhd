----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:37:52 06/02/2023 
-- Design Name: 
-- Module Name:    addop - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addop is
    Port ( i1 : in  STD_LOGIC_VECTOR (15 downto 0);
           i2 : in  STD_LOGIC_VECTOR (15 downto 0);
           o : out  STD_LOGIC_VECTOR (15 downto 0));
end addop;

architecture Behavioral of addop is

begin
 process(i1,i2)
    begin

   o <= i1 + i2 ;
    end process;


end Behavioral;

