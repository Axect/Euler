	.file	"dub_platform_probe_f24dbb80_20ac_46d8_ad84_79c43ba18213.d"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"/tmp/dub_platform_probe_f24dbb80_20ac_46d8_ad84_79c43ba18213.d"
.LC1:
	.string	", "
	.text
	.globl	_D18dub_platform_probe11stringArrayFAAyaZAya
	.type	_D18dub_platform_probe11stringArrayFAAyaZAya, @function
_D18dub_platform_probe11stringArrayFAAyaZAya:
.LFB0:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gdc_personality_v0
	.cfi_lsda 0x1b,.LLSDA0
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$184, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %rax
	movq	%rsi, %rcx
	movq	%rcx, %rdx
	movq	%rax, -208(%rbp)
	movq	%rdx, -200(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	$0, -160(%rbp)
	movq	$0, -152(%rbp)
	movq	-208(%rbp), %rax
	movq	-200(%rbp), %rdx
	movq	%rax, -144(%rbp)
	movq	%rdx, -136(%rbp)
	movq	$0, -176(%rbp)
.L5:
	movq	-144(%rbp), %rax
	cmpq	%rax, -176(%rbp)
	jnb	.L6
	movq	-136(%rbp), %rdx
	movq	-144(%rbp), %rax
	cmpq	%rax, -176(%rbp)
	jb	.L3
	movl	$62, %r12d
	leaq	.LC0(%rip), %r13
	movq	%r12, %rcx
	movq	%r13, %rbx
	movq	%r12, %rax
	movq	%r13, %rdx
	movq	%rdx, %rax
	movl	$7, %edx
	movq	%rcx, %rdi
	movq	%rax, %rsi
.LEHB0:
	call	_d_arraybounds@PLT
.L3:
	movq	-176(%rbp), %rax
	salq	$4, %rax
	addq	%rdx, %rax
	movq	8(%rax), %rdx
	movq	(%rax), %rax
	movq	%rax, -128(%rbp)
	movq	%rdx, -120(%rbp)
	movq	-176(%rbp), %rax
	movq	%rax, -168(%rbp)
	cmpq	$0, -168(%rbp)
	je	.L4
	movq	$2, -224(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, -216(%rbp)
	leaq	-160(%rbp), %rax
	movq	-224(%rbp), %rdx
	movq	-216(%rbp), %rcx
	movq	%rax, %rsi
	movq	_D12TypeInfo_Aya6__initZ@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	_d_arrayappendT@PLT
.L4:
	movb	$34, -177(%rbp)
	movb	$34, -178(%rbp)
	movq	$1, -80(%rbp)
	leaq	-178(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-128(%rbp), %rax
	movq	-120(%rbp), %rdx
	movq	%rax, -96(%rbp)
	movq	%rdx, -88(%rbp)
	movq	$1, -112(%rbp)
	leaq	-177(%rbp), %rax
	movq	%rax, -104(%rbp)
	movl	$3, %r14d
	leaq	-112(%rbp), %rax
	movq	%rax, %r15
	movq	%r14, %rcx
	movq	%r15, %rbx
	movq	%r14, %rax
	movq	%r15, %rdx
	movq	%rdx, %rax
	movq	%rcx, %rsi
	movq	%rax, %rdx
	movq	_D12TypeInfo_Aya6__initZ@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	_d_arraycatnTX@PLT
	leaq	-160(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movq	_D12TypeInfo_Aya6__initZ@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	_d_arrayappendT@PLT
.LEHE0:
	addq	$1, -176(%rbp)
	jmp	.L5
.L6:
	movq	-160(%rbp), %rax
	movq	-152(%rbp), %rdx
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L9
	jmp	.L11
.L10:
	movq	%rax, %rdi
.LEHB1:
	call	_Unwind_Resume@PLT
.LEHE1:
.L11:
	call	__stack_chk_fail@PLT
.L9:
	addq	$184, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.globl	__gdc_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA0:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE0-.LLSDACSB0
.LLSDACSB0:
	.uleb128 .LEHB0-.LFB0
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L10-.LFB0
	.uleb128 0
	.uleb128 .LEHB1-.LFB0
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE0:
	.text
	.size	_D18dub_platform_probe11stringArrayFAAyaZAya, .-_D18dub_platform_probe11stringArrayFAAyaZAya
	.section	.rodata
.LC2:
	.string	"linux"
.LC3:
	.string	"posix"
	.text
	.globl	_D18dub_platform_probe17determinePlatformFZAAya
	.type	_D18dub_platform_probe17determinePlatformFZAAya, @function
_D18dub_platform_probe17determinePlatformFZAAya:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	leaq	-32(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rsi
	leaq	_D13TypeInfo_AAya6__initZ(%rip), %rdi
	call	_d_arrayappendcTX@PLT
	movq	%rdx, %rcx
	subq	$1, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	$5, (%rax)
	leaq	.LC2(%rip), %rdx
	movq	%rdx, 8(%rax)
	leaq	-32(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rsi
	leaq	_D13TypeInfo_AAya6__initZ(%rip), %rdi
	call	_d_arrayappendcTX@PLT
	movq	%rdx, %rcx
	subq	$1, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	$5, (%rax)
	leaq	.LC3(%rip), %rdx
	movq	%rdx, 8(%rax)
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_D18dub_platform_probe17determinePlatformFZAAya, .-_D18dub_platform_probe17determinePlatformFZAAya
	.weak	_D13TypeInfo_AAya6__initZ
	.section	.data.rel.ro._D13TypeInfo_AAya6__initZ,"awG",@progbits,_D13TypeInfo_AAya6__initZ,comdat
	.align 16
	.type	_D13TypeInfo_AAya6__initZ, @object
	.size	_D13TypeInfo_AAya6__initZ, 24
_D13TypeInfo_AAya6__initZ:
	.quad	_D14TypeInfo_Array6__vtblZ
	.quad	0
	.quad	_D12TypeInfo_Aya6__initZ
	.section	.rodata
.LC4:
	.string	"x86_64"
	.text
	.globl	_D18dub_platform_probe21determineArchitectureFZAAya
	.type	_D18dub_platform_probe21determineArchitectureFZAAya, @function
_D18dub_platform_probe21determineArchitectureFZAAya:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	leaq	-32(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rsi
	leaq	_D13TypeInfo_AAya6__initZ(%rip), %rdi
	call	_d_arrayappendcTX@PLT
	movq	%rdx, %rcx
	subq	$1, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	$6, (%rax)
	leaq	.LC4(%rip), %rdx
	movq	%rdx, 8(%rax)
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_D18dub_platform_probe21determineArchitectureFZAAya, .-_D18dub_platform_probe21determineArchitectureFZAAya
	.section	.rodata
.LC5:
	.string	"gdc"
	.text
	.globl	_D18dub_platform_probe17determineCompilerFZAya
	.type	_D18dub_platform_probe17determineCompilerFZAya, @function
_D18dub_platform_probe17determineCompilerFZAya:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$3, %eax
	leaq	.LC5(%rip), %rdx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_D18dub_platform_probe17determineCompilerFZAya, .-_D18dub_platform_probe17determineCompilerFZAya
	.globl	_D18dub_platform_probe12__ModuleInfoZ
	.data
	.align 16
	.type	_D18dub_platform_probe12__ModuleInfoZ, @object
	.size	_D18dub_platform_probe12__ModuleInfoZ, 27
_D18dub_platform_probe12__ModuleInfoZ:
	.long	4100
	.long	0
	.string	"dub_platform_probe"
	.globl	_D18dub_platform_probe11__moduleRefZ
	.section	minfo,"aw"
	.align 8
	.type	_D18dub_platform_probe11__moduleRefZ, @object
	.size	_D18dub_platform_probe11__moduleRefZ, 8
_D18dub_platform_probe11__moduleRefZ:
	.quad	_D18dub_platform_probe12__ModuleInfoZ
	.hidden	gdc.dso_slot
	.weak	gdc.dso_slot
	.section	.bss.gdc.dso_slot,"awG",@nobits,gdc.dso_slot,comdat
	.align 8
	.type	gdc.dso_slot, @gnu_unique_object
	.size	gdc.dso_slot, 8
gdc.dso_slot:
	.zero	8
	.hidden	gdc.dso_initialized
	.weak	gdc.dso_initialized
	.section	.bss.gdc.dso_initialized,"awG",@nobits,gdc.dso_initialized,comdat
	.type	gdc.dso_initialized, @gnu_unique_object
	.size	gdc.dso_initialized, 1
gdc.dso_initialized:
	.zero	1
	.section	.text.gdc.dso_ctor,"axG",@progbits,gdc.dso_ctor,comdat
	.weak	gdc.dso_ctor
	.hidden	gdc.dso_ctor
	.type	gdc.dso_ctor, @function
gdc.dso_ctor:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movzbl	gdc.dso_initialized(%rip), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L23
	movb	$1, gdc.dso_initialized(%rip)
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movq	$1, -64(%rbp)
	leaq	gdc.dso_slot(%rip), %rax
	movq	%rax, -56(%rbp)
	leaq	__start_minfo(%rip), %rax
	movq	%rax, -48(%rbp)
	leaq	__stop_minfo(%rip), %rax
	movq	%rax, -40(%rbp)
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_d_dso_registry@PLT
.L23:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L22
	call	__stack_chk_fail@PLT
.L22:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	gdc.dso_ctor, .-gdc.dso_ctor
	.section	.text.gdc.dso_dtor,"axG",@progbits,gdc.dso_dtor,comdat
	.weak	gdc.dso_dtor
	.hidden	gdc.dso_dtor
	.type	gdc.dso_dtor, @function
gdc.dso_dtor:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movzbl	gdc.dso_initialized(%rip), %eax
	testb	%al, %al
	je	.L27
	movb	$0, gdc.dso_initialized(%rip)
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movq	$1, -64(%rbp)
	leaq	gdc.dso_slot(%rip), %rax
	movq	%rax, -56(%rbp)
	leaq	__start_minfo(%rip), %rax
	movq	%rax, -48(%rbp)
	leaq	__stop_minfo(%rip), %rax
	movq	%rax, -40(%rbp)
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_d_dso_registry@PLT
.L27:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L26
	call	__stack_chk_fail@PLT
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	gdc.dso_dtor, .-gdc.dso_dtor
	.text
	.type	_GLOBAL__I_18dub_platform_probe, @function
_GLOBAL__I_18dub_platform_probe:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	gdc.dso_ctor
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	_GLOBAL__I_18dub_platform_probe, .-_GLOBAL__I_18dub_platform_probe
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__I_18dub_platform_probe
	.text
	.type	_GLOBAL__D_18dub_platform_probe, @function
_GLOBAL__D_18dub_platform_probe:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	gdc.dso_dtor
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	_GLOBAL__D_18dub_platform_probe, .-_GLOBAL__D_18dub_platform_probe
	.section	.fini_array,"aw"
	.align 8
	.quad	_GLOBAL__D_18dub_platform_probe
	.hidden	DW.ref.__gdc_personality_v0
	.weak	DW.ref.__gdc_personality_v0
	.section	.data.rel.local.DW.ref.__gdc_personality_v0,"awG",@progbits,DW.ref.__gdc_personality_v0,comdat
	.align 8
	.type	DW.ref.__gdc_personality_v0, @object
	.size	DW.ref.__gdc_personality_v0, 8
DW.ref.__gdc_personality_v0:
	.quad	__gdc_personality_v0
	.hidden	__stop_minfo
	.hidden	__start_minfo
	.ident	"GCC: (GDC 8.2.1 based on D v2.068.2 built with ISL 0.20 for Arch Linux) 8.2.1 20180831"
	.section	.note.GNU-stack,"",@progbits
