#2.Uma fábrica de camisetas produz os tamanhos pequeno, médio e grande, cada uma sendo vendida
# respectivamente por 10, 12 e 15 reais. Construa um algoritmo em que o usuário forneça a
# quantidade de camisetas pequenas, médias e grandes referentes a uma venda, e a máquina informe
# quanto será o valor arrecadado.

.data
msg1: .asciiz "Quantidade pequenas: "
msg2: .asciiz "Quantidade medias: "
msg3: .asciiz "Quantidade grandes: "
msg4: .asciiz "Valor total = R$ "

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

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    li $t3, 10
    mul $t0, $t0, $t3

    li $t3, 12
    mul $t1, $t1, $t3

    li $t3, 15
    mul $t2, $t2, $t3

    add $t4, $t0, $t1
    add $t4, $t4, $t2

    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall