--this is the register file for part 2
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity REG is port (
DS: IN STD_LOGIC_VECTOR( 3 DOWNTO 0 );
QS: OUT STD_LOGIC_VECTOR( 3 DOWNTO 0 );
reset: IN STD_LOGIC;
clk: IN STD_LOGIC
);
end REG;

architecture bh of REG is
begin 
	process(clk,reset)
	begin
		if(reset = '0') then 
			QS <= "0000";
		elsif(rising_edge(clk)) then
			QS <= DS;
		end if;
	end process;
end bh;
