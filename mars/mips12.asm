#12.Desenvolver um algoritmo que leia a altura, em centímetros de 15 pessoas. Este programa deverá
# calcular e mostrar:
# a. A menor altura do grupo;
# b. A maior altura do grupo;

.data
msg1: .asciiz "Digite a altura da pessoa: "
msg2: .asciiz "\nMenor altura = "
msg3: .asciiz "\nMaior altura = "

.text
.globl main

main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall

    move $t0, $v0
    move $t1, $v0


    li $t2, 1

loop:
    beq $t2, 15, mostrar

    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t3, $v0

    blt $t3, $t0, novo_menor
    j verifica_maior

novo_menor:
    move $t0, $t3

verifica_maior:
    bgt $t3, $t1, novo_maior
    j continua

novo_maior:
    move $t1, $t3

continua:
    addi $t2, $t2, 1
    j loop

mostrar:
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t0
    syscall
    
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall