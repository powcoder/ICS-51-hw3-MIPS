https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
.include "hw3_netid.asm"

##############################################################
# Do NOT place any code in this file!
# This file is NOT part of your homework 3 submission.
#
# Modify this file or create new files to test your functions.
##############################################################

.data
str_input: .asciiz "Input: "
str_result: .asciiz "Result: "
str_return: .asciiz "Function Returned: "

# tbears
tbears_header: .asciiz "\n\n********* tbears *********\n"
tbears_inital: .word 99
tbears_goal: .word 93
tbears_increment: .word 53
tbears_n: .word 4

# countSubstrs
countSubstrs_header: .asciiz "\n\n********* countSubstrs *********\n"
countSubstrs_str: .asciiz "abcab"
.align 2
#countSubstrs_i: .word 0   # always 0 to start at front of string
#countSubstrs_j: .word 4   # length of string -1
#countSubstrs_n: .word 5   #length of string

countSubstrs_i: .word 0   # always 0 to start at front of string
countSubstrs_j: .word 2   # length of string -1
countSubstrs_n: .word 3   #length of string



.text
.globl main

main:

    ############################################
    # TEST CASE for tbears
    ############################################

    li $v0, 4
    la $a0, tbears_header
    syscall

    la $a0, tbears_inital
	lw $a0, 0($a0)
    la $a1, tbears_goal
	lw $a1, 0($a1)
    la $a2, tbears_increment
	lw $a2, 0($a2)
    la $a3, tbears_n
	lw $a3, 0($a3)
    jal tbears

    move $t0, $v0
    li $v0, 4
    la $a0, str_return
    syscall
    li $v0, 1
    add $a0, $zero, $t0
    syscall
    li $v0, 11
    li $a0, '\n'
    syscall

    ############################################
    # TEST CASE for countSubstrs
    ############################################
    li $v0, 4
    la $a0, countSubstrs_header
    syscall
    
    la $a0, countSubstrs_str
    la $a1, countSubstrs_i
	lw $a1, 0($a1) 
    la $a2, countSubstrs_j
	lw $a2, 0($a2) 
    la $a3, countSubstrs_n
	lw $a3, 0($a3) 
    jal countSubstrs

    move $t1, $v0

    li $v0, 4
    la $a0, str_return
    syscall
    li $v0, 1
    add $a0, $zero, $t1
    syscall
    li $v0, 11
    li $a0, '\n'
    syscall
    

    # Exit main
    li $v0, 10
    syscall


