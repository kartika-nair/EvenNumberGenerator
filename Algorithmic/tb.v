module tb();
	reg clock, reset;
	wire [3:0] num;
	evencounter e1 (clock, reset, num);

	initial begin 
		$dumpfile("tb_dump.vcd"); 
		$dumpvars(0, tb); 
	end

	initial begin 
		clock = 1'b0; repeat(90) #10 clock =~ clock;
	end

	initial begin
		reset=1'b0;
		#310
		reset=1'b1;
		#20
		reset=1'b0;
	end
endmodule