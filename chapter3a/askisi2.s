#############################
#	TMHMA DEDOMENWN
#############################

.text
.globl main
main:

li $t1,0	# i
li $t0,0	# p
lw $t2,N	# N
li $t5,0	# to i twn pinakwn... a'tropos

while:

bge $t1,$t2,exit

lb $t3,U($t5)	# $t3=U[i]
lb $t4,V($t5)	# $t4=V[i]

mul $t3,$t3,$t4
add $t0,$t0,$t3
add $t1,$t1,1
add $t5,$t5,4

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
U:	.word 1,2
V:	.word 3,4
CRLF:	.asciiz "\n"
ans:	.asciiz "Apotelesma= "



