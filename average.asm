.data
    array1: .word 1, 2 , 3 , 4 , 5 , 6 , 7 , 8 ,9 , 10  
    array2: .word 7, 2 , 5 , 11 , 4 , 6, 1 , 1 , 8 , 3     
    size: .word 10
    size_as_float: .float 10                         
    average1: .float 0.0                                
    average2: .float 0.0                                     
    message: .asciiz "Average is: "  

.text
main:
    
    la $t0, array1       
    lw $t1, size        
    li $t2, 0           #sum
    li $t3, 0           #idx

loop1:
    beq $t3, $t1, end_loop1  
    lw $t4 , 0($t0)
    add $t2 , $t2 , $t4
    addi $t0 , $t0 , 4
    addi $t3 , $t3 , 1
    j loop1
end_loop1:
    mtc1 $t2, $f0                    # moving the value of sum to $f0 which is the float register
    cvt.s.w $f0, $f0                 # convert the sum to float
    l.s $f1, size_as_float
    div.s $f2, $f0, $f1
    swc1 $f2, average1              
    
######################################################################
# second array
######################################################################
    la $t0, array2       
    lw $t1, size        
    li $t2, 0           #sum
    li $t3, 0           #idx

loop2:
    beq $t3, $t1, end_loop2 
    lw $t4 , 0($t0)
    add $t2 , $t2 , $t4
    addi $t0 , $t0 , 4
    addi $t3 , $t3 , 1
    j loop2
end_loop2:
    mtc1 $t2, $f0                    # moving the value of sum to $f0 which is the float register
    cvt.s.w $f0, $f0                 # convert the sum to float
    l.s $f1, size_as_float
    div.s $f2, $f0, $f1
    swc1 $f2, average2     

#avg1
    
    la $a0, message          
    li $v0, 4                
    syscall
    
    li $v0, 2
    lwc1 $f12, average1      
    syscall
    
    li $a0, '\n'  
    li $v0, 11        
    syscall
    
#avg2
    
    la $a0, message          
    li $v0, 4                
    syscall
    
    li $v0, 2
    lwc1 $f12, average2
    syscall
    
    li $a0, '\n'  
    li $v0, 11        
    syscall
    
    