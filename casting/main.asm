.data

getline:
	.ascii "\n"

getline_end:
	.equ len1, getline_end - getline

buffer: .space 16

.text
.global _start
_start:

    mov x0, #5
    add x0, x0, #'0' // Metode konversi ke char

    ldr x1, =buffer       // muat alamat buffer ke x1
    strb w0, [x1]         // simpan 1 byte dari w0 ke alamat buffer

    mov x0, #1            // stdout
    ldr x1, =buffer       // alamat buffer
    mov x2, #1            // panjang 1 byte
    mov x8, #64           // syscall write
    svc #0

    mov x0, #1
    ldr x1, =getline
    mov x2, #len1
    mov x8, #64
    svc #0

    mov x0, #0
    mov x8, #93           // syscall exit
    svc #0
