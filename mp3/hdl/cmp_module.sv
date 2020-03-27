`define BAD_MUX_SEL $fatal("%0t %s %0d: Illegal mux select", $time, `__FILE__, `__LINE__)

import rv32i_types::*;
import control_itf::*;

import rv32i_types::*;
import pcmux::*;
import marmux::*;
import cmpmux::*;
import alumux::*;
import regfilemux::*;
import rs1mux::*;
import rs2mux::*;
import dcachemux::*;

// Compare module

module cmp_module(
      input rv32i_types::branch_funct3_t op,
      input rv32i_types::rv32i_word a,
      input rv32i_types::rv32i_word b,
      output logic result
);

always_comb begin
      unique case (op)
            rv32i_types::beq: result = (a == b);
            rv32i_types::bne: result = (a != b);
            rv32i_types::blt: result = ($signed(a) < $signed(b));
            rv32i_types::bge: result = ($signed(a) >= $signed(b));
            rv32i_types::bltu: result = (a < b);
            rv32i_types::bgeu: result = (a >= b);
            default: `BAD_MUX_SEL;
      endcase
end

endmodule
