; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strlen.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 13:17:18 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/09 17:08:27 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strlen

section .text

_ret:
	ret

_len:
	mov sil, [rdi + rax]
	cmp sil, 0
	je _ret
	inc rax
	jmp _len

_ft_strlen:
	mov rax, 0
	jmp _len
