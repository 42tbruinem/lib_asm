; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_push_front_bonus.s                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 17:24:02 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/09 17:50:50 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_list_push_front
extern _malloc

section .text

;void ft_list_push_front(t_list **head, void *data)
;rdi = head
;rsi = data

_error:
	ret

_ft_list_push_front:
	push rdi
	push rsi
	push r10
	mov rdi, 16
	call _malloc
	pop r10
	cmp rax, 0
	je _error
	pop rsi
	pop rdi
	mov [rax], rsi
	mov rsi, [rdi]
	mov [rdi], rax
	mov [rax + 8], rsi
	ret
