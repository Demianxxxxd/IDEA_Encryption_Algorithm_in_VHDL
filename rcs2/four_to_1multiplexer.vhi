
-- VHDL Instantiation Created from source file four_to_1multiplexer.vhd -- 11:45:54 07/03/2023
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT four_to_1multiplexer
	PORT(
		i1 : IN std_logic_vector(15 downto 0);
		i2 : IN std_logic_vector(15 downto 0);
		i3 : IN std_logic_vector(15 downto 0);
		i4 : IN std_logic_vector(15 downto 0);
		s : IN std_logic_vector(1 downto 0);          
		o : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	Inst_four_to_1multiplexer: four_to_1multiplexer PORT MAP(
		i1 => ,
		i2 => ,
		i3 => ,
		i4 => ,
		s => ,
		o => 
	);


