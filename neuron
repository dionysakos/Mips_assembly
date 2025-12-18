neuron:
    addi $sp, $sp, -8        # Allocate stack for ra and s0
    sw   $ra, 4($sp)         # Save return address
    sw   $s0, 0($sp)         # Save s0 (will store sum)

    add  $t0, $zero, $zero   # i = 0
    add  $s0, $a3, $zero     # sum = bias

LOOP:
    beq  $t0, $a2, RELU      # if i == n, exit loop
    sll  $t1, $t0, 2         # offset = i * 4
    add  $t2, $a0, $t1       # address of w[i]
    lw   $t3, 0($t2)         # load w[i]
    add  $t4, $a1, $t1       # address of x[i]
    lw   $t5, 0($t4)         # load x[i]
    mul  $t6, $t3, $t5       # w[i] * x[i]
    add  $s0, $s0, $t6       # sum += w[i] * x[i]
    addi $t0, $t0, 1         # i++
    j    LOOP                # repeat loop

RELU:
    slt  $t1, $s0, $zero     # t1 = 1 if sum < 0
    beq  $t1, $zero, END     # if sum >= 0, keep value
    add  $s0, $zero, $zero   # else sum = 0

END:
    add  $v0, $s0, $zero     # return sum in v0
    lw   $s0, 0($sp)         # restore s0
    lw   $ra, 4($sp)         # restore ra
    addi $sp, $sp, 8         # deallocate stack
    jr   $ra                 # return
