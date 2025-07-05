This code is written with macos 64 (x86_64) in mind so you may need to modify syscall codes to get the code working. I think everything else should work though? 

If you have nasm and gcc installed then you can run

```
nasm -fmacho64 subroutines.asm -o hello.o
gcc -arch x86_64 -o hello hello.o
./hello
```
changing `subrouties.asm` for whatever file you want to test.