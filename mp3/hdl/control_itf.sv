import rv32i_types::*;
import pcmux::*;
import marmux::*;
import cmpmux::*;
import alumux::*;
import regfilemux::*;

package control_itf;

// struct of control signals, collected
// for easy connection between datapath
// and control modules
// TODO: This struct will be used when implementing
// forwarding
typedef struct packed
{
      logic [1:0] rs1mux_sel;
      logic [1:0] rs2mux_sel;

      logic pipe_load_ifid;
      logic pipe_load_idex;
      logic pipe_load_exmem;
      logic pipe_load_memwb;

      logic pipe_rst_ifid;
      logic pipe_rst_idex;
      logic pipe_rst_exmem;
      logic pipe_rst_memwb;
} control;

//contains control data information
//length = 20
typedef struct packed
{
      logic alumux1_sel;
      logic [2:0] alumux2_sel;
      logic cmpmux_sel;
      logic [2:0] aluop;
      logic [2:0] cmpop;
      logic dcache_read;
      logic dcache_write;
      logic mask1;
      logic mask2;
      logic [3:0] regfilemux_sel;
      logic load_regfile;
} ctrl_word;

//contains instruction decode data
//length = 192
typedef struct packed
{
      logic [2:0] funct3;
      logic [6:0] funct7;
      rv32i_types::rv32i_opcode opcode;
      logic [31:0] i_imm;
      logic [31:0] s_imm;
      logic [31:0] b_imm;
      logic [31:0] u_imm;
      logic [31:0] j_imm;
      logic [4:0] rs1;
      logic [4:0] rs2;
      logic [4:0] rd;
} instruction_decode;

endpackage: control_itf
