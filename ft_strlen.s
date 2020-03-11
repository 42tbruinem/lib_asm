; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strlen.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 13:17:18 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/11 13:08:28 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strlen

section .text

;rdi = str
;rsi = 2e argument

_ft_strlen:
	mov rax, 0; i = 0

.len:
	mov sil, [rdi + rax]; str[i]
	cmp sil, 0; is str[i] == 0 ?
	je .ret ; return if true
	inc rax ;i++
	jmp .len ;jump back to the start of the loop

.ret:
	ret
