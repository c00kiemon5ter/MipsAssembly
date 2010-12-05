.text
.globl main
main:

# KLITIKI

la $a0,A
lw $a1,N

jal buble
jal print

# SUNEXEIA

li $v0,10
syscall

# PROLOGOS

buble:

addi $sp,$sp,-24

sw $s0,0($sp)	# j
sw $s1,4($sp)	# i
sw $s2,8($sp)	# &A[i]
sw $s3,12($sp)	# A[i]
sw $s4,16($sp)	# &A[i+1]
sw $s5,20($sp)	# A[i+1]

# SWMA

addi $s0,$a1,-2	# j = N - 2

forJ:
bltz $s0,done	# if ( j < 0 ) goto done
li $s1,0		# i = 0

forI:
bgt $s1,$s0,counterJ	# if ( i > j ) goto counters

# ------
mul $s2,$s1,4
add $s2,$s2,$a0
lw $s3,($s2)

add $s4,$s2,4
lw $s5,($s4)
# -----

ble $s3,$s5,counterI		# if ( A[i] <= A[i+1] ) goto counters
sw $s5,($s2)
sw $s3,($s4)

counterI:
addi $s1,$s1,1	# i++
j forI

counterJ:
addi $s0,$s0,-1	# j--
j forJ

# EPILOGOS

done:
lw $s0,0($sp)	# j
lw $s1,4($sp)	# i
lw $s2,8($sp)	# &A[i]
lw $s3,12($sp)	# A[i]
lw $s4,16($sp)	# &A[i+1]
lw $s5,20($sp)	# A[i+1]

addi $sp,$sp,24

jr $ra

#######################################

# PROLOGOS

print:

addi $sp,$sp,-12
sw $s0,0($sp)	# i
sw $s1,4($sp)	# &A[i]
sw $s2,8($sp)	# A[i]

# SWMA

li $s0,0

for:	# for ( i=0; i<N; i++ )
bge $s0,$a1,exit

mul $s1,$s0,4
add $s1,$s1,$a0	# s1 = &A[i]
lw $s2,($s1)	# s2 = A[i]

move $a0,$s2
li $v0,1
syscall

li $v0,4
la $a0,CRLF
syscall

addi $s0,$s0,1
j print

# EPILOGOS

exit:
lw $s0,0($sp)	# i
lw $s1,4($sp)	# &A[i]
lw $s2,8($sp)	# A[i]

addi $sp,$sp,12

jr $ra

##############################################

.data

CRLF:	.asciiz "\n"
A:	.word 10,21,12,33,4,6,18,11,5,6
N:	.word 5


