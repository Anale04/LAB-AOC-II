.data
espaco: .asciiz " "
resultado: .asciiz "O resultado eh: "
.text
.globl main

main:
    # Inicializa os valores de x e exp
    li $a0, 5   # x
    li $a1, 3   # exp
    
    # Chama a função multiplyByPowerOfTwo
    jal multiplybypoweroftwo
    move $s0, $v0   # Armazena o resultado da função multiplyByPowerOfTwo em $s0

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

multiplybypoweroftwo:
    # Calcula x << exp
    sllv $v0, $a0, $a1   # $v0 = x << exp (shift left variable)
    
    # Retorna para a função chamadora
    jr $ra
