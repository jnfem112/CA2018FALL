module Data_Memory
(
	clk_i,
	addr_i,
	data_i,
	MemRead_i,
	MemWrite_i,
	data_o
);

input           clk_i;
input  [31 : 0]	addr_i;
input  [31 : 0]	data_i;
input           MemRead_i;
input           MemWrite_i;
output [31 : 0]	data_o;

reg [7 : 0] memory [0 : 31];

assign data_o = (MemRead_i == 1'b1)? {memory[addr_i + 3] , memory[addr_i + 2] , memory[addr_i + 1] , memory[addr_i]} : 32'b0;

always @(posedge clk_i)
begin
	if (MemWrite_i == 1'b1)
	begin
		memory[addr_i] = data_i[7 : 0];
                memory[addr_i + 1] = data_i[15 : 8];
                memory[addr_i + 2] = data_i[23 : 16];
                memory[addr_i + 3] = data_i[31 : 24];
	end
end

endmodule
