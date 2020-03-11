; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_size_bonus.s                               :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 17:51:15 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/11 19:38:53 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_list_size

section .text

;rdi = begin

;size_t	ft_list_size(t_list *begin);

_ft_list_size:
	xor rax, rax
	jmp .loop

.loop:
	mov rcx, rdi
	cmp rcx, 0
	je .ret
	inc rax
	mov rdi, [rdi + 8]
	jmp .loop

.ret:
	ret
