// forwarding_itf.sv
//
// encapsulates interface to fowarding functions,
// just allows for less lines of code in
// datapath.sv which was already getting kind
// of crowded.

import rv32i_types::*;
import control_itf::*;
import rs1mux::*;
import rs2mux::*;

package forwarding_itf;

typedef struct packed
{
      control_itf::instruction_decode idex_inst_decode;
      control_itf::instruction_decode exmem_inst_decode;
      control_itf::instruction_decode memwb_inst_decode;
} instruction_input;

endpackage
