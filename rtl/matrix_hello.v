/*
 * MATRIX
 * Copyright (c) 2022 Lone Dynamics Corporation. All rights reserved.
 *
 * Hello world example.
 *
 */
 
module matrix_hello #()
(
	input CLK_100,

	output PMOD_A1,
	output PMOD_A2,
	output PMOD_A3,
	output PMOD_A4,
	output PMOD_A7,
	output PMOD_A8,
	output PMOD_A9,
	output PMOD_A10,
);

	wire clk = CLK_100;

	reg [15:0] font [0:26];
	initial begin
		$readmemb("font4x4/font.mem", font);
	end

	localparam strlen = 12;

	reg [5:0] str [strlen-1:0];
	initial begin
		$readmemh("data/str.mem", str);
	end

   reg [31:0] ctr;
	reg [15:0] bitmap = 0;
	reg [2:0] state = 0;
	reg [7:0] ptr = 0;
	reg [5:0] chr;

   always @(posedge clk) begin
		ctr <= ctr + 1;

		if (state == 0) begin
			chr <= str[ptr];
			bitmap <= font[chr];		
			ptr <= ptr + 1;
			if (ptr == strlen - 1) ptr <= 0;
			ctr <= 0;
			state <= 1;
		end

		if (state == 1 && ctr == 32'h1000000) begin
			bitmap <= 0;
			ctr <= 0;
			state <= 2;
		end

		if (state == 2 && ctr == 32'h800000) begin
			ctr <= 0;
			state <= 0;
		end

   end

	matrix #() matrix_i (
		.clk(clk),
		.bitmap(bitmap),
		.row({PMOD_A4, PMOD_A3, PMOD_A2, PMOD_A1}),
		.col({PMOD_A10, PMOD_A9, PMOD_A8, PMOD_A7})
	);

endmodule
