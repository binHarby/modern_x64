section .data
	hello db "Hello! This is kinda of a long string !",10,0
	exitstr db "This seems a bit shorter thoough!",10,0

section .text
	global _start
_start:
	mov rax,hello
	call _print

	mov rax,exitstr
	call _print

	mov rax,60
	mov rdi,0
	syscall 

_print:
	push rax
	mov rdx,0
_printloop:
	inc rax
	inc rdx
	mov cl,[rax]
	cmp cl,0
	jne _printloop

	mov rax,1
	mov rdi,1
	pop rsi
	syscall
	ret
