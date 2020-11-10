----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.11.2020 18:27:04
-- Design Name: 
-- Module Name: Circuito_TB - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use STD.textio.all;
use IEEE.std_logic_textio.all;

library UNISIM;
use UNISIM.VComponents.all;

entity Circuito_TB is
end Circuito_TB;

architecture Behavioral of Circuito_TB is
    component Circuito
    port(
        Add_A : in STD_LOGIC_VECTOR (2 downto 0) := "000";
        Add_B : in STD_LOGIC_VECTOR (2 downto 0) := "000";
        Data_A: in STD_LOGIC_VECTOR (3 downto 0) := "1000";
        Data_B: in STD_LOGIC_VECTOR (3 downto 0) := "1000";
        Ctrl_ALU: in STD_LOGIC_VECTOR (2 downto 0) := "000";
        Malu: out std_logic_vector (1 downto 0) := "00";
        CoutAlu: out std_logic;
        FA: in integer;
        FB: in integer;
        final_alu: STD_LOGIC_VECTOR (3 downto 0) := "0000";
        final:out std_logic_vector (6 downto 0) := "0000000"
        );
    end component;
    Signal senal_A: integer;
    Signal senal_B: integer;
    Signal rom_a : std_logic_vector (2 downto 0) := "000";
    Signal rom_b : std_logic_vector (2 downto 0) := "000";
    Signal alu : std_logic_vector (2 downto 0) := "000";
    Signal emes : std_logic_vector (1 downto 0) := "00";
    Signal carry : std_logic;
    Signal mux_a : integer;
    Signal mux_b : integer;
    Signal deco : std_logic_vector(6 downto 0) := "0000000";
    Signal resultado: std_logic_vector(3 downto 0) := "0000";
    Signal contA : std_logic_vector (2 downto 0) := "000";
    Signal contB : std_logic_vector (2 downto 0) := "000";
    Signal contAlu : std_logic_vector (2 downto 0) := "000";   
    
