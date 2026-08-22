network:
    addi $sp, $sp, -20       
    sw   $ra, 16($sp)              
    sw   $s3, 12($sp)       
    sw   $s2, 8($sp)     
    sw   $s1, 4($sp)         
    sw   $s0, 0($sp)        

    addi $t0, $zero, 1      
    la   $s0, X             
    la   $s1, W              
    la   $s2, B              
    la   $s3, LAYERS           
    add  $t1, $zero, $zero

loop:
    beq $t0, $a0, end
    addiu $t2, $t0, -1

    sll $t3, $t0, 2
    sll $t2, $t2, 2
    add $t5, $t2, $s3
    add $t6, $t3, $s3

    lw $t2, 0($t5)
    lw $t3, 0($t6)

    add $t4, $zero, $zero

j_loop:  
    beq $t4, $t3, end_j
    add $a0, $zero, $s1

    add $t6, $t1, $t4
    add $t6, $t6, $t2

    sll $t5, $t1, 2
    add $t5, $t5, $s0
    add $a1, $zero, $t5
    add $a2, $zero, $t2
    add $t7, $zero, $s2
    lw $a3, 0($t7)

    addi $sp, $sp, -28       
    sw   $t6, 24($sp)              
    sw   $t5, 20($sp)       
    sw   $t4, 16($sp)     
    sw   $t3, 12($sp)         
    sw   $t2, 8($sp) 
    sw   $t1, 4($sp)              
    sw   $t0, 0($sp)        
     
    jal neuron  

    lw   $t6, 24($sp)              
    lw   $t5, 20($sp)       
    lw   $t4, 16($sp)     
    lw   $t3, 12($sp)         
    lw   $t2, 8($sp) 
    lw   $t1, 4($sp)              
    lw   $t0, 0($sp)

    addi $sp, $sp, 28 

    sll $t6, $t6, 2
    add $t5, $s0, $t6
    sw $v0, 0($t5)

    sll $t7, $t2, 2
    add $s1, $s1, $t7
    addi $s2, $s2, 4
    addi $t4, $t4, 1
    j j_loop

end_j:
    add $t1, $t1, $t2
    addi $t0, $t0, 1
    j loop
end:
    sll $t1, $t1, 2
    add $t2, $t1, $s0
    lw $t3, 0($t2)
    add $v0, $zero, $t3

    lw   $ra, 16($sp)              
    lw   $s3, 12($sp)       
    lw   $s2, 8($sp)     
    lw   $s1, 4($sp)         
    lw   $s0, 0($sp)

    addiu $sp,$sp, 20
    jr $ra






