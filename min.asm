.data
Array1:       .word 10, 31, 5, 7, 11, 3, 8, 40, 12, 4  
Array2:       .word 11, 2, 3, 7, 5, 10, 9, 22, 6, 1    
arraySize:    .word 10                                 
minResult1:   .word 0                                 
minResult2:   .word 0                                 
msg:          .asciiz "Min element is: "      
newline:      .asciiz "\n"                            

.text
.globl main

main:
    la   $t0, Array1           
    lw   $t1, arraySize        
    lw   $t2, 0($t0)           
    li   $t3, 1                

loop1:
    bge  $t3, $t1, end_loop1   
    sll  $t4, $t3, 2           
    add  $t4, $t4, $t0         
    lw   $t5, 0($t4)           
    blt  $t5, $t2, update_min1 
    j    skip_update1          

update_min1:
    move $t2, $t5              

skip_update1:
    addi $t3, $t3, 1           
    j    loop1                 

end_loop1:
    la   $t6, minResult1       
    sw   $t2, 0($t6)           

    la   $t0, Array2           
    lw   $t1, arraySize        
    lw   $t2, 0($t0)           
    li   $t3, 1                

loop2:
    bge  $t3, $t1, end_loop2   
    sll  $t4, $t3, 2           
    add  $t4, $t4, $t0         
    lw   $t5, 0($t4)           
    blt  $t5, $t2, update_min2 
    j    skip_update2          

update_min2:
    move $t2, $t5              

skip_update2:
    addi $t3, $t3, 1           
    j    loop2                 

end_loop2:
    la   $t6, minResult2       
    sw   $t2, 0($t6)           

    # Print result for Array1
    la   $a0, msg              
    li   $v0, 4                
    syscall                   

    la   $a0, minResult1       
    lw   $a0, 0($a0)           
    li   $v0, 1                
    syscall                   

    la   $a0, newline          
    li   $v0, 4                
    syscall                   

    la   $a0, msg              
    li   $v0, 4                
    syscall                   

    la   $a0, minResult2       
    lw   $a0, 0($a0)           
    li   $v0, 1                
    syscall                   

    la   $a0, newline          
    li   $v0, 4                
    syscall                   

    li   $v0, 10               
    syscall
