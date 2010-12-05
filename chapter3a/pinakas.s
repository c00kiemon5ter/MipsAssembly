.text
.globl main
main:

la $t0,A
lw $t1,N

sub $t2,$t1,2		# t2= j = N-2

forJ:

bltz $t2,exit 		# if j<0 goto exit

li $t3,0			# t3= i = 0

forI:

bgt $t3,$t2,lbl1		# if i>j goto lbl1

lw $t4,($t0)		# t4=A[i]
add $t0,$t0,4		# epomeno stoixeio tou pinaka A
lw $t5,($t0)		# t5=A[i+1]

ble $t4,$t5,lbl2		# if A[i]<=A[i+1] goto lbl2

move $t6,$t4		# t6 = B = A[i]
move $t4,$t5		# t4 = A[i] = A[i+1]
move $t5,$t6		# t5 = A[i+1] = B

lbl2:
add $t3,$t3,1		# i++

j forI

lbl1:
sub $t2,$t2,1		# j--

j forJ

exit:

la $a0,ans		# emfanise to ans
li $v0,4
syscall

move $a0,$t0		# emfanise to pinaka
li $v0,1
syscall

la $a0,CRLF		# allakse seira
li $v0,4
syscall

li $v0,10			# termatise
syscall

.data

A:	.word 2,4,6,8,10,1,3,5,7,9
N:	.word 10
ans:	.asciiz "O taksinomimenos pinakas:\n"
CRLF:	.asciiz "\n"

#telos
