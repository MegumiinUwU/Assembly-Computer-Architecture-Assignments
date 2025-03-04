.data
outputMessage1: .asciiz "Enter the current system: "
outputMessage2: .asciiz "Enter the number: "
outputMessage3: .asciiz "Enter the new system: "
outputMessage4: .asciiz "The number in the new system: "
errorMessage: .asciiz "Error: Invalid character for the current base.\n"
currentSystem: .word 0
strNumber: .space 32   
number: .word 0
newSystem: .word 0
output: .space 32
inverted: .space 32

.text
main:
    li $v0, 4
    la $a0, outputMessage1
    syscall
    
    li $v0, 5
    syscall
    sw $v0, currentSystem
    
    li $v0, 4
    la $a0, outputMessage2
    syscall
    
    li $v0, 8
    la $a0, strNumber
    li $a1, 32 
    syscall
    
    li $v0, 4
    la $a0, outputMessage3
    syscall
    
    li $v0, 5
    syscall
    sw $v0, newSystem
    
    
    la $a0, strNumber     
    lw $a1, currentSystem  
    jal OtherToDecimal
    
    beqz $v0, InvalidInput 
    

    move $a0, $v1         
    lw $a1, newSystem     
    jal DecimalToOther
    
    li $v0, 4
    la $a0, outputMessage4
    syscall
    
    li $v0, 4
    la $a0, output
    syscall
    
    li $v0, 10
    syscall
    
InvalidInput:
    li $v0, 4
    la $a0, errorMessage
    syscall
    li $v0, 10
    syscall

OtherToDecimal:
    # $a0 = input string address
    # $a1 = base
    li $t0, 0              
    li $t1, 0              
    move $t2, $a1          
Loop:
    move $t3, $a0          
    add $t4, $t3, $t1      
    lb $t5, 0($t4)         
    beqz $t5, End          
    beq $t5, 10, End       
    
    li $t6, 48             
    li $t7, 57             
    ble $t5, $t7, isDigit  
    
    li $t6, 65            
    li $t7, 90             
    ble $t5, $t7, isAlpha  
    
    j InvalidCharacter
isDigit:
    li $t6, 48             
    sub $t5, $t5, $t6      
    j checkBase
isAlpha:
    li $t6, 55             
    sub $t5, $t5, $t6      
    j checkBase
checkBase:
    blt $t5, $t2, addDigit 
    j InvalidCharacter     
addDigit:
    mul $t0, $t0, $t2      
    add $t0, $t0, $t5      
    addi $t1, $t1, 1       
    j Loop
InvalidCharacter:
    li $v0, 0  
    jr $ra
End:
    move $v1, $t0          
    li $v0, 1              
    jr $ra
    
DecimalToOther:
    # $a0 = decimal number
    # $a1 = new base
    la $t0, inverted
    li $t1, 0
    move $t2, $a1          
    move $t3, $a0          
    
Loopl:
    div $t3, $t2
    mflo $t4 
    mfhi $t5 
    move $t3, $t4 
    li $t6, 9
    bgt $t5, $t6, ToChar
    ble $t5, $t6, ToNumber
    
ToChar:
    li $t7, 55
    add $t5, $t5, $t7 
    j Append
    
ToNumber:
    li $t7, 48
    add $t5, $t5, $t7
    j Append
    
Append:
    sb $t5, 0($t0)        
    addi $t0, $t0, 1
    
    blez $t3, Endl
    j Loopl
    
Endl:
    sb $zero, 0($t0)
    
    la $t3, output   
    subi $t4, $t0, 1      
ReverseCopy:
    la $t6, inverted         
    blt $t4, $t6, EndReverse   
    lb $t5, 0($t4)              
    sb $t5, 0($t3)              
    addi $t3, $t3, 1            
    subi $t4, $t4, 1            
    j ReverseCopy
EndReverse:
    sb $zero, 0($t3)            
    la $t0, output         
    jr $ra