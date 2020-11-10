----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.11.2020 11:02:58
-- Design Name: 
-- Module Name: rom_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom_tb is
end rom_tb;

architecture Behavioral of rom_tb is
component rom_a
    port(
        addr_a: in STD_LOGIC_VECTOR (2 downto 0) := "000";
        rom_a: out STD_LOGIC_VECTOR (3 downto 0) := "0000"
    );
    end component;
signal  adr_a: STD_LOGIC_VECTOR (2 downto 0) := "000";
signal rom_aaa: STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin

uut: rom_A port map(
addr_A=>adr_A,
rom_A=>rom_aaa

);
process
begin
adr_A<="100";
wait for 10 ns;
adr_A<="101";
wait for 10 ns;
adr_A<="111";
wait for 10 ns;
wait;
end process;
end Behavioral;
