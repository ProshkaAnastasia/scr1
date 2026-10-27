// Наблюдатель лабораторной 3, вариант 9. Не входит в синтезируемое ядро.
`include "scr1_arch_description.svh"
`include "scr1_arch_types.svh"
`include "scr1_riscv_isa_decoding.svh"

module scr1_tb_log_cmd (
    input logic                         clk,
    input logic                         rst_n,
    input logic                         valid_i,
    input type_scr1_exu_cmd_s            cmd_i,
    input logic [`SCR1_XLEN-1:0]         pc_i,
    input logic [`SCR1_XLEN-1:0]         operand1_i,
    input logic [`SCR1_XLEN-1:0]         operand2_i,
    input logic                         writeback_i,
    input logic [`SCR1_XLEN-1:0]         result_i
);

    // synthesis translate_off
    // Печатаем при записи результата: во время многотактного DIV команда
    // удерживается в EXU, поэтому одной проверки valid было бы недостаточно.
    // На фронте здесь ещё видны операнды и PC завершаемой инструкции.
    always @(posedge clk) begin
        if (rst_n && valid_i && writeback_i
            && (cmd_i.ialu_cmd == SCR1_IALU_CMD_DIV)) begin
            $display("[DIV] PC=0x%08h rs1=x%0d rs2=x%0d rd=x%0d operand1=%0d operand2=%0d result=%0d",
                     pc_i, cmd_i.rs1_addr, cmd_i.rs2_addr, cmd_i.rd_addr,
                     $signed(operand1_i), $signed(operand2_i), $signed(result_i));
        end
    end
    // synthesis translate_on

endmodule : scr1_tb_log_cmd
