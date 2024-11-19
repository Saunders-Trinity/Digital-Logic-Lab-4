library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BIG_MUX is port(
SEL: in std_logic_vector( 1 downto 0);
A: in std_logic_vector( 3 downto 0);
B: in std_logic_vector( 3 downto 0);
C: in std_logic_vector( 3 downto 0);
D: in std_logic_vector( 3 downto 0);
MUX_OUT: out std_logic_vector(3 downto 0)
);
END BIG_MUX;

architecture  bh OF BIG_MUX is
begin 
	process(SEL)
	begin
	case SEL is 
		when "00" =>
			MUX_OUT <= A;
		when "01" =>
			MUX_OUT <= B;
		when "10"=>
			MUX_OUT <= C;
		when "11" =>
			MUX_OUT <= D;
	END CASE;
	end process;
	
end bh;
