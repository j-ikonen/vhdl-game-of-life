library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cellstate_tb is
end cellstate_tb;

architecture behav of cellstate_tb is
    signal nbr : std_logic_vector(7 downto 0);
    signal cell: std_logic;
    signal change : std_logic;

    component cellstate is
        port(
            cell_in : in std_logic;
            nbr_in : in std_logic_vector(7 downto 0);
            change_out : out std_logic
        );
    end component cellstate;

begin
    i_cellstate : cellstate
        port map (
            cell_in => cell,
            nbr_in => nbr,
            change_out => change
    );
    
    test: process
    begin
        nbr <= "01010101";
        cell <= '0';
        wait for 10 ns;
        assert change = '0'
            report "case 1 fail: overpop should stay dead"
            severity error;

        cell <= '1';
        wait for 10 ns;
        assert change = '1'
            report "case 2 fail: overpop should die"
            severity error;
        
        nbr <= "01100000";
        wait for 10 ns;
        assert change = '0'
            report "case 3 fail: 2 nbr should stay alive"
            severity error;

        nbr <= "01100010";
        wait for 10 ns;
            assert change = '0'
                report "case 4 fail: 3 nbr should stay alive"
                severity error;
       
        cell <= '0';
        nbr <= "00100000";
        wait for 10 ns;
            assert change = '1'
                report "case 5 fail: upop should die"
                severity error;
            
        wait for 10 ns;
        assert false report "end of test" severity note;
        wait;
    end process test;
    
    
end architecture behav;