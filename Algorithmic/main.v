module evencounter(input wire clock, reset, output wire [3:0] count_num);
	reg [3:0] num = 4'b0000;
	always @(posedge (clock) or posedge (reset))
	begin 
		if(reset)
			num = 4'b0000;
		else 
			num = num + 4'b0010;
	end
	assign count_num = num;
endmodule