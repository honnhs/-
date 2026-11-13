library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Positive-edge JK flip-flop implemented in behavioral VHDL.
-- Matches the corrected master-slave NAND logic (not the original
-- falling-edge screenshot). CLR is an ACTIVE-LOW asynchronous reset.
entity jk_flip_flop is
    Port (
        J    : in  STD_LOGIC;
        K    : in  STD_LOGIC;
        CLK  : in  STD_LOGIC;
        CLR  : in  STD_LOGIC;
        Q    : out STD_LOGIC;
        Qbar : out STD_LOGIC
    );
end entity jk_flip_flop;

architecture Behavioral of jk_flip_flop is
    signal q_reg : STD_LOGIC;
begin
    process(CLK, CLR)
    begin
        if CLR = '0' then
            q_reg <= '0';                       -- async reset (active LOW)
        elsif rising_edge(CLK) then
            if    J = '0' and K = '0' then
                null;                           -- Hold
            elsif J = '0' and K = '1' then
                q_reg <= '0';                   -- Reset
            elsif J = '1' and K = '0' then
                q_reg <= '1';                   -- Set
            elsif J = '1' and K = '1' then
                q_reg <= not q_reg;             -- Toggle once per rising edge
            end if;
        end if;
    end process;

    Q    <= q_reg;
    Qbar <= not q_reg;
end architecture Behavioral;
