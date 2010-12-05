.text
.globl main
main:

#################

la $a0,A
lw $a1,p
lw $a2,u
lw $a3,X

jal belong

#################

move $a0,$v0
li $v0,1
syscall
li $v0,10
syscall

#################

belong:
addi $sp,$sp,-12

sw $s0,0($sp)	# &A[p]
sw $s1,4($sp)	# A[p]
sw $ra,8($sp)

#################

# move $s0,$a1	# s0 = p
# mul $s0,$s0,4	# s0 = p*4 
# add $s0,$s0,$a0	# s0 = &A[p]

move $s0,$a0
lw $s1,($s0)	# s1 = A[p]

beq $a3,$s1,R1
beq $a1,$a2,R0

addi $s0,$s0,4
addi $a0,$a0,1
move $a0,$s0
jal belong

#################

R1: 
li $v0,1
j done

R0: 
li $v0,0
j done

#################

done:

lw $s0,0($sp)
lw $s1,4($sp)
lw $ra,8($sp)

addi $sp,$sp,12

jr $ra

#################

.data

A:	.word 10,20,30,40,50,60,70,80,90,100
p:	.word 2
u:	.word 6
X:	.word 60


