.text
.globl main
main:

la $t0,Y
lw $t1,N

lw $t2,($t0)
lw $t3,($t0)

li $t4,1

while:

bge $t4,$t1,exit

add $t0,$t0,4
lw $t5,($t0)

bge $t2,$t5,lbl1	# if max >= Y[i] goto lbl1
move $t2,$t5	# else max = Y[i]

lbl1:
ble $t3,$t5,lbl2
move $t3,$t5

lbl2:
add $t4,$t4,1

j while

exit:

la $a0,ans1
li $v0,4
syscall

move $a0,$t2
li $v0,1
syscall

la $a0,CRLF
li $v0,4
syscall

la $a0,ans2
li $v0,4
syscall

move $a0,$t3
li $v0,1
syscall

la $a0,CRLF
li $v0,4
syscall

li $v0,10
syscall

.data

Y:	.word 1,2,3,4,5,6,7,8,9,0
N:	.word 10
CRLF:	.asciiz "\n"
ans1:	.asciiz "Max is "
ans2:	.asciiz "Min is "

