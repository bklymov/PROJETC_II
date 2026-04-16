# Assembly Project II - 68000 to x86_64 Port

## Work in Progress

Starting the port of the 68k assembly program to x86_64 NASM.

So far I have:
- `register_adder.asm` — basic addition subroutine, ported from the 68k version
- `main.asm` — reads two numbers and adds them (no loop yet)

### How to build
```bash
make
./main
```

### Still to do
- Add the 3-iteration loop with running sum
- Input validation
- Overflow checking (the big security issue from the original)
- Test suite
- Proper documentation
