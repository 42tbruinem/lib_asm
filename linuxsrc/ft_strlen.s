; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strlen.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 13:17:18 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/13 10:45:24 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global ft_strlen

section .data
	%define STR rdi
	%define COUNTER rax

section .text

;size_t	ft_strlen(char *str);

ft_strlen:
	push rbp
	mov rbp, rsp
	xor COUNTER, COUNTER

.len:
	mov sil, byte [STR + COUNTER]
	cmp sil, byte 0
	je .ret
	inc COUNTER
	jmp .len

.ret:
	mov rsp, rbp
	pop rbp
	ret
