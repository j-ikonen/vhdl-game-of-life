entity mem is
    generic (
        crd_width : integer := 8
    );
    port (
        row_in : in std_logic_vector(crd_width-1 downto 0);
        col_in : in std_logic_vector(crd_width-1 downto 0);
        cell_out : out std_logic
    );
end entity mem;

architecture rtl of mem is
    constant c_size : integer := 2 ** crd_width-1;

    type t_memory is array (0 to c_size) of 
        std_logic_vector(c_size downto 0);
    signal r_data : t_memory;
begin
    -- Set the value at coordinates to cell output
    get_cell: process(row_in, col_in)
    begin
        cell_out <= r_data(row_in)(col_in);
    end process get_cell;
        
end architecture rtl;
