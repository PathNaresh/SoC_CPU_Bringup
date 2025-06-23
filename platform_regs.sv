///////////////////////////////////////
// 7. platform_regs.sv
///////////////////////////////////////

module platform_regs(input logic clk, input logic rst_n, output logic [31:0] status);
    logic [31:0] status_reg;
    assign status = status_reg;
endmodule
