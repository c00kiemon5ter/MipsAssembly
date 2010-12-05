# To programma mporei na ginei me 1500 tropous, autos einai enas arketa aplos. H wra einai 1:47

#---------------------------------
# TMHMA KEIMENOU
#--------------------------------
.text
.globl main
main:

lw $t1,N	# N
la $t2,A	# A
li $t3,0	# i
li $t4,0	# sum
li $t5,0 	# mean

while:
beq $t3,$t1,exit	# if i=N goto exit

lw $t0,($t2)	# t0 = A[0]
add $t4,$t4,$t0	# t4 = t4 + A[0]

add $t2,$t2,4	# t2 = t2 + 4 => A[0]--> A[1]
add $t3,$t3,1	# i = i+1
j while		# goto while - ulopoiisi tis loop

exit:
div $t5,$t4,$t1	# t5 = t4/N

move $a0,$t5	# apotelesma
li $v0,1		# emfanisi
syscall

la $a0,CRLF	# allagi grammis
li $v0,4		# emfanisi
syscall

li $v0,10		# termatismos
syscall

#----------------------------------------------
# TMHMA DEDOMENWN
#---------------------------------------------

.data

N:	.word 3		# N = 3
A:	.word 2,4,6	# A = {2 , 4, 6}
CRLF:	.asciiz "\n"	# CRLF = allagi grammis

