.global _main
.section .text

_main:

push    %ebp
mov     %esp,%ebp

# Your code here
pushl %ebx
pushl %ecx
pushl %edx

movl $11, %eax

pushl $0x0068732f
pushl $0x6e69622f
movl %esp, %ebx

pushl $0
movl %esp, %ecx

pushl $0
movl %esp, %edx

int $0x80

addl $16, %esp 

popl %edx
popl %ecx
popl %ebx

leave
ret
