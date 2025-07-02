.data

quest:
	.ascii "Enter name: "
len_quest:
	.equ len, len_quest - quest

welcome:
	.ascii "Welcome in aarch64, "
len_welcome:
	.equ len2, len_welcome - welcome

input: .skip 100

.text

.global _start
_start:

    mov x3, #0

    ldr x1, =input
    mov x2, #100

    str x2, [sp, #-16]!
    str x1, [sp, #-16]!

    mov x0, #1
    ldr x1, =quest
    mov x2, #len
    mov x8, #64
    svc #0

    mov x0, #0
    ldr x1, [sp], #16
    ldr x2, [sp], #16
    mov x8, #63
    svc #0

    mainloop:

    str x2, [sp, #-16]!
    str x1, [sp, #-16]!

    mov x0, #1
    ldr x1, =welcome
    mov x2, #len2
    mov x8, #64
    svc #0

    mov x0, #1
    ldr x1, [sp], #16
    ldr x2, [sp], #16
    mov x8, #64
    svc #0

    add x3, x3, #1

    cmp x3, #5
    blt mainloop

    mov x0, #0
    mov x8, #93
    svc #0
