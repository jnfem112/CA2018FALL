module Forward
(
	ID_EX_RSaddr_i,
	ID_EX_RTaddr_i,
	EX_MEM_RDaddr_i,
	MEM_WB_RDaddr_i,
	EX_MEM_RegWrite_i,
	MEM_WB_RegWrite_i,
	select1_o,
	select2_o
);

input  [4 : 0] ID_EX_RSaddr_i;
input  [4 : 0] ID_EX_RTaddr_i;
input  [4 : 0] EX_MEM_RDaddr_i;
input  [4 : 0] MEM_WB_RDaddr_i;
input          EX_MEM_RegWrite_i;
input          MEM_WB_RegWrite_i;
output [1 : 0] select1_o;
output [1 : 0] select2_o;

reg [1 : 0] select1_reg;
reg [1 : 0] select2_reg;

assign select1_o = select1_reg;
assign select2_o = select2_reg;

always @(ID_EX_RSaddr_i or ID_EX_RTaddr_i or EX_MEM_RDaddr_i or MEM_WB_RDaddr_i or EX_MEM_RegWrite_i or MEM_WB_RegWrite_i)
begin
	if (EX_MEM_RegWrite_i && ID_EX_RSaddr_i == EX_MEM_RDaddr_i)
	begin
		select1_reg = 2'b10;
	end
	else if (MEM_WB_RegWrite_i && ID_EX_RSaddr_i == MEM_WB_RDaddr_i)
	begin
		select1_reg = 2'b01;
	end
	else
	begin
		select1_reg = 2'b00;
	end

	if (EX_MEM_RegWrite_i && ID_EX_RTaddr_i == EX_MEM_RDaddr_i)
	begin
		select2_reg = 2'b10;
	end
	else if (MEM_WB_RegWrite_i && ID_EX_RTaddr_i == MEM_WB_RDaddr_i)
	begin
		select2_reg = 2'b01;
	end
	else
	begin
		select2_reg = 2'b00;
	end
end

endmodule
