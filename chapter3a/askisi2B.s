#############################
#	TMHMA DEDOMENWN
#############################

.text
.globl main
main:

li $t1,0	# i
li $t0,0	# p
lw $t2,N	# N

la $t3,U
la $t4,V

while:

bge $t1,$t2,exit

lw $t5,($t3)
lw $t6,($t4)

mul $t5,$t5,$t6
add $t0,$t0,$t5
add $t1,$t1,1
addi $t3,$t3,4
addi $t4,$t4,4

j while

exit:

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


##########################
#	TMHMA KEIMENOU
##########################

.data

N:	.word 2
U:	.word 2,1
V:	.word 4,3
CRLF:	.asciiz "\n"
ans:	.asciiz "Apotelesma= "



