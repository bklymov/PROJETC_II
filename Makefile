NASM      = nasm
GCC       = gcc
NASM_FLAGS = -f elf64 -g -F dwarf
GCC_FLAGS  = -no-pie -g

TARGET = main

.PHONY: clean

$(TARGET): main.o register_adder.o
	$(GCC) $(GCC_FLAGS) -o $@ $^

%.o: %.asm
	$(NASM) $(NASM_FLAGS) -o $@ $<

clean:
	rm -f *.o $(TARGET)
