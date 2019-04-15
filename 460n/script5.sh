# Made by Shashwat Pandey in Fall 2018 for UT EE 460N, Computer Architecture taught by Dr. Yale Patt
# Script for Lab 3
# Please don't use it without my permission or claim it as your own.

touch add.o
touch data.o
touch int.o
touch except_unaligned.o
touch except_prot.o
touch except_unknown.o
touch except_page.o
touch vector_table.o
touch pagetable.asm
touch dumpsim

dos2unix add.asm
dos2unix data.asm 
dos2unix int.asm
dos2unix except_page.asm
dos2unix except_unaligned.asm
dos2unix except_prot.asm
dos2unix except_unknown.asm
dos2unix vector_table.asm
dos2unix pagetable.asm
dos2unix ucode5

./assembler.linux add.asm add.o
./assembler.linux data.asm data.o
./assembler.linux except_unaligned.asm except_unaligned.o
./assembler.linux int.asm int.o
./assembler.linux except_page.asm except_page.o
./assembler.linux except_unaligned.asm except_unaligned.o
./assembler.linux except_prot.asm except_prot.o
./assembler.linux except_unknown.asm except_unknown.o
./assembler.linux pagetable.asm pagetable.o
./assembler.linux vector_table.asm vector_table.o


gcc -std=c99 -Wall -Wextra -ansi -o simulate -g lc3bsim5.c

./simulate ucode5 pagetable.o add.o data.o except_prot.o except_page.o except_unaligned.o except_unknown.o int.o vector_table.o

submit-ee360n add.asm int.asm ucode5 dumpsim vector_table.asm lc3bsim5.c data.asm pagetable.asm
