; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_atoi_base_bonus.s                               :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 17:10:06 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/10 20:43:40 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global	_ft_atoi_base
extern _ft_strlen
extern _ft_strcmp
extern _ft_strchr

_error:
	mov rax, 0
	ret

_is_space:
	cmp cl, byte 32
	jne _whitespace_skipped
	inc rax

_skip_whitespace:
	mov cl, [rsi + r8]
	cmp cl, byte 9
	jl _whitespace_skipped
	cmp cl, byte 13
	jg _is_space
	inc r8
	jmp _skip_whitespace


_plus:
	mov r9, 0
	mov r9b, byte 1
	inc r8
	mov r13, 0
	push r9 ;<- sign
	jmp _atoi

_minus:
	mov r9, 1
	imul r9, -1
	inc r8
	mov r13, 0
	push r9 ;<- sign
	jmp _atoi

_get_sign:
	mov rcx, 0
	mov cl, [rdi + rax]
	cmp cl, byte 45
	je _minus
	cmp cl, byte 43
	je _plus
	mov r9, 0
	mov r9b, byte 1
	mov r13, 0
	push r9 ;<- sign
	jmp _atoi

;str is still on the stack, preserved
;same for my base_len
_validate_base:
	mov rsi, [rdi + r8]
	mov rax, r8
	inc rax
	cmp rax, r10
	je _base_validated
	push rdi
	push r8
	call _ft_strchr
	cmp rax, 0
	je _error
	pop r8
	pop rdi
	inc r8
	jmp _validate_base

;rdi = string
;rsi = base

;r13 = return value
;r10 = base_len
;r9 = sign
;r8 = (temp)str_len | i
;r15 = error

;int	ft_atoi_base(char *str, char *base)
_ft_atoi_base:
	mov r15, 0
	push rdi ;-> str
	push rsi ;-> base
;get the length of the string
	push r15
	call _ft_strlen
	pop r15
;error = 1
	inc r15
	pop rdi ;<- base
;	pop rsi ;<- str
	cmp rax, 0
	je _error
	push rdi ;-> base
;get the length of the base
	push r15
	call _ft_strlen
	pop r15
;error = 2
	inc r15
	pop rdi ;<- base
	cmp rax, 1
	jle _error
;save base_len
	mov r10, rax
	push r10 ;-> base_len
;set i to 0
	mov r8, 0
	push r15
	jmp _validate_base
	_base_validated:
		pop r15;
;error = 3
		inc r15
		mov r8, 0
		pop r10 ;<- base_len
		pop rsi ;<- str
	jmp _skip_whitespace
	_whitespace_skipped:
;error = 4
		inc r15
		jmp _get_sign
	_atoi:
		push rdi ;-> base
		push rsi ;-> str
		push r13 ;-> return
		push r10 ;-> base_len
		push r12
		mov r12, 0
		mov r12b, [rsi + r8]
		cmp r12b, 0
		je _ret
		mov rsi, 0
		mov sil, r12b
		call _ft_strchr
;error = 5>
		inc r15
		pop r12
		pop r10 ;<- base_len
		pop r13 ;<- return
		pop rsi ;<- str
		pop rdi ;<- base
		cmp al, 0
		je _error
;ret = (ret * base) + strchr() - base
		sub rax, rdi
		imul r13, r10
		add r13, rax
		inc r8
		jmp _atoi

_ret:
	pop r9
	pop r9
	inc r15
	mov rax, r13
	cmp r9b, 10
	je _is_positive
	imul rax, r9
_is_positive:
	pop r12
	pop r10
	pop rsi
	pop rdi
	ret
