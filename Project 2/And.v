module And
(
	data1_i,
	data2_i,
	data_o
);

input      data1_i;
input      data2_i;
output reg data_o;

always @(data1_i or data2_i)
begin
	data_o = data1_i & data2_i;
end

endmodule
