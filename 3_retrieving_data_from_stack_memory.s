.global _start
_start:
#Store the location of the first item in myList in R1
#LDR can be used to load register with data from stack
LDR R1,=myList

#Load R2 with the first value of myList
LDR R2,[R1]

#Load R3 with the second valude of myList
#I.E loading from stack with an offset
LDR R3, [R1, #4]

#Preincrement, R1 is changed to R1 + 8 and the value at the new R1 is retrieved
LDR R4, [R1, #8]!

#postincrement, The value at address R1 is read and then R1 is incremented by 12
LDR R5, [R1], #12

#Call sotfware interrupt
SWI 0


#Manually storing data in the stack (RAM)
.data
#create a list of data called "myList"
myList:
	.word 1,2,3,4,5

	
	 