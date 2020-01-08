module ID_EX
(
	clk_i,
	inst_i,
	inst_o,
	RSaddr_i,
	RSaddr_o,
	RTaddr_i,
	RTaddr_o,
	RDaddr_i,
	RDaddr_o,
	RSdata_i,
	RSdata_o,
	RTdata_i,
	RTdata_o,
	imm_i,
	imm_o,
	ALUOp_i,
	ALUOp_o,
	ALUSrc_i,
	ALUSrc_o,
	MemRead_i,
	MemRead_o,
	MemWrite_i,
	MemWrite_o,
	RegWrite_i,
	RegWrite_o,
	MemtoReg_i,
	MemtoReg_o
);

input               clk_i;
input      [31 : 0] inst_i;
output reg [31 : 0] inst_o;
input      [4 : 0]  RSaddr_i;
output reg [4 : 0]  RSaddr_o;
input      [4 : 0]  RTaddr_i;
output reg [4 : 0]  RTaddr_o;
input      [4 : 0]  RDaddr_i;
output reg [4 : 0]  RDaddr_o;
input      [31 : 0] RSdata_i;
output reg [31 : 0] RSdata_o;
input      [31 : 0] RTdata_i;
output reg [31 : 0] RTdata_o;
input      [31 : 0] imm_i;
output reg [31 : 0] imm_o;
input      [1 : 0]  ALUOp_i;
output reg [1 : 0]  ALUOp_o;
input               ALUSrc_i;
output reg          ALUSrc_o;
input               MemRead_i;
output reg          MemRead_o;
input               MemWrite_i;
output reg          MemWrite_o;
input               RegWrite_i;
output reg          RegWrite_o;
input               MemtoReg_i;
output reg          MemtoReg_o;

reg [31 : 0] inst_reg;
reg [4 : 0]  RSaddr_reg;
reg [4 : 0]  RTaddr_reg;
reg [4 : 0]  RDaddr_reg;
reg [31 : 0] RSdata_reg;
reg [31 : 0] RTdata_reg;
reg [31 : 0] imm_reg;
reg [1 : 0]  ALUOp_reg;
reg          ALUSrc_reg;
reg          MemRead_reg;
reg          MemWrite_reg;
reg          RegWrite_reg;
reg          MemtoReg_reg;
 
always @(posedge clk_i or negedge clk_i)
begin
	if (clk_i)
	begin
	        inst_reg <= inst_i;
	        RSaddr_reg <= RSaddr_i;
	        RTaddr_reg <= RTaddr_i;
	        RDaddr_reg <= RDaddr_i;
	        RSdata_reg <= RSdata_i;
	        RTdata_reg <= RTdata_i;
	        imm_reg <= imm_i;
	        ALUOp_reg <= ALUOp_i;
	        ALUSrc_reg <= ALUSrc_i;
	        MemRead_reg <= MemRead_i;
	        MemWrite_reg <= MemWrite_i;
	        RegWrite_reg <= RegWrite_i;
	        MemtoReg_reg <= MemtoReg_i;
	end
	if (!clk_i)
	begin
		inst_o <= inst_reg;
		RSaddr_o <= RSaddr_reg;
		RTaddr_o <= RTaddr_reg;
		RDaddr_o <= RDaddr_reg;
		RSdata_o <= RSdata_reg;
		RTdata_o <= RTdata_reg;
		imm_o <= imm_reg;
		ALUOp_o <= ALUOp_reg;
		ALUSrc_o <= ALUSrc_reg;
		MemRead_o <= MemRead_reg;
		MemWrite_o <= MemWrite_reg;
		RegWrite_o <= RegWrite_reg;
		MemtoReg_o <= MemtoReg_reg;
	end
end
   
endmodule
