; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_atoi_base_bonus.s                               :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/09 17:10:06 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/11 19:12:18 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global	_ft_atoi_base
extern _ft_strlen
extern _ft_strcmp
extern _ft_strchr

section .text

_ft_atoi_base:
;-------------------------<Push STR to stack
;-------------------------<move BASE to RDI
;-------------------------<set i = 0
	push rdi
	mov rdi, rsi
	mov r8, 0

.validate_base:
;-------------------------<push BASE to stack
;-------------------------<set [base + i] to RSI
	push rdi
	mov rsi, 0
	mov sil, [rdi + r8]
;-------------------------<move &[base + i + 1] to RDI
	mov r9, r8
	inc r9
	mov r10, rdi
	mov rdi, 0
	lea rdi, [r10 + r9]
;-------------------------<push i to stack
;-------------------------<push copy of base to stack
;-------------------------<push i + 1 to stack
	push r8
	push r10
	push r9
	call _ft_strchr
;-------------------------<pop i + 1 from stack
;-------------------------<pop copy of rdi from stack
;-------------------------<pop i from stack
;-------------------------<pop BASE from stack
;-------------------------<pop STR from stack
	pop r9
	pop r10
	pop r8
	pop rdi
	pop rsi
	mov r11, 0
	mov r11b, [r10 + r9]
	cmp r11b, 0
	je .base_validated
	cmp rax, 0
	jne .error
	push rsi
	inc r8
	jmp .validate_base

.error:
	mov rax, 0
	ret

.base_validated:

	push rdi
	push rsi
	call _ft_strlen
	pop rsi
	pop rdi
	cmp rax, 0
	je .error
	push rdi
	push rsi
	call _ft_strlen
	pop rdi ;<- str
	pop rsi ;<- base
	cmp rax, 1
	jle .error
	mov rcx, rax
	push rcx
	push rsi
	push rdi
;----------------------------<put base in rdi, put '-' in rsi, run strchr
	mov rdi, rsi
	mov rsi, 0
	mov sil, byte 45
	call _ft_strchr
	pop rsi
	pop rdi
	pop rcx
	cmp rax, 0
	jne .error
	push rcx
	push rsi
	push rdi
	mov rsi, 0
	mov sil, byte 43
;----------------------------<put base in rdi, put '-' in rsi, run strchr
	call _ft_strchr
	pop rsi
	pop rdi
	pop rcx
	cmp rax, 0
	jne .error
;----------------------------<needs to end in: rdi = str, rsi = base
	mov r8, 0
;	jmp .skip_whitespace
	jmp .get_sign


;.skip_whitespace:
;	mov r9, 0
;	mov r9b, [rdi + r8]
;	cmp r9b, 9
;	jl .get_sign
;	cmp r9b, 13
;	jg .is_space
;	inc r8
;	jmp .skip_whitespace

;.is_space:
;	cmp r9b, 32
;	jne .get_sign
;	inc r8
;	jmp .skip_whitespace

.get_sign:
	mov r9, 0
	mov r10, 0
	mov r9b, [rdi + r8]
	mov r10b, byte 45
	cmp r10b, r9b
	je .minus
	mov r10b, byte 43
	cmp r10b, r9b
	je .plus
	mov r9, 1
	jmp .atoi_start

.minus:
	inc r8
	mov r9, 1
	neg r9
	jmp .atoi_start

.plus:
	inc r8
	mov r9, 1

;rdi = base
;rsi = str

;rcx = base_len
;r9 = sign
;r8 = i
;r13 = return

.atoi_start:
	mov r13, 0
	push rsi
	mov rsi, rdi
	pop rdi

;rdi = base
;rsi = str

.atoi:
;-----------------------<move str[i] to r10
	mov r10, 0
	mov r10b, [rsi + r8]; str[i]
;-----------------------<if str[i] == 0, return
	cmp r10b, 0
	je .ret
;-----------------------<push str
;-----------------------<push str
;-----------------------<push return
;-----------------------<push i
;-----------------------<push sign
;-----------------------<push base_len
	push rdi
	push rsi
	push r13
	push r8
	push r9
	push rcx
;-----------------------<move str[i] to rsi
	mov rsi, r10
	call _ft_strchr
;-----------------------<pop base_len
;-----------------------<pop sign
;-----------------------<pop i
;-----------------------<pop return
;-----------------------<pop str
;-----------------------<pop base
	pop rcx
	pop r9
	pop r8
	pop r13
	pop rsi
	pop rdi
	cmp rax, 0
	je .error
	sub rax, rdi
	imul r13, rcx
	add r13, rax
	inc r8
	jmp .atoi

.ret:
	mov rax, r13
	imul rax, r9
	ret
