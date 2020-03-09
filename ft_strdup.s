; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strdup.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 15:03:03 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/09 17:07:27 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strdup
extern _ft_strlen
extern _malloc

section .text

_ft_strdup:
	cmp rdi, 0
	je _ret
	call _ft_strlen
	push rdi
	inc rax
	mov rdi, rax
	call _malloc
	cmp rax, 0
	je _ret
	pop rdi
	mov r9, 0

_loop:
	mov r8b, [rdi + r9]
	mov byte [rax + r9], r8b
	cmp r8b, 0
	je _ret
	inc r9
	jmp _loop

_ret:
	ret
