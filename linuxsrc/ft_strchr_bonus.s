; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strchr_bonus.s                                  :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 19:47:44 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/13 10:59:07 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global ft_strchr

section .data
	%define STR rdi
	%define CHR sil
	%define COUNTER rcx
	%define RETURN_VAL rax

section .text

;char	*ft_strchr(char *str, char c);

ft_strchr:
	xor RETURN_VAL, RETURN_VAL
	xor COUNTER, COUNTER

.loop:
	mov dl, byte [STR + COUNTER]
	lea RETURN_VAL, [STR + COUNTER]
	cmp dl, CHR
	je .ret
	cmp dl, 0
	je .error
	inc COUNTER
	jmp .loop

.error:
	mov RETURN_VAL, 0

.ret:
	ret
