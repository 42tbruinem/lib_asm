; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_push_front_bonus.s                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 17:24:02 by tbruinem      #+#    #+#                  ;
;    Updated: 2020/06/23 19:35:16 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_list_push_front
extern _malloc

section .data
	%define HEAD r12
	%define NEW rax
	%define DATA r14

section .text

;void ft_list_push_front(t_list **head, void *data)

_ft_list_push_front:
	push rbp
	mov rbp, rsp
	push r12
	push r14
	mov HEAD, rdi
	mov DATA, rsi
	cmp HEAD, 0
	je .ret
	mov rdi, 16 ;(SIZEOF(T_LIST));
	call _malloc
	cmp NEW, 0
	je .ret
	mov [NEW], DATA
	mov rsi, [HEAD]
	mov [HEAD], NEW
	mov [NEW + 8], rsi
.ret:
	pop r14
	pop r12
	mov rsp, rbp
	pop rbp
	ret
