library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Functionally equivalent to the original gated NAND D latch.
entity d_latch is
    port (
        D    : in  std_logic;
        en   : in  std_logic;
        Q    : out std_logic;
        Qbar : out std_logic
    );
end entity d_latch;

architecture rtl of d_latch is
    signal q_int : std_logic;
begin
    process (D, en)
    begin
        if en = '1' then
            q_int <= D;
        end if;
        -- en=0: retain q_int.
    end process;
    Q    <= q_int;
    Qbar <= not q_int;
end architecture rtl;
