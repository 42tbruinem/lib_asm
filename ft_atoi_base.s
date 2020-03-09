; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_atoi_base.s                                     :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 17:10:06 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/09 20:09:30 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; Count the length of the second argument (base) with strlen
; The second argument (base) is also the string of characters
; representing what the string is to be interpreted as, default (base 10) is: "0123456789"
; but this could just as easily be: "KDUE" (0 = K, D = 1, U = 2, E = 3)

; Skip all the whitespaces

; Determine the sign

;int	ft_atoi_base(char *str, char *base)
global	_ft_atoi_base
extern _ft_strlen
extern _ft_strcmp

_error:
	mov rax, 0
	ret

_is_space:
	cmp cl, byte 32
	jne _whitespace_skipped
	inc rax
_skip_whitespace:
	mov cl, [rdi + rax]
	cmp cl, byte 9
	jl _whitespace_skipped
	cmp cl, byte 13
	jg _is_space
	inc rax
	jmp _skip_whitespace

;rdi = string
;rsi = base

;r10 = len
;r9 = sign
;r8 = i

_plus:
	mov r9, 1
	inc r8
	jmp _atoi

_minus:
	movsx r9, -1
	inc r8
	jmp _atoi

_get_sign:
	mov cl, [rdi + rax]
	cmp cl, byte 45
	je _minus
	cmp cl, byte 43
	je _plus
	mov r9, 1
	jmp _atoi

_ft_atoi_base:
	push rdi
	mov rdi, rsi
	call _ft_strlen
	cmp rax, 1
	jle _error
	mov r10, rax
	xor r8, r8
	mov rsi, rdi
	pop rdi
	jmp _skip_whitespace
	_whitespace_skipped:
		jmp _get_sign
	_atoi:
		

