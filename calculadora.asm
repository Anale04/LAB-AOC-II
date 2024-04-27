.data
operando: .asciiz "\n Digite o primeiro operando: "
prompt_operand2: .asciiz "\n Digite o segundo operando: "
operacao: .asciiz "\n Digite a operacao (+, -, *, /): "
resultado: .asciiz "\n Resultado: "

.text
main:

	jal operando
	move $s0, $v0

	jal operando
	move $s1, $v0

	jal operacao
	move $s2, $v0

	beq $s2, 43, add_op
	beq $s2, 45, sub_op
	beq $s2, 42, mul_op
	beq $s2, 47, div_op

	li $v0, 10
	syscall

	add_op:
	add $v0, $s0, $s1 # Adição
	 print_r

	sub_op:
	sub $v0, $s0, $s1 # Subtração
	j print_r

	mul_op:
	mul $v0, $s0, $s1 # Multiplicação
	j print_r

	div_op:
	div $s0, $s1 # Divisão
	mflo $v0
	j print_r

	print_r:

	move $t0, $v0
	li $v0, 4
	la $a0, resultado
	syscall

	li $v0, 1
	la $a0, ($t0)
	syscall

	li $v0, 10
	syscall

	operando:
	li $v0, 4
	la $a0, operando
	syscall

	li $v0, 5
	syscall

	jr $ra

	operacao:
	li $v0, 4
	la $a0, operacao
	syscall

	li $v0, 12
	syscall

	jr $ra