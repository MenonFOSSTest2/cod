#  data segment
.data
num1:  .word 0
num2:  .word 0
prompt: .asciiz "please type z integers,end each with:\n"
final:  .asciiz "is the sum,\n"
.text  #directive identifying the start of instruction
.globl _start
_start:
#print prompt on "console"
la $a0,prompt #address of prompt goss in
li $v0,4     #service code for print string syscall
#read in the integer
li $v0,5  #service code
syscall
sw $v0,num1 #store what was entered
#read another
li $v0,5#service code
syscall
sw $v0,num2 #store what was entered
#perform the addition,$a0:=num1+num2
lw $t0,num1
add $a0,$t0,$v0
#print the sum,it is in$a0
li $v0,1
syscall
#print a final string identifying the result
la $a0,final
li $v0,4
syscall
li $v0,10  #exit program service
syscall