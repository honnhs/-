library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Functional model of the user's cross-coupled NOR RS latch.
-- Active-high S/R; S=R=1 produces Q=Qbar=0 (forbidden).
entity rs_latch is
    port (
        S     : in  std_logic;
        R     : in  std_logic;
        Q     : out std_logic;
        Q_bar : out std_logic
    );
end entity rs_latch;

architecture rtl of rs_latch is
    signal q_int  : std_logic;
    signal qb_int : std_logic;
begin
    process (S, R)
    begin
        if S = '1' and R = '0' then
            q_int  <= '1';
            qb_int <= '0';
        elsif S = '0' and R = '1' then
            q_int  <= '0';
            qb_int <= '1';
        elsif S = '1' and R = '1' then
            -- Forbidden NOR-latch input condition.
            q_int  <= '0';
            qb_int <= '0';
        end if;
        -- S=R=0: no assignment -> latch holds previous value.
    end process;
    Q     <= q_int;
    Q_bar <= qb_int;
end architecture rtl;
