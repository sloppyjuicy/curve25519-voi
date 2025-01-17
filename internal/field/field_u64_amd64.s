// Code generated by command: go run field_u64.go. DO NOT EDIT.

// +build amd64,!purego,!force32bit

#include "textflag.h"

// func feMul(out *Element, a *Element, b *Element)
TEXT ·feMul(SB), NOSPLIT|NOFRAME, $0-24
	// Based on assembly generated by PeachPy. Equivalent to the Go in
	// feMulGeneric, which was originally based on the amd64-51-30k
	// assembly in SUPERCOP.
	MOVQ a+8(FP), CX
	MOVQ b+16(FP), BX

	// r0 = x0*y0 + x1_19*y4 + x2_19*y3 + x3_19*y2 + x4_19*y1

	// r00, r01 = x0*y0
	MOVQ (CX), AX
	MULQ (BX)
	MOVQ AX, SI
	MOVQ DX, DI

	// r00, r01 += x1_19*y4
	MOVQ   8(CX), DX
	IMUL3Q $0x13, DX, AX
	MULQ   32(BX)
	ADDQ   AX, SI
	ADCQ   DX, DI

	// r00, r01 += x2_19*y3
	MOVQ   16(CX), DX
	IMUL3Q $0x13, DX, AX
	MULQ   24(BX)
	ADDQ   AX, SI
	ADCQ   DX, DI

	// r00, r01 += x3_19*y2
	MOVQ   24(CX), DX
	IMUL3Q $0x13, DX, AX
	MULQ   16(BX)
	ADDQ   AX, SI
	ADCQ   DX, DI

	// r00, r01 += x4_19*y1
	MOVQ   32(CX), DX
	IMUL3Q $0x13, DX, AX
	MULQ   8(BX)
	ADDQ   AX, SI
	ADCQ   DX, DI

	// r1 = x0*y1 + x1*y0 + x2_19*y4 + x3_19*y3 + x4_19*y2

	// r10, r11 = x0*y1
	MOVQ (CX), AX
	MULQ 8(BX)
	MOVQ AX, R8
	MOVQ DX, R9

	// r10, r11 += x1*y0
	MOVQ 8(CX), AX
	MULQ (BX)
	ADDQ AX, R8
	ADCQ DX, R9

	// r10, r11 += x2_19*y4
	MOVQ   16(CX), DX
	IMUL3Q $0x13, DX, AX
	MULQ   32(BX)
	ADDQ   AX, R8
	ADCQ   DX, R9

	// r10, r11 += x3_19*y3
	MOVQ   24(CX), DX
	IMUL3Q $0x13, DX, AX
	MULQ   24(BX)
	ADDQ   AX, R8
	ADCQ   DX, R9

	// r10, r11 += x4_19*y2
	MOVQ   32(CX), DX
	IMUL3Q $0x13, DX, AX
	MULQ   16(BX)
	ADDQ   AX, R8
	ADCQ   DX, R9

	// r2 = x0*y2 + x1*y1 + x2*y0 + x3_19*y4 + x4_19*y3

	// r20, r11 = x0*y2
	MOVQ (CX), AX
	MULQ 16(BX)
	MOVQ AX, R10
	MOVQ DX, R11

	// r20, r21 += x1*y1
	MOVQ 8(CX), AX
	MULQ 8(BX)
	ADDQ AX, R10
	ADCQ DX, R11

	// r20, r21 += x2*y0
	MOVQ 16(CX), AX
	MULQ (BX)
	ADDQ AX, R10
	ADCQ DX, R11

	// r20, r21 += x3_19*y4
	MOVQ   24(CX), DX
	IMUL3Q $0x13, DX, AX
	MULQ   32(BX)
	ADDQ   AX, R10
	ADCQ   DX, R11

	// r20, r21 += x4_19*y3
	MOVQ   32(CX), DX
	IMUL3Q $0x13, DX, AX
	MULQ   24(BX)
	ADDQ   AX, R10
	ADCQ   DX, R11

	// r3 = x0*y3 + x1*y2 + x2*y1 + x3*y0 + x4_19*y4

	// r30, r31 = x0*y3
	MOVQ (CX), AX
	MULQ 24(BX)
	MOVQ AX, R12
	MOVQ DX, R13

	// r30, r31 += x1*y2
	MOVQ 8(CX), AX
	MULQ 16(BX)
	ADDQ AX, R12
	ADCQ DX, R13

	// r30, r31 += x2*y1
	MOVQ 16(CX), AX
	MULQ 8(BX)
	ADDQ AX, R12
	ADCQ DX, R13

	// r30, r31 += x3*y0
	MOVQ 24(CX), AX
	MULQ (BX)
	ADDQ AX, R12
	ADCQ DX, R13

	// r30, r31 += x4_19*y4
	MOVQ   32(CX), DX
	IMUL3Q $0x13, DX, AX
	MULQ   32(BX)
	ADDQ   AX, R12
	ADCQ   DX, R13

	// r3 = x0*y4 + x1*y3 + x2*y2 + x3*y1 + x4*y0

	// r40, r31 = x0*y4
	MOVQ (CX), AX
	MULQ 32(BX)
	MOVQ AX, R14
	MOVQ DX, R15

	// r40, r41 += x1*y3
	MOVQ 8(CX), AX
	MULQ 24(BX)
	ADDQ AX, R14
	ADCQ DX, R15

	// r40, r41 += x2*y2
	MOVQ 16(CX), AX
	MULQ 16(BX)
	ADDQ AX, R14
	ADCQ DX, R15

	// r40, r41 += x3*y1
	MOVQ 24(CX), AX
	MULQ 8(BX)
	ADDQ AX, R14
	ADCQ DX, R15

	// r40, r41 += x4*y0
	MOVQ 32(CX), AX
	MULQ (BX)
	ADDQ AX, R14
	ADCQ DX, R15

	// Reduce
	MOVQ   $0x0007ffffffffffff, AX
	SHLQ   $0x0d, SI, DI
	ANDQ   AX, SI
	SHLQ   $0x0d, R8, R9
	ANDQ   AX, R8
	ADDQ   DI, R8
	SHLQ   $0x0d, R10, R11
	ANDQ   AX, R10
	ADDQ   R9, R10
	SHLQ   $0x0d, R12, R13
	ANDQ   AX, R12
	ADDQ   R11, R12
	SHLQ   $0x0d, R14, R15
	ANDQ   AX, R14
	ADDQ   R13, R14
	IMUL3Q $0x13, R15, R15
	ADDQ   R15, SI
	MOVQ   SI, DI
	MOVQ   R8, R9
	MOVQ   R10, R11
	MOVQ   R12, R13
	MOVQ   R14, R15
	ANDQ   AX, SI
	ANDQ   AX, R8
	ANDQ   AX, R10
	ANDQ   AX, R12
	ANDQ   AX, R14
	SHRQ   $0x33, DI
	SHRQ   $0x33, R9
	SHRQ   $0x33, R11
	SHRQ   $0x33, R13
	SHRQ   $0x33, R15
	IMUL3Q $0x13, R15, R15
	ADDQ   DI, R8
	ADDQ   R9, R10
	ADDQ   R11, R12
	ADDQ   R13, R14
	ADDQ   R15, SI

	// Write out the results
	MOVQ out+0(FP), AX
	MOVQ SI, (AX)
	MOVQ R8, 8(AX)
	MOVQ R10, 16(AX)
	MOVQ R12, 24(AX)
	MOVQ R14, 32(AX)
	RET

