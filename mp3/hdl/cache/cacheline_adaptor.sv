module cacheline_adaptor
(
    input clk,
    input reset_n,

    // Port to LLC (Lowest Level Cache)
    input logic [255:0] line_i,
    output logic [255:0] line_o,
    input logic [31:0] address_i,
    input read_i,
    input write_i,
    output logic resp_o,

    // Port to memory
    input logic [63:0] burst_i,
    output logic [63:0] burst_o,
    output logic [31:0] address_o,
    output logic read_o,
    output logic write_o,
    input resp_i
);

logic [3:0] state, next;
logic [255:0] read_buffer;

always_comb begin
    if (read_i == 1'b1 && write_i == 1'b1) begin
        read_o = 1'b1;
        write_o = 1'b0;
    end else begin
        read_o = read_i;
        write_o = write_i;
    end

    address_o = address_i;

    // default behavior
    read_buffer = line_o;
    next = 4'h0;
    resp_o = 1'b0;
	 burst_o = {64{1'b0}};

    case(state)
        4'h0: begin
            if (resp_i) begin
                next = 4'h1;
                read_buffer[63:0] = burst_i;
                burst_o = line_i[63:0];
            end else begin
                next = 4'h0;
            end
        end

        4'h1: begin
            next = 4'h2;
            read_buffer[127:64] = burst_i;
            burst_o = line_i[127:64];
        end

        4'h2: begin
            next = 4'h3;
            read_buffer[191:128] = burst_i;
            burst_o = line_i[191:128];
        end

        4'h3: begin
            next = 4'h4;
            read_buffer[255:192] = burst_i;
            burst_o = line_i[255:192];
        end

        4'h4: begin
            next = 4'h0;
            resp_o = 1'b1;
				read_o = 1'b0;
				write_o = 1'b0;
        end

        default: ;
    endcase
end

always_ff @(posedge clk) begin
    state <= reset_n? next : 4'h0;
    line_o <= read_buffer;
end

endmodule : cacheline_adaptor
