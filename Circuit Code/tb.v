module TB;
  reg CLK = 0, rst = 1;
  wire[3:0] Q;
  wire[3:0] Qbar;
  gen g1 (CLK, rst, Q, Qbar);

  initial begin 
    $dumpfile("tb_dump.vcd"); 
    $dumpvars(0, TB); 
  end
  
  initial repeat(40) #50 CLK=~CLK;
  initial #70 rst = 0;
endmodule