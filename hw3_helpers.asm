https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
.data
temp_array: .space 100


.text
	
toUpper:
	move $t0, $a0
__toUpper_loop:
    lb $t1, 0($t0)
    beqz $t1, __toUpper_done	
    
	li $t7, 122
    bgt $t1, $t7, __toUpper_noChange 
	li $t7, 95
    blt $t1, $t7, __toUpper_noChange
    
    addi $t1, $t1, -32 
    sb $t1, 0($t0)
__toUpper_noChange:
	addi $t0, $t0, 1
	j __toUpper_loop
	
__toUpper_done:
	move $v0, $a0
	jr $ra 



delimstrlen:
	move $t0, $a0
	# ERROR in original basecode - lb $t3, 0($a1) needes to be replaced with 
    move $t3, $a1
	li $t1, 0	
	
__delimstrlen_loop:
    lb $t2, 0($t0)
    beq $t2, $t3, __delimstrlen_done	
    beq $t2, $0, __delimstrlen_done	
    
    addi $t0, $t0, 1	
    addi $t1, $t1, 1	
	j __delimstrlen_loop	
__delimstrlen_done:
	move $v0, $t1
	jr $ra

