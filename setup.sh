#!/bin/bash


nasm -f elf32 add.asm -o add.o && nasm -f elf32 add.asm -o add.o && gcc -c -m32 main.c -o main.o && gcc -m32 add.o sum.o main.o -g -o main && ./main matrix1.txt matrix2.txt