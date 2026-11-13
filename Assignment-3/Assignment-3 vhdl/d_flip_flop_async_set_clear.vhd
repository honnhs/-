library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Corresponds to the user's 3-input NAND gate implementation.
-- set/clr are active-high; CLR has priority if both are '1'.
entity d_flip_flop_async_set_clear is
    port (
        D    : in  std_logic;
        CLK  : in  std_logic;
        set  : in  std_logic;
        clr  : in  std_logic;
        Q    : out std_logic;
        Qbar : out std_logic
    );
end entity d_flip_flop_async_set_clear;

architecture rtl of d_flip_flop_async_set_clear is
    signal q_int : std_logic;
begin
    process (CLK, set, clr)
    begin
        if clr = '1' then
            q_int <= '0';
        elsif set = '1' then
            q_int <= '1';
        elsif rising_edge(CLK) then
            q_int <= D;
        end if;
    end process;
    Q    <= q_int;
    Qbar <= not q_int;
end architecture rtl;
