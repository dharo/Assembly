# Assembly
Assembly Programming

Class -----> Any Programs written during lecture
	Chapter 3 from Raspberry Pi Assembly Language

	This chapter discusses how to create and assembly program.
	Nano is used as the text editor. Source files are discussed
	as well as what they must include. ".global _start", where ".global"
	allows "_start" to be visible to ld (link dynamic). This is special
	because it allows for linking multiple files to one executable. 
	This is exemplified in the executable file "fullpart" created by 
	linking part1.s and part2.s.

Homework -----> Anything that is included in the readings/studied outside
		of the classroom will be found in this folder.
	Chapter 4 From Raspberry Pi Assembly Language

	This chapter discusses the Bits of a RISC Machine. More importantly
	on how to convert numbers to binary (0b) and hex (0x) and back.The
	chapter also discusses how to perform binary arithmetic. Addition is
	straight forward; however, subtraction requires the use of a method
	called Twos Compliment (get the ~(not) of the binary number and add 1)
	Twos Compliment provides you with the negative binary representation
	of the number which can then be added to another number to perform
	a subtraction. Method for Performing Twos Compliment can be found 
	in /Homework/Chapter 4. 
