.data

msg:
    .ascii        "Hello, ARM64!\nI Like C and C++. Assembly Too\n"
msg_len:
    .equ len, msg_len - msg

msg2:
	.ascii "My Name is Zach Noland\nNext i want learn stdin in Assembly\n"
	len2 = . -msg
msg2_len:
	.equ len2, msg2_len - msg2

.text

.global _start
_start:

    ldr x1, =msg2
    mov x2, #len2

    str x2, [sp, #-16]! /* I put length string to stack*/
    str x1, [sp, #-16]! /* I put text2 to stack*/

    mov     x0, #1
    ldr     x1, =msg
    mov     x2, #len
    mov     x8, #64
    svc     #0

    mov	    x0, #1
    ldr x1, [sp], #16 /*I want to get back string inside stack*/
    ldr x2, [sp], #16 /*I wsnt to get back length string inside stack*/
    mov     x8, #64
    svc     #0

    mov     x0, #0
    mov     x8, #93
    svc     #0
