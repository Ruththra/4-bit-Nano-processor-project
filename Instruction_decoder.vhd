----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2025 05:44:11
-- Design Name: 
-- Module Name: Instruction_decoder - Behavioral
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

entity Instruction_decoder is
    Port ( instruction : in STD_LOGIC_VECTOR (11 downto 0);
           jump_check : in STD_LOGIC;
           reg_en : out STD_LOGIC_VECTOR (2 downto 0);
           load_sel : out STD_LOGIC;
           value : out STD_LOGIC_VECTOR (3 downto 0);
           reg_a : out STD_LOGIC_VECTOR (2 downto 0);
           reg_b : out STD_LOGIC_VECTOR (2 downto 0);
           addORsub : out STD_LOGIC;
           jump_flag : out STD_LOGIC;
           jump_address : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_decoder;

architecture Behavioral of Instruction_decoder is

    signal instr : std_logic_vector(1 downto 0);
    signal reg_1, reg_2 : std_logic_vector(2 downto 0);
    signal int_value : std_logic_vector(3 downto 0);

begin

    process
    begin
        instr <= instruction(11 downto 10);
        reg_1 <= instruction(9 downto 7);
        reg_2 <= instruction(6 downto 4);
        int_value <= instruction(3 downto 0);
        
        if instr = "10" then --for MOVI instruction
            reg_en <= reg_1;
            value <= int_value;
            load_sel <= '0';
        elsif instr = "01" then --for NEG instruction
            reg_en <= reg_1;
            load_sel <= '1';
            addORsub <= '1';
            reg_a <= "111"; --Always pointing to reg 7 for get value zero for get negative value
            reg_b <= reg_1;
        elsif instr = "00" then --for ADD/SUB instruction
            addORsub <= '0';
            reg_a <= reg_1;
            reg_b <= reg_2;
            load_sel <= '1';
        elsif instr = "11" then --for JUMP instruction
            if jump_check = '1' then
                jump_flag <= '1';
                jump_address <= instruction(2 downto 0);
            else
                jump_flag <= '0';
            end if;
        end if;
    
    end process;


end Behavioral;
