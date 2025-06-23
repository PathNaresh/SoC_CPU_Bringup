///////////////////////////////////////
// 2. scp.c (SCP Firmware)
///////////////////////////////////////

// scp.c
#define CORE_RESET_REG     0xF0000000
#define CORE_CLK_EN_REG    0xF0000004
#define BOOT_ADDR_REG      0xF0000008

void scp_main() {
    *(volatile unsigned int *)BOOT_ADDR_REG = 0x80000000;
    *(volatile unsigned int *)CORE_CLK_EN_REG = 0x1;
    *(volatile unsigned int *)CORE_RESET_REG = 0x0;
    while (1);
}
