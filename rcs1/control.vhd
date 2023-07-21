----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    control - Behavioral 
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

entity control is
    Port ( CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0);
           READY : out  STD_LOGIC;
           EN : out  STD_LOGIC;
           S : out  STD_LOGIC);
end control;

architecture Behavioral of control is
	signal state: std_logic_vector(3 downto 0) := "1000";
begin
	process (CLK, START) is
	begin
		if (CLK'event and CLK = '1') then
			-- state machine
			case state is 
				when "0000" => -- round 1
					state <= "0001";
					ROUND <= "0001";
					S <= '1';
				when "0001" => -- round 2
					state <= "0010";
					ROUND <= "0010";
				when "0010" => -- round 3
					state <= "0011";
					ROUND <= "0011";
				when "0011" => -- round 4
					state <= "0100";
					ROUND <= "0100";
				when "0100" => -- round 5
					state <= "0101";
					ROUND <= "0101";
				when "0101" => -- round 6
					state <= "0110";
					ROUND <= "0110";
				when "0110" => -- round 7
					state <= "0111";
					ROUND <= "0111";
				when "0111" => -- round 8
					state <= "1000";
					ROUND <= "1000";
					
					READY <= '1';
					EN <= '0';
				when "1000" => -- transformation and output
					-- starting a new encryption
					if START = '1' then
							state <= "0000";
							ROUND <= "0000";
							READY <= '0';
							S <= '0';
							EN <= '1';
					end if;
				when others => 
					state <= "1000";
					ROUND <= "1000";
			end case;
		end if;
	end process;


end Behavioral;
