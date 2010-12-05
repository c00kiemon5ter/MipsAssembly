  .text 
  .globl main 
main: 
  la $a0,prompt 
  li $v0,4 
  syscall 

  li $v0,5 
  syscall 

  move $t1,$v0 

  bgtz $t1,emfanish_thetikou 
  bltz $t1,emfanish_arnhtikou 
  beqz $t1,exit 

emfanish_thetikou: 
  la $a0,thetikos 
  li $v0,4 
  syscall 
  j main 

emfanish_arnhtikou: 
  la $a0,arnhtikos 
  li $v0,4 
  syscall 
  j main 

exit: 
  la $a0,telos 
  li $v0,4 
  syscall 

  li $v0,10 
  syscall 

  .data 
prompt: .asciiz "Dwse arithmo:\n" 
thetikos: .asciiz "thetikos\n" 
arnhtikos: .asciiz "arnhtikos\n" 
telos: .asciiz "telos programmatos\n"