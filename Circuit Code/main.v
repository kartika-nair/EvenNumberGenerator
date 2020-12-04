module jkff(input  J, K , clk ,rst, output reg Q, output reg Qbar);
  always @(negedge clk)
  begin
    if(rst)
      Q <= 1'b0; 
    else begin
      case({J,K})
        2'b00 : Q <= Q; 
        2'b01 : Q <= 1'b0; 
        2'b10 : Q <= 1'b1; 
        2'b11 : Q <= ~Q  ;
      endcase
    end

    if(rst)
      Qbar <= 1'b1; 
    else begin
      case({J,K})
        2'b00 : Qbar <= Qbar; 
        2'b01 : Qbar <= 1'b1; 
        2'b10 : Qbar <= 1'b0; 
        2'b11 : Qbar <= ~Qbar  ;
      endcase
    end
  end
endmodule

module gen(input clk, rst, output [3:0] Q, Qbar);
  
  wire d[1:0];
  wire c2, q;

  assign c2 = 1;
  invert i1 (Q[3], d[0]);
  invert i2 (c2, Q[0]);
  and2 a1 (Q[1], Q[2], d[1]);
  
  jkff first (1'b1, 1'b1, clk, rst, q, Qbar[0]);
  jkff second (d[0], d[0], q, rst, Q[1], Qbar[1]);
  jkff third (1'b1, 1'b1, Q[1], rst, Q[2], Qbar[2]);
  jkff fourth (d[1], Q[3], q, rst, Q[3], Qbar[3]);

endmodule
