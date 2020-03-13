; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcpy.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 13:46:15 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/12 19:02:10 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strcpy

section .text

_ret:
	mov rax, rdi
	ret

_loop:

	mov dl, [rsi + rax]
	mov [rdi + rax], dl
	mov dl, [rsi + rax]
	cmp dl, 0
	je _ret
	inc rax
	jmp _loop

_ft_strcpy:
	xor rax, rax
	jmp _loop
