----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/28/2022 10:16:03 AM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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


entity top is
  Port ( CLK100MHZ: in STD_LOGIC;
         JB : out STD_LOGIC;
         SW: in std_logic_vector(7 downto 0);
         BTNC: in STD_LOGIC
         );
end top;

architecture Behavioral of top is
   
begin
    
            
        
    pwm_gen : entity work.pwm_generator
        port map(
            clk => CLK100MHZ,
            pwm_out => JB,
            rst => BTNC,
            
         duty(0) => SW(0),
         duty(1) => SW(1),
         duty(2) => SW(2),
         duty(3) => SW(3),
         duty(4) => SW(4),
         duty(5) => SW(5),
         duty(6) => SW(6),
         duty(7) => SW (7)
         );
     
end Behavioral;