
module control
import rv32i_types::*; /* Import types defined in rv32i_types.sv */
(
    input clk,
    input rst,
    input rv32i_opcode opcode,
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    input logic br_en,
    input logic [4:0] rs1,
    input logic [4:0] rs2,
    output pcmux::pcmux_sel_t pcmux_sel,
    output alumux::alumux1_sel_t alumux1_sel,
    output alumux::alumux2_sel_t alumux2_sel,
    output regfilemux::regfilemux_sel_t regfilemux_sel,
    output marmux::marmux_sel_t marmux_sel,
    output cmpmux::cmpmux_sel_t cmpmux_sel,
    output alu_ops aluop,
    output logic load_pc,
    output logic load_ir,
    output logic load_regfile,
    output logic load_mar,
    output logic load_mdr,
    output logic load_data_out,

	input mem_resp,
    output branch_funct3_t cmpop,
    output logic mem_read,
    output logic mem_write,
    output logic [3:0] mem_byte_enable,
    input logic [1:0] shift_bits
);

/***************** USED BY RVFIMON --- ONLY MODIFY WHEN TOLD *****************/
logic trap;
logic [4:0] rs1_addr, rs2_addr;
logic [3:0] rmask, wmask;

branch_funct3_t branch_funct3;
store_funct3_t store_funct3;
load_funct3_t load_funct3;
arith_funct3_t arith_funct3;

assign arith_funct3 = arith_funct3_t'(funct3);
assign branch_funct3 = branch_funct3_t'(funct3);
assign load_funct3 = load_funct3_t'(funct3);
assign store_funct3 = store_funct3_t'(funct3);
assign rs1_addr = rs1;
assign rs2_addr = rs2;

always_comb
begin : trap_check
    trap = '0;
    rmask = '0;
    wmask = '0;

    case (opcode)
        op_lui, op_auipc, op_imm, op_reg, op_jal, op_jalr:;

        op_br: begin
            case (branch_funct3)
                beq, bne, blt, bge, bltu, bgeu:;
                default: trap = '1;
            endcase
        end

        op_load: begin
            case (load_funct3)
                lw: rmask = 4'b1111;
                lh, lhu: rmask = 4'b0011 << shift_bits/* Modify for MP1 Final */ ;
                lb, lbu: rmask = 4'b0001 << shift_bits/* Modify for MP1 Final */ ;
                default: trap = '1;
            endcase
        end

        op_store: begin
            case (store_funct3)
                sw: wmask = 4'b1111;
                sh: wmask = 4'b0011 << shift_bits/* Modify for MP1 Final */ ;
                sb: wmask = 4'b0001 << shift_bits/* Modify for MP1 Final */ ;
                default: trap = '1;
            endcase
        end

        default: trap = '1;
    endcase
end
/*****************************************************************************/

enum int unsigned {
    /* List of states */
    fetch1        = 0,
    fetch2        = 1,
    fetch3        = 2,
    decode        = 3,
    imm           = 4,
    lui           = 5,
    calc_addr     = 6,
    ld1           = 7,
    ld2           = 8,
    st1           = 9,
    st2           = 10,
    auipc         = 11,
    br            = 12,
    jal           = 13,
    jalr          = 14,
    regstate      = 15
} state, next_states;

/************************* Function Definitions *******************************/
/**
 *  You do not need to use these functions, but it can be nice to encapsulate
 *  behavior in such a way.  For example, if you use the `loadRegfile`
 *  function, then you only need to ensure that you set the load_regfile bit
 *  to 1'b1 in one place, rather than in many.
 *
 *  SystemVerilog functions must take zero "simulation time" (as opposed to 
 *  tasks).  Thus, they are generally synthesizable, and appropraite
 *  for design code.  Arguments to functions are, by default, input.  But
 *  may be passed as outputs, inouts, or by reference using the `ref` keyword.
**/

/**
 *  Rather than filling up an always_block with a whole bunch of default values,
 *  set the default values for controller output signals in this function,
 *   and then call it at the beginning of your always_comb block.
**/
function void set_defaults();
    load_pc = 1'b0;
    load_ir = 1'b0;
    load_regfile = 1'b0;
    load_mar = 1'b0;
    load_mdr = 1'b0;
    load_data_out = 1'b0;
    pcmux_sel = pcmux::pc_plus4;
    cmpop = beq;
    alumux1_sel = alumux::rs1_out;
    alumux2_sel = alumux::i_imm;
    regfilemux_sel = regfilemux::alu_out;
    marmux_sel = marmux::pc_out;
    cmpmux_sel = cmpmux::rs2_out;
    aluop = alu_add;
    mem_read = 1'b0;
    mem_write = 1'b0;
    mem_byte_enable = 4'b1111;
