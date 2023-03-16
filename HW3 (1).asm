


##         Abdullah Alshehri - 201948570

##         Asim Kharma       -   201938690
.text
Step1: 
addiu $s0 , $zero , 0
addiu $s0 , $s0, 1           ## to count the number of step 
li $v0, 4
la $a0, visiblelist      #show the XO shape for the players  
syscall 

jal CheckDuplicateP1          #  this function will check the place if its out of range or duplicate and ask the user again

la $t1,invList
addu $t1,$t1,$t0        #change the invisible list character with the number the user chosed the inv List will be used to know the winner
subiu $t1,$t1,1           
li $t2,'X'
sb $t2,0($t1)              #raplace the chosen place with X mark

jal replacer1                  #jump to the function that replace the space with the symbol 

li $v0, 4
la $a0, visiblelist    #show the list
syscall


####################### step one ############################################
Step2:
addiu $s0 , $s0, 1

jal CheckDuplicateP2       #ask the user for input and check it if duplicate of out of range

la $t1,invList
addu $t1,$t1,$t0
subiu $t1,$t1,1             #modify the list that check for winning 
li $t2,'O'
sb $t2,0($t1)          #place O in the wanted place

jal replacer2                 #function to that modify the XO shape

li $v0, 4
la $a0, visiblelist 
syscall
################################ Step two ################################
Step3:
addiu $s0 , $s0, 1

jal CheckDuplicateP1

la $t1,invList
addu $t1,$t1,$t0                               #repitive action
subiu $t1,$t1,1
li $t2,'X'
sb $t2,0($t1)



jal replacer1

li $v0, 4
la $a0, visiblelist 
syscall

####################### step three ############################################
Step4:
addiu $s0 , $s0, 1
jal CheckDuplicateP2

la $t1,invList
addu $t1,$t1,$t0
subiu $t1,$t1,1                                                              #repitive action
li $t2,'O'
sb $t2,0($t1)

jal replacer2

li $v0, 4
la $a0, visiblelist 
syscall

#
j checkWin             #this function is to check if there is a wainner
#
####################### step four ############################################
Step5:
addiu $s0 , $s0, 1

jal CheckDuplicateP1

la $t1,invList
addu $t1,$t1,$t0
subiu $t1,$t1,1                                                     #repitive action
li $t2,'X'
sb $t2,0($t1)



jal replacer1

li $v0, 4
la $a0, visiblelist 
syscall

#
j checkWin
#
####################### step five ############################################
Step6:
addiu $s0 , $s0, 1

jal CheckDuplicateP2

la $t1,invList
addu $t1,$t1,$t0
subiu $t1,$t1,1                               #repitive action
li $t2,'O'
sb $t2,0($t1)

jal replacer2

li $v0, 4
la $a0, visiblelist 
syscall
#
j checkWin
#
####################### step six ############################################
Step7:
addiu $s0 , $s0, 1

jal CheckDuplicateP1

la $t1,invList
addu $t1,$t1,$t0
subiu $t1,$t1,1                               #repitive action
li $t2,'X'
sb $t2,0($t1)



jal replacer1

li $v0, 4
la $a0, visiblelist 
syscall

#
j checkWin
#
####################### step seven ############################################
Step8:
addiu $s0 , $s0, 1

jal CheckDuplicateP2

la $t1,invList
addu $t1,$t1,$t0
subiu $t1,$t1,1                               #repitive action
li $t2,'O'
sb $t2,0($t1)

jal replacer2

li $v0, 4
la $a0, visiblelist 
syscall
#
j checkWin
#
####################### step eight ############################################
Step9:
addiu $s0 , $s0, 1

jal CheckDuplicateP1

la $t1,invList
addu $t1,$t1,$t0
subiu $t1,$t1,1                               #repitive action
li $t2,'X'
sb $t2,0($t1)



jal replacer1

li $v0, 4
la $a0, visiblelist 
syscall
#
j checkWin
#
####################### step nine ############################################










########################for X 
replacer1:
move $t7,$zero     #initialize the variavle 
addi $t7,$t7,1  #counter to find the place of the bit with respect to string     
addi $t0,$t0,48          #to make the number matches with the ascii number 
la $t6, visiblelist2         #load the numbered list tobe used in the program
lb $a0,($t6)            #to get the byte to be checked
outerloop:
beq $a0,$t0,out        #loop to check every byte if it equals or nut and if its then we branch out

