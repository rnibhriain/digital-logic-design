module	Circuit_1 (A, B, C, F1, F2);
output		F1, F2;
input		A, B, C;
wire		T1, T2, T3, W1, W2, W3, W4;
and		G1(T2, A, B, C);
or		G2(T1, A, B, C);
and		G3(W1, A, B);
and		G4(W2, A, C);
and		G5(W3, B, C);
or		G6(F2, W1, W2, W3);
not		G7(W4, F2);
and		G8(T3, T1, W4);
or		G9(F1, T2, T3);
endmodule