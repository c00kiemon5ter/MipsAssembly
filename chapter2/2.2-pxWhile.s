# sel 160
# paradeigma programmatos Java

#TMHMA KEIMENOU

.text
.globl main
main:

# Diavase kai api8ikeuse to N sto $t1
la $a0,prompt0
li $v0,4
syscall
li $v0,5
syscall
move $t1,$v0

sw $0,sum	# sum = 0

li $t2,1		# fwrtwse to 1

sw $t2,i		# i = 1

again:

bgt	$t2,$t1,exit	# an i > N goto Exit
			#else
lw $t0,sum
add $t0,$t0,$t2		# sum = sum + i
sw $t0,sum

add $t2,$t2,1		# i = i + 1
sw $t2,i			# t2 = i(neo)

j again		# goto Again

exit:

la $a0,ans
li $v0,4
syscall

move $a0,$t0
li $v0,1
syscall

la $a0,CRLF
li $v0,4
syscall

li $v0,10
syscall


#TMHMA DEDOMENWN

.data

num1:	.word 1

prompt0:	.asciiz "Enter N: "

ans:	.asciiz "Value= "

CRLF:	.asciiz "\n"

# telos programmatos



