#upologizei ti parastasi
# (A-1)*X+B-3

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

#Vale ton aritmo 1 kai 3
lw $t4,num1
lw $t5,num3

#kane (A-1)*X+B-3
sub $t0,$t2,$t4
mul $t0,$t0,$t1
add $t0,$t0,$t3
sub $t0,$t0,$t5

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

num1:	.word 1
num3:	.word 3

prompt0:	.asciiz "Enter X: "
prompt1:	.asciiz "Enter A: "
prompt2:	.asciiz "Enter B: "

ans:	.asciiz "Value= "
CRLF:	.asciiz "\n"

#telos math2.s
