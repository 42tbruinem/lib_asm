; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_itoa_base_bonus.s                               :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/12 12:01:02 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/12 16:25:45 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global	_ft_itoa_base
extern	_ft_strlen
extern	_malloc
extern	_printf

;char	*ft_itoa_base(int n, char *base);

section .data
	%define NUM [rbp - 4]
	%define BASE [rbp - 12]
	%define BASE_LEN r12
	%define STRING r13
	%define NUM_LEN r14
	%define MOD edx
	%define TEMP_NUM eax
	%define COUNTER rcx

section .text

_ft_itoa_base:
push rbp
;rsp -8 (total offset: 8)
mov rbp, rsp
sub rsp, 4
;rsp -4 (total offset: 12)
mov NUM, edi
sub rsp, 8
;rsp -8 (total offset: 20)
mov BASE, rsi
sub rsp, 4
;rsp -4 (total offset: 24)
push r12
;rsp -8 (total offset: 32)
push r13
;rsp -8 (total offset: 40)
push r14
;rsp -8 (total offset: 48)
sub rsp, 8
;rsp -8 (total offset: 56) <-- needed to align to 16byte convention for function call
mov rdi, rsi
call _ft_strlen
mov COUNTER, 1
cmp rax, 1
jle .ret
mov BASE_LEN, rax
mov TEMP_NUM, NUM
cmp TEMP_NUM, 0
jl .sign
jmp .numlen

.sign:
inc COUNTER
neg TEMP_NUM

.numlen:
xor r8, r8
mov r8d, TEMP_NUM
cmp r8, BASE_LEN
jle .malloc
xor MOD, MOD
div BASE_LEN
inc COUNTER
jmp .numlen

.malloc:
mov NUM_LEN, COUNTER
mov rdi, COUNTER
inc rdi
call _malloc
cmp rax, 0
je .error
mov STRING, rax
mov COUNTER, NUM_LEN ;counter = 2
mov byte [STRING + COUNTER], byte 0
dec COUNTER ;so we have to decrease it (counter = 1)
mov TEMP_NUM, NUM
cmp TEMP_NUM, 0
jl .addsign
mov r11b, byte 0
jmp .assign

.addsign:
mov byte [STRING + 0], byte 45
mov r11b, byte 45
imul TEMP_NUM, -1

.assign:
cmp COUNTER, 0
jl .ret_string
xor MOD, MOD
div BASE_LEN
mov r9, BASE
xor r8, r8
mov r8d, MOD
xor r10, r10
mov r10b, byte [r9 + r8]
xor r8, r8
mov byte [STRING + COUNTER], r10b
dec COUNTER
jmp .assign

.ret_string:
mov rax, STRING
cmp r11b, 45
jne .ret
mov byte [STRING + 0], r11b
jmp .ret

.error:
mov rax, 0

.ret:
pop r14
pop r13
pop r12
mov rsp, rbp
pop rbp
ret
