/// Copyright by Syntacore LLC © 2016-2021. See LICENSE for details
/// @file       <scr1_arch_description.svh>
/// @brief      Architecture description file
///

// Обрабатывать ветвь при отсутствии SCR1_ARCH_DESCRIPTION_SVH.
`ifndef SCR1_ARCH_DESCRIPTION_SVH
// Защита от повторного подключения этого заголовка.
// Имя SCR1_ARCH_DESCRIPTION_SVH: имя процессорного ядра; Architecture — архитектура; описание; SystemVerilog Header — заголовок.
`define SCR1_ARCH_DESCRIPTION_SVH


//------------------------------------------------------------------------------
// CORE FUNDAMENTAL PARAMETERS
//------------------------------------------------------------------------------

// SCR1 core identifiers
// Идентификатор версии реализации процессора.
// Имя SCR1_MIMPID: имя процессорного ядра; Machine Implementation ID — идентификатор реализации.
`define SCR1_MIMPID             32'h22011200
// Идентификатор производителя; ноль означает неуказанное значение.
// Имя SCR1_MVENDORID: имя процессорного ядра; Machine Vendor ID — идентификатор производителя.
`define SCR1_MVENDORID          32'h00000000

// Width of main registers and buses
// Разрядность целочисленных регистров: 32 бита.
// Имя SCR1_XLEN: имя процессорного ядра; ширина целочисленного регистра.
`define SCR1_XLEN               32
// Ширина адреса памяти инструкций, равная XLEN.
// Имя SCR1_IMEM_AWIDTH: имя процессорного ядра; Instruction Memory — память инструкций; Address Width — ширина адреса.
`define SCR1_IMEM_AWIDTH        `SCR1_XLEN
// Ширина данных памяти инструкций, равная XLEN.
// Имя SCR1_IMEM_DWIDTH: имя процессорного ядра; Instruction Memory — память инструкций; Data Width — ширина данных.
`define SCR1_IMEM_DWIDTH        `SCR1_XLEN
// Ширина адреса памяти данных, равная XLEN.
// Имя SCR1_DMEM_AWIDTH: имя процессорного ядра; Data Memory — память данных; Address Width — ширина адреса.
`define SCR1_DMEM_AWIDTH        `SCR1_XLEN
// Ширина данных памяти данных, равная XLEN.
// Имя SCR1_DMEM_DWIDTH: имя процессорного ядра; Data Memory — память данных; Data Width — ширина данных.
`define SCR1_DMEM_DWIDTH        `SCR1_XLEN

// TAP IDCODE
// Идентификационный код JTAG TAP.
// Имя SCR1_TAP_IDCODE: имя процессорного ядра; Test Access Port — порт JTAG; идентификационный код.
`define SCR1_TAP_IDCODE         'hDEB11001


// Обрабатывать ветвь при наличии SCR1_ARCH_CUSTOM.
`ifdef SCR1_ARCH_CUSTOM
//------------------------------------------------------------------------------
// INCLUDE SCR1_ARCH_CUSTOM.SVH
//------------------------------------------------------------------------------

// The external file scr1_arch_custom.svh is used for the open SCR1-SDK project,
// and can also be used for any custom projects.

// The file sets:
// - target platform (FPGA/ASIC), which affects the choice of logical constructs;
// - device build ID;
// - address constants;
// - could enables configuration parameters.

// Possible targets:
// `define SCR1_TRGT_FPGA_INTEL         // target platform is Intel FPGAs
// `define SCR1_TRGT_FPGA_INTEL_MAX10   // target platform is Intel MAX 10 FPGAs (used in the SCR1-SDK project)
// `define SCR1_TRGT_FPGA_INTEL_ARRIAV  // target platform is Intel Arria V FPGAs (used in the SCR1-SDK project)
// `define SCR1_TRGT_FPGA_XILINX        // target platform is Xilinx FPGAs (used in the SCR1-SDK project)
// `define SCR1_TRGT_ASIC               // target platform is ASIC
// `define SCR1_TRGT_SIMULATION         // target is simulation (enable simulation code)

 // Подключить внешние настройки платформы, адресов и конфигурации из scr1_arch_custom.svh.
 `include "scr1_arch_custom.svh"

// Завершить текущую условную ветвь препроцессора SystemVerilog.
`endif // SCR1_ARCH_CUSTOM


