/*

	David Haro
	September 9, 2015
	First Assembly Program

*/

.global _start
_start:
	mov r0, #2
	mov r7, #1
	swi 0
