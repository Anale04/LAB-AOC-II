.data
array: .word 34, 7, 23, 32, 15, 88, 26, 12, 29, 5   # vetor com 10 posições
min_msg: .asciiz "min="
max_msg: .asciiz "max="
newline: .asciiz "\n"

.text
.globl main
main:
    la $a0, array          # Carrega o endereço base do vetor em $s0
    li $t0, 0              # Inicializa o índice i = 0
    lw $t1, 0($a0)         # Inicializa $t1 com o primeiro elemento do vetor (min = array[0])
    lw $t2, 0($a0)         # Inicializa $t2 com o primeiro elemento do vetor (max = array[0])
    li $t3, 10             # Tamanho do vetor
    
loop:
    beq $t0, $t3, print_min_max  # Se i == 10, termina o loop
    
    lw $t4, 0($a0)         # Carrega o próximo elemento do vetor em $t4
    
    # Verifica se $t4 é menor que $t1 (atual min)
    slt $t5, $t4, $t1
    bne $t5, $zero, update_min
    
    # Verifica se $t4 é maior que $t2 (atual max)
    slt $t5, $t2, $t4
    bne $t5, $zero, update_max
    
    j increment_index
    
update_min:
    move $t1, $t4          # Atualiza o valor mínimo
    j increment_index

update_max:
    move $t2, $t4          # Atualiza o valor máximo
    j increment_index

increment_index:
    addi $t0, $t0, 1       # Incrementa o índice i
    addi $a0, $a0, 4       # Move para o próximo elemento do vetor
    j loop

print_min_max:
    # Print do mínimo
    li $v0, 4              # Código da syscall para imprimir string
    la $a0, min_msg        # Carrega o endereço da string "min="
    syscall

    li $v0, 1              # Código da syscall para imprimir inteiro
    move $a0, $t1          # Carrega o mínimo em $a0
    syscall

    # Nova linha
    li $v0, 4              # Código da syscall para imprimir string
    la $a0, newline        # Carrega o endereço da string de nova linha
    syscall

    # Print do máximo
    li $v0, 4              # Código da syscall para imprimir string
    la $a0, max_msg        # Carrega o endereço da string "max="
    syscall

    li $v0, 1              # Código da syscall para imprimir inteiro
    move $a0, $t2          # Carrega o máximo em $a0
    syscall

    li $v0, 10             # Encerra o programa
    syscall