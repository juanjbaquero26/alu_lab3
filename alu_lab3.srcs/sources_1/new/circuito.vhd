----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.11.2020 17:23:17
-- Design Name: 
-- Module Name: Circuito - Behavioral
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


entity Circuito is
    port
    (
        Add_A : in STD_LOGIC_VECTOR (2 downto 0) := "000";
        Add_B : in STD_LOGIC_VECTOR (2 downto 0) := "000";
        Data_A: in STD_LOGIC_VECTOR (3 downto 0) := "1000";
        Data_B: in STD_LOGIC_VECTOR (3 downto 0) := "1000";
        Ctrl_ALU: in STD_LOGIC_VECTOR (2 downto 0) := "000";
        Malu: out std_logic_vector (1 downto 0) := "00";
        CoutAlu: out std_logic;
        FA:in integer;
        FB: in integer;
        final_alu: STD_LOGIC_VECTOR (3 downto 0) := "0000";
        final:out std_logic_vector (6 downto 0) := "0000000"
    );
end Circuito;

architecture Behavioral of Circuito is

    component deco
    port(
        ent: in std_logic_vector (3 downto 0) := "0000";
        sal: out std_logic_vector (6 downto 0)
    );
    end component;
    
    component mux_a
    port(
         data_A: in STD_LOGIC_VECTOR (3 downto 0) := "1000";
           in_romA: in STD_LOGIC_VECTOR (3 downto 0):= "0000";
           FA: in integer;
           A: out STD_LOGIC_VECTOR (3 downto 0):= "0000"
    );
    end component;
    
    component mux_b
    port(
        fB: in integer;
        in_romB: in STD_LOGIC_VECTOR (3 downto 0) := "0000";
        data_B: in STD_LOGIC_VECTOR (3 downto 0) := "1000";
        B: out STD_LOGIC_VECTOR (3 downto 0) := "0000"   
    );
    end component;
    
    component rom_a
    port(
        addr_a: in STD_LOGIC_VECTOR (2 downto 0) := "000";
        rom_a: out STD_LOGIC_VECTOR (3 downto 0) := "0000"
    );
    end component;
    
    component rom_b
    port(
        add_b: in STD_LOGIC_VECTOR (2 downto 0) := "000";
        rom_b: out STD_LOGIC_VECTOR (3 downto 0) := "0000"
    );
    end component;   
    
    component alu
    port(
         a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           control : in STD_LOGIC_VECTOR (2 downto 0);
           cout : out STD_LOGIC;
           resultado2 : out STD_LOGIC_VECTOR (3 downto 0);
           mab : out std_logic_vector(1 downto 0);
           resultado : out STD_LOGIC_VECTOR (3 downto 0)
    );
    end component;
    
    signal wire_muxA: STD_LOGIC_VECTOR (3 downto 0) := "0000"; 
    signal wire_muxB: STD_LOGIC_VECTOR (3 downto 0) := "0000"; 
    signal wire_aluA: STD_LOGIC_VECTOR (3 downto 0) := "0000"; 
    signal wire_aluB: STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal out_MALU: std_logic_vector (3 downto 0) := "0000";
     signal out_MALU2: std_logic_vector (3 downto 0) := "0000";
    
    begin
    
    romA: rom_a port map(
        addr_a => Add_A,
        rom_a => wire_muxA
    );
    
    romB: rom_b port map(
        add_b => Add_B,
        rom_b => wire_muxB
    );  
    
    muxA: mux_a port map(
        fa => FA,
        in_romA => wire_muxA,
        data_A => Data_A,
        A => wire_aluA
    );
    
    muxB: mux_b port map(
        fB => FB,
        in_romB => wire_muxB,
        data_B => Data_B,
        B => wire_aluB
    );   

    Ma1u: alu port map(
        a => wire_aluA,
        b => wire_aluB,
        control => Ctrl_ALU,
        mab => Malu,
        cout => CoutAlu,
        resultado => out_MALU, 
        resultado2=>out_MALU2       
    );
    
    dec: deco port map(
        ent => out_MALU,
        sal=> final
    );

end Behavioral;