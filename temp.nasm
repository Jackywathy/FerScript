extern printf
extern exit
section .data
	hi db "Hello World!", 0
	numFmt: db "%d", 10, 0
	strFmt: db "%s", 10, 0
	print0: db "X is:", 0
	print1: db "X is:", 0
section .bss
	 x resb 4
section .text
	 global main
main:
	;Initalize variables
	mov eax, 5
	mov [x], eax

	push print0
	push strFmt
	call printf
	pop eax

	push dword [x]
	push numFmt
	call printf
	pop eax

	;Adding "[Num Literal, -5]" to "[Term, x]"
	mov eax, [x]
	add eax, -5
	mov [x], eax

	push print1
	push strFmt
	call printf
	pop eax

	push dword [x]
	push numFmt
	call printf
	pop eax

	push hi
	push strFmt
	call printf
	pop eax
	push 0
	call exit
