; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_read.s                                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 13:02:34 by tbruinem      #+#    #+#                  ;
;    Updated: 2020/05/06 16:51:28 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global	ft_read

section .data
	%define READ_ID 0

section .text

ft_read:
	mov		rax, READ_ID
	syscall
	jc		.error
	ret

.error:
	mov		rax, -1
	ret
