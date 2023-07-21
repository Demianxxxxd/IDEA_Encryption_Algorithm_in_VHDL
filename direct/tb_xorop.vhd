--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:33:31 05/12/2023
-- Design Name:   
-- Module Name:   /nas/lrz/home/ge86qud/submit/direct/tb_xorop.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: xorop
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
 
ENTITY tb_xorop IS
END tb_xorop;
 
ARCHITECTURE behavior OF tb_xorop IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT xorop
    PORT(
         a : IN  std_logic_vector(2 downto 0);
         b : IN  std_logic_vector(2 downto 0);
         O : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   ------signal a : std_logic := '0';
   ------signal b : std_logic := '0';

 	--Outputs
  -- ----signal O : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   ------appropriate port name 
 
   --constant period : time := 10 ns;
signal A, B, O : std_logic_vector(2 downto 0):="000"; 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
  -- uut: xorop PORT MAP (
     --     a => a,
    --      b => b,
    --      O => O
    --    );

   -- Clock process definitions
   --a_process :process
   --begin
	--	a <= '0';
	--	b <= '0';
	--	wait for period/2;
	--	a <= '1';
	--	b <= '1';
	--	wait for period/2;
  -- end process;
 
my_xorop: xorop port map(A, B, O);
A<="000", "101" after 100 ns;
B<="000", "101" after 200 ns;
  

END;
