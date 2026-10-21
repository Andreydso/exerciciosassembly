#6.Faça um algoritmo que leia dois valores inteiros A e B se os valores forem iguais deverá se somar
# os dois, caso contrário multiplique A por B. Ao final de qualquer um dos cálculos deve-se atribuir o
# resultado para uma variável C e mostrar seu conteúdo na tela.

.data
msg1: .asciiz "Digite A: "
msg2: .asciiz "Digite B: "
msg3: .asciiz "C = "

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

    beq $t0, $t1, iguais

    mul $t2, $t0, $t1
    j mostrar

iguais:
    add $t2, $t0, $t1

mostrar:
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall