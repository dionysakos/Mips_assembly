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
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    la $t0, X
    addi $t1, $zero, 5
    sw $t1, 0($t0)

    addi $a0, $zero, 3
    jal network
    add $t1, $v0, $zero
    addi $t3, $zero, 230

    slt $t2, $t1, $t3
    bne $t2, $zero, one
seven:
    addi $v0, $zero, 7
    j end
one:
    addi $v0, $zero, 1
end:
    addi $sp, $sp, 4
    jr $ra


