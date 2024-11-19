library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is port(
A: in std_logic_vector( 3 downto 0 );
B: in std_logic_vector( 3 downto 0 );
CIN: in std_logic_vector( 0 downto 0 );
OP_CODE: in std_logic_vector(2 downto 0);

COUT: out std_logic;

ALU_OUT: OUT std_logic_vector( 3 downto 0 )

);
END alu;

architecture bh of alu is
begin
  process(A, B, CIN,OP_CODE)
  begin
    case OP_CODE is
      when "000" =>
        ALU_OUT <= not A;
        COUT <= '0';
      when "001" =>
        ALU_OUT <= A and B;
        COUT <= '0';
      when "010" =>
        ALU_OUT <= A or B;
        COUT <= '0';
      when "011" =>
        ALU_OUT <= std_logic_vector(unsigned(A) + unsigned(B) + unsigned(CIN));
        if (unsigned(A) + unsigned(B) + unsigned(CIN) > 15) then
          COUT <= '1';
        else
          COUT <= '0';
        end if;
      when "100" =>
        ALU_OUT <= A;
        COUT <= '0';
      when "101" =>
        ALU_OUT <= B;
        COUT <= '0';
      when "110" =>
        ALU_OUT <= std_logic_vector(unsigned(A) sll 1); -- Shift left
        COUT <= '0';
      when "111" =>
        ALU_OUT <= std_logic_vector(unsigned(A) srl 1); -- Shift right
        COUT <= '0';
      when others =>
        COUT <= '0';
        ALU_OUT <= A;
    end case;
  end process;
end bh;
