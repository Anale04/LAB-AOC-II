.data
espaco: .asciiz " "
resultado: .asciiz "O resultado eh: "
.text
.globl main

main:
    # Inicializa os valores de base e exp
    li $a0, 2    # base
    li $a1, 3    # exp
    
    # Chama a função power
    jal power
    move $s0, $v0   # Armazena o resultado da função power em $s0

    # Exibe a mensagem "O resultado eh: "
    li $v0, 4
    la $a0, resultado
    syscall

    # Exibe o resultado
    li $v0, 1
    move $a0, $s0
    syscall

    # Exibe um espaço em branco
    li $v0, 4
    la $a0, espaco
    syscall

    # Finaliza o programa
    li $v0, 10
    syscall

power:
    # Inicializa as variáveis locais
    li $t0, 0       # i = 0
    li $v0, 1       # res = 1 (armazenado em $v0)
    
Loop:
    # Se i >= exp, saia do loop
    bge $t0, $a1, Retorna

    # res *= base
    mul $v0, $v0, $a0

    # i++
    addi $t0, $t0, 1

    # Volta para o início do loop
    j Loop

Retorna:
    # Retorna para a função chamadora
    jr $ra
