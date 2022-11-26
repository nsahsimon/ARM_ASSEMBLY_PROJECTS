				ADR R12,myStorage    ;
				SUB		SP,SP,#12
				MOV		R5,#3        ; side P
				STR		R5,[SP,#0]
				MOV		R5,#4        ; side Q
				STR		R5,[SP,#4]
				MOV		R5,#5         ; side R
				STR		R5,[SP,#8]
				BL		L5
				STR		R1,[R12,#0]
				B		Done                ;end
				;		Your code goes here.
				
				
				
L5				ORR		R0,R0,R0
				MOV		R0,#0 ;R0 will hold the number of equal sides of the triangle
				;R0		will be incremented by 1 any time a new pair of equal sides is found
				
				;;;		Check if the triangle is valid
				
				LDR		R2, [SP, #0]
				LDR		R3, [SP, #4]
				LDR		R4, [SP, #8]
				
				ADD		R5, R2, R3 ;Sum up side P adn Q of the triangle
				CMP		R5, R4 ;compare the sum of sides p and q with side r
				BLEQ		invalidTriangle
				CMP		R2, R3
				BEQ		equalSides
				
				ADD		R5, R4, R2 ;Sum up side P adn R of the triangle
				CMP		R5, R3 ;compare the sum of sides p and R with side Q
				BLEQ		invalidTriangle
				CMP		R4, R5
				BEQ		equalSides
				
				ADD		R5, R3, R4 ;Sum up side Q adn R of the triangle
				CMP		R5, R2 ;compare the sum of sides Q and R with side P
				BLEQ		invalidTriangle
				CMP		R3, R4
				BEQ		equalSides
				
				;;;		Check if the triangle is isoceles, equilateral or scalene
				CMP		R0,#3 ; Check if the triangle is equilateral
				BEQ		equilateral
				CMP		R0,#1
				BEQ		isoceles
				CMP		R0,#0
				BEQ		scalene
				
				
				
				
invalidTriangle     ; executed any time an invalid triangle is detected
				MOV		R1,#0                  ; Set your return value 0 before returning for an invalid triangle
				MOV		PC,LR
				
equalSides  ; executed any time two sides of the triangle are found
				ADD		R0,R0,#1
				
				
equilateral
				MOV		R1,#2
				MOV		PC,LR
				
isoceles
				MOV		R1,#1
				B		checkRightAngle
				
scalene
				MOV		R1,#4
				B		checkRightAngle
				
checkRightAngle
				
				MOV		R0,R2 ; holds the initial value  of R2
				MOV		R6,R2
				CMP		R2,#2
				BLT		skipLoop2 ;Do not enter the loop if side length == 0 or 1
				;squaring	R2 using repeated addition
loop2
				SUB		R0,R0,#1
				ADD		R2,R2,R6
				CMP		R0,#1
				BGT		loop2
skipLoop2
				;
				
				
				MOV		R0,R3 ; holds the initial value  of R3
				MOV		R6,R3
				CMP		R3,#2
				BLT		skipLoop3 ;Do not enter the loop if side length == 0 or 1
				;squaring	R3 using repeated addition
loop3
				SUB		R0,R0,#1
				ADD		R3,R3,R6
				CMP		R0,#1
				BGT		loop3
skipLoop3
				;
				
				
				
				MOV		R0,R4 ; holds the initial value  of R4
				MOV		R6,R4
				CMP		R4,#2
				BLT		skipLoop4 ;Do not enter the loop if side length == 0 or 1
				;squaring	R4 using repeated addition
loop4
				SUB		R0,R0,#1
				ADD		R4,R4,R6
				CMP		R0,#1
				BGT		loop4
skipLoop4
				;
				
				ADD		R5, R3,R4
				CMP		R2,R5
				BEQ		rightAngle
				ADD		R5, R2,R3
				CMP		R4,R5
				BEQ		rightAngle
				ADD		R5, R4,R2
				CMP		R3,R5
				BEQ		rightAngle
				MOV		PC,LR ;end execution
				
				
				
rightAngle
				MOV		R1,#3
				MOV		PC,LR
				;add		logic to check if a triangle is a right angle triangle
				
Done				end		;
				
myStorage			DCD		0
