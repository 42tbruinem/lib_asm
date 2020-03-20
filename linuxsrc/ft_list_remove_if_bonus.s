; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_remove_if_bonus.s                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/12 21:32:02 by tbruinem       #+#    #+#                 ;
;    Updated: 2020/03/13 15:51:19 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global ft_list_remove_if
extern free

section .data
	%define HEAD r12
	%define DATA_REF r13
	%define ITER r14
	%define LAST r15
	%define CMP_FUNCT [rbp - 8]

;void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());

section .text

ft_list_remove_if:
;-------------------< RSP - 8 | TOTAL: 8
	push rbp
	mov rbp, rsp
;-------------------< RSP - 8 | TOTAL: 16
	sub rsp, 8
	mov CMP_FUNCT, rdx
;-------------------< RSP - 8 | TOTAL: 24
	push r12
;-------------------< RSP - 8 | TOTAL: 32
	push r13
;-------------------< RSP - 8 | TOTAL: 40
	push r14
	mov HEAD, rdi
	mov DATA_REF, rsi
	cmp HEAD, 0
	je .ret
	mov ITER, [HEAD]
	mov LAST, 0

.loop:
	cmp ITER, 0
	je .ret
	mov rdi, [ITER]
	mov rsi, DATA_REF
	call CMP_FUNCT
	cmp rax, 0
	jne .continue
	cmp LAST, 0
	jne .not_head
	mov rdi, ITER
	mov ITER, [rdi + 8]
	mov [HEAD], ITER
	call free
	jmp .loop
.not_head:
	mov rsi, [ITER + 8]
	mov rdi, ITER
	mov [LAST + 8], rsi
	mov ITER, rsi ;
	call free
	jmp .loop
.continue:
	mov LAST, ITER
	mov ITER, [LAST + 8]
	jmp .loop

.ret:
	pop r14
	pop r13
	pop r12
	mov rsp, rbp
	pop rbp
	ret
