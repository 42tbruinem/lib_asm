; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_write.s                                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 12:27:19 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/13 10:24:46 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global	ft_write

section .data
	%define WRITE_ID 1

section .text

ft_write:
	mov		rax, WRITE_ID
	syscall
	jc		.error
	ret

.error:
	mov		rax, -1
	ret
