.data
array1:     .word 10, 31, 5, 7, 11, 3, 8, 40, 12, 4  
array2:     .word 19, 2, 3, 7, 5, 10, 9, 0, 6, 1     
size:       .word 10                                 
count1:.word 0                                  
count2:.word 0                                                           
message:    .asciiz "Count of even numbers is: "  
newline: .asciiz "\n"

.text
.globl main

main:
    
    la $t0, array1       
    lw $t1, size        
    li $t2, 0           
    li $t3, 0           

loop:
    beq $t2, $t1, end_loop   

    lw $t4, 0($t0)           
    rem $t5, $t4, 2          
    bne $t5, $zero, not_even 

    addi $t3, $t3, 1         

not_even:
    addi $t2, $t2, 1         
    addi $t0, $t0, 4        
    j loop                   

end_loop:
    
    sw $t3, count1


    la $t0, array2        
    li $t2, 0             
    li $t3, 0 

loop2:
    lw $t1, size          
    beq $t2, $t1, end2    

    lw $t4, 0($t0)        
    rem $t5, $t4, 2       
    bne $t5, $zero, not_even2 

    addi $t3, $t3, 1      

not_even2:
    addi $t2, $t2, 1      
    addi $t0, $t0, 4      
    j loop2               

end2:
    
    sw $t3, count2



    
    la $a0, message          
    li $v0, 4                
    syscall
    
    lw $a0, count1   
    li $v0, 1             
    syscall
    
    la $a0, newline   
    li $v0, 4         
    syscall
    
    
    la $a0, message          
    li $v0, 4                
    syscall
    
    lw $a0, count2
    li $v0, 1             
    syscall

    li $v0, 10            
    syscall