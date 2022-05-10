#!/bin/bash


nasm -f elf32 sum.asm -o sum.o && gcc -c -m32 main.c -o main.o && gcc -m32 sum.o main.o -no-pie -g -o main && ./main a.txt b.txt