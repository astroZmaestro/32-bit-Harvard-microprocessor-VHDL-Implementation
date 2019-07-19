----------------------------------------------------------------------------------
-- Company: mpor
-- Engineer: Ashour
-- 
-- Create Date:    21:10:10 02/14/2019 
-- Design Name: 
-- Module Name:    data_mem - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
entity data_mem is
generic( data_width: integer:=32;
          add_width: integer :=7);
    Port ( address : in  STD_LOGIC_VECTOR (add_width-1 downto 0);
           data_in : in  STD_LOGIC_VECTOR (data_width-1 downto 0);
			  data_out : out STD_LOGIC_VECTOR(data_width-1 downto 0);
           RW : in  STD_LOGIC; 
           clck : in  STD_LOGIC);
end data_mem;

architecture Behavioral of data_mem is
type ram is array (integer range<>) of std_logic_vector(data_width-1 downto 0);
signal mem : ram (0 to 2**add_width-1 ):=(8 => x"00000000", 9 => x"00000000" ,13 => x"41535452", 14=> x"4F000000", 15=> x"00000005",16=> x"58494C4C",17=> x"494E5800",18=> x"00000007",19=> x"4D455353",20=> x"49000000",
21=> x"00000005",22=> x"4156454E",23=> x"47455253",24=> x"00000008",25=> x"45535341",26=> x"4D000000",27=> x"00000005", 28=> x"4153484F",29=> x"55520000",30=> x"00000006",
31=> x"41544546",32=> x"00000000",33=> x"00000004",34=> x"48555353",35=> x"45494E00",36=> x"00000007",
118=> x"00000057",119=> x"00000026",120=> x"00000045",121=> x"0000004B",122=> x"00000051",123=> x"00000057",124=> x"0000002B",
125=> x"00000046",126=> x"0000004C",127=> x"00000052",128=> x"00000058",129=> x"00000023",200=> x"00004FD2",201=> x"00002BA6",
202=> x"00002DA5",203=> x"00002DA7",204=> x"00007CE6",205=> x"00002DE5",206=> x"00002DE7",others=>(others=>'U'));
begin
--- write data  RW=1
Write_data:process(clck)
begin
if (rising_edge(clck)) then
   if ( RW='1') then
	  mem(conv_integer(unsigned(address)))<= data_in;
	 end if;
end if;
end process;
--Read Data  RW=0
data_out<= mem(conv_integer(unsigned(address))) when (RW='0' ) else
       (others=>'0');
end Behavioral;
