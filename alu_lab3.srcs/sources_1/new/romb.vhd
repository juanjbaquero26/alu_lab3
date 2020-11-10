----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2020 16:05:11
-- Design Name: 
-- Module Name: rom_b - Behavioral
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

entity rom_b is
    Port ( add_b : in STD_LOGIC_VECTOR (2 downto 0);
           rom_B : out STD_LOGIC_VECTOR (3 downto 0));
end rom_b;

architecture Behavioral of rom_b is
    type rom_type is array (0 to 7) of std_logic_vector (3 downto 0);
    constant ROM : rom_type :=(
    7 => "0101",
    6 => "0001",
    5 => "0000", 
    4 => "0010",
    3 => "0110",
    2 => "0000",
    1 => "0011",
    0 => "0100");
begin
    rom_B <= ROM(conv_integer(add_b));

end Behavioral;