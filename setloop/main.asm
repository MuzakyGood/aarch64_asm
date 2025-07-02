.data

quest:
	.ascii "Set how many times to loop: "
len_quest: .equ len, len_quest - quest

inputnumber: .skip 100

textquest:
	.ascii "Enter Text: "
txt_len: .equ lentxt, txt_len - textquest

inputtext: .skip 100

.text

.global _start
_start:

    mov x3, #0 // x3 init to end loop

    // stdout print how many loop set question
    mov x0, #1
    ldr x1, =quest
    mov x2, #len
    mov x8, #64
    svc #0

    // stdin input with buffer value loop
    mov x0, #0
    ldr x1, =inputnumber
    mov x2, #100
    mov x8, #63
    svc #0

    ldr x1, =inputnumber // get value from data inputnumber to register x1
    ldrb w4, [x1] // Get value from register x1
    sub w4, w4, #'0' // casting char to value

    // stdout print text input question
    mov x0, #1
    ldr x1, =textquest
    mov x2, #lentxt
    mov x8, #64
    svc #0

    // stdin input with buffer text
    mov x0, #0
    ldr x1, =inputtext
    mov x2, #100
    mov x8, #63
    svc #0

    mainloop: // flag main loop

    // stdout print text you input before
    mov x0, #1
    ldr x1, =inputtext
    mov x2, #lentxt
    mov x8, #64
    svc #0

    add x3, x3, #1 // add x3 = x3 + 1

    cmp x3, x4 // compere x3 and x4
    blt mainloop // x3 < x4 jump to mainloop flag

    // exit return 0;
    mov x0, #0
    mov x8, #93
    svc #0
