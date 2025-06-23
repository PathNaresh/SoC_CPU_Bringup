///////////////////////////////////////
// 3. cpu_link.ld
///////////////////////////////////////

ENTRY(_start)
MEMORY { RAM (rwx) : ORIGIN = 0x80000000, LENGTH = 64K }
SECTIONS {
    .text : { *(.text*) *(.rodata*) } > RAM
    .data : { *(.data*) *(.sdata*) } > RAM
    .bss  : { *(.bss*) *(.sbss*) *(COMMON) } > RAM
    . = ALIGN(8);
    end = .;
}
