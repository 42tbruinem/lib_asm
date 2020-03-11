; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_sort_bonus.s                               :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/11 19:22:46 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/11 19:31:41 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_list_sort
extern _ft_list_size

section .data
	%define CMP_FUNCT [rbp - 16]
	%define HEAD [rbp - 8]
	%define LST_SIZE r12

section .text

;void	ft_list_sort(t_list **begin, int (*cmp)(char ());

_ft_list_sort
	push rbp
	mov rbp, rsp
	push rdi
	push rsi
	push r12
	mov rsi, [HEAD]
	call _ft_list_size
	mov r12, rax

.ret:
	pop r12
	pop rsi
	pop rdi
	mov rsp, rbp
	pop rbp
