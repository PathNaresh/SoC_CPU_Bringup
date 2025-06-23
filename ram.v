///////////////////////////////////////
// 6. ram.v
///////////////////////////////////////

module ram #(parameter MEM_DEPTH = 16384, parameter MEM_INIT_FILE = "")(
    input  logic         clk,
    input  logic         rst_n,
    input  logic [31:0]  addr,
    input  logic [31:0]  wdata,
    input  logic         write_en,
    input  logic         read_en,
    output logic [31:0]  rdata
);

    logic [31:0] mem [0:MEM_DEPTH-1];

    initial begin
        if (MEM_INIT_FILE != "")
            $readmemh(MEM_INIT_FILE, mem);
    end

    always_ff @(posedge clk) begin
        if (!rst_n)
            rdata <= 32'b0;
        else if (read_en)
            rdata <= mem[addr[15:2]];
        if (write_en)
            mem[addr[15:2]] <= wdata;
    end
endmodule
