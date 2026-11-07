.data
print_fmt:.string "%ld\n" 
.text
.globl main
signo:
pushq %rbp
movq %rsp, %rbp
subq $16, %rsp
movq %rdi, -8(%rbp)
movq -8(%rbp), %rax
pushq %rax
movq $0, %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jl spaceship_menor_0
jg spaceship_mayor_0
movq $0, %rax
jmp spaceship_fin_0
spaceship_menor_0:
movq $-1, %rax
jmp spaceship_fin_0
spaceship_mayor_0:
movq $1, %rax
spaceship_fin_0:
jmp .Lfin_signo
movq $0, %rax
.Lfin_signo:
leave
ret
safe_div:
pushq %rbp
movq %rsp, %rbp
subq $32, %rsp
movq %rdi, -8(%rbp)
movq %rsi, -16(%rbp)
movq %rdx, -24(%rbp)
movq -16(%rbp), %rax
movq %rax, %rcx
movq $0, %rax
cmpq %rcx, %rax
sete %al
movzbq %al, %rax
cmpq $0, %rax
je else_1
movq -24(%rbp), %rax
jmp .Lfin_safe_div
jmp endif_1
else_1:
movq -8(%rbp), %rax
movq %rax, %rcx
movq -16(%rbp), %rax
xchgq %rax, %rcx
cqto
idivq %rcx
jmp .Lfin_safe_div
endif_1:
movq $0, %rax
.Lfin_safe_div:
leave
ret
clamp:
pushq %rbp
movq %rsp, %rbp
subq $32, %rsp
movq %rdi, -8(%rbp)
movq %rsi, -16(%rbp)
movq %rdx, -24(%rbp)
movq -8(%rbp), %rax
pushq %rax
movq -16(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jl spaceship_menor_3
jg spaceship_mayor_3
movq $0, %rax
jmp spaceship_fin_3
spaceship_menor_3:
movq $-1, %rax
jmp spaceship_fin_3
spaceship_mayor_3:
movq $1, %rax
spaceship_fin_3:
pushq %rax
movq $-1, %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
sete %al
movzbq %al, %rax
cmpq $0, %rax
je else_2
movq -16(%rbp), %rax
jmp .Lfin_clamp
jmp endif_2
else_2:
movq -8(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jl spaceship_menor_5
jg spaceship_mayor_5
movq $0, %rax
jmp spaceship_fin_5
spaceship_menor_5:
movq $-1, %rax
jmp spaceship_fin_5
spaceship_mayor_5:
movq $1, %rax
spaceship_fin_5:
movq %rax, %rcx
movq $1, %rax
cmpq %rcx, %rax
sete %al
movzbq %al, %rax
cmpq $0, %rax
je else_4
movq -24(%rbp), %rax
jmp .Lfin_clamp
jmp endif_4
else_4:
movq -8(%rbp), %rax
jmp .Lfin_clamp
endif_4:
endif_2:
movq $0, %rax
.Lfin_clamp:
leave
ret
main:
pushq %rbp
movq %rsp, %rbp
movq $-25, %rax
pushq %rax
popq %rdi
call signo
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq $0, %rax
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq $1, %rax
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq $100, %rax
pushq %rax
movq $4, %rax
pushq %rax
movq $999, %rax
pushq %rax
popq %rdx
popq %rsi
popq %rdi
call safe_div
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq $100, %rax
pushq %rax
movq $0, %rax
pushq %rax
movq $999, %rax
pushq %rax
popq %rdx
popq %rsi
popq %rdi
call safe_div
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq $5, %rax
pushq %rax
movq $10, %rax
pushq %rax
movq $50, %rax
pushq %rax
popq %rdx
popq %rsi
popq %rdi
call clamp
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq $25, %rax
pushq %rax
movq $10, %rax
pushq %rax
movq $50, %rax
pushq %rax
popq %rdx
popq %rsi
popq %rdi
call clamp
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq $80, %rax
pushq %rax
movq $10, %rax
pushq %rax
movq $50, %rax
pushq %rax
popq %rdx
popq %rsi
popq %rdi
call clamp
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq $0, %rax
.Lfin_main:
movq $0, %rax
leave
ret
.section .note.GNU-stack,"",@progbits
