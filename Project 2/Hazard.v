module Hazard
(
	IF_ID_RSaddr_i,
	IF_ID_RTaddr_i,
	ID_EX_RDaddr_i,
	ID_EX_MemRead_i,
	select_o,
	PC_write_o,
	IF_ID_write_o
);

input              ID_EX_MemRead_i;
input      [4 : 0] IF_ID_RSaddr_i;
input      [4 : 0] IF_ID_RTaddr_i;
input      [4 : 0] ID_EX_RDaddr_i;
output reg         select_o;
output reg         PC_write_o;
output reg         IF_ID_write_o;

always @(IF_ID_RSaddr_i or IF_ID_RTaddr_i or ID_EX_RDaddr_i or ID_EX_MemRead_i)
begin
	select_o = (ID_EX_MemRead_i && (IF_ID_RSaddr_i == ID_EX_RDaddr_i || IF_ID_RTaddr_i == ID_EX_RDaddr_i))? 1'b1 : 1'b0;
	PC_write_o = (ID_EX_MemRead_i && (IF_ID_RSaddr_i == ID_EX_RDaddr_i || IF_ID_RTaddr_i == ID_EX_RDaddr_i))? 1'b0 : 1'b1;
	IF_ID_write_o = (ID_EX_MemRead_i && (IF_ID_RSaddr_i == ID_EX_RDaddr_i || IF_ID_RTaddr_i == ID_EX_RDaddr_i))? 1'b0 : 1'b1;
end

endmodule
