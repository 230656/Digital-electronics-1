library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
entity pwm02 is
    Port ( clk : in STD_LOGIC;
        duty : in STD_LOGIC_VECTOR (7 downto 0);
        pwm : out STD_LOGIC;
        pwm_i : out STD_LOGIC
    );
end pwm02;
architecture Behavioral02 of pwm02 is
    signal counter : std_logic_vector (7 downto 0) := "00000000"; --initialize to 0
    signal duty_sig : std_logic_vector (7 downto 0) := "00000000";
    begin
    process(clk)
    begin
        if rising_edge(clk) then
            counter <= counter + 1;
        end if;
        if counter = 0 then
            duty_sig <= duty;
        end if;
    end process;
pwm <= '1' when counter <= duty_sig else '0';
pwm_i <= '1' when counter < duty_sig else '0';
end Behavioral02;