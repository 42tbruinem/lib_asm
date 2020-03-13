; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_size_bonus.s                               :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 17:51:15 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/13 11:00:53 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global ft_list_size

section .data
	%define SIZE rax
	%define LIST rdi

section .text

;size_t	ft_list_size(t_list *begin);

ft_list_size:
	push rbp
	mov rbp, rsp
	mov SIZE, 0

.loop:
	cmp LIST, 0
	je .ret
	inc SIZE
	mov rcx, [LIST + 8]
	mov LIST, rcx
	jmp .loop

.ret:
	mov rsp, rbp
	pop rbp
	ret
