----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2020 16:05:11
-- Design Name: 
-- Module Name: rom_a - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom_a is
    Port ( addr_a : in STD_LOGIC_VECTOR (2 downto 0);
           rom_A : out STD_LOGIC_VECTOR (3 downto 0));
end rom_a;

architecture Behavioral of rom_a is
    type rom_type is array (0 to 7) of std_logic_vector (3 downto 0);
    constant ROM : rom_type :=(
    0 => "1111",
    1 => "1110",
    2 => "0011",
    3 => "0001",
    4 => "0010",
    5 => "1010",
    6 => "1011",
    7 => "1100");
begin
    rom_A <= ROM(conv_integer(addr_a));
end Behavioral;
