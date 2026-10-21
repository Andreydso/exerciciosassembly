#9.Fazer um algoritmo que leia 2 números inteiros e exiba a divisão destes. Sabe-se que o 2o número
# não pode ser zero, portanto, deve-se insistir na solicitação do 2o número até ele ser diferente de 0

.data
msg1: .asciiz "Digite o primeiro numero: "
msg2: .asciiz "Digite o segundo numero (diferente de 0): "
msg3: .asciiz "Divisao = "
msg4: .asciiz "\nNumero invalido! "

.text
.globl main

main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

lerSegundo:
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    beq $t1, $zero, invalido

    div $t0, $t1
    mflo $t2

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall

invalido:
    li $v0, 4
    la $a0, msg4
    syscall

    j lerSegundo