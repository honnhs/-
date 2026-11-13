library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Same positive-edge behavior as the user's Master-Slave circuit.
entity d_flip_flop is
    port (
        D    : in  std_logic;
        CLK  : in  std_logic;
        Q    : out std_logic;
        Qbar : out std_logic
    );
end entity d_flip_flop;

architecture rtl of d_flip_flop is
    signal q_int : std_logic;
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            q_int <= D;
        end if;
    end process;
    Q    <= q_int;
    Qbar <= not q_int;
end architecture rtl;
