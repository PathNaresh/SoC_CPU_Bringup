///////////////////////////////////////
// SoC CPU Bring-Up Project - End to End
///////////////////////////////////////

Project Structure:

     Makefile
 
     cpu_link.ld
     
     scp_link.ld
     
     main.c
     
     scp.c
     
     tb_top.sv
     
     platform_regs.sv
     
     ram.v

| Component         | Variable          | Address      | Purpose                           |
| ----------------- | ----------------- | ------------ | --------------------------------- |
| **CPU firmware**  | `TEST_ADDR`       | `0x90000000` | Data memory used by CPU firmware  |
| **SCP firmware**  | `BOOT_ADDR_REG`   | `0xF0000008` | SCP writes core boot address here |
| **Platform Regs** | `STATUS_REG`      | `0xF0000010` | CPU writes PASS/FAIL code here    |
| **CPU code**      | via `cpu_link.ld` | `0x80000000` | CPU starts fetching instructions  |
| **SCP code**      | via `scp_link.ld` | `0x81000000` | SCP runs from here                |

SoC memory map is sparse, meaning different functional units occupy distant address ranges. Here's a visual:

Address Range         | Used For
----------------------+-------------------------------------
0x80000000 - 0x8000FFFF | CPU RAM (code + data)
0x81000000 - 0x8100FFFF | SCP RAM (code)
0x90000000 - 0x90000003 | CPU Test memory (write/read addr)
0xF0000000 - 0xF000001F | Platform Registers (reset, clk, status)
