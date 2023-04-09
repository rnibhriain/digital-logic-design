module BCD_Adder(
	output [3:0]	Sum,
	output		Carry_out,
	input[3:0]	Addend, Augend,
	input		Carry_in
);
	reg [4:0] s2;	
	assign Sum = s2[3:0];
	assign Carry_out = s2[4];
	always	@(*)
	begin
	s2 = Addend + Augend + Carry_in;
	if (s2 > 9 ) s2 = s2 + 6;
	end
endmodule