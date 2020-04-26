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

enum int {idle, cycle0, cycle1, cycle2, cycle3, finish} state, next;

logic [255:0] read_buffer, write_buffer, write_buffer_next;
logic [31:0] addr_buffer, addr_next;

assign address_o = addr_buffer;

always_comb begin
    // default behavior
	 read_o = 1'b0;
	 write_o = 1'b0;
    read_buffer = line_o;
	 write_buffer_next = write_buffer;
    next = idle;
    resp_o = 1'b0;
	 burst_o = {64{1'b0}};
	 addr_next = addr_buffer;

    case(state)
	     idle: begin
		      if (read_i || write_i) begin
				    next = cycle0;
					 addr_next = address_i;
					 write_buffer_next = line_i;
				end
		  end
		  
        cycle0: begin
            read_o = read_i;
				write_o = write_i;
            if (resp_i) begin
                next = cycle1;
                read_buffer[63:0] = burst_i;
                burst_o = write_buffer[63:0];
            end else begin
                next = cycle0;
            end
        end

        cycle1: begin
            next = cycle2;
				read_o = read_i;
				write_o = write_i;
            read_buffer[127:64] = burst_i;
            burst_o = write_buffer[127:64];
        end

        cycle2: begin
            next = cycle3;
				read_o = read_i;
				write_o = write_i;
            read_buffer[191:128] = burst_i;
            burst_o = write_buffer[191:128];
        end

        cycle3: begin
            next = finish;
				read_o = read_i;
				write_o = write_i;
            read_buffer[255:192] = burst_i;
            burst_o = write_buffer[255:192];
        end

        finish: begin
            next = idle;
            resp_o = 1'b1;
				read_o = 1'b0;
				write_o = 1'b0;
        end

        default: ;
    endcase
end

always_ff @(posedge clk) begin
    state <= reset_n? next : idle;
    line_o <= read_buffer;
	 addr_buffer <= addr_next;
	 write_buffer <= write_buffer_next;
end

endmodule : cacheline_adaptor
