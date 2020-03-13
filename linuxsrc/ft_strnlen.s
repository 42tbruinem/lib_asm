; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strnlen.s                                       :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/11 16:30:50 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/13 10:41:10 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global ft_strnlen

section .data
	%define STR rdi
	%define NUM rsi
	%define COUNTER rax

section .text

;	size_t	ft_strnlen(char *str, size_t n);

ft_strnlen:
	push rbp
	mov rbp, rsp
	xor COUNTER, COUNTER

.loop:
	mov cl, byte [STR + COUNTER]
	cmp cl, byte 0
	je .ret
	cmp COUNTER, NUM
	je .ret
	inc COUNTER
	jmp .loop

.ret:
	mov rsp, rbp
	pop rbp
	ret
