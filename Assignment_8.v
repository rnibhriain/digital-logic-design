module FiniteStateMachine (output out_z, input in_x, in_y, clk, reset_b);
	reg[1:0] state, next_state;

	assign out_z = ((state == 2'b11) || (state == 2'b10));
	
	always @ (posedge clk, negedge reset_b)
		if (reset_b == 1'b0) state <= 2'b00;
		else state <= next_state;
	always @ (state, in_x, in_y)
	case (state)
		2'b00:	if ({in_x, in_y} == 2'b00) next_state = 2'b00;
			else if ({in_x, in_y} == 2'b01) next_state = 2'b00;
			else if ({in_x, in_y} == 2'b10) next_state = 2'b11;
			else next_state = 2'b01;
		2'b01:	if ({in_x, in_y} == 2'b00) next_state = 2'b11;
			else if ({in_x, in_y} == 2'b01) next_state = 2'b00;
			else if ({in_x, in_y} == 2'b10) next_state = 2'b01;
			else next_state = 2'b00;
		2'b10:	if ({in_x, in_y} == 2'b00) next_state = 2'b11;
			else if ({in_x, in_y} == 2'b01) next_state = 2'b10;
			else if ({in_x, in_y} == 2'b10) next_state = 2'b11;
			else next_state = 2'b10;
		2'b11:	if ({in_x, in_y} == 2'b00) next_state = 2'b00;
			else if ({in_x, in_y} == 2'b01) next_state = 2'b10;
			else if ({in_x, in_y} == 2'b10) next_state = 2'b11;
			else next_state = 2'b00;
	endcase
endmodule