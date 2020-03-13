; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcpy.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 13:46:15 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/13 10:45:54 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global ft_strcpy

section .data
	%define SRC rsi
	%define DST rdi
	%define COUNTER rax

section .text

;char	*ft_strcpy(char *dest, char *src);

ft_strcpy:
	push rbp
	mov rbp, rsp
	xor COUNTER, COUNTER

.loop:
	mov dl, byte [SRC + COUNTER]
	mov byte [DST + COUNTER], dl
	cmp dl, byte 0
	je .ret
	inc COUNTER
	jmp .loop

.ret:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
