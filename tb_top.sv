///////////////////////////////////////
// 8. tb_top.sv
///////////////////////////////////////

module tb_top;

  logic clk, rst_n;
  logic [31:0] status;

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst_n = 0;
    repeat (10) @(posedge clk);
    rst_n = 1;
  end

  platform_regs regs (.clk(clk), .rst_n(rst_n), .status(status));

  ram #(.MEM_INIT_FILE("cpu.hex")) u_cpu_ram (...);
  ram #(.MEM_INIT_FILE("scp.hex")) u_scp_ram (...);

  always @(posedge clk) begin
    if (status == 32'hA5A5A5A5) begin
      $display("CPU Bring-Up Test: PASS");
      $finish;
    end else if (status == 32'hDEADBEEF) begin
      $display("CPU Bring-Up Test: FAIL");
      $fatal;
    end
  end
endmodule
