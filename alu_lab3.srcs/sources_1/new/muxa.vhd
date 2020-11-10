-----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2020 16:05:11
-- Design Name: 
-- Module Name: mux_a - Behavioral
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
use IEEE.Std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity mux_a is
    generic(
        N : integer := 3 
    );
    Port ( in_romA: in STD_LOGIC_VECTOR (N downto 0):= X"0";
           FA: in integer;
           Data_A: in STD_LOGIC_VECTOR (3 downto 0) := "1000";
           A: out STD_LOGIC_VECTOR (N downto 0):= X"0");
end mux_a;

architecture Behavioral of mux_a is
signal A1: STD_LOGIC_VECTOR (N downto 0) := X"0";
    begin
    A <= A1;
    process (FA, in_romA)
        begin
        case FA is
            when 0=> A1 <= data_A;
            when 1=> A1 <= in_romA;
            when others => A1 <= X"0";
        end case;
    end process;
        
end Behavioral;