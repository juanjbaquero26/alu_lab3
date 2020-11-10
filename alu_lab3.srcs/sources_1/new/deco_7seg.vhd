----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.11.2020 14:55:07
-- Design Name: 
-- Module Name: deco_7seg - Behavioral
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
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity deco is
    generic(n: integer := 6);
    port (
        sal : out  std_logic_vector(n downto 0);
        ent : in std_logic_vector(n-3 downto 0)
    );
end entity;

architecture arch of deco is
begin
    process (ent)        
    begin
     sal <= (others => '1');
     if ((to_integer(unsigned(ent)))>7)then
         sal <= (others => '1');
     else
     sal (to_integer(unsigned(ent))) <= '0';
    end if;
    end process;
    

end architecture;