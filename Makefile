///////////////////////////////////////
// 5. Makefile
///////////////////////////////////////

CROSS = riscv64-unknown-elf-
CFLAGS = -Wall -nostartfiles -march=rv64im -mabi=lp64
LDFLAGS = -Wl,-T

all: cpu.hex scp.hex

cpu.elf: main.c cpu_link.ld
	$(CROSS)gcc $(CFLAGS) -o $@ main.c $(LDFLAGS)cpu_link.ld

scp.elf: scp.c scp_link.ld
	$(CROSS)gcc $(CFLAGS) -o $@ scp.c $(LDFLAGS)scp_link.ld

cpu.hex: cpu.elf
	$(CROSS)objcopy -O verilog cpu.elf cpu.hex

scp.hex: scp.elf
	$(CROSS)objcopy -O verilog scp.elf scp.hex

clean:
	rm -f *.elf *.hex
