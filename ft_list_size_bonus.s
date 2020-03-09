; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_size_bonus.s                               :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 17:51:15 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/09 19:13:20 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_list_size

section .text

;rdi = begin

_ret:
	ret

_loop:
	mov rcx, rdi
	cmp rcx, 0
	je _ret
	inc rax
	mov rdi, [rdi + 8]
	jmp _loop

_ft_list_size:
	xor rax, rax
	jmp _loop
