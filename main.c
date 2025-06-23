///////////////////////////////////////
// 1. main.c (CPU Firmware)
///////////////////////////////////////

// main.c
#define TEST_ADDR  0x90000000
#define TEST_DATA  0x12345678
#define STATUS_REG 0xF0000010

void main() {
    *(volatile unsigned int *)TEST_ADDR = TEST_DATA;
    unsigned int val = *(volatile unsigned int *)TEST_ADDR;

    if (val == TEST_DATA)
        *(volatile unsigned int *)STATUS_REG = 0xA5A5A5A5;
    else
        *(volatile unsigned int *)STATUS_REG = 0xDEADBEEF;

    while (1);
}
