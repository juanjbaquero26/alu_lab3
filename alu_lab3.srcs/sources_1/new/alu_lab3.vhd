----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.11.2020 14:53:17
-- Design Name: 
-- Module Name: alu_lab3 - Behavioral
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
use ieee.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;
entity alu is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           control : in STD_LOGIC_VECTOR (2 downto 0);
           cout : out STD_LOGIC;
           resultado2 : out STD_LOGIC_VECTOR (3 downto 0);
           mab : out std_logic_vector(1 downto 0);
           resultado : out STD_LOGIC_VECTOR (3 downto 0));
                           
end alu;

architecture Behavioral of alu is
    signal r_temp:std_logic_vector(4 downto 0);
    signal r_temp_mul: std_logic_vector(7 downto 0);
    begin
    
        process(control,a,b)
        begin
        case control is
        
            when "000" =>
                if( b<a ) then
                    r_temp <= "00000";
                    cout<=r_temp(4);
                    resultado<=r_temp(3 downto 0);
                    resultado2<=r_temp(3 downto 0);
                    
                else
                    r_temp <=('0'& b)-('0'& a);
                    cout<=r_temp(4);
                    resultado<=r_temp(3 downto 0);
                    resultado2<=r_temp(3 downto 0);
                 
                end if;
                
            when "001"=>
                r_temp <=('0'& b) xnor ('0'& a);
                cout<=r_temp(4);
                resultado<=r_temp(3 downto 0);
                resultado2<=r_temp(3 downto 0);
                
            when "010" =>         
                r_temp <=('0'& b) + ('0'& a);
                cout<=r_temp(4);
                resultado<=r_temp(3 downto 0);
                resultado2<=r_temp(3 downto 0);
      
            when "011" =>         
                r_temp <=('0'& b)+(1);
                cout<=r_temp(4);
                resultado<=r_temp(3 downto 0);
                resultado2<=r_temp(3 downto 0); 
            
            when "100" =>         
                if( b<a ) then
                    r_temp <= "00000";
                    cout<=r_temp(4);
                    resultado<=r_temp(3 downto 0);
                    resultado2<=r_temp(3 downto 0);
                    
                else
                    r_temp <=('0'& b)-('0'& a);
                    cout<=r_temp(4);
                    resultado<=r_temp(3 downto 0);
                    resultado2<=r_temp(3 downto 0);
                 
                end if;
            when "101" =>         
                r_temp_mul <=("0000"& a)* "00000010";
                cout<=r_temp(4);
                resultado<=r_temp(3 downto 0); 
                resultado2<=r_temp(3 downto 0);
                
             when "110" =>         
                r_temp <=('0'& a)+(2);
                cout<=r_temp(4);
                resultado<=r_temp(3 downto 0); 
                resultado2<=r_temp(3 downto 0);   
            
            when others =>         
                r_temp <=('0'& b) xor ('0'& a);
                cout<=r_temp(4);
                resultado<=r_temp(3 downto 0);
                resultado2<=r_temp(3 downto 0);               
                
       end case;
            
       end process;            
       mab<=   "00" when a<b else
               "01" when a>b else
               "10" when a=b else
               "11";
               
end Behavioral;