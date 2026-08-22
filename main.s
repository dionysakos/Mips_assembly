.data

# Input feature vector
X:      .word 0, 50, 20, 0, 0, 0   # X[0] will be set at runtime

# Layer sizes
LAYERS: .word 3, 2, 1

# Weights
W:      .word -2, 5, 3, -5, 2, 2, 1, 1

# Biases
B:      .word 0, 0, 0

.text
.globl main

main:
    addi $sp, $sp, -4        # Allocate stack
    sw   $ra, 0($sp)         # Save return address

    la   $t0, X              # Load address of X[0]
    addi $t1, $zero, 5       # Input value (YZ)
    sw   $t1, 0($t0)         # X[0] = YZ

    addi $a0, $zero, 3       # num_layers = 3
    jal  network             # call network

    addi $t2, $zero, 230     # classification threshold
    slt  $t0, $v0, $t2       # t0 = 1 if output < threshold
    bne  $t0, $zero, ONE
    j    SEVEN

ONE:
    addi $v0, $zero, 1       # return class 1
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra

SEVEN:
    addi $v0, $zero, 7       # return class 7
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra
