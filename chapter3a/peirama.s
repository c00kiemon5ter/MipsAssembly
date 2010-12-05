.text
.globl main
main:


li $t1,0
li $t2,0
lw $t3,N

again:

bge $t2,$t3,exit 	# if t2 >= 7 goto exit 

lb $t0,Y($t1)
add $t1,$t1,4
add $t2,$t2,1

move $a0,$t0
li $v0,1
syscall

la $a0,CRLF
li $v0,4
syscall

j again

exit:

la $a0,end
li $v0,4
syscall

li $v0,10
syscall

.data

Y:	.word 1,2,3,4,5,6,7,8,9,0
CRLF:	.asciiz "\n"
end:	.asciiz "telos"
N:	.word 7

