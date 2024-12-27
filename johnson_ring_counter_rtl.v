module johnson_ring_counter_rtl(clk, rst, js_rg, count);
  input clk;
  input rst;
  input js_rg;
  output reg [4:0] count;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      count <= 5'b00001; 
    end else if (js_rg) begin
      count <= {~count[0], count[4:1]};
    end else begin
      count <= {count[0], count[4:1]};
    end
  end
endmodule
