----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.05.2022 11:22:16
-- Design Name: 
-- Module Name: pwm_generator - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm_generator is
    Port ( clk : in STD_LOGIC;
           duty : in STD_LOGIC_VECTOR (7 downto 0);
           pwm_out : out STD_LOGIC;
           rst : in STD_LOGIC);
end pwm_generator;

architecture Behavioral of pwm_generator is
signal s_cnt : natural;

begin

pwm : process(clk)

begin

if rising_edge(clk) then    -- Synchronous process
   s_cnt <= s_cnt + 1;
  if (s_cnt >= (256 - 1)) then
                s_cnt <= 0;
  end if;
  if (s_cnt >= to_integer(unsigned( duty ))) then 
  pwm_out <= '0';
  else  pwm_out <= '1';
  end if;
        end if;
end process pwm;

end Behavioral;