; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcpy.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 13:46:15 by tbruinem      #+#    #+#                  ;
;    Updated: 2020/06/18 17:48:42 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strcpy

;char	*ft_strcpy(char *dest, const char *src);

section .data
	%define SRC rsi
	%define DST rdi
	%define COUNTER rax

section .text

;char	*ft_strcpy(char *dest, char *src);

_ft_strcpy:
	push rbp
	mov rbp, rsp
	mov COUNTER, 0

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
