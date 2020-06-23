; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_sort_bonus.s                               :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/23 23:30:08 by tbruinem      #+#    #+#                  ;
;    Updated: 2020/06/24 00:02:47 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

;void	ft_list_sort(t_list **begin_list, int (*cmp)())

global	ft_list_sort

section .data
	%define HEAD r12
	%define ITER r13
	%define CMP	r14
	%define SWAPPED r15

section .text

ft_list_sort:
	push rbp
	mov rbp, rsp
	push r12
	push r13
	push r14
	push r15
	sub rsp, 8
	cmp	rdi, 0
		je .ret
	cmp	rsi, 0
		je .ret
	mov CMP, rsi
	mov HEAD, rdi
	mov SWAPPED, 1

.resetloop:
	cmp SWAPPED, 0
		je .ret
	mov SWAPPED, 0
	mov ITER, [HEAD]

.loop:
	cmp ITER, 0
		je .resetloop
	mov rax, [ITER + 8]
	cmp rax, 0
		je .continue
	mov rdi, [ITER]
	mov rsi, [rax]
	call CMP
	cmp rax, $0
	jl .continue
	cmp rax, 0
	je .continue
	mov rax, [ITER]
	mov rdx, [ITER + 8]
	mov rcx, [rdx]
	mov [ITER], rcx
	mov [rdx], rax
	mov SWAPPED, 1
.continue:
	mov rax, [ITER + 8]
	mov ITER, rax
	jmp .loop

.ret:
	add rsp, 8
	pop r15
	pop r14
	pop r13
	pop r12
	mov rsp, rbp
	pop rbp
	ret
