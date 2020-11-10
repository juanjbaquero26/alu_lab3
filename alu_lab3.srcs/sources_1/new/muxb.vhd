----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2020 16:05:11
-- Design Name: 
-- Module Name: mux_b - Behavioral
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

entity mux_b is
    generic (
    N : integer := 3 
    );
    Port ( 
           in_romB : in STD_LOGIC_VECTOR (N downto 0):= X"0";
           FB : in integer;
           Data_b: in STD_LOGIC_VECTOR (3 downto 0) := "1000";
           B : out STD_LOGIC_VECTOR (N downto 0):= X"0");
end mux_b;

architecture Behavioral of mux_b is
signal B1: STD_LOGIC_VECTOR (N downto 0) := X"0";
    begin
    B <= B1;
    process (FB, in_romB)
        begin
        case FB is
            when 0 => B1 <= data_B;
            when 1 => B1 <= in_romB;
            when others => B1 <= X"0";
        end case;
    end process;

end Behavioral;