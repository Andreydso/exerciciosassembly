#7.Faça um algoritmo que leia uma variável e some 5, caso seja par ou some 8, caso seja ímpar,
# imprimir o resultado desta operação.

.data
msg1: .asciiz "Digite um numero: "
msg2: .asciiz "Resultado = "

.text
.globl main

main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 2
    div $t0, $t1
    mfhi $t2

    beq $t2, $zero, par

    addi $t0, $t0, 8
    j mostrar

par:
    addi $t0, $t0, 5

mostrar:
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall