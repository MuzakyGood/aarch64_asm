.data

quest:
	.ascii "Enter name: "
len_quest:
	.equ len, len_quest - quest

welcome:
	.ascii "Welcome in aarch64, "
len_welcome:
	.equ len2, len_welcome - welcome

input: .skip 100     // Alocation 100 byte for input

.text

.global _start
_start:

    ldr x1, =input
    mov x2, #100

    str x2, [sp, #-16]!
    str x1, [sp, #-16]!

    mov x0, #1
    ldr x1, =quest
    mov x2, #len
    mov x8, #64
    svc #0

    mov x0, #0            // stdin
    ldr x1, [sp], #16       // buffer address
    ldr x2, [sp], #16          // max byte will be read
    mov x8, #63           // syscall: read
    svc #0

    str x2, [sp, #-16]!
    str x1, [sp, #-16]!

    mov x0, #1
    ldr x1, =welcome
    mov x2, #len2
    mov x8, #64
    svc #0

    // print results input
    mov x0, #1            // stdout
    ldr x1, [sp], #16      // buffer address
    ldr x2, [sp], #16
    mov x8, #64           // syscall: write
    svc #0

    // Exit
    mov x0, #0
    mov x8, #93
    svc #0
