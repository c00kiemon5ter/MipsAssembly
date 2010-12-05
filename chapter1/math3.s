#upologizei tin parastasi
#Z=A*X*X*X+B*X*X+C*X+D

#################################
#	TMHMA KEIMENOU	#
#################################

.text
.globl main
main:

#diavase to X
la $a0,prompt0
li $v0,4
syscall
li $v0,5
syscall
move $t1,$v0

#diavase to A
la $a0,prompt1
li $v0,4
syscall
li $v0,5
syscall
move $t2,$v0

#diavase to B
la $a0,prompt2
li $v0,4
syscall
li $v0,5
syscall
move $t3,$v0

#diavase to C
la $a0,prompt3
li $v0,4
syscall
li $v0,5
syscall
move $t4,$v0

#diavase to D
la $a0,prompt4
li $v0,4
syscall
li $v0,5
syscall
move $t5,$v0

#kane A*X*X
mul $t0,$t2,$t1
mul $t0,$t0,$t1

#kane B*X
mul $t6,$t3,$t1

#kane A*X*X+B*X+C
add $t0,$t0,$t6
add $t0,$t0,$t4

#kane (A*X*X+B*X+C)*X
mul $t0,$t0,$t1

#kane (A*X*X+B*X+C)*X+D
add $t0,$t0,$t5

#emfanise oti exei to ans
la $a0,ans
li $v0,4
syscall

#emfanise to apotelesma
move $a0,$t0
li $v0,1
syscall

#allakse grammi
la $a0,CRLF
li $v0,4
syscall

#teleiwse
li $v0,10
syscall

#################################
#	TMHMA DEDOMENWN	#
#################################

.data

prompt0:	.asciiz "Enter X: "
prompt1:	.asciiz "Enter A: "
prompt2:	.asciiz "Enter B: "
prompt3:	.asciiz "Enter C: "
prompt4:	.asciiz "Enter D: "

ans:	.asciiz "Value= "
CRLF:	.asciiz "\n"

#telos math2.s