----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 07:02:34 PM
-- Design Name: 
-- Module Name: MUX_8way_4bit - Behavioral
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

entity MUX_8way_4bit is
    Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
           R1 : in STD_LOGIC_VECTOR (3 downto 0);
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC_VECTOR (2 downto 0);
           RegVal : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_8way_4bit;

architecture Behavioral of MUX_8way_4bit is

signal S0_0,S0_1,S0_2,S0_3,S1_0,S1_1:STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

    S0_0 <= (R0 and not (3 downto 0=>RegSel(0))) or (R1 and (3 downto 0=>RegSel(0)));
    S0_1 <= (R2 and not (3 downto 0=>RegSel(0))) or (R3 and (3 downto 0=>RegSel(0)));
    S0_2 <= (R4 and not (3 downto 0=>RegSel(0))) or (R5 and (3 downto 0=>RegSel(0)));
    S0_3 <= (R6 and not (3 downto 0=>RegSel(0))) or (R7 and (3 downto 0=>RegSel(0)));
    
    S1_0 <= (S0_0 and not (3 downto 0=>RegSel(1))) or (S0_1 and (3 downto 0=>RegSel(1)));
    S1_1 <= (S0_2 and not (3 downto 0=>RegSel(1))) or (S0_3 and (3 downto 0=>RegSel(1)));
    
    RegVal <= (S1_0 and not (3 downto 0=>RegSel(2))) or (S1_1 and (3 downto 0=>RegSel(2)));
    
end Behavioral;



