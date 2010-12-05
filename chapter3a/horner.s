.text
.globl main
main:

la $t0,P
lw $t2,N
lw $t1,($t2)	# Y = P[N]
sub $t3,$t2,1	# i = N - 1
lw $t4,X

while:

bltz $t3,exit

mul $t1,$t1,$t4
sub $t0,$t0,4
lw $t5,($t0)
add $t1,$t1,$t5
sub $t3,$t3,1

j while

exit:

la $a0,ans
li $v0,4
syscall
move $a0,$t1
li $v0,1
syscall
la $a0,CRLF
li $v0,4
syscall
li $v0,10
syscall


.data

X:	.word 2
N:	.word 16
P:	.word 1,2,3,4,5,6,7,8,9,0,11,45,-234,4564,25,-35
ans:	.asciiz "Y= "
CRLF:	.asciiz "\n"



