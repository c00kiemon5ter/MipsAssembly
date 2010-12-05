# if (X < 0) z=-1
# else if (X ==0) z=0;
# else if (X>0) z=1;

.text
.globl main
main:

lw $t1,X

bgez	$t1,l1

sw $t0,A
#sw $t0,Z
j exit

l1:

bnez	$t1,l2

sw $t0,ZR
#sw $t0,Z
j exit

l2:

li $t2,1
sw $t2,T
#sw $t0,Z

exit:

la $a0,ans
li $v0,4
syscall

move $a0,$t2
li $v0,1
syscall

#la $a0,CRLF
#li $v0,4
#syscall

li $v0,10
syscall


# tmima data

.data

T:	.asciiz "Thetikos"
A:	.asciiz "Arnitikos"
ZR:	.asciiz "Miden"
X:	.word 5
#Z:	.asciiz "Z"
ans:	.asciiz "Z= "
#CRLF	.asciiz "\n"

# telos