// func fePow2k(out *Element, a *Element, k uint64)
TEXT ·fePow2k(SB), NOSPLIT|NOFRAME, $0-24
	MOVQ a+8(FP), CX
	MOVQ k+16(FP), BX

pow2k_loop:
	// r0 = x0*x0 + x1*38*x4 + x2*38*x3

	// r00, r01 = x0*x0
	MOVQ (CX), AX
	MULQ (CX)
	MOVQ AX, SI
	MOVQ DX, DI

	// r00, r01 += x1*38*x4
	MOVQ   8(CX), DX
	IMUL3Q $0x26, DX, AX
	MULQ   32(CX)
	ADDQ   AX, SI
	ADCQ   DX, DI

	// r00, r01 += x2*38*x3
	MOVQ   16(CX), DX
	IMUL3Q $0x26, DX, AX
	MULQ   24(CX)
	ADDQ   AX, SI
	ADCQ   DX, DI

	// r1 = x0*2*x1 + x2*38*x4 + x3*19*x3

	// r10, r11 = x0*2*x1
	MOVQ (CX), AX
	SHLQ $0x01, AX
	MULQ 8(CX)
	MOVQ AX, R8
	MOVQ DX, R9

	// r10, r11 += x2*38*x4
	MOVQ   16(CX), DX
	IMUL3Q $0x26, DX, AX
	MULQ   32(CX)
	ADDQ   AX, R8
	ADCQ   DX, R9

	// r10, r11 += x3*19*x3
	MOVQ   24(CX), DX
	IMUL3Q $0x13, DX, AX
	MULQ   24(CX)
	ADDQ   AX, R8
	ADCQ   DX, R9

	// r2 = x0*2*x2 + x1*x1 + x3*38*x4

	// r20, r21 = x0*2*x2
	MOVQ (CX), AX
	SHLQ $0x01, AX
	MULQ 16(CX)
	MOVQ AX, R10
	MOVQ DX, R11

	// r20, r21 += x1*x1
	MOVQ 8(CX), AX
	MULQ 8(CX)
	ADDQ AX, R10
	ADCQ DX, R11

	// r20, r21 += x3*38*x4
	MOVQ   24(CX), DX
	IMUL3Q $0x26, DX, AX
	MULQ   32(CX)
	ADDQ   AX, R10
	ADCQ   DX, R11

	// r3 = x0*2*x3 + x1*2*x2 + x4*19*x4

	// r30, r31 = x0*2*x3
	MOVQ (CX), AX
	SHLQ $0x01, AX
	MULQ 24(CX)
	MOVQ AX, R12
	MOVQ DX, R13

	// r30, r31 += x1*2*x2
	MOVQ 8(CX), AX
	SHLQ $0x01, AX
	MULQ 16(CX)
	ADDQ AX, R12
	ADCQ DX, R13

	// r30, r31 += x4*19*x4
	MOVQ   32(CX), DX
	IMUL3Q $0x13, DX, AX
	MULQ   32(CX)
	ADDQ   AX, R12
	ADCQ   DX, R13

	// r4 = x0*2*x4 + x1*2*x3 + x2*x2

	// r40, r41 = x0*2*x4
	MOVQ (CX), AX
	SHLQ $0x01, AX
	MULQ 32(CX)
	MOVQ AX, R14
	MOVQ DX, R15

	// r40, r41 += x1*2*x3
	MOVQ 8(CX), AX
	SHLQ $0x01, AX
	MULQ 24(CX)
	ADDQ AX, R14
	ADCQ DX, R15

	// r40, r41 += x2*x2
	MOVQ 16(CX), AX
	MULQ 16(CX)
	ADDQ AX, R14
	ADCQ DX, R15

	// Reduce
	MOVQ   $0x0007ffffffffffff, AX
	SHLQ   $0x0d, SI, DI
	ANDQ   AX, SI
	SHLQ   $0x0d, R8, R9
	ANDQ   AX, R8
	ADDQ   DI, R8
	SHLQ   $0x0d, R10, R11
	ANDQ   AX, R10
	ADDQ   R9, R10
	SHLQ   $0x0d, R12, R13
	ANDQ   AX, R12
	ADDQ   R11, R12
	SHLQ   $0x0d, R14, R15
	ANDQ   AX, R14
	ADDQ   R13, R14
	IMUL3Q $0x13, R15, R15
	ADDQ   R15, SI
	MOVQ   SI, DI
	MOVQ   R8, R9
	MOVQ   R10, R11
	MOVQ   R12, R13
	MOVQ   R14, R15
	ANDQ   AX, SI
	ANDQ   AX, R8
	ANDQ   AX, R10
	ANDQ   AX, R12
	ANDQ   AX, R14
	SHRQ   $0x33, DI
	SHRQ   $0x33, R9
	SHRQ   $0x33, R11
	SHRQ   $0x33, R13
	SHRQ   $0x33, R15
	IMUL3Q $0x13, R15, R15
	ADDQ   DI, R8
	ADDQ   R9, R10
	ADDQ   R11, R12
	ADDQ   R13, R14
	ADDQ   R15, SI

	// Write out the results
	MOVQ out+0(FP), CX
	MOVQ SI, (CX)
	MOVQ R8, 8(CX)
	MOVQ R10, 16(CX)
	MOVQ R12, 24(CX)
	MOVQ R14, 32(CX)
	DECQ BX
	JNZ  pow2k_loop
	RET