addi $t6,$t6,1
lb $a0,($t6)                     #add 1 to get the next byte
addi $t7,$t7,1
j outerloop    #return to the loop
out:
la $t5, visiblelist  
addu,$t5, $t5,$t7
subiu ,$t5, $t5,1
li $t6,'X'                   
sb $t6,0($t5)                    #after finding the place we substitute it with the symbol either x or O
jr $ra              #return to the place that called the function


#########################for O

replacer2:
move $t7,$zero
addi $t7,$t7,1  #counter
addi $t0,$t0,48
la $t6, visiblelist2                       #identical to what we did for x but now for O
lb $a0,($t6)
outerloop2:
beq $a0,$t0,out2

addi $t6,$t6,1
lb $a0,($t6)
addi $t7,$t7,1
j outerloop2
out2:
la $t5, visiblelist 
addu,$t5, $t5,$t7
subiu ,$t5, $t5,1
li $t6,'O'
sb $t6,0($t5)
jr $ra


###################Check Win ############################

checkWin:
la $t1,invList
addiu $t3 , $zero ,0x00000058   
addiu $t4 , $zero , 0                   #Temp values
addiu $t8 , $zero , 0
addiu $t9 , $zero , 0
jal checkRows 
addiu $t1 , $t1 ,1              # to move lower level 
jal checkRows 
addiu $t1 , $t1 ,1		# to move lower level
jal checkRows 
addiu $t3 , $zero ,0x0000004F  # For Os
addiu $t1 , $zero , 0
la $t1,invList 
addiu $t4 , $zero , 0
addiu $t8 , $zero , 0
addiu $t9 , $zero , 0
jal checkRows
addiu $t1 , $t1 ,1 
jal checkRows 
addiu $t1 , $t1 ,1
jal checkRows

##checking for columns 
addiu $t1 , $zero, 0 
la $t1,invList
addiu $t3 , $zero ,0x00000058   #For Xs 
jal checkColumns 
subiu $t1 , $t1 , 5             # reset the temp value
jal checkColumns  
subiu $t1 , $t1 , 5
jal checkColumns  

addiu $t3 , $zero ,0x0000004F  # For Os
addiu $t1 , $zero , 0
la $t1,invList 
jal checkColumns 
subiu $t1 , $t1 , 5
jal checkColumns  
subiu $t1 , $t1 , 5
jal checkColumns  


##Checking the diagnoals 
addiu $t1 , $zero, 0 
la $t1,invList
addiu $t3 , $zero ,0x00000058   #For Xs 
jal CheckFirstDiagnoal 
subiu $t1 , $t1 , 8
addiu $t3 , $zero ,0x0000004F  # For Os
jal CheckFirstDiagnoal 
subiu $t1 , $t1 , 8
addiu $t3 , $zero ,0x00000058   #For Xs 
jal CheckSecondDiagnoal
subiu $t1 , $t1 , 6
addiu $t3 , $zero ,0x0000004F  # For Os
jal CheckSecondDiagnoal

j NextStep      # if no winner found 
checkRows: 
lb $t4 , 0($t1)
addi $t1,$t1,1 
lb $t8 , 0($t1)
addi $t1,$t1,1 
lb $t9 , 0($t1)
bne $t4 , $t3 , Terminate        #check whether the 3 values are equal to X or O , if so , then jump to winner 
bne $t8 , $t3 , Terminate
beq $t9 , $t3 , Winner
jr $ra
checkColumns: 
addiu $t4 , $zero , 0
addiu $t8 , $zero , 0
addiu $t9 , $zero , 0
lb $t4 , 0($t1) 
addi $t1,$t1,3                 # increment by 3 to check the next column
lb $t8 , 0($t1)
addi $t1,$t1,3 
lb $t9 , 0($t1)
bne $t4 , $t3 , Terminate
bne $t8 , $t3 , Terminate
beq $t9 , $t3 , Winner

