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
         signal state: std_logic_vector(2 downto 0):="111";
begin
      process(CLK,INIT) is
      begin 
		
          -- increment the state
		if (CLK'event and CLK = '1') then
			-- state machine
			case state is 
				when "000" => 
					state <= "001";
					EN125 <= '0';
				when "001" => 
					state <= "010";
					EN346 <= '1';
					S <= "01";
					S_T <= "01" xor ('0' & TRAFO);
				when "010" => 
					state <= "011";
					EN346 <= '0';
				when "011" =>
					if (TRAFO = '1') then
						state <= "110";
						RESULT <= '1';
						S <= "11";
						S_T <= "11" xor ('0' & TRAFO);
					else
						state <= "100";
						EN78 <= '1';
						S <= "10";
						S_T <= "10" xor ('0' & TRAFO);
					end if;
				when "100" => 
					state <= "101";
					EN78 <= '0';
				when "101" => 
					state <= "110";
					RESULT <= '1';
					S <= "11";
					S_T <= "11" xor ('0' & TRAFO);
				when "110" => 
					state <= "111";
					RESULT <= '0';
				when "111" => 
					if INIT = '1' then
						state <= "000";
						EN125 <= '1';
						EN346 <= '0';
						EN78 <= '0';
						RESULT <= '0';
						S <= "00";
						S_T <= "00" xor ('0' & TRAFO);
					end if;
				when others => 
					state <= "111";
			end case;
		end if;
	end process; 	  
				 

    

end Behavioral;