//------------------------------------------------------------------------------
// RECOMMENDED CORE ARCHITECTURE CONFIGURATIONS
//------------------------------------------------------------------------------

// Uncomment one of these defines to set the recommended configuration:

//`define SCR1_CFG_RV32IMC_MAX
//`define SCR1_CFG_RV32IC_BASE
//`define SCR1_CFG_RV32EC_MIN

// If all defines are commented, custom configuration will be used (see below)

//------------------------------------------------------------------------------
// READ-ONLY: settings for recommended configurations
// Обрабатывать ветвь при наличии SCR1_CFG_RV32IMC_MAX.
`ifdef  SCR1_CFG_RV32IMC_MAX
  // Включить базовый набор RV32I с 32 целочисленными регистрами.
  // Имя SCR1_RVI_EXT: имя процессорного ядра; RISC-V I — базовые целочисленные инструкции; Extension — расширение.
  `define SCR1_RVI_EXT
  // Включить целочисленное умножение и деление (расширение M).
  // Имя SCR1_RVM_EXT: имя процессорного ядра; RISC-V M — целочисленное умножение/деление; Extension — расширение.
  `define SCR1_RVM_EXT
  // Включить сжатые инструкции (расширение C).
  // Имя SCR1_RVC_EXT: имя процессорного ядра; RISC-V C — сжатые инструкции; Extension — расширение.
  `define SCR1_RVC_EXT
  // Число доступных для записи старших битов базы mtvec: от 0 до 26; остальные фиксированы.
  // Имя SCR1_MTVEC_BASE_WR_BITS: имя процессорного ядра; Machine Trap-Vector — адрес и режим машинного обработчика; база; Writable — доступный для записи; биты.
  parameter int unsigned SCR1_MTVEC_BASE_WR_BITS = 26;
  // Разрешить изменение режима mtvec, включая векторные прерывания.
  // Имя SCR1_MTVEC_MODE_EN: имя процессорного ядра; Machine Trap-Vector — адрес и режим машинного обработчика; режим; Enable — включение.
  `define SCR1_MTVEC_MODE_EN
  // Использовать быстрый однотактный умножитель.
  // Имя SCR1_FAST_MUL: имя процессорного ядра; быстрый; Multiply — умножение.
  `define SCR1_FAST_MUL
  // Разрешить сброс содержимого файла целочисленных регистров.
  // Имя SCR1_MPRF_RST_EN: имя процессорного ядра; файл основных целочисленных регистров x0–x31 (x0–x15 для E); Reset — сброс; Enable — включение.
  `define SCR1_MPRF_RST_EN
  // Включить дополнительный CSR управления счётчиками.
  // Имя SCR1_MCOUNTEN_EN: имя процессорного ядра; проектный машинный CSR разрешения счётчиков; Enable — включение.
  `define SCR1_MCOUNTEN_EN
  // Включить аппаратную подсистему отладки.
  // Имя SCR1_DBG_EN: имя процессорного ядра; Debug — отладка; Enable — включение.
  `define SCR1_DBG_EN
  // Включить блок аппаратных отладочных триггеров.
  // Имя SCR1_TDU_EN: имя процессорного ядра; Trigger Debug Unit — блок отладочных триггеров; Enable — включение.
  `define SCR1_TDU_EN
  // Количество аппаратных отладочных триггеров.
  // Имя SCR1_TDU_TRIG_NUM: имя процессорного ядра; Trigger Debug Unit — блок отладочных триггеров; Trigger — триггер; Number — количество.
  parameter int unsigned SCR1_TDU_TRIG_NUM = 4;
  // Разрешить триггеры по счётчику инструкций.
  // Имя SCR1_TDU_ICOUNT_EN: имя процессорного ядра; Trigger Debug Unit — блок отладочных триггеров; Instruction Count — счётчик инструкций; Enable — включение.
  `define SCR1_TDU_ICOUNT_EN
  // Включить встроенный контроллер прерываний IPIC.
  // Имя SCR1_IPIC_EN: имя процессорного ядра; Integrated Programmable Interrupt Controller — встроенный программируемый контроллер прерываний; Enable — включение.
  `define SCR1_IPIC_EN
  // Включить синхронизацию входов IPIC.
  // Имя SCR1_IPIC_SYNC_EN: имя процессорного ядра; Integrated Programmable Interrupt Controller — встроенный программируемый контроллер прерываний; Synchronization — синхронизация; Enable — включение.
  `define SCR1_IPIC_SYNC_EN
  // Включить тесно связанную память TCM.
  // Имя SCR1_TCM_EN: имя процессорного ядра; Tightly-Coupled Memory — тесно связанная память; Enable — включение.
  `define SCR1_TCM_EN
