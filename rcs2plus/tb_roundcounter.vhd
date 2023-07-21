--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:28:44 07/05/2023
-- Design Name:   
-- Module Name:   /nas/lrz/home/ge86qud/submit/rcs2/tb_roundcounter.vhd
-- Project Name:  idea_rcs2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: roundcounter
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
 
ENTITY tb_roundcounter IS
END tb_roundcounter;
 
ARCHITECTURE behavior OF tb_roundcounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT roundcounter
    PORT(
         CLK : IN  std_logic;
         START : IN  std_logic;
         RESULT : IN  std_logic;
         READY : OUT  std_logic;
         S_i : OUT  std_logic;
         INIT : OUT  std_logic;
         TRAFO : OUT  std_logic;
         ROUND : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal START : std_logic := '0';
   signal RESULT : std_logic := '0';

 	--Outputs
   signal READY : std_logic;
   signal S_i : std_logic;
   signal INIT : std_logic;
   signal TRAFO : std_logic;
   signal ROUND : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: roundcounter PORT MAP (
          CLK => CLK,
          START => START,
          RESULT => RESULT,
          READY => READY,
          S_i => S_i,
          INIT => INIT,
          TRAFO => TRAFO,
          ROUND => ROUND
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
	begin
   START <= '1';
		RESULT <= '0';
		wait for CLK_period;
		START <= '0';
		
		-- round 1
		RESULT <= '1';
		wait for CLK_period;
		RESULT <= '0';
		wait for CLK_period;
		
		-- round 2
		RESULT <= '1';
		wait for CLK_period;
		RESULT <= '0';
		wait for CLK_period;
		
		-- round 3
		RESULT <= '1';
		wait for CLK_period;
		RESULT <= '0';
		wait for CLK_period;
		
		-- round 4
		RESULT <= '1';
		wait for CLK_period;
		RESULT <= '0';
		wait for CLK_period;
		
		-- round 5
		RESULT <= '1';
		wait for CLK_period;
		RESULT <= '0';
		wait for CLK_period;
		
		-- round 6
		RESULT <= '1';
		wait for CLK_period;
		RESULT <= '0';
		wait for CLK_period;
		
		-- round 7
		RESULT <= '1';
		wait for CLK_period;
		RESULT <= '0';
		wait for CLK_period;
		
		-- round 8
		RESULT <= '1';
		wait for CLK_period;
		RESULT <= '0';
		wait for CLK_period;
		
		-- round 9
		RESULT <= '1';
		wait for CLK_period;
		RESULT <= '0';
		wait for CLK_period;
		
		-- round 10
		RESULT <= '1';
		wait for CLK_period;
		RESULT <= '0';
		wait for CLK_period;
   end process;

END;
