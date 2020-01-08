module CPU
(
	clk_i,
	rst_i,
	start_i
);

// Ports.
input clk_i;
input rst_i;
input start_i;

wire [31 : 0] inst;
wire [31 : 0] inst_addr;
wire          zero;

PC PC
(
	.clk_i   (clk_i),
	.rst_i   (rst_i),
	.start_i (start_i),
	.PC_i    (Add_PC.data_o),
	.PC_o    (inst_addr)
);

Adder Add_PC
(
	.data1_i (inst_addr),
	.data2_i (32'd4),
	.data_o  (PC.PC_i)
);

Instruction_Memory Instruction_Memory
(
	.addr_i (inst_addr), 
	.inst_o (inst)
);

Registers Registers
(
	.clk_i      (clk_i),
	.RSaddr_i   (inst[19 : 15]),
	.RTaddr_i   (inst[24 : 20]),
	.RDaddr_i   (inst[11 : 7]), 
	.RDdata_i   (ALU.data_o),
	.RegWrite_i (Control.RegWrite_o), 
	.RSdata_o   (ALU.data1_i), 
	.RTdata_o   (MUX_ALUSrc.data1_i) 
);

Sign_Extend Sign_Extend
(
	.inst_i (inst),
	.imm_o  (MUX_ALUSrc.data2_i)
);

MUX32 MUX_ALUSrc
(
	.data1_i  (Registers.RTdata_o),
	.data2_i  (Sign_Extend.imm_o),
	.select_i (Control.ALUSrc_o),
	.data_o   (ALU.data2_i)
);

ALU ALU
(
	.data1_i   (Registers.RSdata_o),
	.data2_i   (MUX_ALUSrc.data_o),
	.ALUCtrl_i (ALU_Control.ALUCtrl_o),
	.data_o    (Registers.RDdata_i),
	.zero_o    (zero)
);

Control Control
(
	.Op_i       (inst[6 : 0]),
	.ALUOp_o    (ALU_Control.ALUOp_i),
	.ALUSrc_o   (MUX_ALUSrc.select_i),
	.RegWrite_o (Registers.RegWrite_i)
);

ALU_Control ALU_Control
(
	.inst_i    (inst),
	.ALUOp_i   (Control.ALUOp_o),
	.ALUCtrl_o (ALU.ALUCtrl_i)
);

endmodule
