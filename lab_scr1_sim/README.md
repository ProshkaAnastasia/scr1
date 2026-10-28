# Лабораторная работа 2 — вариант 9

Цель: изучить настройку SCR1, обработку исключений и компоновку программы.

- Тест: `isa/rv32mi/illegal.S`; в списке оставлен только он.
- Reset Vector: `0xF00`, Trap Vector: `0xB00`.
- При Illegal instruction (`mcause=2`) обработчик выводит `incorrect instruction`, затем передаёт управление обработчику теста.
- В `riscv_macros.h` выделены `.text.trap` и `.text.reset`; `link.ld` размещает их по заданным адресам.
- Исходный ISA-прогон: 56/56 PASS. Итоговый одиночный тест: 1/1 PASS.

Подробные шаги, листинги, анализ CSR и таблица всех девяти пунктов задания:
[PDF](../report/lab2_report.pdf), [LaTeX](../report/lab2_report.tex).

Исходные журналы: [baseline](../report/results/baseline/test_results.txt),
[одиночный тест до изменений](../report/results/illegal_before.log).
Итоговые результаты, дизассемблирование и трассы: [results](../results/).
CSR-выборка содержит снимки штатного трассировщика, а не все записи CSR.

Запуск из корня SCR1 в подготовленном контейнере:

```sh
make clean
make run_verilator CFG=MAX BUS=AHB TARGETS=riscv_isa TRACE=1
```

Сборка отчёта из `report/`: `xelatex lab2_report.tex` (дважды).

Реализация сохранена коммитом `36b6433`; новые материалы требуют коммита.
Статус GitHub Fork не подтверждается одним лишь адресом remote.
Исходные результаты остальных наборов, кроме ISA, в материалах отсутствуют.

## Временная диаграмма

[Снимок GTKWave](../report/diagram.png) показывает переход PC с `0x1004`
на `0xB00`. Обрезанный снимок и его разбор включены в PDF-отчёт.

[Вывод строки](../report/diagram-3.png): на `dmem_hwdata` в ASCII читается
`incorrect instruction`. Снимок и пояснения включены в PDF.
