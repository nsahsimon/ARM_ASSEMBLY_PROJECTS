.global _start
_start:
#Store the location of the first item in myList in R1
#LDR can be used to load register with data from stack
LDR R1,=myList

#Load R2 with the first value of myList
LDR R2,[R1]

#Call sotfware interrupt
SWI 0


#Manually storing data in the stack (RAM)
.data
#create a list of data called "myList"
myList:
	.word 1,2,3,4,5

	
	 