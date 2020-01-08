module IF_ID
(
	clk_i,
	IF_ID_write_i,
	IF_ID_flush_i,
	IF_ID_stall_i,
	PC_i,
	PC_o,
	inst_i,
	inst_o
);

input               clk_i;
input               IF_ID_write_i;
input               IF_ID_flush_i;
input               IF_ID_stall_i;
input      [31 : 0] PC_i;
output reg [31 : 0] PC_o;
input      [31 : 0] inst_i;
output reg [31 : 0] inst_o;

reg [31 : 0] PC_reg;
reg [31 : 0] inst_reg;

always @(posedge clk_i or negedge clk_i)
begin
	if (IF_ID_stall_i)
	begin
		// Do nothing.
	end
	else
	begin
		if (clk_i && IF_ID_write_i)
		begin
			PC_reg <= PC_i;
			inst_reg <= (IF_ID_flush_i)? 32'b0 : inst_i;
		end
		if (!clk_i)
		begin
			PC_o <= PC_reg;
			inst_o <= inst_reg;	
		end
	end
end
   
endmodule
