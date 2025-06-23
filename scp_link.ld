///////////////////////////////////////
// 4. scp_link.ld
///////////////////////////////////////

ENTRY(_start)
MEMORY { SCP_RAM (rwx) : ORIGIN = 0x81000000, LENGTH = 64K }
SECTIONS {
    .text : { *(.text*) *(.rodata*) } > SCP_RAM
    .data : { *(.data*) *(.sdata*) } > SCP_RAM
    .bss  : { *(.bss*) *(.sbss*) *(COMMON) } > SCP_RAM
    . = ALIGN(8);
    end = .;
}
