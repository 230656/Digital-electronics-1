----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2022 16:59:36
-- Design Name: 
-- Module Name: rst - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rst is
  port (
    clk : in std_logic;
    rst_n : in std_logic; -- Pullup
    rst : out std_logic
  );

end rst;

architecture Behavioral of rst is

  signal sreg : std_logic_vector(3 downto 0);


begin

 SREG_PROC : process(clk)
  begin
    if rising_edge(clk) then
      sreg <= sreg(sreg'high - 1 downto 0) & rst_n;
    end if;
  end process;

  RESET_PROC : process(sreg)
    constant all_ones : std_logic_vector(sreg'range) := (others => '1');
  begin

    if sreg = all_ones then
      rst <= '0';
    else
      rst <= '1';
    end if;

  end process;

end Behavioral;
