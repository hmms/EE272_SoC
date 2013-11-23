module lfsr    (
out             ,  // Output of the counter
enable          ,  // Enable  for counter
clk             ,  // clock input
reset              // reset input
);

//----------Output Ports--------------
output [15:0] out;
//------------Input Ports--------------
input [15:0] data;
input enable, clk, reset;
//------------Internal Variables--------
reg [15:0] out;
wire        linear_feedback;

//-------------Code Starts Here-------
assign linear_feedback =(((out[15] ^ out[13]) ^ out[12]) ^ out[10]);

always @(posedge clk)
if (reset) begin // active high reset
  out <= 16'b0 ;
end else if (enable) begin
  out <= {out[14],out[13],
		  out[12],out[11],
		  out[10],out[9],
		  out[8],out[7],
          out[6],out[5],
		  out[4],out[3],
          out[2],out[1],
          out[0], linear_feedback};
end 

endmodule // End Of Module counter