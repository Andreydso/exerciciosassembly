#11.Escrever um algoritmo que leia uma quantidade desconhecida de números e conte quantos deles
# estão nos seguintes intervalos: [0-25], [26-50], [51-75] e [76-100]. A entrada de dados deve terminar
# quando for lido um número negativo.
.data
msg1: .asciiz "Digite um numero (-1 para terminar): "
msg2: .asciiz "Numero invalido! Digite entre 0 e 100 ou negativo para terminar.\n"

msg3: .asciiz "\n[0-25] = "
msg4: .asciiz "\n[26-50] = "
msg5: .asciiz "\n[51-75] = "
msg6: .asciiz "\n[76-100] = "

.text
.globl main

main:
    li $t0, 0
    li $t1, 0
    li $t2, 0
    li $t3, 0

ler:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t4, $v0

    bltz $t4, mostrar

    bgt $t4, 100, invalido

    ble $t4, 25, intervalo1

    ble $t4, 50, intervalo2

    ble $t4, 75, intervalo3

    addi $t3, $t3, 1
    j ler

intervalo1:
    addi $t0, $t0, 1
    j ler

intervalo2:
    addi $t1, $t1, 1
    j ler

intervalo3:
    addi $t2, $t2, 1
    j ler

invalido:
    li $v0, 4
    la $a0, msg2
    syscall

    j ler

mostrar:
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, msg5
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, msg6
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall