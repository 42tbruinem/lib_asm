; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_read.s                                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 13:02:34 by tbruinem      #+#    #+#                  ;
;    Updated: 2020/06/10 23:02:13 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global	ft_read

section .data
	%define READ_ID 0

section .text

ft_read:
	mov		rax, READ_ID
	syscall
	js		.error
	cmp		rax, 0
	jl		.error
	ret

.error:
	mov		rax, -1
	ret
