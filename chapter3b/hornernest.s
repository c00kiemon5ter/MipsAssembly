.text
.globl main
main:

#################

la $a0,A
lw $a1,N
lw $a2,X

jal hornernest

#################

move $a0,$v0
li $v0,1
syscall
la $a0,CRLF
li $v0,4
syscall
li $v0,10
syscall

#################

hornernest:

addi $sp,$sp,-16

sw $s0,0($sp)	# Px
sw $s1,4($sp)	# &A[i]
sw $s2,8($sp)	# A[i]
sw $s3,12($sp)	# k

#################

addi $s3,$a1,-1

# move $s1,$a0
# mul $a1,$a1,4
# add $s1,$s1,$a1
# lw $s0,($s1)
mul $a1,$a1,4
add $a0,$a0,$a1
lw $s0,($a0)

for:
bltz $s3,done

# sub $s1,$s1,4
# lw $s2,($s1)
sub $a0,$a0,4
lw $s2,($a0)

mul $s0,$s0,$a2
add $s0,$s0,$s2

sub $s3,$s3,1
j for

#################
done:
move $v0,$s0

lw $s0,0($sp)
lw $s1,4($sp)
lw $s2,8($sp)
lw $s3,12($sp)
addi $sp,$sp,12

jr $ra

#################

.data

A:	.word 0,1,2,3,4
N:	.word 4
X:	.word 2
CRLF:	.asciiz "\n"