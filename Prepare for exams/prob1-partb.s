neuron:
    prologue:
        addiu $sp, $sp, -4
        sw $s1, 0($sp)
    body:
        addi $t0, $zero, 0
        add $s1,$zero, $a3 
    loop:
        beq $t0, $a2, end
        sll $t1,$t0, 2
        add $t2, $a0, $t1
        lw $t3, 0($t2)
        add $t2, $a1, $t1
        lw $t4, 0($t2)
        mul $t5, $t3, $t4
        add $s1,$s1, $t5
    next:
        addi $t0, $t0,1
        j loop
    end:
        slt $t1, $s1, $zero
        beq $t1, $zero, epilogue
        add $s1, $zero, $zero
    epilogue:
        add $v0, $zero, $s1
        lw $s1, 0($sp)
        addiu $sp, $sp, 4
        jr $ra

