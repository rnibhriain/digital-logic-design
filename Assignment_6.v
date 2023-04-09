module Compare (A, B, Y);

	output [5:0] Y;
	input [3:0] A;
	input [3:0] B;
  	
	assign {Y[5]} = (A==B) ? 1:0;
	assign {Y[4]} = (A!=B) ? 1:0;
	assign {Y[3]} = (A>B) ? 1:0;
	assign {Y[2]} = (A<B) ? 1:0;
	assign {Y[1]} = (A>=B) ? 1:0;
	assign {Y[0]} = (A<=B) ? 1:0;
	
	
endmodule