network:
    addi $sp, $sp, -24       # Allocate stack for s0–s4 and ra
    sw   $ra, 20($sp)        # Save return address
    sw   $s4, 16($sp)        # Save s4 (num_layers)
    sw   $s3, 12($sp)        # Save s3 (LAYERS pointer)
    sw   $s2, 8($sp)         # Save s2 (B pointer)
    sw   $s1, 4($sp)         # Save s1 (W pointer)
    sw   $s0, 0($sp)         # Save s0 (input pointer)

    addi $t0, $zero, 1       # layer = 1
    la   $s0, X              # s0 = input array
    la   $s1, W              # s1 = weights array
    la   $s2, B              # s2 = bias array
    la   $s3, LAYERS         # s3 = layers array
    add  $s4, $zero, $a0     # s4 = num_layers
    add  $t4, $zero, $zero   # offset = 0

LOOP:
    beq  $t0, $s4, END       # while (layer < num_layers)

    addi $t1, $t0, -1
    sll  $t1, $t1, 2
    add  $t1, $s3, $t1
    lw   $t5, 0($t1)         # n_in = LAYERS[layer-1]

    sll  $t1, $t0, 2
    add  $t1, $s3, $t1
    lw   $t6, 0($t1)         # n_out = LAYERS[layer]

    add  $t7, $zero, $zero   # j = 0

JLOOP:
    beq  $t7, $t6, OFFLOOP   # while (j < n_out)

    sll  $t1, $t4, 2
    add  $t1, $s0, $t1       # input base for layer

    lw   $t2, 0($s2)         # load bias
    add  $a0, $zero, $s1     # w pointer
    add  $a1, $zero, $t1     # input pointer
    add  $a2, $zero, $t5     # n_in
    add  $a3, $zero, $t2     # bias
    jal  neuron              # call neuron

    sll  $t1, $t4, 2
    sll  $t2, $t7, 2
    add  $t1, $t1, $t2
    sll  $t2, $t5, 2
    add  $t3, $t1, $t2
    add  $t1, $s0, $t3
    sw   $v0, 0($t1)         # store neuron output

    sll  $t1, $t5, 2
    add  $s1, $s1, $t1       # advance weights
    addi $s2, $s2, 4         # advance bias pointer
    addi $t7, $t7, 1         # j++
    j    JLOOP

OFFLOOP:
    addi $t4, $t4, $t5       # offset += n_in
    addi $t0, $t0, 1         # layer++
    j    LOOP

END:
    sll  $t1, $t4, 2
    add  $t1, $t1, $s0
    lw   $v0, 0($t1)         # return final output

    lw   $s0, 0($sp)
    lw   $s1, 4($sp)
    lw   $s2, 8($sp)
    lw   $s3, 12($sp)
    lw   $s4, 16($sp)
    lw   $ra, 20($sp)
    addi $sp, $sp, 24
    jr   $ra