// Обрабатывать ветвь при наличии SCR1_CFG_RV32IC_BASE.
`elsif  SCR1_CFG_RV32IC_BASE
  // Включить базовый набор RV32I с 32 целочисленными регистрами.
  // Имя SCR1_RVI_EXT: имя процессорного ядра; RISC-V I — базовые целочисленные инструкции; Extension — расширение.
  `define SCR1_RVI_EXT
  // Включить сжатые инструкции (расширение C).
  // Имя SCR1_RVC_EXT: имя процессорного ядра; RISC-V C — сжатые инструкции; Extension — расширение.
  `define SCR1_RVC_EXT
  // Число доступных для записи старших битов базы mtvec: от 0 до 26; остальные фиксированы.
  // Имя SCR1_MTVEC_BASE_WR_BITS: имя процессорного ядра; Machine Trap-Vector — адрес и режим машинного обработчика; база; Writable — доступный для записи; биты.
  parameter int unsigned SCR1_MTVEC_BASE_WR_BITS = 16;
  // Разрешить изменение режима mtvec, включая векторные прерывания.
  // Имя SCR1_MTVEC_MODE_EN: имя процессорного ядра; Machine Trap-Vector — адрес и режим машинного обработчика; режим; Enable — включение.
  `define SCR1_MTVEC_MODE_EN
  // Убрать регистр между выборкой IFU и декодированием IDU.
  // Имя SCR1_NO_DEC_STAGE: имя процессорного ядра; отключение; Decode — декодирование; ступень конвейера.
  `define SCR1_NO_DEC_STAGE
  // Разрешить сброс содержимого файла целочисленных регистров.
  // Имя SCR1_MPRF_RST_EN: имя процессорного ядра; файл основных целочисленных регистров x0–x31 (x0–x15 для E); Reset — сброс; Enable — включение.
  `define SCR1_MPRF_RST_EN
  // Включить дополнительный CSR управления счётчиками.
  // Имя SCR1_MCOUNTEN_EN: имя процессорного ядра; проектный машинный CSR разрешения счётчиков; Enable — включение.
  `define SCR1_MCOUNTEN_EN
  // Включить аппаратную подсистему отладки.
  // Имя SCR1_DBG_EN: имя процессорного ядра; Debug — отладка; Enable — включение.
  `define SCR1_DBG_EN
  // Включить блок аппаратных отладочных триггеров.
  // Имя SCR1_TDU_EN: имя процессорного ядра; Trigger Debug Unit — блок отладочных триггеров; Enable — включение.
  `define SCR1_TDU_EN
  // Количество аппаратных отладочных триггеров.
  // Имя SCR1_TDU_TRIG_NUM: имя процессорного ядра; Trigger Debug Unit — блок отладочных триггеров; Trigger — триггер; Number — количество.
  parameter int unsigned SCR1_TDU_TRIG_NUM = 2;
  // Разрешить триггеры по счётчику инструкций.
  // Имя SCR1_TDU_ICOUNT_EN: имя процессорного ядра; Trigger Debug Unit — блок отладочных триггеров; Instruction Count — счётчик инструкций; Enable — включение.
  `define SCR1_TDU_ICOUNT_EN
  // Включить встроенный контроллер прерываний IPIC.
  // Имя SCR1_IPIC_EN: имя процессорного ядра; Integrated Programmable Interrupt Controller — встроенный программируемый контроллер прерываний; Enable — включение.
  `define SCR1_IPIC_EN
  // Включить синхронизацию входов IPIC.
  // Имя SCR1_IPIC_SYNC_EN: имя процессорного ядра; Integrated Programmable Interrupt Controller — встроенный программируемый контроллер прерываний; Synchronization — синхронизация; Enable — включение.
  `define SCR1_IPIC_SYNC_EN
  // Включить тесно связанную память TCM.
  // Имя SCR1_TCM_EN: имя процессорного ядра; Tightly-Coupled Memory — тесно связанная память; Enable — включение.
  `define SCR1_TCM_EN
// Обрабатывать ветвь при наличии SCR1_CFG_RV32EC_MIN.
`elsif  SCR1_CFG_RV32EC_MIN
  // Включить базовый набор RV32E с 16 целочисленными регистрами.
  // Имя SCR1_RVE_EXT: имя процессорного ядра; RISC-V E — база с 16 регистрами; Extension — расширение.
  `define SCR1_RVE_EXT
  // Включить сжатые инструкции (расширение C).
  // Имя SCR1_RVC_EXT: имя процессорного ядра; RISC-V C — сжатые инструкции; Extension — расширение.
  `define SCR1_RVC_EXT
  // Число доступных для записи старших битов базы mtvec: от 0 до 26; остальные фиксированы.
  // Имя SCR1_MTVEC_BASE_WR_BITS: имя процессорного ядра; Machine Trap-Vector — адрес и режим машинного обработчика; база; Writable — доступный для записи; биты.
  parameter int unsigned SCR1_MTVEC_BASE_WR_BITS = 0;
  // Убрать регистр между выборкой IFU и декодированием IDU.
  // Имя SCR1_NO_DEC_STAGE: имя процессорного ядра; отключение; Decode — декодирование; ступень конвейера.
  `define SCR1_NO_DEC_STAGE
  // Убрать регистр между декодированием IDU и исполнением EXU.
  // Имя SCR1_NO_EXE_STAGE: имя процессорного ядра; отключение; Execute — исполнение; ступень конвейера.
  `define SCR1_NO_EXE_STAGE
  // Включить тесно связанную память TCM.
  // Имя SCR1_TCM_EN: имя процессорного ядра; Tightly-Coupled Memory — тесно связанная память; Enable — включение.
  `define SCR1_TCM_EN

// Если готовая конфигурация не выбрана, использовать ручные настройки ниже.
`else // begin custom configuration section


