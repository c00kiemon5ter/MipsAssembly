.text
.globl main
main:

la $a0,A
la $a1,B
lw $a2,N

jal scalpr

move $a0,$v0
li $v0,1
syscall

li $v0,10
syscall

scalpr:

###########################

addi $sp,$sp,-24

sw $s0,0($sp)	# i
sw $s1,4($sp)	# temp
sw $s2,8($sp)	# &A[i]
sw $s3,12($sp)	# A[i]
sw $s4,16($sp)	# &B[i]
sw $s5,20($sp)	# B[i]

###########################

li $s0,0	# i = 0
li $s1,0	# temp = 0

move $s2,$a0
move $s4,$a1

for:

bge $s0,$a2,done	# if ( i >= N ) goto done

lw $s3,($s2)	# s3 = A[i]
lw $s5,($s4)	# s5 = B[i]

mul $s3,$s3,$s5
add $s1,$s1,$s3

addi $s0,$s0,1
addi $s2,$s2,4
addi $s4,$s4,4
j for

###########################

done:
move $v0,$s1

lw $s0,0($sp)	# i
lw $s1,4($sp)	# temp
lw $s2,8($sp)	# &A[i]
lw $s3,12($sp)	# A[i]
lw $s4,16($sp)	# &B[i]
lw $s5,20($sp)	# B[i]

addi $sp,$sp,24

jr $ra

###########################

.data

A:	.word 1,2,3
B:	.word 4,5,6
N:	.word 3
CRLF:	.asciiz "\n"