module ALU_Control
(
	inst_i,
	ALUOp_i,
	ALUCtrl_o
);

input  [31 : 0] inst_i;
input  [1 : 0]  ALUOp_i;
output [3 : 0]  ALUCtrl_o;

reg [3 : 0] ALUCtrl_reg;

assign ALUCtrl_o = ALUCtrl_reg;

always @(inst_i or ALUOp_i)
begin
	if (ALUOp_i == 2'b10)
	begin
		if (inst_i[14 : 12] == 3'b000)
		begin
			if (inst_i[31 : 25] == 7'b0000000)
			begin
				ALUCtrl_reg = 4'b0010;
			end
			else if (inst_i[31 : 25] == 7'b0100000)
			begin
				ALUCtrl_reg = 4'b0110;
			end
			else if (inst_i[31 : 25] == 7'b0000001)
			begin
				ALUCtrl_reg = 4'b0111;
			end
		end
		else if (inst_i[14 : 12] == 3'b111)
		begin
			ALUCtrl_reg = 4'b0000;
		end
		else if (inst_i[14 : 12] == 3'b110)
		begin
			ALUCtrl_reg = 4'b0001;
		end
	end
	else if (ALUOp_i == 2'b11 || ALUOp_i == 2'b00)
	begin
		ALUCtrl_reg = 4'b0010;
	end
	else if (ALUOp_i == 2'b01)
	begin
		ALUCtrl_reg = 4'b0110;
	end
end

endmodule