//------------------------------------------------------------------------------
// CUSTOM CORE ARCHITECTURE CONFIGURATION
//------------------------------------------------------------------------------

// To fine-tune custom configuration, you can change the values in this section.
// Make sure that the defines of the recommended configurations are commented,
// otherwise this section will be inactive.

// RISC-V ISA options
//`define SCR1_RVE_EXT                // enable RV32E base integer instruction set, otherwise RV32I will be used
// Включить целочисленное умножение и деление (расширение M).
// Имя SCR1_RVM_EXT: имя процессорного ядра; RISC-V M — целочисленное умножение/деление; Extension — расширение.
`define SCR1_RVM_EXT                // enable standard extension "M" for integer hardware multiplier and divider
// Включить сжатые инструкции (расширение C).
// Имя SCR1_RVC_EXT: имя процессорного ядра; RISC-V C — сжатые инструкции; Extension — расширение.
`define SCR1_RVC_EXT                // enable standard extension "C" for compressed instructions
// Число доступных для записи старших битов базы mtvec: от 0 до 26; остальные фиксированы.
// Имя SCR1_MTVEC_BASE_WR_BITS: имя процессорного ядра; Machine Trap-Vector — адрес и режим машинного обработчика; база; Writable — доступный для записи; биты.
parameter int unsigned SCR1_MTVEC_BASE_WR_BITS = 26;    // number of writable high-order bits in MTVEC.base field
                                                            // legal values are 0 to 26
                                                            // read-only bits are hardwired to reset value
