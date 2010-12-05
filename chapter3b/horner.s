.text
.globl main
main:

# KLITIKI AKOLOUTHIA

la $a0,A
lw $a1,N
lw $a2,X

jal horner

# SUNEXEIA

move $a0,$v0
li $v0,1
syscall

la $a0,CRLF
li $v0,4
syscall

li $v0,10
syscall

# SUNARTISI HORNER

horner:

# PROLOGOS

sub $sp,$sp,12

sw $s0,0($sp)	# Px
sw $s1,4($sp)	# k
sw $s2,8($sp)	# A[k]

# SWMA 

sub $s1,$a1,1	# k = N - 1

mul $a1,$a1,4	# upologise ti dieuthinsi tou N ostou orou
add $a0,$a0,$a1	# apothikeuse tin sto $a0

lw $s0,($a0)	# fortwse to A[k] sto $s0

for:
bltz $s1,done	# if ( k < 0 ) goto done

sub $a0,$a0,4	# fortwse sto $s2
lw $s2,($a0)	# to A[k-1]

mul $s0,$s0,$a2
add $s0,$s0,$s2

sub $s1,$s1,1	# k--
j for

# EPILOGOS

done:
move $v0,$s0

lw $s0,0($sp)
lw $s1,4($sp)
lw $s2,8($sp)

addi $sp,$sp,12

jr $ra

########################
# TMHMA DEDOMENWN  #

.data

A:	.word 0,1,2,3,4
N:	.word 4
X:	.word 2

CRLF:	.asciiz "\n"



