; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_write.s                                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 12:27:19 by tbruinem      #+#    #+#                  ;
;    Updated: 2020/06/18 15:52:01 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global			_ft_write
extern	___error

section .data
	%define WRITE_ID 0x2000004

section .text

_ft_write:
	mov				rax, WRITE_ID
	syscall
	jc				_error
	ret

_error:
	push			rax
	call			___error
	mov				rdi, rax
	pop				rax
	mov				[rdi], rax
	mov				rax, -1
	ret