// Разрешить изменение режима mtvec, включая векторные прерывания.
// Имя SCR1_MTVEC_MODE_EN: имя процессорного ядра; Machine Trap-Vector — адрес и режим машинного обработчика; режим; Enable — включение.
`define SCR1_MTVEC_MODE_EN          // enable writable MTVEC.mode field to allow vectored irq mode, otherwise only direct mode is possible

// Обрабатывать ветвь при отсутствии SCR1_RVE_EXT.
`ifndef SCR1_RVE_EXT
  // Включить базовый набор RV32I с 32 целочисленными регистрами.
  // Имя SCR1_RVI_EXT: имя процессорного ядра; RISC-V I — базовые целочисленные инструкции; Extension — расширение.
  `define SCR1_RVI_EXT // RV32E base integer instruction set if SCR1_RVE_EXT is not enabled
// Завершить текущую условную ветвь препроцессора SystemVerilog.
`endif // ~SCR1_RVE_EXT

// Core pipeline options (power-performance-area optimization)
// Убрать регистр между выборкой IFU и декодированием IDU.
// Имя SCR1_NO_DEC_STAGE: имя процессорного ядра; отключение; Decode — декодирование; ступень конвейера.
`define SCR1_NO_DEC_STAGE           // disable register between IFU and IDU
// Убрать регистр между декодированием IDU и исполнением EXU.
// Имя SCR1_NO_EXE_STAGE: имя процессорного ядра; отключение; Execute — исполнение; ступень конвейера.
`define SCR1_NO_EXE_STAGE           // disable register between IDU and EXU
// Добавить регистр нового адреса PC в блоке выборки.
// Имя SCR1_NEW_PC_REG: имя процессорного ядра; новый; Program Counter — адрес выполняемой инструкции; Register — регистр.
`define SCR1_NEW_PC_REG             // enable register in IFU for New_PC value
// Использовать быстрый однотактный умножитель.
// Имя SCR1_FAST_MUL: имя процессорного ядра; быстрый; Multiply — умножение.
`define SCR1_FAST_MUL               // enable fast one-cycle multiplication, otherwise multiplication takes 32 cycles
// Включить управление тактовым сигналом для снижения потребления.
// Имя SCR1_CLKCTRL_EN: имя процессорного ядра; Clock Control — управление тактированием; Enable — включение.
`define SCR1_CLKCTRL_EN             // enable global clock gating
// Разрешить сброс содержимого файла целочисленных регистров.
// Имя SCR1_MPRF_RST_EN: имя процессорного ядра; файл основных целочисленных регистров x0–x31 (x0–x15 для E); Reset — сброс; Enable — включение.
`define SCR1_MPRF_RST_EN            // enable reset for MPRF
// Включить дополнительный CSR управления счётчиками.
// Имя SCR1_MCOUNTEN_EN: имя процессорного ядра; проектный машинный CSR разрешения счётчиков; Enable — включение.
`define SCR1_MCOUNTEN_EN            // enable custom MCOUNTEN CSR for counter control

// Uncore options
// Включить аппаратную подсистему отладки.
// Имя SCR1_DBG_EN: имя процессорного ядра; Debug — отладка; Enable — включение.
`define SCR1_DBG_EN                 // enable Debug Subsystem (TAPC, DM, SCU, HDU)
// Включить блок аппаратных отладочных триггеров.
// Имя SCR1_TDU_EN: имя процессорного ядра; Trigger Debug Unit — блок отладочных триггеров; Enable — включение.
`define SCR1_TDU_EN                 // enable Trigger Debug Unit (hardware breakpoints)
// Количество аппаратных отладочных триггеров.
// Имя SCR1_TDU_TRIG_NUM: имя процессорного ядра; Trigger Debug Unit — блок отладочных триггеров; Trigger — триггер; Number — количество.
parameter int unsigned SCR1_TDU_TRIG_NUM = 2;   // number of hardware triggers
// Разрешить триггеры по счётчику инструкций.
// Имя SCR1_TDU_ICOUNT_EN: имя процессорного ядра; Trigger Debug Unit — блок отладочных триггеров; Instruction Count — счётчик инструкций; Enable — включение.
`define SCR1_TDU_ICOUNT_EN          // enable hardware triggers on instruction counter
// Включить встроенный контроллер прерываний IPIC.
// Имя SCR1_IPIC_EN: имя процессорного ядра; Integrated Programmable Interrupt Controller — встроенный программируемый контроллер прерываний; Enable — включение.
`define SCR1_IPIC_EN                // enable Integrated Programmable Interrupt Controller
// Включить синхронизацию входов IPIC.
// Имя SCR1_IPIC_SYNC_EN: имя процессорного ядра; Integrated Programmable Interrupt Controller — встроенный программируемый контроллер прерываний; Synchronization — синхронизация; Enable — включение.
`define SCR1_IPIC_SYNC_EN           // enable IPIC synchronizer
// Включить тесно связанную память TCM.
// Имя SCR1_TCM_EN: имя процессорного ядра; Tightly-Coupled Memory — тесно связанная память; Enable — включение.
`define SCR1_TCM_EN                 // enable Tightly-Coupled Memory

// Завершить текущую условную ветвь препроцессора SystemVerilog.
`endif // end custom configuration section


