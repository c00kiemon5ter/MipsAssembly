# if (X>=Y) 
# z=a*x+b
# else
# z=a*y+b


# TMHMA KEIMENOU

.text
.globl main
main:


# emfanise "Entrer X: "
la $a0,prompt0
li $v0,4
syscall
# apo8ikeuse to X sto $t1
li $v0,5
syscall
move $t1,$v0

# emfanise "Entrer Y: "
la $a0,prompt1
li $v0,4
syscall
# apo8ikeuse to Y sto $t2
li $v0,5
syscall
move $t2,$v0

# emfanise "Entrer A: "
la $a0,prompt2
li $v0,4
syscall
# apo8ikeuse to A sto $t3
li $v0,5
syscall
move $t3,$v0

# emfanise "Entrer B: "
la $a0,prompt3
li $v0,4
syscall
# apo8ikeuse to B sto $t4
li $v0,5
syscall
move $t4,$v0


# if X>=Y goto Exit
bge	$t1,$t2,exit

# else (if X<Y) z= a*y + b
mul $t0,$t3,$t2
add $t0,$t0,$t4

j exit2

exit:
# z= a*x + b
mul $t0,$t3,$t1
add $t0,$t0,$t4

la $a0,ans
li $v0,4
syscall

move $a0,$t0
li $v0,1
syscall

la $a0,CRLF
li $v0,4
syscall

li $v0,10
syscall

exit2:

la $a0,ans
li $v0,4
syscall

move $a0,$t0
li $v0,1
syscall

la $a0,CRLF
li $v0,4
syscall

li $v0,10
syscall

# TMHMA DEDOMENWN

prompt0:	.asciiz "Enter X: "
prompt1:	.asciiz "Enter Y:"
prompt2:	.asciiz "Enter A: "
prompt3:	.asciiz "Enter B: "

ans:	.asciiz "Z= "
CRLF:	.asciiz "\n"

# telos programmatos

