module Serial_Twos_Comp (output y, input [7: 0] data, input load, shift_control, Clock, reset_b);
	reg [7: 0] SReg;
	reg Q;
	wire SO = SReg [0];
	assign y = SO ^ Q;
	always @ (posedge Clock, negedge reset_b)
		if (reset_b == 0) begin
			SReg <= 0;
			Q <= 0;
		end
		else begin
			if (load) SReg = data;
			else if (shift_control) begin
				Q <= Q | SO;
				SReg <= {y, SReg[7: 1]};
			end
		end
endmodule
module Serial_Twos_Comp (output y, input [7: 0] data, input load, shift_control,
Clock, reset_b);
	reg [7: 0] ShiftReg;
	reg C;
	wire S0 = ShiftReg[0];
	assign y = S0 ^ C;
	always @ (posedge Clock, negedge reset_b) begin
		if (reset_b == 0) begin
			ShiftReg <= 0;
			C <= 0;
		end 
		else begin
			if (load) begin
				ShiftReg = data;
				C <= C | S0;
			end
			else if (shift_control) begin
				ShiftReg <= {y, ShiftReg[7: 1]};
				C <= C | S0;
			end
			else begin
				ShiftReg <= 0;
				C <= 0;
			end		
		end
	end
endmodule