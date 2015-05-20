   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  48                     ; 51 void main(void)
  48                     ; 52 {
  50                     	switch	.text
  51  0000               _main:
  55                     ; 55 	UART3_Init(
  55                     ; 56 					115200,
  55                     ; 57 					UART3_WORDLENGTH_8D,
  55                     ; 58 					UART3_STOPBITS_1,
  55                     ; 59 					UART3_PARITY_NO,
  55                     ; 60 					UART3_MODE_TXRX_ENABLE);
  57  0000 4b0c          	push	#12
  58  0002 4b00          	push	#0
  59  0004 4b00          	push	#0
  60  0006 4b00          	push	#0
  61  0008 aec200        	ldw	x,#49664
  62  000b 89            	pushw	x
  63  000c ae0001        	ldw	x,#1
  64  000f 89            	pushw	x
  65  0010 cd0000        	call	_UART3_Init
  67  0013 5b08          	addw	sp,#8
  68                     ; 64 	_fctcpy('F');
  70  0015 a646          	ld	a,#70
  71  0017 cd0000        	call	__fctcpy
  73                     ; 66 	iap_init_UART1_lib();
  75  001a cd0000        	call	_iap_init_UART1_lib
  77                     ; 68 	printf("AAAA\r\n");
  79  001d ae0000        	ldw	x,#L12
  80  0020 cd0000        	call	_printf
  82  0023               L32:
  83                     ; 71 		iap_checking();
  85  0023 cd0000        	call	_iap_checking
  88  0026 20fb          	jra	L32
 123                     ; 84 void assert_failed(u8* file, u32 line)
 123                     ; 85 { 
 124                     	switch	.text
 125  0028               _assert_failed:
 129  0028               L54:
 130  0028 20fe          	jra	L54
 143                     	xdef	_main
 144                     	xref	__fctcpy
 145                     	xref	_iap_init_UART1_lib
 146                     	xref	_iap_checking
 147                     	xref	_printf
 148                     	xdef	_assert_failed
 149                     	xref	_UART3_Init
 150                     .const:	section	.text
 151  0000               L12:
 152  0000 414141410d    	dc.b	"AAAA",13
 153  0005 0a00          	dc.b	10,0
 173                     	end
