; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    read.s                                             :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 13:02:34 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/09 13:05:18 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_read

section .data
	READ_ID equ 0x2000003

section .text

_error:
	mov rax, -1
	ret

_ft_read:
	mov rax, READ_ID
	syscall
	jc _error
	ret
