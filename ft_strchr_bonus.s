; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strchr_bonus.s                                  :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 19:47:44 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/09 20:40:05 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strchr

section .text

;char	*ft_strchr(char *str, char c)

;rdi = str
;rsi = c
;rax = i

_ft_strchr:
	xor rax, rax

_loop:
	mov cl, byte [rdi + rax]
	cmp cl, sil
	je _ret
	cmp cl, 0
	je _ret
	inc rax
	jmp _loop

_ret:
	lea rax, [rdi + rax]
	ret
