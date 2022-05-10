#!/bin/bash


nasm -f elf32 add.asm -o add.o && gcc -c -m32 main.c -o main.o && gcc -m32 add.o main.o -no-pie -g -o main && ./main a.txt b.txt