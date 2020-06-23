; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_sort_bonus.s                               :+:    :+:             ;
;                                                      +:+                     ;
;    By: tbruinem <tbruinem@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/12 16:30:24 by tbruinem      #+#    #+#                  ;
;    Updated: 2020/06/23 23:17:22 by tbruinem      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

;step 1:
;skip for the length of i (updating highest_prev AND iter)

;step 2:
;loop over iter, comparing iter->next against highest
;updating highest and highest_prev if a new highest is found

;step 3:
;at the end of the loop, check if highest is not equal to *begin
;(otherwise we cant set highest_prev) and it wouldnt make sense to re-add it to the beginning

;do this until i == len
;then we'll have a sorted list.

global ft_list_sort
extern ft_list_size

section .data
	%define HEAD r12
	%define ITER r13
	%define HIGHEST r14
	%define HIGHEST_PREV r15
	%define COUNTER rbx
	%define LST_SIZE [rbp - 16]
	%define CMP_FUNCT [rbp - 8]
	%define SKIPCOUNTER rdx

section .text

;void	ft_list_sort(t_list **begin, int (*cmp)());

ft_list_sort:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	sub rsp, 16
	push r12
	push r13
	push r14
	push r15
	push rbx
	mov CMP_FUNCT, rsi
	mov HEAD, rdi
	mov rdi, [HEAD]
	push rdi;
	call ft_list_size
	pop rdi;
	mov LST_SIZE, rax
	cmp rax, 1
	jle .ret
	mov COUNTER, 0
	mov SKIPCOUNTER, 0

.sort:

;----------------------------------------------------
;	loop over the list LST_SIZE times
;	reset skipcounter
;	reset highest, highest_prev and iter
;----------------------------------------------------
	cmp COUNTER, LST_SIZE
	je .ret
	mov SKIPCOUNTER, 0
	mov HIGHEST_PREV, 0
	mov rax, [HEAD]
	mov ITER, rax
	mov HIGHEST, ITER
	cmp COUNTER, 0
	je .continue
;----------------------------------------------------
;	list = list->next COUNTER times
;	updating highest_prev, iter and highest
;----------------------------------------------------
.skip:
	mov rsi, ITER
	mov HIGHEST_PREV, ITER
	mov rdi, [ITER + 8]
	mov ITER, rdi
	mov HIGHEST, ITER
	inc SKIPCOUNTER
	cmp SKIPCOUNTER, COUNTER
	jl .skip
;----------------------------------------------------
;	compare HIGHEST->DATA against iter->next->data
;	updating highest and highest_prev if iter->next->data is bigger
;----------------------------------------------------
.continue:
	cmp ITER, 0
	je .move_to_front
	cmp qword [ITER + 8], 0
	je .move_to_front
	mov rax, [ITER + 8]
	mov rdi, [rax]
	mov rsi, [HIGHEST]
	call CMP_FUNCT
	cmp rax, 0
	jg .not_higher
	mov HIGHEST, [ITER + 8]
	mov HIGHEST_PREV, ITER
.not_higher:
	mov rax, [ITER + 8]
	mov ITER, rax
	jmp .continue

;----------------------------------------------------
;	set HIGHEST_PREV->next = HIGHEST->next
;	set HIGHEST->next = [HEAD]->next
;	set [HEAD] = HIGHEST
;----------------------------------------------------
.move_to_front:
	inc COUNTER
	cmp HIGHEST, [HEAD]
	je	.sort
	mov rax, [HIGHEST + 8]
	mov [HIGHEST_PREV + 8], rax
	mov rax, [HEAD]
	mov [HEAD], HIGHEST
	mov [HIGHEST + 8], rax
	jmp .sort

.error:
	mov rax, 0

.ret:
	pop rbx 
	pop r15
	pop r14
	pop r13
	pop r12
	mov rsp, rbp
	pop rbp
