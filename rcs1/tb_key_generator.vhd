--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:17:13 06/02/2023
-- Design Name:   
-- Module Name:   /nas/lrz/home/ge86qud/submit/rcs1/tb_key_generator.vhd
-- Project Name:  idea_rcs1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: key_generator
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_key_generator IS
END tb_key_generator;
 
ARCHITECTURE behavior OF tb_key_generator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT key_generator
    PORT(
         key : IN  std_logic_vector(127 downto 0);
         ROUND : IN  std_logic_vector(3 downto 0);
         Z1 : OUT  std_logic_vector(15 downto 0);
         Z2 : OUT  std_logic_vector(15 downto 0);
         Z3 : OUT  std_logic_vector(15 downto 0);
         Z4 : OUT  std_logic_vector(15 downto 0);
         Z5 : OUT  std_logic_vector(15 downto 0);
         Z6 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal key : std_logic_vector(127 downto 0) := (others => '0');
   signal ROUND : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Z1 : std_logic_vector(15 downto 0);
   signal Z2 : std_logic_vector(15 downto 0);
   signal Z3 : std_logic_vector(15 downto 0);
   signal Z4 : std_logic_vector(15 downto 0);
   signal Z5 : std_logic_vector(15 downto 0);
   signal Z6 : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: key_generator PORT MAP (
          key => key,
          ROUND => ROUND,
          Z1 => Z1,
          Z2 => Z2,
          Z3 => Z3,
          Z4 => Z4,
          Z5 => Z5,
          Z6 => Z6
        );

   -- Clock process definitions
   test_process :process
   begin
	
		key<=x"00010002000300040005000600070008"; 
		ROUND<="0000";
		
		wait for period/2;
      ROUND<="0001";
		
		wait for period/2;
      ROUND<="0010";
				
		wait for period/2;
      ROUND<="0011";
		
		wait for period/2;
      ROUND<="0100";
		wait for period/2;
      ROUND<="0101";
		wait for period/2;
      ROUND<="0110";
		wait for period/2;
      ROUND<="0111";
		wait for period/2;
      ROUND<="1000";
		wait for period/2;
		
		
		
		
   end process;
 


END;
