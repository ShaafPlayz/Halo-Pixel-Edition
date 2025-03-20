##################################################################### 
#
# CSCB58 Winter 2025 Assembly Final Project
# University of Toronto, Scarborough 
#
# Student: Muhammad Shaaf Yousaf, 1009524374, yousaf12, shaaf.yousaf@mail.utoronto.ca
#
# Bitmap Display Configuration:
# - Unit width in pixels: 8
# - Unit height in pixels: 8
# - Display width in pixels: 512
# - Display height in pixels: 256
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestoneshave been reached in this submission? 
#
# - Milestone 0
#
# Which approved features have been implemented for milestone 3? 
# (See the assignment handout for the list of additional features) 
# 1. (fill in the feature, if any)
# 2. (fill in the feature, if any) 
# 3. (fill in the feature, if any) 
# ... (add more if necessary)
#
# Link to video demonstration for final submission: 
# - (insert YouTube / MyMedia / other URL here). Make sure we can view it! 
#
# Are you OK with us sharing the video with people outside course staff? 
# - yes, [github link] 
#
# Any additional information that the TA needs to know:
# - (write here, if any) 
######################################################################


.eqv BASE_ADDRESS 0x10008000
.eqv TopR 252
.eqv BottomL 7936
.eqv BottomR 8188
.text
.globl main
main:
	li $t5, 0
	li $t2, BASE_ADDRESS
	 
	li $t1, 0x00ffffff # $t1 stores the sky colour code
	li $t3, 0x00406080 # $t1 stores the floor colour code
	
	j paintwhite
	
paintwhite: 	beq $t5, 6152, before # IF current pixel is at the end of screen we exit program
		
		sw $t3,0($t2)
		addi $t2, $t2, 4
		addi $t5, $t5, 4
		
		j paintwhite

before: li $t5, 0
paintfloor: 	beq $t5, 240, before2 # IF current pixel is at the end of screen we exit program
		
		sw $t1,0($t2)
		addi $t2, $t2, 4
		addi $t5, $t5, 4
		
		j paintfloor
		
before2: li $t5, 0
paintwhiteagain: beq $t5, 1808, END # IF current pixel is at the end of screen we exit program
		
		sw $t3,0($t2)
		addi $t2, $t2, 4
		addi $t5, $t5, 4
		
		j paintwhiteagain

		
END: 	li $v0, 10 # terminate the program gracefully
	syscall



