procedure expected
    (
    sel_A: integer;
    sel_B: integer;
    add_a: in std_logic_vector(2 downto 0);
    add_b: in std_logic_vector(2 downto 0);
    Sel_alu: in std_logic_vector(2 downto 0);
    ms : out std_logic_vector (1 downto 0);
    carry : out std_logic;
    resultado : out std_logic_vector(3 downto 0);
    resultado2: out std_logic_vector(3 downto 0);
    resultado_deco : out std_logic_vector(6 downto 0);
    const_a: in std_logic_vector(3 downto 0) := "1000";
    const_b: in std_logic_vector(3 downto 0) := "1000"
    ) is 
    
    variable sal_muxa : std_logic_vector (3 downto 0) := "0000";
    variable sal_muxb : std_logic_vector (3 downto 0) := "0000";
    variable emes : std_logic_vector (1 downto 0) := "00";
    variable cout : std_logic := '0';
    variable alu_out : std_logic_vector (3 downto 0) := "0000";
    variable alu_out2 : std_logic_vector (3 downto 0) := "0000";
    variable deco_out : std_logic_vector (6 downto 0) := "0000000";
    variable r_temp:std_logic_vector(4 downto 0);
    variable r_temp_mul: std_logic_vector(7 downto 0);
    type rom_A is array (0 to 7) of std_logic_vector (3 downto 0);
    constant ROM : rom_A :=(
        0 => "1111",
        1 => "1110",
        2 => "0011",
        3 => "0001",
        4 => "0010",
        5 => "1010",
        6 => "1011",
        7 => "1100");
   type rom_type is array (0 to 7) of std_logic_vector (3 downto 0);
   constant ROMb : rom_type :=(
        7 => "0101",
        6 => "0001",
        5 => "0000", 
        4 => "0010",
        3 => "0110",
        2 => "0000",
        1 => "0011",
        0 => "0100");
   
    begin
        if(sel_A=0)then 
            sal_muxa :=const_a;
        else
            sal_muxa := rom(conv_integer(add_a));
        
       end if;
        if(sel_b=0)then 
            sal_muxb :=const_b;
        else
            sal_muxb := romb(conv_integer(add_b));
        
       end if;
       case sel_alu is
        
            when "000" =>
                if( sal_muxa>sal_muxb ) then
                    r_temp := "00000";
                    cout:=r_temp(4);
                    alu_out :=r_temp(3 downto 0);
                    alu_out2 :=r_temp(3 downto 0);
                    
                else
                    r_temp := ('0'& sal_muxb)-('0'& sal_muxa);
                    cout:=r_temp(4);
                   alu_out :=r_temp(3 downto 0);
                    alu_out2 :=r_temp(3 downto 0);
                 
                end if;
                
            when "001"=>
                r_temp := ('0'& sal_muxb) xnor ('0'& sal_muxa);
                cout:=r_temp(4);
                alu_out :=r_temp(3 downto 0);
                 alu_out2 :=r_temp(3 downto 0);
                
            when "010" =>         
                r_temp := ('0'& sal_muxb) + ('0'& sal_muxa);
                cout:=r_temp(4);
                alu_out :=r_temp(3 downto 0);
                 alu_out2 :=r_temp(3 downto 0);
      
            when "011" =>         
               r_temp := ('0'& sal_muxb)+(1);
                cout:=r_temp(4);
                alu_out :=r_temp(3 downto 0); 
                 alu_out2 :=r_temp(3 downto 0);
            
            when "100" =>         
                if( sal_muxb<sal_muxa ) then
                    r_temp :=  "00000";
                    cout:=r_temp(4);
                   alu_out :=r_temp(3 downto 0);
                    alu_out2 :=r_temp(3 downto 0);
                    
                else
                    r_temp := ('0'& sal_muxb)-('0'& sal_muxa);
                   cout:=r_temp(4);
                   alu_out :=r_temp(3 downto 0);
                    alu_out2 :=r_temp(3 downto 0);
                 
                end if;
            when "101" =>         
                r_temp_mul :=("0000"& sal_muxa)* "00000010";
                cout:=r_temp(4);
                alu_out :=r_temp(3 downto 0);
                alu_out2 :=r_temp(3 downto 0); 
                
             when "110" =>         
                r_temp := ('0'& sal_muxa)+(2);
                cout:=r_temp(4);
                alu_out :=r_temp(3 downto 0);
                alu_out2 :=r_temp(3 downto 0);    
            
            when others =>         
                r_temp := ('0'& sal_muxb) xor ('0'& sal_muxa);
                cout:=r_temp(4);
                alu_out :=r_temp(3 downto 0);
                alu_out2 :=r_temp(3 downto 0);
               
                
       end case;
       resultado:= alu_out;
       resultado2:= alu_out2;
       carry:=cout;
       
       if(sal_muxa<sal_muxb)then
             emes:=   "00";
       elsif(sal_muxa>sal_muxb)then
            emes:=   "01";
       elsif(sal_muxa=sal_muxb)then
            emes:= "10";  
       else
           emes:=   "11";
       end if;
       
       
       ms :=emes;
            if alu_out2 = "0000" then deco_out := "1111110"; -- 0
            elsif alu_out2  = "0001" then deco_out := "1111101"; -- 1
            elsif alu_out2 = "0010" then deco_out := "1111011"; -- 2
            elsif alu_out2 = "0011" then deco_out:= "1110111"; -- 3
            elsif alu_out2  = "0100" then deco_out:= "1101111"; -- 4
            elsif alu_out2 = "0101" then deco_out:= "1011111"; -- 5
            elsif alu_out2  = "0110" then deco_out:= "0111111"; -- 6
            elsif alu_out2  = "0111" then deco_out:= "0000000"; -- 7
            elsif alu_out2 = "1000" then deco_out:= "0000000"; -- 8
            elsif alu_out2 = "1001" then deco_out:= "0000000"; -- 9
            else deco_out := "UUUUUUU";
            end if;
            
            resultado_deco:=deco_out;
            
       end expected;
    begin
    uut1:  Circuito PORT MAP 
     (
        Add_A => rom_a,
        Add_B => rom_b,		
        Ctrl_ALU => alu,
        Malu => emes,
        CoutAlu => carry,
        FA => mux_a,
        FB => mux_b,
        final => deco,
        final_alu=> resultado
     );	
     
     process
     variable s : line;
     variable m : std_logic_vector(1 downto 0);
     variable cout : std_logic;
     variable out_alu : std_logic_vector(3 downto 0);
     variable out_alu2 : std_logic_vector(3 downto 0);
     variable out_deco : std_logic_vector(6 downto 0);
    
        begin
        contA <= "000";
        contB <= "000";
        contAlu <= "000";
        for i in 0 to 7 loop
            for fa in 0 to 1 loop
                if fa = 1 then
                    mux_a <= 1;
                    for roma in 0 to 7 loop
                        rom_a <= contA;
                        conta <= contA + 1;
                        for fb in 0 to 1 loop
                            if fb = 1 then
                                mux_b <= 1;
                                for romb in 0 to 7 loop
                                    rom_b <= contB;
                                    expected(fa, fb, rom_a, rom_b, alu, m, cout, out_alu, out_alu2, out_deco);
                                    wait for 60 ns;
                                    write (s, string'("Salida ALU: ")); write (s, resultado); 
                                    write (s, string'(" Expected: ")); write (s, out_alu);
                                    write (s, string' (" Ms: ")); write (s, emes); write (s, string'(" Expected: ")); write (s, m);
                                    write (s, string' (" Carry: ")); write (s, carry); write (s, string'(" Expected: ")); write (s, cout);
                                    write (s, string' (" Deco: ")); write (s, deco); write (s, string'(" Expected: ")); write (s, out_deco);
                                    writeline(output, s);                     
                                    contB <= contB + 1;
                                end loop;
                            else
                                mux_b <= 0;
                                expected(fa, fb, rom_a, rom_b, alu, m, cout, out_alu, out_alu2, out_deco);
                                wait for 60 ns;
                                write (s, string'("Salida ALU: ")); write (s, resultado); write (s, string'(" Expected: ")); write (s, out_alu);
                                write (s, string' (" Ms: ")); write (s, emes); write (s, string'(" Expected: ")); write (s, m);
                                write (s, string' (" Carry: ")); write (s, carry); write (s, string'(" Expected: ")); write (s, cout);
                                write (s, string' (" Deco: ")); write (s, deco); write (s, string'(" Expected: ")); write (s, out_deco);
                                writeline(output, s);  
                            end if;
                        end loop;
                    end loop;
                else
                    mux_a <= 0;
                    for fb in 0 to 1 loop
                        if fb = 1 then
                            mux_b <= 1;
                            for romb in 0 to 7 loop
                                rom_b <= contB;
                                expected(fa, fb, rom_a, rom_b, alu, m, cout, out_alu, out_alu2, out_deco);
                                wait for 60 ns;
                                write (s, string'("Salida ALU: ")); write (s, resultado); write (s, string'(" Expected: ")); write (s, out_alu);
                                write (s, string' (" Ms: ")); write (s, emes); write (s, string'(" Expected: ")); write (s, m);
                                write (s, string' (" Carry: ")); write (s, carry); write (s, string'(" Expected: ")); write (s, cout);
                                write (s, string' (" Deco: ")); write (s, deco); write (s, string'(" Expected: ")); write (s, out_deco);
                                writeline(output, s);  
                                contB <= contB + 1;
                            end loop;
                        else
                            mux_b <= 0;
                            expected(fa, fb, rom_a, rom_b, alu, m, cout, out_alu, out_alu2, out_deco);
                            wait for 60 ns;
                            write (s, string'("Salida ALU: ")); write (s, resultado); write (s, string'(" Expected: ")); write (s, out_alu);
                            write (s, string' (" Ms: ")); write (s, emes); write (s, string'(" Expected: ")); write (s, m);
                            write (s, string' (" Carry: ")); write (s, carry); write (s, string'(" Expected: ")); write (s, cout);
                            write (s, string' (" Deco: ")); write (s, deco); write (s, string'(" Expected: ")); write (s, out_deco);
                            writeline(output, s);  
                        end if;
                    end loop;
                end if;
            end loop;
        alu <= contAlu;
        contalu <= contalu + 1;
        contB <= "000";  
        contA <= "000";                         
    end loop;
    end process;
end Behavioral;
