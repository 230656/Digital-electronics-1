library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
 
ENTITY Testbench IS
END Testbench;
 
ARCHITECTURE behavior OF Testbench IS 
 
    
    

   --Inputs
   signal s_clk : std_logic := '0';
   signal duty : std_logic_vector(7 downto 0) := (others => '0');
	

 	--Outputs
   signal pwm_out : std_logic;

   -- Clock period definition
   constant clk_period : time := 10 ns;
 
BEGIN
 
	
  uut_gates : entity WORK.PWM_GENERATOR 
  PORT MAP (
          clk => s_clk,
          duty => duty,
          pwm_out => pwm_out,
          rst => '0'
        );

   -- Clock process definitions
   clk_process :process
   begin
		s_clk <= '0';
		wait for clk_period/2;
		s_clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	

      wait for clk_period*10;
     
		duty <= "01000000";
		
		
		
   end process;

END;
