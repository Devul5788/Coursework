/*
 * tab:2
 *
 * edit_dist_asm.S - inplementation of computing edit distance between two (linked) lists
 *
 * Permission to use, copy, modify, and distribute this software and its
 * documentation for any purpose, without fee, and without written agreement is
 * hereby granted, provided that the above copyright notice and the following
 * two paragraphs appear in all copies of this software.
 *
 * IN NO EVENT SHALL THE AUTHOR OR THE UNIVERSITY OF ILLINOIS BE LIABLE TO
 * ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL
 * DAMAGES ARISING OUT  OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION,
 * EVEN IF THE AUTHOR AND/OR THE UNIVERSITY OF ILLINOIS HAS BEEN ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * THE AUTHOR AND THE UNIVERSITY OF ILLINOIS SPECIFICALLY DISCLAIM ANY
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE
 * PROVIDED HEREUNDER IS ON AN "AS IS" BASIS, AND NEITHER THE AUTHOR NOR
 * THE UNIVERSITY OF ILLINOIS HAS ANY OBLIGATION TO PROVIDE MAINTENANCE,
 * SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS."
 *
 * Author:        Xiang Li
 * Version:       1
 * Creation Date: Sat Aug 20 2022
 * History:
 *    XL    1    Sat Aug 20 2022
 *        First written.
 */

.data
  UNUSED  = 0
  VAL   = 4
  NEXT = 8

.text
.global edit_dist_asm

# Edit Dist ASM (Assembly)
# Declaration is in edit_dist.h
#
# Registers:
#   EAX - Return Value
#   EBX - root1
#   ESI - root2
#   you may choose how to store your local/temp variables
# b edit_dist_asm.S:65

edit_dist_asm:
  # build stack
  pushl %ebp
  movl %esp, %ebp
  pushl %ebx
  pushl %esi
  pushl %edi

  # adding local variables
  addl  $-12, %esp

  # EBX is root1, and ESI is root2
  movl 8(%ebp), %ebx
  movl 12(%ebp), %esi

  # check (root1 == NULL) go to CHECKROOT2
  cmpl $0, %ebx
  je CHECK_ROOT2

  # check (root1 != NULL) --> check check root2 is null
  cmpl $0, %esi
  je NEXT2

  # check (root1->val == root2->val) go to NEXT3 
  movl 4(%esi), %edi
  cmpl %edi, 4(%ebx)
  je NEXT3

  # no base condition batch. Set INSERT variable
  jmp INSERT

BACK1:
  # store the return value of insert on stack
  movl	%eax, (%esp)
  jmp DELETE

BACK2:  
  # store the return value of delete on stack
  movl %eax,4(%esp)
  jmp REPLACE

BACK3:  
  # store the return value of replace on stack
  movl %eax,8(%esp)

  # insert <= delete
  movl (%esp),%edi
  cmpl 4(%esp),%edi
  jbe INS_RET1

BACK4: 
  # delete <= replace
  movl 4(%esp),%edi 
  cmpl 8(%esp),%edi 
  jbe DEL_RET

  # replace is min out of three
  jmp REP_RET

INS_RET1:
  # insert <= replace
  cmpl 8(%esp), %edi
  jbe INS_RET
  jmp BACK4

INS_RET:
  # return value of insert recursion call
  movl (%esp), %eax
  addl $1, %eax
  jmp FINISH

DEL_RET:
  # return value of delete recursion call
  movl 4(%esp), %eax
  addl $1, %eax
  jmp FINISH

REP_RET:
  # return value of replace recursion call
  movl 8(%esp), %eax
  addl $1, %eax
  jmp FINISH

CHECK_ROOT2:
  # check (root2 == NULL && root1 == NULL) return 0
  cmpl $0, %esi
  je ZERO_RET

  # only root1 == NULL
  jmp NEXT1

NEXT1:
  # check (root1 != NULL && root2 == NULL) return 1 + edit_dist_c(root1->next, root2)
  pushl	8(%esi)
  pushl %ebx
  call edit_dist_asm
  popl %edi
  popl %edi
  addl $1, %eax
  jmp FINISH

NEXT2:
  # check (root1 == NULL && root2 != NULL) return 1 + edit_dist_c(root1->next, root2);
  pushl	%esi
  pushl $0
  call edit_dist_asm
  popl %edi
  popl %edi
  addl $1, %eax
  jmp FINISH

NEXT3:
  # check (root1->val == root2->val) return edit_dist_c(root1->next, root2->next)
  pushl 8(%esi)
  pushl 8(%ebx)
  call edit_dist_asm
  popl %edi
  popl %edi
  jmp FINISH

ZERO_RET:
  # return 0
  andl $0, %eax
  jmp FINISH

INSERT:
  # recursive call to find value of insert
  pushl	%esi
  pushl 8(%ebx)
  call edit_dist_asm
  popl %edi
  popl %edi
  jmp BACK1

DELETE:
  # recursive call to find value of delete
  pushl	8(%esi)
  pushl %ebx
  call edit_dist_asm
  popl %edi
  popl %edi
  jmp BACK2

REPLACE:
  # recursive call to find value of replace
  pushl	8(%esi)
  pushl 8(%ebx)
  call edit_dist_asm
  popl %edi
  popl %edi
  jmp BACK3

FINISH:
  # callee teardown
  addl  $12, %esp
  popl %edi
  popl %esi
  popl %ebx

  # return value save in eax
  leave
  ret