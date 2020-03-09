; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    write.s                                            :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 12:27:19 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/09 12:57:09 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_write

section .data
	WRITE_ID equ 0x2000004

section .text

_ft_write:
	mov rax, WRITE_ID
	syscall
	jc _error
	ret

_error:
	mov rax, -1
	ret
