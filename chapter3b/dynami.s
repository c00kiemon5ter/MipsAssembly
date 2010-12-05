.text
.globl main
main:

#################

lw $a0,X
lw $a1,R

jal dynami

#################

move $a0,$v0
li $v0,1
syscall
li $v0,10
syscall

#################

dynami:

addi $sp,$sp,-12
sw $s0,0($sp)
sw $s1,4($sp)
sw $ra,8($sp)

#################

li $s0,1
li $s1,0

while:
bge $s1,$a1,done

mul $s0,$s0,$a0
addi $s1,$s1,1
j while

#################

done:
move $v0,$s0
lw $s0,0($sp)
lw $s1,4($sp)
lw $ra,8($sp)
addi $sp,$sp,12

jr $ra

#################

.data

X:	.word 5
R:	.word 3