endfunction

/**
 *  Use the next several functions to set the signals needed to
 *  load various registers
**/
function void loadPC(pcmux::pcmux_sel_t sel);
    load_pc = 1'b1;
    pcmux_sel = sel;
endfunction

function void loadRegfile(regfilemux::regfilemux_sel_t sel);
    load_regfile = 1'b1;
    regfilemux_sel = sel;
endfunction

function void loadMAR(marmux::marmux_sel_t sel);
    load_mar = 1'b1;
    marmux_sel = sel;
endfunction

function void loadMDR();
    load_mdr = 1'b1;
endfunction

function void loadIR();
    load_ir = 1'b1;
endfunction

function void loadDataOut();
    load_data_out = 1'b1;
endfunction

function void setALU(alumux::alumux1_sel_t sel1, alumux::alumux2_sel_t sel2, logic setop, alu_ops op);
    /* Student code here */
    if (setop) begin
        aluop = op; // else default value
        alumux1_sel = sel1;
        alumux2_sel = sel2;
    end
endfunction

function automatic void setCMP(cmpmux::cmpmux_sel_t sel, branch_funct3_t op);
    cmpmux_sel = sel;
    cmpop = op;
endfunction

/*****************************************************************************/

    /* Remember to deal with rst signal */

always_comb
begin : state_actions
    /* Default output assignments */
    set_defaults();
    /* Actions for each state */
    if (state == fetch1) begin //??
        loadMAR(marmux::pc_out);
    end

    else if (state == fetch2) begin
        loadMDR();
        mem_read = 1'b1;
    end

    else if (state == fetch3) begin
        loadIR();
    end

    else if (state == imm) begin
        case(arith_funct3)
            slt: begin
                loadPC(pcmux::pc_plus4);
                loadRegfile(regfilemux::br_en);
                setCMP(cmpmux::i_imm, blt);
            end

            sltu: begin
                loadPC(pcmux::pc_plus4);
                loadRegfile(regfilemux::br_en);
                setCMP(cmpmux::i_imm, bltu);
            end

            sr: begin
                loadRegfile(regfilemux::alu_out);
                loadPC(pcmux::pc_plus4);

                if (funct7[5]) begin
                    setALU(alumux::rs1_out, alumux::i_imm, 1'b1, alu_sra);
                end
                else begin
                    setALU(alumux::rs1_out, alumux::i_imm, 1'b1, alu_srl);
                end
            end

            default: begin
                loadRegfile(regfilemux::alu_out);
                loadPC(pcmux::pc_plus4);
                setALU(alumux::rs1_out, alumux::i_imm, 1'b1, alu_ops'(arith_funct3));
            end
        endcase
    end

    else if (state == regstate) begin
        unique case(arith_funct3)
            add: begin
                loadRegfile(regfilemux::alu_out);
                loadPC(pcmux::pc_plus4);

                if (funct7[5]) begin
                    setALU(alumux::rs1_out, alumux::rs2_out, 1'b1, alu_sub);
                end
                else begin
                    setALU(alumux::rs1_out, alumux::rs2_out, 1'b1, alu_add);
                end
            end

            slt: begin
                loadPC(pcmux::pc_plus4);
                loadRegfile(regfilemux::br_en);
                setCMP(cmpmux::rs2_out, blt);
            end

            sltu: begin
                loadPC(pcmux::pc_plus4);
                loadRegfile(regfilemux::br_en);
                setCMP(cmpmux::rs2_out, bltu);
            end

            sr: begin
                loadRegfile(regfilemux::alu_out);
                loadPC(pcmux::pc_plus4);
                
                if (funct7[5]) begin
                    setALU(alumux::rs1_out, alumux::rs2_out, 1'b1, alu_sra);
                end
                else begin
                    setALU(alumux::rs1_out, alumux::rs2_out, 1'b1, alu_srl);
                end
            end

            default: begin
                loadRegfile(regfilemux::alu_out);
                loadPC(pcmux::pc_plus4);
                setALU(alumux::rs1_out, alumux::rs2_out, 1'b1, alu_ops'(arith_funct3));
            end
        endcase
    end

    else if (state == lui) begin
        loadRegfile(regfilemux::u_imm);
        loadPC(pcmux::pc_plus4);
    end

    else if (state == calc_addr) begin
        case(opcode)
            op_load: begin
                loadMAR(marmux::alu_out);
                setALU(alumux::rs1_out, alumux::i_imm, 1'b1, alu_add);
            end
            op_store: begin
                loadMAR(marmux::alu_out);
                loadDataOut();
                setALU(alumux::rs1_out, alumux::s_imm, 1'b1, alu_add);
            end
        endcase
    end

    else if (state == ld1) begin
        loadMDR();
        mem_read = 1'b1;
    end

    else if (state == ld2) begin
        loadPC(pcmux::pc_plus4);
        unique case(load_funct3)
            lb: loadRegfile(regfilemux::lb);
            lh: loadRegfile(regfilemux::lh);
            lw: loadRegfile(regfilemux::lw);
            lbu: loadRegfile(regfilemux::lbu);
            lhu: loadRegfile(regfilemux::lhu);
            default: ;
        endcase
    end

    else if (state == st1) begin
        mem_write = 1'b1;
        mem_byte_enable = wmask;
    end
    
    else if (state == st2) begin
        loadPC(pcmux::pc_plus4);
    end

    else if (state == auipc) begin
        loadPC(pcmux::pc_plus4);
        setALU(alumux::pc_out, alumux::u_imm, 1'b1, alu_add);
        loadRegfile(regfilemux::alu_out);
    end

    else if (state == br) begin
        // type cast the br_en as a pcmux selector
        loadPC(pcmux::pcmux_sel_t'(br_en));
        setALU(alumux::pc_out, alumux::b_imm, 1'b1, alu_add);
        setCMP(cmpmux::rs2_out, branch_funct3);
    end

    else if (state == jal) begin
        loadRegfile(regfilemux::pc_plus4);
        setALU(alumux::pc_out, alumux::i_imm, 1'b1, alu_add);
        loadPC(pcmux::alu_mod2);
    end

    else if (state == jalr) begin
        loadRegfile(regfilemux::pc_plus4);
        setALU(alumux::rs1_out, alumux::j_imm, 1'b1, alu_add);
        loadPC(pcmux::alu_mod2);
    end


end

// <= as a blocking assignment operator. It indicates that the right-hand 
// side expression should be evaluated and its value assigned to the left-hand 
// side variable immediately, blocking any further execution until the assignment is complete. 
// This means that the statements following the assignment are executed only after the assignment is finished.
always_comb
begin : next_state_logic
    /* Next state information and conditions (if any)
     * for transitioning between states */
    if(rst) begin
        next_states = fetch1;
    end

    else begin
        if (state == fetch1) begin
            next_states = fetch2;
        end

        else if (state == fetch2) begin
            if(mem_resp == 0)
                next_states = fetch2;
            else
                next_states = fetch3;
        end

        else if (state == fetch3) begin
            next_states = decode;
        end

        else if (state == decode) begin
            unique case(opcode)
                rv32i_types::op_imm: next_states = imm;
                rv32i_types::op_lui: next_states = lui;
                rv32i_types::op_load: next_states = calc_addr;
                rv32i_types::op_store: next_states = calc_addr;
                rv32i_types::op_auipc: next_states = auipc;
                rv32i_types::op_br: next_states = br;
                rv32i_types::op_jal: next_states = jal;
                rv32i_types::op_jalr: next_states = jalr;
                rv32i_types::op_reg: next_states = regstate;
                default: next_states = fetch1;
            endcase
        end

        else if (state == calc_addr) begin
            unique case(opcode)
                rv32i_types::op_load: next_states = ld1;
                rv32i_types::op_store: next_states = st1;
            endcase
        end

        else if (state == ld1) begin
            if(mem_resp == 0)
                next_states = ld1;
            else
                next_states = ld2;
        end

        else if (state == st1) begin
            if(mem_resp == 0)
                next_states = st1;
            else
                next_states = st2;
        end

        else begin
            next_states = fetch1;
        end
    end
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
    state <= next_states;
end

endmodule : control
