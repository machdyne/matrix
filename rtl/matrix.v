/*
 * MATRIX
 * Copyright (c) 2022 Lone Dynamics Corporation. All rights reserved.
 *
 * Simple 4x4 LED matrix driver.
 *
 */

module matrix #(
)(
	input clk,
	input [15:0] bitmap,
	output reg [3:0] row,	// source
	output reg [3:0] col		// sink
);

	reg [3:0] p;
	reg [7:0] delay;

	always @(posedge clk) begin

		row <= 4'b0000;
		col <= 4'b0000;

		if (p == 0 && bitmap[0]) begin row <= 4'b0001; col <= 4'b1110; end
		else if (p == 1 && bitmap[1]) begin row <= 4'b0001; col <= 4'b1101; end
		else if (p == 2 && bitmap[2]) begin row <= 4'b0001; col <= 4'b1011; end
		else if (p == 3 && bitmap[3]) begin row <= 4'b0001; col <= 4'b0111; end
		else if (p == 4 && bitmap[4]) begin row <= 4'b0010; col <= 4'b1110; end
		else if (p == 5 && bitmap[5]) begin row <= 4'b0010; col <= 4'b1101; end
		else if (p == 6 && bitmap[6]) begin row <= 4'b0010; col <= 4'b1011; end
		else if (p == 7 && bitmap[7]) begin row <= 4'b0010; col <= 4'b0111; end
		else if (p == 8 && bitmap[8]) begin row <= 4'b0100; col <= 4'b1110; end
		else if (p == 9 && bitmap[9]) begin row <= 4'b0100; col <= 4'b1101; end
		else if (p == 10 && bitmap[10]) begin row <= 4'b0100; col <= 4'b1011; end
		else if (p == 11 && bitmap[11]) begin row <= 4'b0100; col <= 4'b0111; end
		else if (p == 12 && bitmap[12]) begin row <= 4'b1000; col <= 4'b1110; end
		else if (p == 13 && bitmap[13]) begin row <= 4'b1000; col <= 4'b1101; end
		else if (p == 14 && bitmap[14]) begin row <= 4'b1000; col <= 4'b1011; end
		else if (p == 15 && bitmap[15]) begin row <= 4'b1000; col <= 4'b0111; end

		if (!delay) begin
			p <= p + 1;
		end

		delay <= delay + 1;

	end

endmodule
