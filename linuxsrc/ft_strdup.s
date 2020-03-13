; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strdup.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 15:03:03 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/13 10:46:36 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global ft_strdup
extern ft_strlen
extern malloc

section .data
	%define STR rdi
	%define DUP rax
	%define COUNTER rcx

section .text

;char	*ft_strdup(char *str);

ft_strdup:
	push rbp
	mov rbp, rsp
	cmp STR, 0
	je .ret
	push STR
	call ft_strlen
	inc rax
	mov rdi, rax
	call malloc
	cmp DUP, 0
	je .ret
	pop STR
	mov COUNTER, 0

.loop:
	mov r8b, byte [STR + COUNTER]
	mov byte [DUP + COUNTER], r8b
	cmp r8b, byte 0
	je .ret
	inc COUNTER
	jmp .loop

.ret:
	mov rsp, rbp
	pop rbp
	ret
