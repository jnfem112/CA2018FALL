module PC
(
	clk_i,
	rst_i,
	start_i,
	PC_write_i,
	PC_stall_i,
	PC_i,
	PC_o
);

// Interface.
input            clk_i;
input            rst_i;
input            start_i;
input            PC_write_i;
input            PC_stall_i;
input   [31 : 0] PC_i;
output  [31 : 0] PC_o;

// Signals.
reg [31 : 0] PC_o;

always @(posedge clk_i or negedge rst_i)
begin
	if (~rst_i)
	begin
		PC_o <= 32'b0;
	end
	else
	begin
		if (PC_stall_i)
		begin
			// Do nothing.
		end
		else if (start_i)
		begin
			if (PC_write_i)
			begin
				PC_o <= PC_i;
			end
		end
		else
		begin
			PC_o <= 32'b0;
		end
	end
end

endmodule
