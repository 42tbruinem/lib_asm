; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_read.s                                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 13:02:34 by tbruinem      #+#    #+#                  ;
;    Updated: 2020/06/18 15:52:38 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global	_ft_read
extern	___error

section .data
	%define READ_ID 0x2000003

section .text

_ft_read:
	mov rax, READ_ID
	syscall
	jc _error
	ret

_error:
	push			rax
	call			___error
	mov				rdi, rax
	pop				rax
	mov				[rdi], rax
	mov				rax, -1
	ret