//------------------------------------------------------------------------------
// CORE INTEGRATION OPTIONS
//------------------------------------------------------------------------------

// Bypasses on AXI/AHB bridge I/O
// Обойти регистр входного этапа моста AHB памяти инструкций.
// Имя SCR1_IMEM_AHB_IN_BP: имя процессорного ядра; Instruction Memory — память инструкций; шина AMBA AHB; вход; Bypass — обход промежуточного регистра.
`define SCR1_IMEM_AHB_IN_BP         // bypass instruction memory AHB bridge input register
// Обойти регистр выходного этапа моста AHB памяти инструкций.
// Имя SCR1_IMEM_AHB_OUT_BP: имя процессорного ядра; Instruction Memory — память инструкций; шина AMBA AHB; выход; Bypass — обход промежуточного регистра.
`define SCR1_IMEM_AHB_OUT_BP        // bypass instruction memory AHB bridge output register
// Обойти регистр входного этапа моста AHB памяти данных.
// Имя SCR1_DMEM_AHB_IN_BP: имя процессорного ядра; Data Memory — память данных; шина AMBA AHB; вход; Bypass — обход промежуточного регистра.
`define SCR1_DMEM_AHB_IN_BP         // bypass data memory AHB bridge input register
// Обойти регистр выходного этапа моста AHB памяти данных.
// Имя SCR1_DMEM_AHB_OUT_BP: имя процессорного ядра; Data Memory — память данных; шина AMBA AHB; выход; Bypass — обход промежуточного регистра.
`define SCR1_DMEM_AHB_OUT_BP        // bypass data memory AHB bridge output register
// Обойти регистр запросного этапа моста AXI памяти инструкций.
// Имя SCR1_IMEM_AXI_REQ_BP: имя процессорного ядра; Instruction Memory — память инструкций; шина AMBA AXI; Request — запрос; Bypass — обход промежуточного регистра.
`define SCR1_IMEM_AXI_REQ_BP        // bypass instruction memory AXI bridge request register
// Обойти регистр ответного этапа моста AXI памяти инструкций.
// Имя SCR1_IMEM_AXI_RESP_BP: имя процессорного ядра; Instruction Memory — память инструкций; шина AMBA AXI; Response — ответ; Bypass — обход промежуточного регистра.
`define SCR1_IMEM_AXI_RESP_BP       // bypass instruction memory AXI bridge response register
// Обойти регистр запросного этапа моста AXI памяти данных.
// Имя SCR1_DMEM_AXI_REQ_BP: имя процессорного ядра; Data Memory — память данных; шина AMBA AXI; Request — запрос; Bypass — обход промежуточного регистра.
`define SCR1_DMEM_AXI_REQ_BP        // bypass data memory AXI bridge request register
// Обойти регистр ответного этапа моста AXI памяти данных.
// Имя SCR1_DMEM_AXI_RESP_BP: имя процессорного ядра; Data Memory — память данных; шина AMBA AXI; Response — ответ; Bypass — обход промежуточного регистра.
`define SCR1_DMEM_AXI_RESP_BP       // bypass data memory AXI bridge response register

