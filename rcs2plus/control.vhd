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
           INIT : in  STD_LOGIC;
           TRAFO : in STD_LOGIC;
           EN125 : out  STD_LOGIC;
           EN346 : out  STD_LOGIC;
           EN78 : out  STD_LOGIC;
           RESULT : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(1 downto 0);
           S_T: out STD_LOGIC_VECTOR(1 downto 0));	
end control;

architecture Behavioral of control is
signal state: std_logic_vector(1 downto 0):="11";
      begin 
		process (CLK, INIT) is
	begin
		-- increment the state
		if (CLK'event and CLK = '1') then
			-- state machine
			-- this new state in rcs2plus is 
			-- now compareable to multiplexercontrol
			case state is 
				when "00" =>
					state <= "01";
					S <= "01";
					S_T <= "01";
					
					-- if trafo is set or not
					if TRAFO = '1' then
						S_T <= "00";		
					end if;
					
					EN125 <= '0';
					EN346 <= '1';
				when "01" =>
					if TRAFO = '1' then
						state <= "11";
						S <= "11";
						S_T <= "10";
						
						RESULT <= '1';
					else 							
						state <= "10";
						S <= "10";
						S_T <= "10";
						
						EN78 <= '1';
					end if;
					
					EN346 <= '0';
				when "10" =>
					state <= "11";
					S <= "11";
					S_T <= "11";
					
					EN78 <= '0';
					RESULT <= '1';
				when "11" =>
					RESULT <= '0';
					if INIT = '1' then
						state <= "00";
						S <= "00";
						S_T <= "00";
						
						if TRAFO = '1' then
							S_T <= "01";
						end if;
						
						EN125 <= '1';
					end if;
				when others =>
					state <= "11";
			end case;
		end if;
	end process; 
				 

    

end Behavioral;

