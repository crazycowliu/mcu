   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	bsct
  16  0000               _pkg_count:
  17  0000 00            	dc.b	0
  18  0001               _rx_idx:
  19  0001 00            	dc.b	0
  20                     .const:	section	.text
  21  0000               _iap_HSIDivFactor:
  22  0000 01            	dc.b	1
  23  0001 02            	dc.b	2
  24  0002 04            	dc.b	4
  25  0003 08            	dc.b	8
  71                     ; 68  void MAIN_UART1_RX_IRQHandler(void)
  71                     ; 69 {
  73                     	switch	.text
  74  0000               _MAIN_UART1_RX_IRQHandler:
  76  0000 88            	push	a
  77       00000001      OFST:	set	1
  80                     ; 73   char c = 0;
  83  0001               L13:
  84                     ; 74   while(iap_UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
  86  0001 ae0020        	ldw	x,#32
  87  0004 ad1f          	call	_iap_UART1_GetFlagStatus
  89  0006 4d            	tnz	a
  90  0007 27f8          	jreq	L13
  91                     ; 75   c = iap_UART1_ReceiveData8();
  93  0009 ad5d          	call	_iap_UART1_ReceiveData8
  95  000b 6b01          	ld	(OFST+0,sp),a
  96                     ; 78   if (pkg_count == 0) {
  98  000d 3d00          	tnz	_pkg_count
  99  000f 2612          	jrne	L53
 100                     ; 79     buf[rx_idx] = c;
 102  0011 b601          	ld	a,_rx_idx
 103  0013 5f            	clrw	x
 104  0014 97            	ld	xl,a
 105  0015 7b01          	ld	a,(OFST+0,sp)
 106  0017 e700          	ld	(_buf,x),a
 107                     ; 80     rx_idx++;
 109  0019 3c01          	inc	_rx_idx
 110                     ; 82     if (rx_idx == 128) {
 112  001b b601          	ld	a,_rx_idx
 113  001d a180          	cp	a,#128
 114  001f 2602          	jrne	L53
 115                     ; 83       rx_idx = 0;
 117  0021 3f01          	clr	_rx_idx
 118  0023               L53:
 119                     ; 88 }
 122  0023 84            	pop	a
 123  0024 81            	ret
 266                     ; 90 FlagStatus iap_UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
 266                     ; 91 {
 267                     	switch	.text
 268  0025               _iap_UART1_GetFlagStatus:
 270  0025 89            	pushw	x
 271  0026 88            	push	a
 272       00000001      OFST:	set	1
 275                     ; 92   FlagStatus status = RESET;
 277                     ; 96   if (UART1_FLAG == UART1_FLAG_LBDF)
 279  0027 a30210        	cpw	x,#528
 280  002a 2610          	jrne	L321
 281                     ; 98     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
 283  002c 9f            	ld	a,xl
 284  002d c45237        	and	a,21047
 285  0030 2706          	jreq	L521
 286                     ; 101       status = SET;
 288  0032 a601          	ld	a,#1
 289  0034 6b01          	ld	(OFST+0,sp),a
 291  0036 202b          	jra	L131
 292  0038               L521:
 293                     ; 106       status = RESET;
 295  0038 0f01          	clr	(OFST+0,sp)
 296  003a 2027          	jra	L131
 297  003c               L321:
 298                     ; 109   else if (UART1_FLAG == UART1_FLAG_SBK)
 300  003c 1e02          	ldw	x,(OFST+1,sp)
 301  003e a30101        	cpw	x,#257
 302  0041 2611          	jrne	L331
 303                     ; 111     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
 305  0043 c65235        	ld	a,21045
 306  0046 1503          	bcp	a,(OFST+2,sp)
 307  0048 2706          	jreq	L531
 308                     ; 114       status = SET;
 310  004a a601          	ld	a,#1
 311  004c 6b01          	ld	(OFST+0,sp),a
 313  004e 2013          	jra	L131
 314  0050               L531:
 315                     ; 119       status = RESET;
 317  0050 0f01          	clr	(OFST+0,sp)
 318  0052 200f          	jra	L131
 319  0054               L331:
 320                     ; 124     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
 322  0054 c65230        	ld	a,21040
 323  0057 1503          	bcp	a,(OFST+2,sp)
 324  0059 2706          	jreq	L341
 325                     ; 127       status = SET;
 327  005b a601          	ld	a,#1
 328  005d 6b01          	ld	(OFST+0,sp),a
 330  005f 2002          	jra	L131
 331  0061               L341:
 332                     ; 132       status = RESET;
 334  0061 0f01          	clr	(OFST+0,sp)
 335  0063               L131:
 336                     ; 136   return status;
 338  0063 7b01          	ld	a,(OFST+0,sp)
 341  0065 5b03          	addw	sp,#3
 342  0067 81            	ret
 366                     ; 138 uint8_t iap_UART1_ReceiveData8(void)
 366                     ; 139 {
 367                     	switch	.text
 368  0068               _iap_UART1_ReceiveData8:
 372                     ; 140   return ((uint8_t)UART1->DR);
 374  0068 c65231        	ld	a,21041
 377  006b 81            	ret
 413                     ; 143 char putchar(char c) {
 414                     	switch	.text
 415  006c               _putchar:
 417  006c 88            	push	a
 418       00000000      OFST:	set	0
 421                     ; 144 	UART3_SendData8(c);
 423  006d cd0000        	call	_UART3_SendData8
 426  0070               L771:
 427                     ; 145 	while(UART3_GetFlagStatus(UART3_FLAG_TXE) == RESET);	
 429  0070 ae0080        	ldw	x,#128
 430  0073 cd0000        	call	_UART3_GetFlagStatus
 432  0076 4d            	tnz	a
 433  0077 27f7          	jreq	L771
 434                     ; 146 	return c;
 436  0079 7b01          	ld	a,(OFST+1,sp)
 439  007b 5b01          	addw	sp,#1
 440  007d 81            	ret
 476                     ; 149 void iap_print_buf(void) {
 477                     	switch	.text
 478  007e               _iap_print_buf:
 480  007e 89            	pushw	x
 481       00000002      OFST:	set	2
 484                     ; 150 		int i = 0;
 486                     ; 151 			if(buf[3] == 'u') {
 488  007f b603          	ld	a,_buf+3
 489  0081 a175          	cp	a,#117
 490  0083 2624          	jrne	L122
 491                     ; 152 				for (i = 0; i < buf[4] + 7; i++) {//or rx_idx
 493  0085 5f            	clrw	x
 494  0086 1f01          	ldw	(OFST-1,sp),x
 496  0088 200d          	jra	L722
 497  008a               L322:
 498                     ; 154 					putchar(buf[i]);
 500  008a 1e01          	ldw	x,(OFST-1,sp)
 501  008c e600          	ld	a,(_buf,x)
 502  008e addc          	call	_putchar
 504                     ; 152 				for (i = 0; i < buf[4] + 7; i++) {//or rx_idx
 506  0090 1e01          	ldw	x,(OFST-1,sp)
 507  0092 1c0001        	addw	x,#1
 508  0095 1f01          	ldw	(OFST-1,sp),x
 509  0097               L722:
 512  0097 9c            	rvf
 513  0098 a600          	ld	a,#0
 514  009a 97            	ld	xl,a
 515  009b a607          	ld	a,#7
 516  009d bb04          	add	a,_buf+4
 517  009f 2401          	jrnc	L61
 518  00a1 5c            	incw	x
 519  00a2               L61:
 520  00a2 02            	rlwa	x,a
 521  00a3 1301          	cpw	x,(OFST-1,sp)
 522  00a5 2ce3          	jrsgt	L322
 524  00a7 2024          	jra	L332
 525  00a9               L122:
 526                     ; 156 			} else if (buf[3] == 'i' || buf[3] == 'f') {
 528  00a9 b603          	ld	a,_buf+3
 529  00ab a169          	cp	a,#105
 530  00ad 2706          	jreq	L732
 532  00af b603          	ld	a,_buf+3
 533  00b1 a166          	cp	a,#102
 534  00b3 2618          	jrne	L332
 535  00b5               L732:
 536                     ; 157 				for (i = 0; i < 7; i++) {//or rx_idx
 538  00b5 5f            	clrw	x
 539  00b6 1f01          	ldw	(OFST-1,sp),x
 540  00b8               L142:
 541                     ; 159 					putchar(buf[i]);
 543  00b8 1e01          	ldw	x,(OFST-1,sp)
 544  00ba e600          	ld	a,(_buf,x)
 545  00bc adae          	call	_putchar
 547                     ; 157 				for (i = 0; i < 7; i++) {//or rx_idx
 549  00be 1e01          	ldw	x,(OFST-1,sp)
 550  00c0 1c0001        	addw	x,#1
 551  00c3 1f01          	ldw	(OFST-1,sp),x
 554  00c5 9c            	rvf
 555  00c6 1e01          	ldw	x,(OFST-1,sp)
 556  00c8 a30007        	cpw	x,#7
 557  00cb 2feb          	jrslt	L142
 558  00cd               L332:
 559                     ; 162 }
 562  00cd 85            	popw	x
 563  00ce 81            	ret
 591                     ; 164 void iap_init_UART1_lib(void) {
 592                     	switch	.text
 593  00cf               _iap_init_UART1_lib:
 597                     ; 166   iap_UART1_DeInit();
 599  00cf cd03ba        	call	_iap_UART1_DeInit
 601                     ; 167   iap_UART1_Init(
 601                     ; 168     (u32)115200,
 601                     ; 169     UART1_WORDLENGTH_8D,
 601                     ; 170     UART1_STOPBITS_1,
 601                     ; 171     UART1_PARITY_NO,
 601                     ; 172     UART1_SYNCMODE_CLOCK_DISABLE,
 601                     ; 173     UART1_MODE_TXRX_ENABLE);
 603  00d2 4b0c          	push	#12
 604  00d4 4b80          	push	#128
 605  00d6 4b00          	push	#0
 606  00d8 4b00          	push	#0
 607  00da 4b00          	push	#0
 608  00dc aec200        	ldw	x,#49664
 609  00df 89            	pushw	x
 610  00e0 ae0001        	ldw	x,#1
 611  00e3 89            	pushw	x
 612  00e4 cd03e5        	call	_iap_UART1_Init
 614  00e7 5b09          	addw	sp,#9
 615                     ; 174   iap_UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);
 617  00e9 4b01          	push	#1
 618  00eb ae0205        	ldw	x,#517
 619  00ee cd0525        	call	_iap_UART1_ITConfig
 621  00f1 84            	pop	a
 622                     ; 177   iap_UART1_Cmd(ENABLE);
 624  00f2 a601          	ld	a,#1
 625  00f4 cd0596        	call	_iap_UART1_Cmd
 627                     ; 179 	rim();
 630  00f7 9a            rim
 632                     ; 180 }
 636  00f8 81            	ret
 680                     	switch	.const
 681  0004               L42:
 682  0004 00008000      	dc.l	32768
 683  0008               L62:
 684  0008 00010001      	dc.l	65537
 685  000c               L03:
 686  000c 00004000      	dc.l	16384
 687  0010               L23:
 688  0010 00004800      	dc.l	18432
 689                     ; 183 u8 WriteBuffer(u32  DataAddress, u8 DataCount)
 689                     ; 184 {
 690                     	switch	.text
 691  00f9               _WriteBuffer:
 693       00000000      OFST:	set	0
 696                     ; 186   if (((u32)DataAddress >= FLASH_START) && (((u32)DataAddress + DataCount - 1) <= FLASH_END))
 698  00f9 96            	ldw	x,sp
 699  00fa 1c0003        	addw	x,#OFST+3
 700  00fd cd0000        	call	c_ltor
 702  0100 ae0004        	ldw	x,#L42
 703  0103 cd0000        	call	c_lcmp
 705  0106 2529          	jrult	L103
 707  0108 96            	ldw	x,sp
 708  0109 1c0003        	addw	x,#OFST+3
 709  010c cd0000        	call	c_ltor
 711  010f 7b07          	ld	a,(OFST+7,sp)
 712  0111 cd0000        	call	c_ladc
 714  0114 a601          	ld	a,#1
 715  0116 cd0000        	call	c_lsbc
 717  0119 ae0008        	ldw	x,#L62
 718  011c cd0000        	call	c_lcmp
 720  011f 2410          	jruge	L103
 721                     ; 187     return WriteBufferFlash(DataAddress, DataCount, FLASH_MEMTYPE_PROG);
 723  0121 4bfd          	push	#253
 724  0123 7b08          	ld	a,(OFST+8,sp)
 725  0125 88            	push	a
 726  0126 1e07          	ldw	x,(OFST+7,sp)
 727  0128 89            	pushw	x
 728  0129 1e07          	ldw	x,(OFST+7,sp)
 729  012b 89            	pushw	x
 730  012c ad3d          	call	_WriteBufferFlash
 732  012e 5b06          	addw	sp,#6
 735  0130 81            	ret
 736  0131               L103:
 737                     ; 190   if (((u32)DataAddress >= EEPROM_START) && (((u32)DataAddress + DataCount - 1) <= EEPROM_END))
 739  0131 96            	ldw	x,sp
 740  0132 1c0003        	addw	x,#OFST+3
 741  0135 cd0000        	call	c_ltor
 743  0138 ae000c        	ldw	x,#L03
 744  013b cd0000        	call	c_lcmp
 746  013e 2529          	jrult	L303
 748  0140 96            	ldw	x,sp
 749  0141 1c0003        	addw	x,#OFST+3
 750  0144 cd0000        	call	c_ltor
 752  0147 7b07          	ld	a,(OFST+7,sp)
 753  0149 cd0000        	call	c_ladc
 755  014c a601          	ld	a,#1
 756  014e cd0000        	call	c_lsbc
 758  0151 ae0010        	ldw	x,#L23
 759  0154 cd0000        	call	c_lcmp
 761  0157 2410          	jruge	L303
 762                     ; 191     return WriteBufferFlash(DataAddress, DataCount, FLASH_MEMTYPE_DATA);
 764  0159 4bf7          	push	#247
 765  015b 7b08          	ld	a,(OFST+8,sp)
 766  015d 88            	push	a
 767  015e 1e07          	ldw	x,(OFST+7,sp)
 768  0160 89            	pushw	x
 769  0161 1e07          	ldw	x,(OFST+7,sp)
 770  0163 89            	pushw	x
 771  0164 ad05          	call	_WriteBufferFlash
 773  0166 5b06          	addw	sp,#6
 776  0168 81            	ret
 777  0169               L303:
 778                     ; 194   return 0;
 780  0169 4f            	clr	a
 783  016a 81            	ret
 888                     ; 198 u8 WriteBufferFlash(u32 DataAddress, u8 DataCount, FLASH_MemType_TypeDef MemType)
 888                     ; 199 {
 889                     	switch	.text
 890  016b               _WriteBufferFlash:
 892  016b 520a          	subw	sp,#10
 893       0000000a      OFST:	set	10
 896                     ; 200   u32 Address = (u32) DataAddress;
 898  016d 1e0f          	ldw	x,(OFST+5,sp)
 899  016f 1f09          	ldw	(OFST-1,sp),x
 900  0171 1e0d          	ldw	x,(OFST+3,sp)
 901  0173 1f07          	ldw	(OFST-3,sp),x
 902                     ; 201   u8 * DataPointer = &buf[7];
 904  0175 ae0007        	ldw	x,#_buf+7
 905  0178 1f05          	ldw	(OFST-5,sp),x
 906                     ; 205   if(MemType == FLASH_MEMTYPE_PROG)
 908  017a 7b12          	ld	a,(OFST+8,sp)
 909  017c a1fd          	cp	a,#253
 910  017e 260c          	jrne	L753
 911                     ; 206     Offset = FLASH_START;
 913  0180 ae8000        	ldw	x,#32768
 914  0183 1f03          	ldw	(OFST-7,sp),x
 915  0185 ae0000        	ldw	x,#0
 916  0188 1f01          	ldw	(OFST-9,sp),x
 918  018a 202d          	jra	L563
 919  018c               L753:
 920                     ; 208     Offset = EEPROM_START;
 922  018c ae4000        	ldw	x,#16384
 923  018f 1f03          	ldw	(OFST-7,sp),x
 924  0191 ae0000        	ldw	x,#0
 925  0194 1f01          	ldw	(OFST-9,sp),x
 926  0196 2021          	jra	L563
 927  0198               L363:
 928                     ; 214     FLASH_ProgramByte(Address, *DataPointer);
 930  0198 1e05          	ldw	x,(OFST-5,sp)
 931  019a f6            	ld	a,(x)
 932  019b 88            	push	a
 933  019c 1e0a          	ldw	x,(OFST+0,sp)
 934  019e 89            	pushw	x
 935  019f 1e0a          	ldw	x,(OFST+0,sp)
 936  01a1 89            	pushw	x
 937  01a2 cd0000        	call	_FLASH_ProgramByte
 939  01a5 5b05          	addw	sp,#5
 940                     ; 215     Address++;
 942  01a7 96            	ldw	x,sp
 943  01a8 1c0007        	addw	x,#OFST-3
 944  01ab a601          	ld	a,#1
 945  01ad cd0000        	call	c_lgadc
 947                     ; 216     DataPointer++;
 949  01b0 1e05          	ldw	x,(OFST-5,sp)
 950  01b2 1c0001        	addw	x,#1
 951  01b5 1f05          	ldw	(OFST-5,sp),x
 952                     ; 217     DataCount--;
 954  01b7 0a11          	dec	(OFST+7,sp)
 955  01b9               L563:
 956                     ; 211   while((Address % 4) && (DataCount))
 958  01b9 7b0a          	ld	a,(OFST+0,sp)
 959  01bb a503          	bcp	a,#3
 960  01bd 2731          	jreq	L573
 962  01bf 0d11          	tnz	(OFST+7,sp)
 963  01c1 26d5          	jrne	L363
 964  01c3 202b          	jra	L573
 965  01c5               L373:
 966                     ; 224     FLASH_ProgramWord(Address, *(u32*)DataPointer);
 968  01c5 1e05          	ldw	x,(OFST-5,sp)
 969  01c7 9093          	ldw	y,x
 970  01c9 ee02          	ldw	x,(2,x)
 971  01cb 89            	pushw	x
 972  01cc 93            	ldw	x,y
 973  01cd fe            	ldw	x,(x)
 974  01ce 89            	pushw	x
 975  01cf 1e0d          	ldw	x,(OFST+3,sp)
 976  01d1 89            	pushw	x
 977  01d2 1e0d          	ldw	x,(OFST+3,sp)
 978  01d4 89            	pushw	x
 979  01d5 cd0000        	call	_FLASH_ProgramWord
 981  01d8 5b08          	addw	sp,#8
 982                     ; 225     Address    += 4;
 984  01da 96            	ldw	x,sp
 985  01db 1c0007        	addw	x,#OFST-3
 986  01de a604          	ld	a,#4
 987  01e0 cd0000        	call	c_lgadc
 989                     ; 226     DataPointer+= 4;
 991  01e3 1e05          	ldw	x,(OFST-5,sp)
 992  01e5 1c0004        	addw	x,#4
 993  01e8 1f05          	ldw	(OFST-5,sp),x
 994                     ; 227     DataCount  -= 4;
 996  01ea 7b11          	ld	a,(OFST+7,sp)
 997  01ec a004          	sub	a,#4
 998  01ee 6b11          	ld	(OFST+7,sp),a
 999  01f0               L573:
1000                     ; 221   while((Address % BLOCK_BYTES) && (DataCount >= 4))
1002  01f0 7b0a          	ld	a,(OFST+0,sp)
1003  01f2 a57f          	bcp	a,#127
1004  01f4 2740          	jreq	L504
1006  01f6 7b11          	ld	a,(OFST+7,sp)
1007  01f8 a104          	cp	a,#4
1008  01fa 24c9          	jruge	L373
1009  01fc 2038          	jra	L504
1010  01fe               L304:
1011                     ; 234     FLASH_ProgramBlock((Address - Offset)/BLOCK_BYTES, MemType, FLASH_PROGRAMMODE_STANDARD, DataPointer);
1013  01fe 1e05          	ldw	x,(OFST-5,sp)
1014  0200 89            	pushw	x
1015  0201 4b00          	push	#0
1016  0203 7b15          	ld	a,(OFST+11,sp)
1017  0205 88            	push	a
1018  0206 96            	ldw	x,sp
1019  0207 1c000b        	addw	x,#OFST+1
1020  020a cd0000        	call	c_ltor
1022  020d 96            	ldw	x,sp
1023  020e 1c0005        	addw	x,#OFST-5
1024  0211 cd0000        	call	c_lsub
1026  0214 a607          	ld	a,#7
1027  0216 cd0000        	call	c_lursh
1029  0219 be02          	ldw	x,c_lreg+2
1030  021b cd0000        	call	_FLASH_ProgramBlock
1032  021e 5b04          	addw	sp,#4
1033                     ; 235     Address    += BLOCK_BYTES;
1035  0220 96            	ldw	x,sp
1036  0221 1c0007        	addw	x,#OFST-3
1037  0224 a680          	ld	a,#128
1038  0226 cd0000        	call	c_lgadc
1040                     ; 236     DataPointer+= BLOCK_BYTES;    
1042  0229 1e05          	ldw	x,(OFST-5,sp)
1043  022b 1c0080        	addw	x,#128
1044  022e 1f05          	ldw	(OFST-5,sp),x
1045                     ; 237     DataCount  -= BLOCK_BYTES;
1047  0230 7b11          	ld	a,(OFST+7,sp)
1048  0232 a080          	sub	a,#128
1049  0234 6b11          	ld	(OFST+7,sp),a
1050  0236               L504:
1051                     ; 231   while(DataCount >= BLOCK_BYTES)
1053  0236 7b11          	ld	a,(OFST+7,sp)
1054  0238 a180          	cp	a,#128
1055  023a 24c2          	jruge	L304
1057  023c 202b          	jra	L314
1058  023e               L114:
1059                     ; 244     FLASH_ProgramWord(Address, *(u32*)DataPointer);
1061  023e 1e05          	ldw	x,(OFST-5,sp)
1062  0240 9093          	ldw	y,x
1063  0242 ee02          	ldw	x,(2,x)
1064  0244 89            	pushw	x
1065  0245 93            	ldw	x,y
1066  0246 fe            	ldw	x,(x)
1067  0247 89            	pushw	x
1068  0248 1e0d          	ldw	x,(OFST+3,sp)
1069  024a 89            	pushw	x
1070  024b 1e0d          	ldw	x,(OFST+3,sp)
1071  024d 89            	pushw	x
1072  024e cd0000        	call	_FLASH_ProgramWord
1074  0251 5b08          	addw	sp,#8
1075                     ; 245     Address    += 4;
1077  0253 96            	ldw	x,sp
1078  0254 1c0007        	addw	x,#OFST-3
1079  0257 a604          	ld	a,#4
1080  0259 cd0000        	call	c_lgadc
1082                     ; 246     DataPointer+= 4;
1084  025c 1e05          	ldw	x,(OFST-5,sp)
1085  025e 1c0004        	addw	x,#4
1086  0261 1f05          	ldw	(OFST-5,sp),x
1087                     ; 247     DataCount  -= 4;
1089  0263 7b11          	ld	a,(OFST+7,sp)
1090  0265 a004          	sub	a,#4
1091  0267 6b11          	ld	(OFST+7,sp),a
1092  0269               L314:
1093                     ; 241   while(DataCount >= 4)
1095  0269 7b11          	ld	a,(OFST+7,sp)
1096  026b a104          	cp	a,#4
1097  026d 24cf          	jruge	L114
1099  026f 2021          	jra	L124
1100  0271               L714:
1101                     ; 254     FLASH_ProgramByte(Address, *DataPointer);
1103  0271 1e05          	ldw	x,(OFST-5,sp)
1104  0273 f6            	ld	a,(x)
1105  0274 88            	push	a
1106  0275 1e0a          	ldw	x,(OFST+0,sp)
1107  0277 89            	pushw	x
1108  0278 1e0a          	ldw	x,(OFST+0,sp)
1109  027a 89            	pushw	x
1110  027b cd0000        	call	_FLASH_ProgramByte
1112  027e 5b05          	addw	sp,#5
1113                     ; 255     Address++;
1115  0280 96            	ldw	x,sp
1116  0281 1c0007        	addw	x,#OFST-3
1117  0284 a601          	ld	a,#1
1118  0286 cd0000        	call	c_lgadc
1120                     ; 256     DataPointer++;
1122  0289 1e05          	ldw	x,(OFST-5,sp)
1123  028b 1c0001        	addw	x,#1
1124  028e 1f05          	ldw	(OFST-5,sp),x
1125                     ; 257     DataCount--;
1127  0290 0a11          	dec	(OFST+7,sp)
1128  0292               L124:
1129                     ; 251   while(DataCount)
1131  0292 0d11          	tnz	(OFST+7,sp)
1132  0294 26db          	jrne	L714
1133                     ; 260   return 1;
1135  0296 a601          	ld	a,#1
1138  0298 5b0a          	addw	sp,#10
1139  029a 81            	ret
1166                     ; 263 void iap_init(void) {
1167                     	switch	.text
1168  029b               _iap_init:
1172                     ; 265 	FLASH_Unlock(FLASH_MEMTYPE_PROG);
1174  029b a6fd          	ld	a,#253
1175  029d cd0000        	call	_FLASH_Unlock
1177                     ; 266 	FLASH_Unlock(FLASH_MEMTYPE_DATA);
1179  02a0 a6f7          	ld	a,#247
1180  02a2 cd0000        	call	_FLASH_Unlock
1182                     ; 267 	code_addr = 0x009080;
1184  02a5 ae9080        	ldw	x,#36992
1185  02a8 bf82          	ldw	_code_addr+2,x
1186  02aa ae0000        	ldw	x,#0
1187  02ad bf80          	ldw	_code_addr,x
1188                     ; 269 	pkg_count = 0;
1190  02af 3f00          	clr	_pkg_count
1191  02b1               L534:
1192                     ; 271 		iap_updating();
1194  02b1 cd034c        	call	_iap_updating
1197  02b4 20fb          	jra	L534
1233                     ; 278 void iap_update(void) {
1234                     	switch	.text
1235  02b6               _iap_update:
1237  02b6 5204          	subw	sp,#4
1238       00000004      OFST:	set	4
1241                     ; 279   u32  DataAddress = (buf[5] << 8 | buf[6]) & 0x0000FFFF;
1243  02b8 b605          	ld	a,_buf+5
1244  02ba 5f            	clrw	x
1245  02bb 97            	ld	xl,a
1246  02bc b606          	ld	a,_buf+6
1247  02be 02            	rlwa	x,a
1248  02bf cd0000        	call	c_uitolx
1250  02c2 96            	ldw	x,sp
1251  02c3 1c0001        	addw	x,#OFST-3
1252  02c6 cd0000        	call	c_rtol
1254                     ; 323 	WriteBufferFlash(DataAddress, buf[4] - 3, FLASH_MEMTYPE_PROG);
1256  02c9 4bfd          	push	#253
1257  02cb b604          	ld	a,_buf+4
1258  02cd a003          	sub	a,#3
1259  02cf 88            	push	a
1260  02d0 1e05          	ldw	x,(OFST+1,sp)
1261  02d2 89            	pushw	x
1262  02d3 1e05          	ldw	x,(OFST+1,sp)
1263  02d5 89            	pushw	x
1264  02d6 cd016b        	call	_WriteBufferFlash
1266  02d9 5b06          	addw	sp,#6
1267                     ; 324 }
1270  02db 5b04          	addw	sp,#4
1271  02dd 81            	ret
1296                     ; 326 void iap_finish(void) {
1297                     	switch	.text
1298  02de               _iap_finish:
1302                     ; 327 		disableInterrupts();
1305  02de 9b            sim
1307                     ; 329 		_asm("LDW X,  SP ");
1311  02df 96            LDW X,  SP 
1313                     ; 330 		_asm("LD  A,  $FF");
1316  02e0 b6ff          LD  A,  $FF
1318                     ; 331 		_asm("LD  XL, A  ");
1321  02e2 97            LD  XL, A  
1323                     ; 332 		_asm("LDW SP, X  ");
1326  02e3 94            LDW SP, X  
1328                     ; 333 		_asm("JPF $8000");		//try main first
1331  02e4 ac008000      JPF $8000
1333                     ; 334 }
1336  02e8 81            	ret
1364                     ; 336 void iap_checking(void) {
1365                     	switch	.text
1366  02e9               _iap_checking:
1370                     ; 337 		if (pkg_count != 0) {
1372  02e9 3d00          	tnz	_pkg_count
1373  02eb 2701          	jreq	L774
1374                     ; 338 			return;
1377  02ed 81            	ret
1378  02ee               L774:
1379                     ; 341 		if (buf[0] == 'b' && buf[1] == 'b' && buf[2] == 'b') {
1381  02ee b600          	ld	a,_buf
1382  02f0 a162          	cp	a,#98
1383  02f2 2642          	jrne	L105
1385  02f4 b601          	ld	a,_buf+1
1386  02f6 a162          	cp	a,#98
1387  02f8 263c          	jrne	L105
1389  02fa b602          	ld	a,_buf+2
1390  02fc a162          	cp	a,#98
1391  02fe 2636          	jrne	L105
1392                     ; 342       if (rx_idx >= 3 && buf[rx_idx-1] == 'e' && buf[rx_idx-2] == 'e' &&  buf[rx_idx-3] == 'e') {
1394  0300 b601          	ld	a,_rx_idx
1395  0302 a103          	cp	a,#3
1396  0304 2530          	jrult	L105
1398  0306 b601          	ld	a,_rx_idx
1399  0308 5f            	clrw	x
1400  0309 97            	ld	xl,a
1401  030a 5a            	decw	x
1402  030b e600          	ld	a,(_buf,x)
1403  030d a165          	cp	a,#101
1404  030f 2625          	jrne	L105
1406  0311 b601          	ld	a,_rx_idx
1407  0313 5f            	clrw	x
1408  0314 97            	ld	xl,a
1409  0315 5a            	decw	x
1410  0316 5a            	decw	x
1411  0317 e600          	ld	a,(_buf,x)
1412  0319 a165          	cp	a,#101
1413  031b 2619          	jrne	L105
1415  031d b601          	ld	a,_rx_idx
1416  031f 5f            	clrw	x
1417  0320 97            	ld	xl,a
1418  0321 1d0003        	subw	x,#3
1419  0324 e600          	ld	a,(_buf,x)
1420  0326 a165          	cp	a,#101
1421  0328 260c          	jrne	L105
1422                     ; 344 				buf[rx_idx] = 0;
1424  032a b601          	ld	a,_rx_idx
1425  032c 5f            	clrw	x
1426  032d 97            	ld	xl,a
1427  032e 6f00          	clr	(_buf,x)
1428                     ; 345 				rx_idx = 0;
1430  0330 3f01          	clr	_rx_idx
1431                     ; 346         pkg_count = 1;
1433  0332 35010000      	mov	_pkg_count,#1
1434  0336               L105:
1435                     ; 350 		if (pkg_count != 1) {
1437  0336 b600          	ld	a,_pkg_count
1438  0338 a101          	cp	a,#1
1439  033a 2701          	jreq	L505
1440                     ; 351 			return;
1443  033c 81            	ret
1444  033d               L505:
1445                     ; 353 		iap_print_buf();		
1447  033d cd007e        	call	_iap_print_buf
1449                     ; 355 		if (buf[3] == 'i') {
1451  0340 b603          	ld	a,_buf+3
1452  0342 a169          	cp	a,#105
1453  0344 2603          	jrne	L705
1454                     ; 356 			iap_init();
1456  0346 cd029b        	call	_iap_init
1458  0349               L705:
1459                     ; 358 		pkg_count = 0;
1461  0349 3f00          	clr	_pkg_count
1462                     ; 359 }
1465  034b 81            	ret
1494                     ; 360 void iap_updating(void) {
1495                     	switch	.text
1496  034c               _iap_updating:
1500                     ; 361 		if (pkg_count != 0) {
1502  034c 3d00          	tnz	_pkg_count
1503  034e 2701          	jreq	L125
1504                     ; 362 			return;
1507  0350 81            	ret
1508  0351               L125:
1509                     ; 364 		if (buf[0] == 'b' && buf[1] == 'b' && buf[2] == 'b') {
1511  0351 b600          	ld	a,_buf
1512  0353 a162          	cp	a,#98
1513  0355 2642          	jrne	L325
1515  0357 b601          	ld	a,_buf+1
1516  0359 a162          	cp	a,#98
1517  035b 263c          	jrne	L325
1519  035d b602          	ld	a,_buf+2
1520  035f a162          	cp	a,#98
1521  0361 2636          	jrne	L325
1522                     ; 365       if (rx_idx >= 3 && buf[rx_idx-1] == 'e' && buf[rx_idx-2] == 'e' &&  buf[rx_idx-3] == 'e') {
1524  0363 b601          	ld	a,_rx_idx
1525  0365 a103          	cp	a,#3
1526  0367 2530          	jrult	L325
1528  0369 b601          	ld	a,_rx_idx
1529  036b 5f            	clrw	x
1530  036c 97            	ld	xl,a
1531  036d 5a            	decw	x
1532  036e e600          	ld	a,(_buf,x)
1533  0370 a165          	cp	a,#101
1534  0372 2625          	jrne	L325
1536  0374 b601          	ld	a,_rx_idx
1537  0376 5f            	clrw	x
1538  0377 97            	ld	xl,a
1539  0378 5a            	decw	x
1540  0379 5a            	decw	x
1541  037a e600          	ld	a,(_buf,x)
1542  037c a165          	cp	a,#101
1543  037e 2619          	jrne	L325
1545  0380 b601          	ld	a,_rx_idx
1546  0382 5f            	clrw	x
1547  0383 97            	ld	xl,a
1548  0384 1d0003        	subw	x,#3
1549  0387 e600          	ld	a,(_buf,x)
1550  0389 a165          	cp	a,#101
1551  038b 260c          	jrne	L325
1552                     ; 367 				buf[rx_idx] = 0;
1554  038d b601          	ld	a,_rx_idx
1555  038f 5f            	clrw	x
1556  0390 97            	ld	xl,a
1557  0391 6f00          	clr	(_buf,x)
1558                     ; 368 				rx_idx = 0;
1560  0393 3f01          	clr	_rx_idx
1561                     ; 369         pkg_count = 1;
1563  0395 35010000      	mov	_pkg_count,#1
1564  0399               L325:
1565                     ; 372 		if (pkg_count != 1) {
1567  0399 b600          	ld	a,_pkg_count
1568  039b a101          	cp	a,#1
1569  039d 2701          	jreq	L725
1570                     ; 373 			return;
1573  039f 81            	ret
1574  03a0               L725:
1575                     ; 375 		iap_print_buf();
1577  03a0 cd007e        	call	_iap_print_buf
1579                     ; 376 		if (buf[3] == 'u') {
1581  03a3 b603          	ld	a,_buf+3
1582  03a5 a175          	cp	a,#117
1583  03a7 2605          	jrne	L135
1584                     ; 380 				iap_update();
1586  03a9 cd02b6        	call	_iap_update
1589  03ac 2009          	jra	L335
1590  03ae               L135:
1591                     ; 382 			} else if (buf[3] == 'f') {
1593  03ae b603          	ld	a,_buf+3
1594  03b0 a166          	cp	a,#102
1595  03b2 2603          	jrne	L335
1596                     ; 385 				iap_finish();
1598  03b4 cd02de        	call	_iap_finish
1600  03b7               L335:
1601                     ; 387 		pkg_count = 0;
1603  03b7 3f00          	clr	_pkg_count
1604                     ; 388 }
1607  03b9 81            	ret
1630                     ; 390 void iap_UART1_DeInit(void)
1630                     ; 391 {
1631                     	switch	.text
1632  03ba               _iap_UART1_DeInit:
1636                     ; 394   (void)UART1->SR;
1638  03ba c65230        	ld	a,21040
1639                     ; 395   (void)UART1->DR;
1641  03bd c65231        	ld	a,21041
1642                     ; 397   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
1644  03c0 725f5233      	clr	21043
1645                     ; 398   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
1647  03c4 725f5232      	clr	21042
1648                     ; 400   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
1650  03c8 725f5234      	clr	21044
1651                     ; 401   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
1653  03cc 725f5235      	clr	21045
1654                     ; 402   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
1656  03d0 725f5236      	clr	21046
1657                     ; 403   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
1659  03d4 725f5237      	clr	21047
1660                     ; 404   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
1662  03d8 725f5238      	clr	21048
1663                     ; 406   UART1->GTR = UART1_GTR_RESET_VALUE;
1665  03dc 725f5239      	clr	21049
1666                     ; 407   UART1->PSCR = UART1_PSCR_RESET_VALUE;
1668  03e0 725f523a      	clr	21050
1669                     ; 408 }
1672  03e4 81            	ret
1975                     	switch	.const
1976  0014               L45:
1977  0014 00000064      	dc.l	100
1978                     ; 410 void iap_UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength,
1978                     ; 411                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity,
1978                     ; 412                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
1978                     ; 413 {
1979                     	switch	.text
1980  03e5               _iap_UART1_Init:
1982  03e5 520c          	subw	sp,#12
1983       0000000c      OFST:	set	12
1986                     ; 414   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
1990                     ; 418   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);
1992  03e7 72195234      	bres	21044,#4
1993                     ; 421   UART1->CR1 |= (uint8_t)WordLength;
1995  03eb c65234        	ld	a,21044
1996  03ee 1a13          	or	a,(OFST+7,sp)
1997  03f0 c75234        	ld	21044,a
1998                     ; 424   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);
2000  03f3 c65236        	ld	a,21046
2001  03f6 a4cf          	and	a,#207
2002  03f8 c75236        	ld	21046,a
2003                     ; 426   UART1->CR3 |= (uint8_t)StopBits;
2005  03fb c65236        	ld	a,21046
2006  03fe 1a14          	or	a,(OFST+8,sp)
2007  0400 c75236        	ld	21046,a
2008                     ; 429   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));
2010  0403 c65234        	ld	a,21044
2011  0406 a4f9          	and	a,#249
2012  0408 c75234        	ld	21044,a
2013                     ; 431   UART1->CR1 |= (uint8_t)Parity;
2015  040b c65234        	ld	a,21044
2016  040e 1a15          	or	a,(OFST+9,sp)
2017  0410 c75234        	ld	21044,a
2018                     ; 434   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);
2020  0413 725f5232      	clr	21042
2021                     ; 436   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);
2023  0417 c65233        	ld	a,21043
2024  041a a40f          	and	a,#15
2025  041c c75233        	ld	21043,a
2026                     ; 438   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);
2028  041f c65233        	ld	a,21043
2029  0422 a4f0          	and	a,#240
2030  0424 c75233        	ld	21043,a
2031                     ; 441   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
2033  0427 96            	ldw	x,sp
2034  0428 1c000f        	addw	x,#OFST+3
2035  042b cd0000        	call	c_ltor
2037  042e a604          	ld	a,#4
2038  0430 cd0000        	call	c_llsh
2040  0433 96            	ldw	x,sp
2041  0434 1c0001        	addw	x,#OFST-11
2042  0437 cd0000        	call	c_rtol
2044  043a cd0000        	call	_CLK_GetClockFreq
2046  043d 96            	ldw	x,sp
2047  043e 1c0001        	addw	x,#OFST-11
2048  0441 cd0000        	call	c_ludv
2050  0444 96            	ldw	x,sp
2051  0445 1c0009        	addw	x,#OFST-3
2052  0448 cd0000        	call	c_rtol
2054                     ; 442   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
2056  044b 96            	ldw	x,sp
2057  044c 1c000f        	addw	x,#OFST+3
2058  044f cd0000        	call	c_ltor
2060  0452 a604          	ld	a,#4
2061  0454 cd0000        	call	c_llsh
2063  0457 96            	ldw	x,sp
2064  0458 1c0001        	addw	x,#OFST-11
2065  045b cd0000        	call	c_rtol
2067  045e cd0000        	call	_CLK_GetClockFreq
2069  0461 a664          	ld	a,#100
2070  0463 cd0000        	call	c_smul
2072  0466 96            	ldw	x,sp
2073  0467 1c0001        	addw	x,#OFST-11
2074  046a cd0000        	call	c_ludv
2076  046d 96            	ldw	x,sp
2077  046e 1c0005        	addw	x,#OFST-7
2078  0471 cd0000        	call	c_rtol
2080                     ; 444   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F);
2082  0474 96            	ldw	x,sp
2083  0475 1c0009        	addw	x,#OFST-3
2084  0478 cd0000        	call	c_ltor
2086  047b a664          	ld	a,#100
2087  047d cd0000        	call	c_smul
2089  0480 96            	ldw	x,sp
2090  0481 1c0001        	addw	x,#OFST-11
2091  0484 cd0000        	call	c_rtol
2093  0487 96            	ldw	x,sp
2094  0488 1c0005        	addw	x,#OFST-7
2095  048b cd0000        	call	c_ltor
2097  048e 96            	ldw	x,sp
2098  048f 1c0001        	addw	x,#OFST-11
2099  0492 cd0000        	call	c_lsub
2101  0495 a604          	ld	a,#4
2102  0497 cd0000        	call	c_llsh
2104  049a ae0014        	ldw	x,#L45
2105  049d cd0000        	call	c_ludv
2107  04a0 b603          	ld	a,c_lreg+3
2108  04a2 a40f          	and	a,#15
2109  04a4 ca5233        	or	a,21043
2110  04a7 c75233        	ld	21043,a
2111                     ; 446   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
2113  04aa 96            	ldw	x,sp
2114  04ab 1c0009        	addw	x,#OFST-3
2115  04ae cd0000        	call	c_ltor
2117  04b1 a604          	ld	a,#4
2118  04b3 cd0000        	call	c_lursh
2120  04b6 b603          	ld	a,c_lreg+3
2121  04b8 a4f0          	and	a,#240
2122  04ba b703          	ld	c_lreg+3,a
2123  04bc 3f02          	clr	c_lreg+2
2124  04be 3f01          	clr	c_lreg+1
2125  04c0 3f00          	clr	c_lreg
2126  04c2 b603          	ld	a,c_lreg+3
2127  04c4 ca5233        	or	a,21043
2128  04c7 c75233        	ld	21043,a
2129                     ; 448   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;
2131  04ca c65232        	ld	a,21042
2132  04cd 1a0c          	or	a,(OFST+0,sp)
2133  04cf c75232        	ld	21042,a
2134                     ; 451   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN);
2136  04d2 c65235        	ld	a,21045
2137  04d5 a4f3          	and	a,#243
2138  04d7 c75235        	ld	21045,a
2139                     ; 453   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL);
2141  04da c65236        	ld	a,21046
2142  04dd a4f8          	and	a,#248
2143  04df c75236        	ld	21046,a
2144                     ; 455   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL |
2144                     ; 456                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));
2146  04e2 7b16          	ld	a,(OFST+10,sp)
2147  04e4 a407          	and	a,#7
2148  04e6 ca5236        	or	a,21046
2149  04e9 c75236        	ld	21046,a
2150                     ; 458   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
2152  04ec 7b17          	ld	a,(OFST+11,sp)
2153  04ee a504          	bcp	a,#4
2154  04f0 2706          	jreq	L127
2155                     ; 461     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;
2157  04f2 72165235      	bset	21045,#3
2159  04f6 2004          	jra	L327
2160  04f8               L127:
2161                     ; 466     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);
2163  04f8 72175235      	bres	21045,#3
2164  04fc               L327:
2165                     ; 468   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
2167  04fc 7b17          	ld	a,(OFST+11,sp)
2168  04fe a508          	bcp	a,#8
2169  0500 2706          	jreq	L527
2170                     ; 471     UART1->CR2 |= (uint8_t)UART1_CR2_REN;
2172  0502 72145235      	bset	21045,#2
2174  0506 2004          	jra	L727
2175  0508               L527:
2176                     ; 476     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);
2178  0508 72155235      	bres	21045,#2
2179  050c               L727:
2180                     ; 480   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
2182  050c 7b16          	ld	a,(OFST+10,sp)
2183  050e a580          	bcp	a,#128
2184  0510 2706          	jreq	L137
2185                     ; 483     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN);
2187  0512 72175236      	bres	21046,#3
2189  0516 200a          	jra	L337
2190  0518               L137:
2191                     ; 487     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
2193  0518 7b16          	ld	a,(OFST+10,sp)
2194  051a a408          	and	a,#8
2195  051c ca5236        	or	a,21046
2196  051f c75236        	ld	21046,a
2197  0522               L337:
2198                     ; 489 }
2201  0522 5b0c          	addw	sp,#12
2202  0524 81            	ret
2347                     ; 491 void iap_UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
2347                     ; 492 {
2348                     	switch	.text
2349  0525               _iap_UART1_ITConfig:
2351  0525 89            	pushw	x
2352  0526 89            	pushw	x
2353       00000002      OFST:	set	2
2356                     ; 493   uint8_t uartreg = 0, itpos = 0x00;
2360                     ; 497   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
2362  0527 9e            	ld	a,xh
2363  0528 6b01          	ld	(OFST-1,sp),a
2364                     ; 499   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2366  052a 9f            	ld	a,xl
2367  052b a40f          	and	a,#15
2368  052d 5f            	clrw	x
2369  052e 97            	ld	xl,a
2370  052f a601          	ld	a,#1
2371  0531 5d            	tnzw	x
2372  0532 2704          	jreq	L06
2373  0534               L26:
2374  0534 48            	sll	a
2375  0535 5a            	decw	x
2376  0536 26fc          	jrne	L26
2377  0538               L06:
2378  0538 6b02          	ld	(OFST+0,sp),a
2379                     ; 501   if (NewState != DISABLE)
2381  053a 0d07          	tnz	(OFST+5,sp)
2382  053c 272a          	jreq	L3201
2383                     ; 504     if (uartreg == 0x01)
2385  053e 7b01          	ld	a,(OFST-1,sp)
2386  0540 a101          	cp	a,#1
2387  0542 260a          	jrne	L5201
2388                     ; 506       UART1->CR1 |= itpos;
2390  0544 c65234        	ld	a,21044
2391  0547 1a02          	or	a,(OFST+0,sp)
2392  0549 c75234        	ld	21044,a
2394  054c 2045          	jra	L5301
2395  054e               L5201:
2396                     ; 508     else if (uartreg == 0x02)
2398  054e 7b01          	ld	a,(OFST-1,sp)
2399  0550 a102          	cp	a,#2
2400  0552 260a          	jrne	L1301
2401                     ; 510       UART1->CR2 |= itpos;
2403  0554 c65235        	ld	a,21045
2404  0557 1a02          	or	a,(OFST+0,sp)
2405  0559 c75235        	ld	21045,a
2407  055c 2035          	jra	L5301
2408  055e               L1301:
2409                     ; 514       UART1->CR4 |= itpos;
2411  055e c65237        	ld	a,21047
2412  0561 1a02          	or	a,(OFST+0,sp)
2413  0563 c75237        	ld	21047,a
2414  0566 202b          	jra	L5301
2415  0568               L3201:
2416                     ; 520     if (uartreg == 0x01)
2418  0568 7b01          	ld	a,(OFST-1,sp)
2419  056a a101          	cp	a,#1
2420  056c 260b          	jrne	L7301
2421                     ; 522       UART1->CR1 &= (uint8_t)(~itpos);
2423  056e 7b02          	ld	a,(OFST+0,sp)
2424  0570 43            	cpl	a
2425  0571 c45234        	and	a,21044
2426  0574 c75234        	ld	21044,a
2428  0577 201a          	jra	L5301
2429  0579               L7301:
2430                     ; 524     else if (uartreg == 0x02)
2432  0579 7b01          	ld	a,(OFST-1,sp)
2433  057b a102          	cp	a,#2
2434  057d 260b          	jrne	L3401
2435                     ; 526       UART1->CR2 &= (uint8_t)(~itpos);
2437  057f 7b02          	ld	a,(OFST+0,sp)
2438  0581 43            	cpl	a
2439  0582 c45235        	and	a,21045
2440  0585 c75235        	ld	21045,a
2442  0588 2009          	jra	L5301
2443  058a               L3401:
2444                     ; 530       UART1->CR4 &= (uint8_t)(~itpos);
2446  058a 7b02          	ld	a,(OFST+0,sp)
2447  058c 43            	cpl	a
2448  058d c45237        	and	a,21047
2449  0590 c75237        	ld	21047,a
2450  0593               L5301:
2451                     ; 534 }
2454  0593 5b04          	addw	sp,#4
2455  0595 81            	ret
2490                     ; 536 void iap_UART1_Cmd(FunctionalState NewState)
2490                     ; 537 {
2491                     	switch	.text
2492  0596               _iap_UART1_Cmd:
2496                     ; 538   if (NewState != DISABLE)
2498  0596 4d            	tnz	a
2499  0597 2706          	jreq	L5601
2500                     ; 541     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD);
2502  0599 721b5234      	bres	21044,#5
2504  059d 2004          	jra	L7601
2505  059f               L5601:
2506                     ; 546     UART1->CR1 |= UART1_CR1_UARTD;
2508  059f 721a5234      	bset	21044,#5
2509  05a3               L7601:
2510                     ; 548 }
2513  05a3 81            	ret
2549                     ; 550 void iap_UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2549                     ; 551 {
2550                     	switch	.text
2551  05a4               _iap_UART1_ClearITPendingBit:
2555                     ; 554   if (UART1_IT == UART1_IT_RXNE)
2557  05a4 a30255        	cpw	x,#597
2558  05a7 2606          	jrne	L7011
2559                     ; 556     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2561  05a9 35df5230      	mov	21040,#223
2563  05ad 2004          	jra	L1111
2564  05af               L7011:
2565                     ; 561     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2567  05af 72195237      	bres	21047,#4
2568  05b3               L1111:
2569                     ; 563 }
2572  05b3 81            	ret
2663                     ; 565 uint32_t iap_CLK_GetClockFreq(void)
2663                     ; 566 {
2664                     	switch	.text
2665  05b4               _iap_CLK_GetClockFreq:
2667  05b4 5209          	subw	sp,#9
2668       00000009      OFST:	set	9
2671                     ; 567   uint32_t clockfrequency = 0;
2673                     ; 568   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2675                     ; 569   uint8_t tmp = 0, presc = 0;
2679                     ; 572   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2681  05b6 c650c3        	ld	a,20675
2682  05b9 6b09          	ld	(OFST+0,sp),a
2683                     ; 574   if (clocksource == CLK_SOURCE_HSI)
2685  05bb 7b09          	ld	a,(OFST+0,sp)
2686  05bd a1e1          	cp	a,#225
2687  05bf 2641          	jrne	L7511
2688                     ; 576     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2690  05c1 c650c6        	ld	a,20678
2691  05c4 a418          	and	a,#24
2692  05c6 6b09          	ld	(OFST+0,sp),a
2693                     ; 577     tmp = (uint8_t)(tmp >> 3);
2695  05c8 0409          	srl	(OFST+0,sp)
2696  05ca 0409          	srl	(OFST+0,sp)
2697  05cc 0409          	srl	(OFST+0,sp)
2698                     ; 578     presc = iap_HSIDivFactor[tmp];
2700  05ce 7b09          	ld	a,(OFST+0,sp)
2701  05d0 5f            	clrw	x
2702  05d1 97            	ld	xl,a
2703  05d2 d60000        	ld	a,(_iap_HSIDivFactor,x)
2704  05d5 6b09          	ld	(OFST+0,sp),a
2705                     ; 579     clockfrequency = HSI_VALUE / presc;
2707  05d7 7b09          	ld	a,(OFST+0,sp)
2708  05d9 b703          	ld	c_lreg+3,a
2709  05db 3f02          	clr	c_lreg+2
2710  05dd 3f01          	clr	c_lreg+1
2711  05df 3f00          	clr	c_lreg
2712  05e1 96            	ldw	x,sp
2713  05e2 1c0001        	addw	x,#OFST-8
2714  05e5 cd0000        	call	c_rtol
2716  05e8 ae2400        	ldw	x,#9216
2717  05eb bf02          	ldw	c_lreg+2,x
2718  05ed ae00f4        	ldw	x,#244
2719  05f0 bf00          	ldw	c_lreg,x
2720  05f2 96            	ldw	x,sp
2721  05f3 1c0001        	addw	x,#OFST-8
2722  05f6 cd0000        	call	c_ludv
2724  05f9 96            	ldw	x,sp
2725  05fa 1c0005        	addw	x,#OFST-4
2726  05fd cd0000        	call	c_rtol
2729  0600 201c          	jra	L1611
2730  0602               L7511:
2731                     ; 581   else if ( clocksource == CLK_SOURCE_LSI)
2733  0602 7b09          	ld	a,(OFST+0,sp)
2734  0604 a1d2          	cp	a,#210
2735  0606 260c          	jrne	L3611
2736                     ; 583     clockfrequency = LSI_VALUE;
2738  0608 aef400        	ldw	x,#62464
2739  060b 1f07          	ldw	(OFST-2,sp),x
2740  060d ae0001        	ldw	x,#1
2741  0610 1f05          	ldw	(OFST-4,sp),x
2743  0612 200a          	jra	L1611
2744  0614               L3611:
2745                     ; 587     clockfrequency = HSE_VALUE;
2747  0614 ae3600        	ldw	x,#13824
2748  0617 1f07          	ldw	(OFST-2,sp),x
2749  0619 ae016e        	ldw	x,#366
2750  061c 1f05          	ldw	(OFST-4,sp),x
2751  061e               L1611:
2752                     ; 590   return((uint32_t)clockfrequency);
2754  061e 96            	ldw	x,sp
2755  061f 1c0005        	addw	x,#OFST-4
2756  0622 cd0000        	call	c_ltor
2760  0625 5b09          	addw	sp,#9
2761  0627 81            	ret
2823                     	xdef	_iap_CLK_GetClockFreq
2824                     	xdef	_iap_checking
2825                     	xdef	_iap_init_UART1_lib
2826                     	xdef	_putchar
2827                     	xdef	_iap_HSIDivFactor
2828                     	switch	.ubsct
2829  0000               _buf:
2830  0000 000000000000  	ds.b	128
2831                     	xdef	_buf
2832  0080               _code_addr:
2833  0080 00000000      	ds.b	4
2834                     	xdef	_code_addr
2835                     	xdef	_rx_idx
2836                     	xdef	_pkg_count
2837                     	xdef	_MAIN_UART1_RX_IRQHandler
2838                     	xdef	_iap_print_buf
2839                     	xdef	_iap_UART1_ReceiveData8
2840                     	xdef	_iap_UART1_GetFlagStatus
2841                     	xdef	_iap_UART1_ClearITPendingBit
2842                     	xdef	_iap_UART1_Cmd
2843                     	xdef	_iap_UART1_ITConfig
2844                     	xdef	_iap_UART1_Init
2845                     	xdef	_iap_UART1_DeInit
2846                     	xdef	_iap_updating
2847                     	xdef	_iap_finish
2848                     	xdef	_iap_update
2849                     	xdef	_iap_init
2850                     	xdef	_WriteBufferFlash
2851                     	xdef	_WriteBuffer
2852                     	xref	_FLASH_ProgramBlock
2853                     	xref	_FLASH_ProgramWord
2854                     	xref	_FLASH_ProgramByte
2855                     	xref	_FLASH_Unlock
2856                     	xref	_UART3_GetFlagStatus
2857                     	xref	_UART3_SendData8
2858                     	xref	_CLK_GetClockFreq
2859                     	xref.b	c_lreg
2860                     	xref.b	c_x
2880                     	xref	c_smul
2881                     	xref	c_ludv
2882                     	xref	c_llsh
2883                     	xref	c_rtol
2884                     	xref	c_uitolx
2885                     	xref	c_lursh
2886                     	xref	c_lsub
2887                     	xref	c_lgadc
2888                     	xref	c_lsbc
2889                     	xref	c_ladc
2890                     	xref	c_lcmp
2891                     	xref	c_ltor
2892                     	end
