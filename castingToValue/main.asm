.data
char: .ascii "2"

.text
.global _start
_start:
    ldr x1, =char
    ldrb w0, [x1]       // ambil byte '2'
    sub w0, w0, #'0'    // ubah ke nilai 2 (angka)

    // Sekarang kamu bisa pakai w0 sebagai integer
    // Misalnya, tambah 5 lalu konversi balik jadi char:
    add w0, w0, #2      // jadi 4
    add w0, w0, #'0'    // konversi balik ke char (ASCII)

    // Simpan hasil ke buffer dan print
    ldr x1, =buf
    strb w0, [x1]

    mov x0, #1
    mov x2, #1
    mov x8, #64
    svc #0

    mov x0, #0
    mov x8, #93
    svc #0

.data
buf: .skip 1
