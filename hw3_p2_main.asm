https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
.include "hw3_morsecode.asm"
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
str_return: .asciiz "Return: "

# toMorse
toMorse_header: .asciiz "\n\n********* toMorse *********\n"
toMorse_plaintext: .asciiz "ZoT!1-2"
toMorse_morsecodetext: .ascii "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#"
.asciiz "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"  # should never interact with these characters
.align 2
toMorse_size: .word 39

# createKey
createKey_header: .asciiz "\n\n********* createKey *********\n"
createKey_phrase: .asciiz "Computer Science is Fun."
createKey_secretKey: .space 26
.asciiz "\0^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"  # should never interact with these characters

# strNcmp
strNcmp_header: .asciiz "\n\n********* strNcmp *********\n"
strNcmp_mystr1: .asciiz "MIPS!!"
strNcmp_mystr2: .asciiz "MIPS - Millions.of.Instruction.Per...Second"
.align 2
strNcmp_N: .word 4

# morse2Key
morse2Key_header: .asciiz "\n\n********* morse2Key *********\n"
morse2Key_mctext: .asciiz "--x..x.--.x...xx..xx..-.x-.-.--xx"
morse2Key_secretkey: .ascii "ILBEACKDFGHJMNOPQRSTUVWXYZ"
.asciiz "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"  # should never interact with these characters


# encrypt
encrypt_header: .asciiz "\n\n********* encrypt *********\n"
encrypt_plaintext: .asciiz "GO ANTEATERS!"
encrypt_phrase: .asciiz "Computer Science is cool!"


.text
.globl main

main:

    ############################################
    # TEST CASE for toMorse
    ############################################
    li $v0, 4
    la $a0, toMorse_header
    syscall

    la $a0, toMorse_plaintext
    la $a1, toMorse_morsecodetext
    la $a2, toMorse_size
    lw $a2, 0($a2)
    la $a3, MorseCode
    jal toMorse

    move $t0, $v0
    move $t1, $v1

    li $v0, 4
    la $a0, str_return
    syscall

    li $v0, 1
    add $a0, $zero, $t0
    syscall
    li $v0, 11
    li $a0, ','
    syscall
    li $v0, 1
    add $a0, $zero, $t1
    syscall
    li $v0, 11
    li $a0, '\n'
    syscall
    
    li $v0, 4
    la $a0, str_result
    syscall
    li $v0, 4
    la $a0, toMorse_morsecodetext
    syscall
    li $v0, 11
    li $a0, '\n'
    syscall

    ############################################
    # TEST CASE for createKey
    ############################################
    li $v0, 4
    la $a0, createKey_header
    syscall

    la $a0, createKey_phrase
    la $a1, createKey_secretKey
    jal createKey

    li $v0, 4
    la $a0, str_result
    syscall
    li $v0, 4
    la $a0, createKey_secretKey
    syscall
    li $v0, 11
    li $a0, '\n'
    syscall

    ############################################
    # TEST CASE for strNcmp
    ############################################
    li $v0, 4
    la $a0, strNcmp_header
    syscall
    
    la $a0, strNcmp_mystr1
    la $a1, strNcmp_mystr2
    la $a2, strNcmp_N
    lw $a2, 0($a2)
    jal strNcmp

    move $t0, $v0
    move $t1, $v1

    li $v0, 4
    la $a0, str_return
    syscall
    li $v0, 1
    add $a0, $zero, $t0
    syscall
    li $v0, 11
    li $a0, ','
    syscall
    li $v0, 1
    add $a0, $zero, $t1
    syscall
    li $v0, 11
    li $a0, '\n'
    syscall

    ############################################
    # TEST CASE for morse2Key
    ############################################
    li $v0, 4
    la $a0, morse2Key_header
    syscall

    la $a0, morse2Key_mctext
    la $a1, keymap     
    la $a2, morse2Key_secretkey
    jal morse2Key

    move $t0, $v0

    li $v0, 4
    la $a0, str_return
    syscall

    li $t2, 0xFFFF
    beq $t2, $t0, morse2Key_negone

    li $v0, 11
    add $a0, $zero, $t0
    syscall
    j morse2Key_done

morse2Key_negone:
    li $v0, 1
    addi $a0, $zero, -1
    syscall

morse2Key_done:
    li $v0, 11
    li $a0, '\n'
    syscall

    ############################################
    # TEST CASE for encrypt
    ############################################

    li $v0, 4
    la $a0, encrypt_header
    syscall

    la $a0, encrypt_plaintext
    la $a1, encrypt_phrase
    la $a2, MorseCode
    la $a3, keymap
    jal encrypt

    # Exit main
    li $v0, 10
    syscall


