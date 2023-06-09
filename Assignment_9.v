module StateDiagram (output y_out, input x_in, clk, reset_b);
	reg[2:0] state, next_state;
	parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;

	assign y_out = state[0];
	
	always @ (posedge clk, negedge reset_b)
		if (reset_b == 1'b0) state = 3'b000;
		else state <= next_state;
	
	
	always @ (x_in, state)
	case (state)
		S0: if(x_in) next_state <= S1;
			else next_state <= S0;
		S1: next_state <= S3;
		S2: next_state <= S4;
		S3: next_state <= S5;
		S4: next_state <= S0;
		S5: next_state <= S2;
	endcase
endmodule