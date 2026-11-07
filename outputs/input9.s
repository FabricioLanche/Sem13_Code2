.data
print_fmt:.string "%ld\n" 
.text
.globl main
discrim:
pushq %rbp
movq %rsp, %rbp
subq $32, %rsp
movq %rdi, -8(%rbp)
movq %rsi, -16(%rbp)
movq %rdx, -24(%rbp)
movq -16(%rbp), %rax
movq %rax, %rcx
movq -16(%rbp), %rax
imulq %rcx, %rax
pushq %rax
movq $4, %rax
movq %rax, %rcx
movq -8(%rbp), %rax
imulq %rcx, %rax
movq %rax, %rcx
movq -24(%rbp), %rax
imulq %rcx, %rax
movq %rax, %rcx
popq %rax
subq %rcx, %rax
jmp .Lfin_discrim
movq $0, %rax
.Lfin_discrim:
leave
ret
tipoRaices:
pushq %rbp
movq %rsp, %rbp
subq $32, %rsp
movq %rdi, -8(%rbp)
movq %rsi, -16(%rbp)
movq %rdx, -24(%rbp)
movq $0, -32(%rbp)
movq -16(%rbp), %rax
movq %rax, %rcx
movq -16(%rbp), %rax
imulq %rcx, %rax
pushq %rax
movq $4, %rax
movq %rax, %rcx
movq -8(%rbp), %rax
imulq %rcx, %rax
movq %rax, %rcx
movq -24(%rbp), %rax
imulq %rcx, %rax
movq %rax, %rcx
popq %rax
subq %rcx, %rax
movq %rax, -32(%rbp)
movq -32(%rbp), %rax
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
jmp .Lfin_tipoRaices
movq $0, %rax
.Lfin_tipoRaices:
leave
ret
main:
pushq %rbp
movq %rsp, %rbp
subq $32, %rsp
movq $0, -8(%rbp)
movq $0, -16(%rbp)
movq $0, -24(%rbp)
movq $1, %rax
pushq %rax
movq $-4, %rax
pushq %rax
movq $4, %rax
pushq %rax
popq %rdx
popq %rsi
popq %rdi
call tipoRaices
movq %rax, -8(%rbp)
movq $1, %rax
pushq %rax
movq $-5, %rax
pushq %rax
movq $6, %rax
pushq %rax
popq %rdx
popq %rsi
popq %rdi
call tipoRaices
movq %rax, -16(%rbp)
movq $1, %rax
pushq %rax
movq $2, %rax
pushq %rax
movq $5, %rax
pushq %rax
popq %rdx
popq %rsi
popq %rdi
call tipoRaices
movq %rax, -24(%rbp)
movq -8(%rbp), %rax
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq -16(%rbp), %rax
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq -24(%rbp), %rax
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
