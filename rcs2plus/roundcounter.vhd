----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    roundcounter - Behavioral 
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

entity roundcounter is
    Port ( CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           RESULT : in  STD_LOGIC;
           READY : out  STD_LOGIC;
           S_i : out  STD_LOGIC;
           INIT : out  STD_LOGIC;
           TRAFO : out  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0));
end roundcounter;

architecture Behavioral of roundcounter is

type FSM is (sleep, setup, calc);
	signal state: FSM := sleep;
	signal RND: std_logic_vector (3 downto 0):= "1000";
begin
	process (CLK) is
	begin
		if (CLK'event and CLK = '1') then
			case state is
				when sleep => -- sleep state
					-- next setup state
					if (START = '1') then
						state <= setup;
						
						INIT <= '1';
						READY <= '0';
						ROUND <= "0000";
						RND <= "0000";
						TRAFO <= '0';			-- resetting the transformation
						S_i <= '1';				-- setting the select
					end if;
				when setup => -- setup state
					state <= calc;
					
					INIT <= '0';
				when calc => -- calculation state
					if (RESULT = '1') then
						if (RND = "1000") then
							state <= sleep;
							INIT <= '0';
							READY <= '1';
						else -- if the final ROUND 1000 is not.
							state <= setup;
							INIT <= '1';
							READY <= '0';
							
							-- updating the ROUND
							case RND is 
								when "0000" =>
									ROUND <= "0001";
									RND <= "0001";
									S_i <= '0';		-- resetting the select 
								when "0001" =>
									ROUND <= "0010";
									RND <= "0010";
								when "0010" =>
									ROUND <= "0011";
									RND <= "0011";
								when "0011" =>
									ROUND <= "0100";
									RND <= "0100";
								when "0100" =>
									ROUND <= "0101";
									RND <= "0101";
								when "0101" =>
									ROUND <= "0110";
									RND <= "0110";
								when "0110" =>
									ROUND <= "0111";
									RND <= "0111";
								when "0111" =>
									ROUND <= "1000";
									RND <= "1000";
									TRAFO <= '1'; -- setting the transformation 
								when others =>
									ROUND <= "1000";
									RND <= "1000";
							end case;
						end if;
					end if;
				when others => 
					state <= sleep;
					ROUND <= "1000";
					RND <= "1000";
			end case;	
		end if;
	end process;

end Behavioral;
