library ieee;
use ieee.std_logic_1164.all;

entity cellstate is
    port (
        cell_in : in std_logic;
        nbr_in : in std_logic_vector(7 downto 0);
        change_out : out std_logic
    );
end cellstate;

architecture rtl of cellstate is
begin
    
    proc_state: process(cell_in, nbr_in)
        variable count : integer range 0 to 8 := 0;
    begin
        count := 0;
        
        for i in nbr_in'range loop
            if nbr_in(i) = '1' then
                count := count + 1;
            end if;
        end loop;
        
        if (cell_in = '1' and (count < 2 or 3 < count)) or 
           (cell_in = '0' and count = 3)  then
            change_out <= '1';
        else
            change_out <= '0';
        end if;
    end process proc_state;

end architecture rtl;