// Обрабатывать ветвь при отсутствии SCR1_ARCH_CUSTOM.
`ifndef SCR1_ARCH_CUSTOM
// Default address constants (if scr1_arch_custom.svh is not used)
// Адрес первой инструкции после сброса: 0xF00; здесь должен находиться _start.
// Имя SCR1_ARCH_RST_VECTOR: имя процессорного ядра; Architecture — архитектура; Reset — сброс; адрес входа.
parameter bit [`SCR1_XLEN-1:0]          SCR1_ARCH_RST_VECTOR        = 'hF00;            // Reset vector value (start address after reset)
// База mtvec после сброса: 0xB00; здесь размещён trap_vector.
// Имя SCR1_ARCH_MTVEC_BASE: имя процессорного ядра; Architecture — архитектура; Machine Trap-Vector — адрес и режим машинного обработчика; база.
parameter bit [`SCR1_XLEN-1:0]          SCR1_ARCH_MTVEC_BASE        = 'hB00;            // MTVEC.base field reset value, or constant value for MTVEC.base bits that are hardwired

// Маска выбора TCM: старшие 16 бит определяют область, младшие 16 задают смещение.
// Имя SCR1_TCM_ADDR_MASK: имя процессорного ядра; Tightly-Coupled Memory — тесно связанная память; Address — адрес; маска.
parameter bit [`SCR1_DMEM_AWIDTH-1:0]   SCR1_TCM_ADDR_MASK          = 'hFFFF0000;       // TCM mask and size; size in bytes is two's complement of the mask value
// База TCM 0x00480000; диапазон до 0x0048FFFF, размер 64 КиБ.
// Имя SCR1_TCM_ADDR_PATTERN: имя процессорного ядра; Tightly-Coupled Memory — тесно связанная память; Address — адрес; шаблон сравнения адреса.
parameter bit [`SCR1_DMEM_AWIDTH-1:0]   SCR1_TCM_ADDR_PATTERN       = 'h00480000;       // TCM address match pattern

// Маска выбора таймера: младшие 5 бит задают смещение в области 32 байта.
// Имя SCR1_TIMER_ADDR_MASK: имя процессорного ядра; таймер; Address — адрес; маска.
parameter bit [`SCR1_DMEM_AWIDTH-1:0]   SCR1_TIMER_ADDR_MASK        = 'hFFFFFFE0;       // Timer mask
// База регистров таймера: диапазон 0x00490000–0x0049001F.
// Имя SCR1_TIMER_ADDR_PATTERN: имя процессорного ядра; таймер; Address — адрес; шаблон сравнения адреса.
parameter bit [`SCR1_DMEM_AWIDTH-1:0]   SCR1_TIMER_ADDR_PATTERN     = 'h00490000;       // Timer address match pattern

// Device build ID
 // Использовать идентификатор реализации в качестве идентификатора сборки.
 // Имя SCR1_ARCH_BUILD_ID: имя процессорного ядра; Architecture — архитектура; сборка; идентификатор.
 `define SCR1_ARCH_BUILD_ID             `SCR1_MIMPID

// Завершить текущую условную ветвь препроцессора SystemVerilog.
`endif // SCR1_ARCH_CUSTOM


//------------------------------------------------------------------------------
// TARGET-SPECIFIC OPTIONS
//------------------------------------------------------------------------------

// RAM-based MPRF can be used for Intel FPGAs only
// Обрабатывать ветвь при наличии SCR1_TRGT_FPGA_INTEL.
`ifdef SCR1_TRGT_FPGA_INTEL
  // Реализовать файл регистров на выделенных блоках RAM Intel FPGA.
  // Имя SCR1_MPRF_RAM: имя процессорного ядра; файл основных целочисленных регистров x0–x31 (x0–x15 для E); память с произвольным доступом.
  `define SCR1_MPRF_RAM           // implements MPRF with dedicated RAM blocks
// Завершить текущую условную ветвь препроцессора SystemVerilog.
`endif

// EXU_STAGE_BYPASS and MPRF_RST_EN must be disabled for RAM-based MPRF
// Обрабатывать ветвь при наличии SCR1_MPRF_RAM.
`ifdef SCR1_MPRF_RAM
  // Отключить настройку SCR1_NO_EXE_STAGE для совместимости с реализацией MPRF на RAM.
  `undef  SCR1_NO_EXE_STAGE
  // Отключить настройку SCR1_MPRF_RST_EN для совместимости с реализацией MPRF на RAM.
  `undef  SCR1_MPRF_RST_EN
// Завершить текущую условную ветвь препроцессора SystemVerilog.
`endif


//------------------------------------------------------------------------------
// SIMULATION OPTIONS
//------------------------------------------------------------------------------

//`define SCR1_TRGT_SIMULATION            // enable simulation code (automatically defined by root makefile)
//`define SCR1_TRACE_LOG_EN               // enable tracelog
//`define SCR1_XPROP_EN                   // enable X-propagation

// Addresses used in testbench
// Адрес остановки теста в симуляторе: согласован с SIM_STOP linker script.
// Имя SCR1_SIM_EXIT_ADDR: имя процессорного ядра; Simulation — симуляция; выход; Address — адрес.
localparam [`SCR1_XLEN-1:0]      SCR1_SIM_EXIT_ADDR      = 32'h0000_00F8;
// Порт симулятора: запись байта по этому адресу выводит символ.
// Имя SCR1_SIM_PRINT_ADDR: имя процессорного ядра; Simulation — симуляция; вывод символов; Address — адрес.
localparam [`SCR1_XLEN-1:0]      SCR1_SIM_PRINT_ADDR     = 32'hF000_0000;
// Специальный адрес тестового окружения для управления внешним прерыванием.
// Имя SCR1_SIM_EXT_IRQ_ADDR: имя процессорного ядра; Simulation — симуляция; Extension — расширение; Interrupt Request — запрос прерывания; Address — адрес.
localparam [`SCR1_XLEN-1:0]      SCR1_SIM_EXT_IRQ_ADDR   = 32'hF000_0100;
// Специальный адрес тестового окружения для управления программным прерыванием.
// Имя SCR1_SIM_SOFT_IRQ_ADDR: имя процессорного ядра; Simulation — симуляция; Software — программный; Interrupt Request — запрос прерывания; Address — адрес.
localparam [`SCR1_XLEN-1:0]      SCR1_SIM_SOFT_IRQ_ADDR  = 32'hF000_0200;

// Завершить текущую условную ветвь препроцессора SystemVerilog.
`endif // SCR1_ARCH_DESCRIPTION_SVH
