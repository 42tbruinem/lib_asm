; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strnlen.s                                       :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/11 16:30:50 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/11 18:11:32 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strnlen

section .data
	%define STR [rbp - 8]
	%define N [rbp - 16]
	%define COUNTER rax

section .text

;	size_t	ft_strnlen(char *str, size_t n);

_ft_strnlen:
;   #Prologue

	push rbp
	mov rbp, rsp

	sub rsp, 8
	mov [rbp - 8], rdi
	sub rsp, 8
	mov N, rsi
	mov COUNTER, 0

.loop:
	mov rcx, 0
	mov rdx, STR
	mov cl, [rdx + COUNTER]
	cmp cl, byte 0
	je .ret
	cmp rax, N
	jg .ret
	inc COUNTER
	jmp .loop

.ret:
;	#Epilogue

	mov rsp, rbp
	pop rbp
	ret
