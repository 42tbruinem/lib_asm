; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_remove_if_bonus.s                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/12 21:32:02 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/12 21:34:55 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_list_remove_if
extern _free

section .data
	%define HEAD r12
	%define DATA_REF r13
	%define CMP_FUNCT [rbp - 8]

;void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());

section .text

_ft_list_remove_if:
	push rbp
	mov rbp, rsp

.ret:
	mov rsp, rbp
	pop rbp
	ret
