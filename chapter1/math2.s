#upologizei ti parastasi
# (A*X+B)*(Y-C)

#################################
#	TMHMA KEIMENOU	#
#################################

.text
.globl main
main:

#kalei to sustima gia emfanisi tou prompt0
la $a0,prompt0
li $v0,4
syscall
#diavase to X
li $v0,5
syscall
move $t1,$v0

#diavase to Y
la $a0,prompt1
li $v0,4
syscall
li $v0,5
syscall
move $t2,$v0

#diavase to A
la $a0,prompt2
li $v0,4
syscall
li $v0,5
syscall
move $t3,$v0

#diavase to B
la $a0,prompt3
li $v0,4
syscall
li $v0,5
syscall
move $t4,$v0

#diavase to C
la $a0,prompt4
li $v0,4
syscall
li $v0,5
syscall
move $t5,$v0

#kane A*X
mul $t0,$t3,$t1

#kane A*X+B
add $t0,$t0,$t4

#kane Y-C
sub $t6,$t2,$t5

#kane (A*X+B)*(Y-C)
mul $t0,$t0,$t6

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
prompt1:	.asciiz "Enter Y: "
prompt2:	.asciiz "Enter A: "
prompt3:	.asciiz "Enter B: "
prompt4:	.asciiz "Enter C: "

ans:	.asciiz "Value= "
CRLF:	.asciiz "\n"

#telos math2.s


