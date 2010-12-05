.text
.globl main
main:

# KLITIKI AKOLOUTHIA

la $a0,A		# A
lw $a1,p		# p
lw $a2,u		# u
lw $a3,X		# X

jal belongs


# SUNEXEIA

move $a0,$v0
li $v0,1
syscall

la $a0,CRLF
li $v0,4
syscall

li $v0,10
syscall

# SUNARTISI BELONGS

belongs:

# PROLOGOS

add $sp,$sp,-12

sw $s0,0($sp)	# A[u]
sw $s1,4($sp)	# A[p]
sw $ra,8($sp)

# SWMA

move $s0,$a1	# $s0 = p
mul $s0,$s0,4
add $s0,$s0,$a0	# $s0 = &A[p]

lw $s1,($s0)	# $s1 = A[p]

beq $a3,$s1,return1
beq $a1,$a2,return0

addi $a1,$a1,1
jal belongs

return0:
li $v0,0
j done

return1:
li $v0,1
j done

done:
lw $s0,0($sp)
lw $s1,4($sp)
lw $ra,8($sp)

addi $sp,$sp,12

jr $ra

#################################
# 	TMHMA DEDOMENWN	#


.data


A:	.word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
p:	.word 2
u:	.word 6
X:	.word 60
CRLF:	.asciiz "\n"



