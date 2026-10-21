#8.Encontrar o dobro de um número caso ele seja positivo e o seu triplo caso seja negativo,
# imprimindo o resultado.

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
    bgtz $t0, positivo
    mul $t0, $t0, 3
    j mostrar

positivo:
    mul $t0, $t0, 2

mostrar:
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall