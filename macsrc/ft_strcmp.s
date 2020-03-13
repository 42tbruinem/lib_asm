; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcmp.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 14:39:51 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/09 15:02:16 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strcmp

section .text

_ret:
	sub r10b, r9b
	movsx rax, r10b
	ret

_loop:
	mov r10b, [rdi + rax]
	mov r9b, [rsi + rax]
	cmp r10b, r9b
	jne _ret
	cmp r10b, 0
	je _ret
	inc rax
	jmp _loop

_ft_strcmp:
	xor rax, rax
	jmp _loop
