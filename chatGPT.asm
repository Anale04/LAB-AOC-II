#include<stdio.h>
#int fatorial(int n){
#  if(n <= 1) return 1;
#  return n * fatorial(n-1);
#}

#int main(){
#  printf("%d", fatorial(10));
#  return 0;
#}

.data 
espaco: .asciiz  " "
resultado: .asciiz "O resultado eh: "
.text
.globl main 

main:
	li $a0, 10
	li $v0, 10
	jal fat
	
	saida:
	
	move $s0, $v0
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	li $v0, 10
	syscall
	
fat:
	beq $a0, 1, saida
	add $a0, $a0, -1
	mul $v0, $v0, $a0
	
	jal fat 
