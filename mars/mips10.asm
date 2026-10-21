#10. No Assembly MIPS, existe a operação REM que apresenta o resto da divisão de 2 valores inteiros.
# SEM UTILIZAR A OPERAÇÃO REM, faça um algoritmo usando DIV, MUL e SUB que receba 2 valores
# inteiros e exiba o resto da divisão do maior pelo menor (Condição que deve ser verificada no início
# do algoritmo.

.data
msg1: .asciiz "Digite o primeiro numero: "
msg2: .asciiz "Digite o segundo numero: "
msg3: .asciiz "Resto = "

.text
.globl main

main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0
    
    bgt $t0, $t1, A_maior

    move $t2, $t1
    move $t3, $t0
    j calcular

A_maior:
    move $t2, $t0
    move $t3, $t1

calcular:
    div $t2, $t3

    mflo $t4

    mul $t5, $t4, $t3

    sub $t6, $t2, $t5

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t6
    syscall

    li $v0, 10
    syscall