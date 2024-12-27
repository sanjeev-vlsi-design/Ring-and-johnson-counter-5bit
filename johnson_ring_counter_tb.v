module johnson_ring_counter_tb; 
  reg clk;  
  reg rst;  
  reg js_rg;
  wire [4:0] count;  
    
  johnson_ring_counter_rtl Dut (
    .clk(clk),  
    .rst(rst),
    .js_rg(js_rg),  
    .count(count)
  );  

  always #10 clk = ~clk;  
    
  initial begin  
    clk = 0;
    rst = 1;  
    js_rg = 1;

    repeat (2) @(posedge clk);
    #10 rst = 0;

    js_rg = 1;
    repeat (10) @(posedge clk);

    js_rg = 0;
    repeat (10) @(posedge clk);

    js_rg = 1;
    repeat (10) @(posedge clk);
    $finish;  
  end  
endmodule
