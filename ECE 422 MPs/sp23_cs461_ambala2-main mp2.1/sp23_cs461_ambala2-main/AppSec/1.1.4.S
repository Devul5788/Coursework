.global your_asm_fn
.section .text

your_asm_fn:

push    %ebp
mov     %esp,%ebp

# Your code here

  pushl %ebx
  pushl %ecx

  pushl $0
  pushl $0x646f6f66
  pushl $0x6c6f6f63
  movl %esp, %ebx

  push  $0xc105ed
  movl %esp, %ecx

  push %ebx
  push %ecx

  push $0xacce55ed

  call practice

  addl $32, %esp

   popl %ecx
   popl %ebx

leave
ret

