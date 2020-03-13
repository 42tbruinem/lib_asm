; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcmp.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 14:39:51 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/13 10:46:07 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global ft_strcmp

section .data
	%define S1 rdi
	%define S2 rsi
	%define COUNTER rax

section .text

;int	ft_strcmp(char *s1, char *s2);

ft_strcmp:
	xor COUNTER, COUNTER

.loop:
	mov r10b, byte [S1 + COUNTER]
	mov r9b, byte [S2 + COUNTER]
	cmp r10b, r9b
	jne .ret
	cmp r10b, 0
	je .ret
	inc COUNTER
	jmp .loop

.ret:
	sub r10b, r9b
	movsx rax, r10b
	ret