jr $ra
CheckFirstDiagnoal:
addiu $t4 , $zero , 0
addiu $t8 , $zero , 0
addiu $t9 , $zero , 0
lb $t4 , 0($t1) 
addi $t1,$t1,4
lb $t8 , 0($t1)
addi $t1,$t1,4 
lb $t9 , 0($t1) 
bne $t4 , $t3 , Terminate
bne $t8 , $t3 , Terminate
beq $t9 , $t3 , Winner
jr $ra 
CheckSecondDiagnoal:
addiu $t4 , $zero , 0
addiu $t8 , $zero , 0
addiu $t9 , $zero , 0
addi $t1,$t1,2
lb $t4 , 0($t1) 
addi $t1,$t1,2
lb $t8 , 0($t1)
addi $t1,$t1,2 
lb $t9 , 0($t1) 
bne $t4 , $t3 , Terminate
bne $t8 , $t3 , Terminate
bne $t9 , $t3 , Terminate
j Winner

Terminate: 
jr $ra
Winner:
bne $t3 , 0x0000004F , XWin  
li $v0 , 4
la $a0 , O_Win 
syscall 
j Exit
 
XWin:  
li $v0 , 4 
la $a0 , X_Win
syscall
j Exit


NextStep:  
beq $s0 , 8 , Step9
beq $s0 , 7 , Step8
beq $s0 , 6 , Step7    ##check which step to continue to 
beq $s0 , 5 , Step6
beq $s0 , 4 , Step5

li $v0 , 4                # if no step ramining , display no Winner message 
la $a0 , NoWinner
syscall
Exit:    li $v0,10   #terminate the program
         syscall
         
         
         
#####################check for input O

outofrangeO:
li $v0, 4                         #this step we reach it if the input is out of range so we can get into a loop and enter checkDuplicateP2  
la $a0, invalidMSG      
syscall
        
CheckDuplicateP2:           #this function will be called with every step to get the user's input
li $v0, 4
la $a0, player2        #ask for number for player2 
syscall 
li $v0, 5
syscall
move $t0, $v0
blt $t0,1,outofrangeO 
bgt $t0,9,outofrangeO              #check if its inside the range of 1-9 ,if not we will go to outofrangeO and ask the the user again

la $t1,invList
add $t1,$t1,$t0                    #use the invList to check if the place taken or not 
subi $t1,$t1,1
lb $a0,($t1)                    #load the byte where we want to check
addi $t2,$t0,48
bne $a0,$t2,notequalO     # if the place is not taken we will return to the main code
jr $ra
  notequalO:     #if it's taken then we will get error message and enter the function from the top again 
        li $v0, 4
	la $a0, ErrorMSG        
	syscall
         j CheckDuplicateP2
         
         
         
         
##########################check for input X
 

outofrangeX:
li $v0, 4
la $a0, invalidMSG      
syscall
        
CheckDuplicateP1:          
li $v0, 4
la $a0, player1        
syscall 
li $v0, 5 
syscall
move $t0, $v0
blt $t0,1,outofrangeX               # repetitive action the same thing as O for now for X
bgt $t0,9,outofrangeX

la $t1,invList
add $t1,$t1,$t0
subi $t1,$t1,1
lb $a0,($t1)
addi $t2,$t0,48
bne $a0,$t2,notequalX
jr $ra
  notequalX:
        li $v0, 4
	la $a0, ErrorMSG        
	syscall
        j CheckDuplicateP1
        

.data
visiblelist: .asciiz "\n  | | \n--------\n  | | \n--------\n  | | "          #this list to be modifiied by the program
visiblelist2: .asciiz "\n 1|2|3\n--------\n 4|5|6\n--------\n 7|8|9"            #this list used find the place of the number
invList: .asciiz "123456789"                                             #this list used to check the winner and to check for inputs
player1: .asciiz "\nPlayer 1, Enter a square from 1 to 9: "
player2: .asciiz "\nPlayer 2, Enter a square from 1 to 9: "
O_Win : .asciiz "\nO,  is the winner! "
X_Win : .asciiz "\nX,  is the winner! "
ErrorMSG : .asciiz" \nSquare is already used!" 
invalidMSG: .asciiz "\nInvalid square! "
NoWinner: .asciiz " \n No Winner \n" 
