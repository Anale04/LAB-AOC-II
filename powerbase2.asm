.data
espaco: .asciiz " "
resultado: .asciiz "O resultado eh: "
.text
.globl main

main:
    # Inicializa o valor de exp
    li $a0, 3   # exp
    
    # Chama a função powerBase2
    jal powerBase2
    move $s0, $v0   # Armazena o resultado da função powerBase2 em $s0

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

powerBase2:
    # Calcula 2 << exp
    li $t0, 2       # carrega 2 em $t0
    sllv $v0, $t0, $a0   # $v0 = 2 << exp (shift left variable)
    
    # Retorna para a função chamadora
    jr $ra
