findmin:
    addi $sp, $sp, -8        # Allocate stack space
    sw   $s2, 4($sp)         # Save s2
    sw   $s1, 0($sp)         # Save s1 (will store min)

    addi $t0, $zero, 1       # i = 1
    addi $t2, $a0, 0         # p = a (pointer to first array element)
    lw   $s1, 0($t2)         # min = *p

LOOP:
    beq  $t0, $a1, END       # if i == length, exit loop
    addi $t2, $t2, 4         # p++
    lw   $s2, 0($t2)         # load *p
    slt  $t1, $s2, $s1       # t1 = 1 if *p < min
    beq  $t1, $zero, NEXT    # if *p >= min, skip update
    add  $s1, $s2, $zero     # min = *p

NEXT:
    addi $t0, $t0, 1         # i++
    jmp  LOOP                # repeat loop

END:
    add  $v0, $s1, $zero     # return min in v0
    lw   $s2, 4($sp)         # restore s2
    lw   $s1, 0($sp)         # restore s1
    addi $sp, $sp, 8         # deallocate stack
    jr   $ra                 # return
