module ALU
(
	data1_i,
	data2_i,
	ALUCtrl_i,
	data_o,
	zero_o
);

input  [31 : 0] data1_i;
input  [31 : 0] data2_i;
input  [3 : 0]  ALUCtrl_i;
output [31 : 0] data_o;
output          zero_o;

reg [31 : 0] data_reg;

assign data_o = data_reg;
assign zero_o = (data_reg == 32'b0)? 1'b1 : 1'b0;

always @(data1_i or data2_i or ALUCtrl_i)
begin
	case (ALUCtrl_i)
		4'b0010: data_reg = data1_i + data2_i;
		4'b0110: data_reg = data1_i - data2_i;
		4'b0111: data_reg = data1_i * data2_i;
		4'b0000: data_reg = data1_i & data2_i;
		4'b0001: data_reg = data1_i | data2_i;
	endcase
end

endmodule
