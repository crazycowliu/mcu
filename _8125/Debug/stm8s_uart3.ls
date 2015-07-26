   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 54 void UART3_DeInit(void)
  43                     ; 55 {
  45                     	switch	.text
  46  0000               _UART3_DeInit:
  50                     ; 58   (void) UART3->SR;
  52  0000 c65240        	ld	a,21056
  53                     ; 59   (void) UART3->DR;
  55  0003 c65241        	ld	a,21057
  56                     ; 61   UART3->BRR2 = UART3_BRR2_RESET_VALUE; /*Set UART3_BRR2 to reset value 0x00 */
  58  0006 725f5243      	clr	21059
  59                     ; 62   UART3->BRR1 = UART3_BRR1_RESET_VALUE; /*Set UART3_BRR1 to reset value 0x00 */
  61  000a 725f5242      	clr	21058
  62                     ; 64   UART3->CR1 = UART3_CR1_RESET_VALUE;  /*Set UART3_CR1 to reset value 0x00  */
  64  000e 725f5244      	clr	21060
  65                     ; 65   UART3->CR2 = UART3_CR2_RESET_VALUE;  /*Set UART3_CR2 to reset value 0x00  */
  67  0012 725f5245      	clr	21061
  68                     ; 66   UART3->CR3 = UART3_CR3_RESET_VALUE;  /*Set UART3_CR3 to reset value 0x00  */
  70  0016 725f5246      	clr	21062
  71                     ; 67   UART3->CR4 = UART3_CR4_RESET_VALUE;  /*Set UART3_CR4 to reset value 0x00  */
  73  001a 725f5247      	clr	21063
  74                     ; 68   UART3->CR6 = UART3_CR6_RESET_VALUE;  /*Set UART3_CR6 to reset value 0x00  */
  76  001e 725f5249      	clr	21065
  77                     ; 69 }
  80  0022 81            	ret
 308                     .const:	section	.text
 309  0000               L43:
 310  0000 00098969      	dc.l	625001
 311  0004               L64:
 312  0004 00000064      	dc.l	100
 313                     ; 83 void UART3_Init(uint32_t BaudRate, UART3_WordLength_TypeDef WordLength, 
 313                     ; 84                 UART3_StopBits_TypeDef StopBits, UART3_Parity_TypeDef Parity, 
 313                     ; 85                 UART3_Mode_TypeDef Mode)
 313                     ; 86 {
 314                     	switch	.text
 315  0023               _UART3_Init:
 317  0023 520e          	subw	sp,#14
 318       0000000e      OFST:	set	14
 321                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
 325                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 329                     ; 91   assert_param(IS_UART3_WORDLENGTH_OK(WordLength));
 331  0025 0d15          	tnz	(OFST+7,sp)
 332  0027 2706          	jreq	L21
 333  0029 7b15          	ld	a,(OFST+7,sp)
 334  002b a110          	cp	a,#16
 335  002d 2603          	jrne	L01
 336  002f               L21:
 337  002f 4f            	clr	a
 338  0030 2010          	jra	L41
 339  0032               L01:
 340  0032 ae005b        	ldw	x,#91
 341  0035 89            	pushw	x
 342  0036 ae0000        	ldw	x,#0
 343  0039 89            	pushw	x
 344  003a ae0008        	ldw	x,#L741
 345  003d cd0000        	call	_assert_failed
 347  0040 5b04          	addw	sp,#4
 348  0042               L41:
 349                     ; 92   assert_param(IS_UART3_STOPBITS_OK(StopBits));
 351  0042 0d16          	tnz	(OFST+8,sp)
 352  0044 2706          	jreq	L02
 353  0046 7b16          	ld	a,(OFST+8,sp)
 354  0048 a120          	cp	a,#32
 355  004a 2603          	jrne	L61
 356  004c               L02:
 357  004c 4f            	clr	a
 358  004d 2010          	jra	L22
 359  004f               L61:
 360  004f ae005c        	ldw	x,#92
 361  0052 89            	pushw	x
 362  0053 ae0000        	ldw	x,#0
 363  0056 89            	pushw	x
 364  0057 ae0008        	ldw	x,#L741
 365  005a cd0000        	call	_assert_failed
 367  005d 5b04          	addw	sp,#4
 368  005f               L22:
 369                     ; 93   assert_param(IS_UART3_PARITY_OK(Parity));
 371  005f 0d17          	tnz	(OFST+9,sp)
 372  0061 270c          	jreq	L62
 373  0063 7b17          	ld	a,(OFST+9,sp)
 374  0065 a104          	cp	a,#4
 375  0067 2706          	jreq	L62
 376  0069 7b17          	ld	a,(OFST+9,sp)
 377  006b a106          	cp	a,#6
 378  006d 2603          	jrne	L42
 379  006f               L62:
 380  006f 4f            	clr	a
 381  0070 2010          	jra	L03
 382  0072               L42:
 383  0072 ae005d        	ldw	x,#93
 384  0075 89            	pushw	x
 385  0076 ae0000        	ldw	x,#0
 386  0079 89            	pushw	x
 387  007a ae0008        	ldw	x,#L741
 388  007d cd0000        	call	_assert_failed
 390  0080 5b04          	addw	sp,#4
 391  0082               L03:
 392                     ; 94   assert_param(IS_UART3_BAUDRATE_OK(BaudRate));
 394  0082 96            	ldw	x,sp
 395  0083 1c0011        	addw	x,#OFST+3
 396  0086 cd0000        	call	c_ltor
 398  0089 ae0000        	ldw	x,#L43
 399  008c cd0000        	call	c_lcmp
 401  008f 2403          	jruge	L23
 402  0091 4f            	clr	a
 403  0092 2010          	jra	L63
 404  0094               L23:
 405  0094 ae005e        	ldw	x,#94
 406  0097 89            	pushw	x
 407  0098 ae0000        	ldw	x,#0
 408  009b 89            	pushw	x
 409  009c ae0008        	ldw	x,#L741
 410  009f cd0000        	call	_assert_failed
 412  00a2 5b04          	addw	sp,#4
 413  00a4               L63:
 414                     ; 95   assert_param(IS_UART3_MODE_OK((uint8_t)Mode));
 416  00a4 7b18          	ld	a,(OFST+10,sp)
 417  00a6 a108          	cp	a,#8
 418  00a8 2730          	jreq	L24
 419  00aa 7b18          	ld	a,(OFST+10,sp)
 420  00ac a140          	cp	a,#64
 421  00ae 272a          	jreq	L24
 422  00b0 7b18          	ld	a,(OFST+10,sp)
 423  00b2 a104          	cp	a,#4
 424  00b4 2724          	jreq	L24
 425  00b6 7b18          	ld	a,(OFST+10,sp)
 426  00b8 a180          	cp	a,#128
 427  00ba 271e          	jreq	L24
 428  00bc 7b18          	ld	a,(OFST+10,sp)
 429  00be a10c          	cp	a,#12
 430  00c0 2718          	jreq	L24
 431  00c2 7b18          	ld	a,(OFST+10,sp)
 432  00c4 a10c          	cp	a,#12
 433  00c6 2712          	jreq	L24
 434  00c8 7b18          	ld	a,(OFST+10,sp)
 435  00ca a144          	cp	a,#68
 436  00cc 270c          	jreq	L24
 437  00ce 7b18          	ld	a,(OFST+10,sp)
 438  00d0 a1c0          	cp	a,#192
 439  00d2 2706          	jreq	L24
 440  00d4 7b18          	ld	a,(OFST+10,sp)
 441  00d6 a188          	cp	a,#136
 442  00d8 2603          	jrne	L04
 443  00da               L24:
 444  00da 4f            	clr	a
 445  00db 2010          	jra	L44
 446  00dd               L04:
 447  00dd ae005f        	ldw	x,#95
 448  00e0 89            	pushw	x
 449  00e1 ae0000        	ldw	x,#0
 450  00e4 89            	pushw	x
 451  00e5 ae0008        	ldw	x,#L741
 452  00e8 cd0000        	call	_assert_failed
 454  00eb 5b04          	addw	sp,#4
 455  00ed               L44:
 456                     ; 98   UART3->CR1 &= (uint8_t)(~UART3_CR1_M);     
 458  00ed 72195244      	bres	21060,#4
 459                     ; 100   UART3->CR1 |= (uint8_t)WordLength; 
 461  00f1 c65244        	ld	a,21060
 462  00f4 1a15          	or	a,(OFST+7,sp)
 463  00f6 c75244        	ld	21060,a
 464                     ; 103   UART3->CR3 &= (uint8_t)(~UART3_CR3_STOP);  
 466  00f9 c65246        	ld	a,21062
 467  00fc a4cf          	and	a,#207
 468  00fe c75246        	ld	21062,a
 469                     ; 105   UART3->CR3 |= (uint8_t)StopBits;  
 471  0101 c65246        	ld	a,21062
 472  0104 1a16          	or	a,(OFST+8,sp)
 473  0106 c75246        	ld	21062,a
 474                     ; 108   UART3->CR1 &= (uint8_t)(~(UART3_CR1_PCEN | UART3_CR1_PS));  
 476  0109 c65244        	ld	a,21060
 477  010c a4f9          	and	a,#249
 478  010e c75244        	ld	21060,a
 479                     ; 110   UART3->CR1 |= (uint8_t)Parity;     
 481  0111 c65244        	ld	a,21060
 482  0114 1a17          	or	a,(OFST+9,sp)
 483  0116 c75244        	ld	21060,a
 484                     ; 113   UART3->BRR1 &= (uint8_t)(~UART3_BRR1_DIVM);  
 486  0119 725f5242      	clr	21058
 487                     ; 115   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVM);  
 489  011d c65243        	ld	a,21059
 490  0120 a40f          	and	a,#15
 491  0122 c75243        	ld	21059,a
 492                     ; 117   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVF);  
 494  0125 c65243        	ld	a,21059
 495  0128 a4f0          	and	a,#240
 496  012a c75243        	ld	21059,a
 497                     ; 120   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 499  012d 96            	ldw	x,sp
 500  012e 1c0011        	addw	x,#OFST+3
 501  0131 cd0000        	call	c_ltor
 503  0134 a604          	ld	a,#4
 504  0136 cd0000        	call	c_llsh
 506  0139 96            	ldw	x,sp
 507  013a 1c0001        	addw	x,#OFST-13
 508  013d cd0000        	call	c_rtol
 510  0140 cd0000        	call	_CLK_GetClockFreq
 512  0143 96            	ldw	x,sp
 513  0144 1c0001        	addw	x,#OFST-13
 514  0147 cd0000        	call	c_ludv
 516  014a 96            	ldw	x,sp
 517  014b 1c000b        	addw	x,#OFST-3
 518  014e cd0000        	call	c_rtol
 520                     ; 121   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 522  0151 96            	ldw	x,sp
 523  0152 1c0011        	addw	x,#OFST+3
 524  0155 cd0000        	call	c_ltor
 526  0158 a604          	ld	a,#4
 527  015a cd0000        	call	c_llsh
 529  015d 96            	ldw	x,sp
 530  015e 1c0001        	addw	x,#OFST-13
 531  0161 cd0000        	call	c_rtol
 533  0164 cd0000        	call	_CLK_GetClockFreq
 535  0167 a664          	ld	a,#100
 536  0169 cd0000        	call	c_smul
 538  016c 96            	ldw	x,sp
 539  016d 1c0001        	addw	x,#OFST-13
 540  0170 cd0000        	call	c_ludv
 542  0173 96            	ldw	x,sp
 543  0174 1c0007        	addw	x,#OFST-7
 544  0177 cd0000        	call	c_rtol
 546                     ; 124   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 546                     ; 125                                 << 4) / 100) & (uint8_t)0x0F); 
 548  017a 96            	ldw	x,sp
 549  017b 1c000b        	addw	x,#OFST-3
 550  017e cd0000        	call	c_ltor
 552  0181 a664          	ld	a,#100
 553  0183 cd0000        	call	c_smul
 555  0186 96            	ldw	x,sp
 556  0187 1c0001        	addw	x,#OFST-13
 557  018a cd0000        	call	c_rtol
 559  018d 96            	ldw	x,sp
 560  018e 1c0007        	addw	x,#OFST-7
 561  0191 cd0000        	call	c_ltor
 563  0194 96            	ldw	x,sp
 564  0195 1c0001        	addw	x,#OFST-13
 565  0198 cd0000        	call	c_lsub
 567  019b a604          	ld	a,#4
 568  019d cd0000        	call	c_llsh
 570  01a0 ae0004        	ldw	x,#L64
 571  01a3 cd0000        	call	c_ludv
 573  01a6 b603          	ld	a,c_lreg+3
 574  01a8 a40f          	and	a,#15
 575  01aa 6b05          	ld	(OFST-9,sp),a
 576                     ; 126   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 578  01ac 96            	ldw	x,sp
 579  01ad 1c000b        	addw	x,#OFST-3
 580  01b0 cd0000        	call	c_ltor
 582  01b3 a604          	ld	a,#4
 583  01b5 cd0000        	call	c_lursh
 585  01b8 b603          	ld	a,c_lreg+3
 586  01ba a4f0          	and	a,#240
 587  01bc b703          	ld	c_lreg+3,a
 588  01be 3f02          	clr	c_lreg+2
 589  01c0 3f01          	clr	c_lreg+1
 590  01c2 3f00          	clr	c_lreg
 591  01c4 b603          	ld	a,c_lreg+3
 592  01c6 6b06          	ld	(OFST-8,sp),a
 593                     ; 128   UART3->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 595  01c8 7b05          	ld	a,(OFST-9,sp)
 596  01ca 1a06          	or	a,(OFST-8,sp)
 597  01cc c75243        	ld	21059,a
 598                     ; 130   UART3->BRR1 = (uint8_t)BaudRate_Mantissa;           
 600  01cf 7b0e          	ld	a,(OFST+0,sp)
 601  01d1 c75242        	ld	21058,a
 602                     ; 132   if ((uint8_t)(Mode & UART3_MODE_TX_ENABLE))
 604  01d4 7b18          	ld	a,(OFST+10,sp)
 605  01d6 a504          	bcp	a,#4
 606  01d8 2706          	jreq	L151
 607                     ; 135     UART3->CR2 |= UART3_CR2_TEN;  
 609  01da 72165245      	bset	21061,#3
 611  01de 2004          	jra	L351
 612  01e0               L151:
 613                     ; 140     UART3->CR2 &= (uint8_t)(~UART3_CR2_TEN);  
 615  01e0 72175245      	bres	21061,#3
 616  01e4               L351:
 617                     ; 142   if ((uint8_t)(Mode & UART3_MODE_RX_ENABLE))
 619  01e4 7b18          	ld	a,(OFST+10,sp)
 620  01e6 a508          	bcp	a,#8
 621  01e8 2706          	jreq	L551
 622                     ; 145     UART3->CR2 |= UART3_CR2_REN;  
 624  01ea 72145245      	bset	21061,#2
 626  01ee 2004          	jra	L751
 627  01f0               L551:
 628                     ; 150     UART3->CR2 &= (uint8_t)(~UART3_CR2_REN);  
 630  01f0 72155245      	bres	21061,#2
 631  01f4               L751:
 632                     ; 152 }
 635  01f4 5b0e          	addw	sp,#14
 636  01f6 81            	ret
 691                     ; 160 void UART3_Cmd(FunctionalState NewState)
 691                     ; 161 {
 692                     	switch	.text
 693  01f7               _UART3_Cmd:
 697                     ; 162   if (NewState != DISABLE)
 699  01f7 4d            	tnz	a
 700  01f8 2706          	jreq	L702
 701                     ; 165     UART3->CR1 &= (uint8_t)(~UART3_CR1_UARTD); 
 703  01fa 721b5244      	bres	21060,#5
 705  01fe 2004          	jra	L112
 706  0200               L702:
 707                     ; 170     UART3->CR1 |= UART3_CR1_UARTD;  
 709  0200 721a5244      	bset	21060,#5
 710  0204               L112:
 711                     ; 172 }
 714  0204 81            	ret
 847                     ; 189 void UART3_ITConfig(UART3_IT_TypeDef UART3_IT, FunctionalState NewState)
 847                     ; 190 {
 848                     	switch	.text
 849  0205               _UART3_ITConfig:
 851  0205 89            	pushw	x
 852  0206 89            	pushw	x
 853       00000002      OFST:	set	2
 856                     ; 191   uint8_t uartreg = 0, itpos = 0x00;
 860                     ; 194   assert_param(IS_UART3_CONFIG_IT_OK(UART3_IT));
 862  0207 a30100        	cpw	x,#256
 863  020a 271e          	jreq	L65
 864  020c a30277        	cpw	x,#631
 865  020f 2719          	jreq	L65
 866  0211 a30266        	cpw	x,#614
 867  0214 2714          	jreq	L65
 868  0216 a30205        	cpw	x,#517
 869  0219 270f          	jreq	L65
 870  021b a30244        	cpw	x,#580
 871  021e 270a          	jreq	L65
 872  0220 a30412        	cpw	x,#1042
 873  0223 2705          	jreq	L65
 874  0225 a30346        	cpw	x,#838
 875  0228 2603          	jrne	L45
 876  022a               L65:
 877  022a 4f            	clr	a
 878  022b 2010          	jra	L06
 879  022d               L45:
 880  022d ae00c2        	ldw	x,#194
 881  0230 89            	pushw	x
 882  0231 ae0000        	ldw	x,#0
 883  0234 89            	pushw	x
 884  0235 ae0008        	ldw	x,#L741
 885  0238 cd0000        	call	_assert_failed
 887  023b 5b04          	addw	sp,#4
 888  023d               L06:
 889                     ; 195   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 891  023d 0d07          	tnz	(OFST+5,sp)
 892  023f 2706          	jreq	L46
 893  0241 7b07          	ld	a,(OFST+5,sp)
 894  0243 a101          	cp	a,#1
 895  0245 2603          	jrne	L26
 896  0247               L46:
 897  0247 4f            	clr	a
 898  0248 2010          	jra	L66
 899  024a               L26:
 900  024a ae00c3        	ldw	x,#195
 901  024d 89            	pushw	x
 902  024e ae0000        	ldw	x,#0
 903  0251 89            	pushw	x
 904  0252 ae0008        	ldw	x,#L741
 905  0255 cd0000        	call	_assert_failed
 907  0258 5b04          	addw	sp,#4
 908  025a               L66:
 909                     ; 198   uartreg = (uint8_t)((uint16_t)UART3_IT >> 0x08);
 911  025a 7b03          	ld	a,(OFST+1,sp)
 912  025c 6b01          	ld	(OFST-1,sp),a
 913                     ; 201   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
 915  025e 7b04          	ld	a,(OFST+2,sp)
 916  0260 a40f          	and	a,#15
 917  0262 5f            	clrw	x
 918  0263 97            	ld	xl,a
 919  0264 a601          	ld	a,#1
 920  0266 5d            	tnzw	x
 921  0267 2704          	jreq	L07
 922  0269               L27:
 923  0269 48            	sll	a
 924  026a 5a            	decw	x
 925  026b 26fc          	jrne	L27
 926  026d               L07:
 927  026d 6b02          	ld	(OFST+0,sp),a
 928                     ; 203   if (NewState != DISABLE)
 930  026f 0d07          	tnz	(OFST+5,sp)
 931  0271 273a          	jreq	L372
 932                     ; 206     if (uartreg == 0x01)
 934  0273 7b01          	ld	a,(OFST-1,sp)
 935  0275 a101          	cp	a,#1
 936  0277 260a          	jrne	L572
 937                     ; 208       UART3->CR1 |= itpos;
 939  0279 c65244        	ld	a,21060
 940  027c 1a02          	or	a,(OFST+0,sp)
 941  027e c75244        	ld	21060,a
 943  0281 2066          	jra	L113
 944  0283               L572:
 945                     ; 210     else if (uartreg == 0x02)
 947  0283 7b01          	ld	a,(OFST-1,sp)
 948  0285 a102          	cp	a,#2
 949  0287 260a          	jrne	L103
 950                     ; 212       UART3->CR2 |= itpos;
 952  0289 c65245        	ld	a,21061
 953  028c 1a02          	or	a,(OFST+0,sp)
 954  028e c75245        	ld	21061,a
 956  0291 2056          	jra	L113
 957  0293               L103:
 958                     ; 214     else if (uartreg == 0x03)
 960  0293 7b01          	ld	a,(OFST-1,sp)
 961  0295 a103          	cp	a,#3
 962  0297 260a          	jrne	L503
 963                     ; 216       UART3->CR4 |= itpos;
 965  0299 c65247        	ld	a,21063
 966  029c 1a02          	or	a,(OFST+0,sp)
 967  029e c75247        	ld	21063,a
 969  02a1 2046          	jra	L113
 970  02a3               L503:
 971                     ; 220       UART3->CR6 |= itpos;
 973  02a3 c65249        	ld	a,21065
 974  02a6 1a02          	or	a,(OFST+0,sp)
 975  02a8 c75249        	ld	21065,a
 976  02ab 203c          	jra	L113
 977  02ad               L372:
 978                     ; 226     if (uartreg == 0x01)
 980  02ad 7b01          	ld	a,(OFST-1,sp)
 981  02af a101          	cp	a,#1
 982  02b1 260b          	jrne	L313
 983                     ; 228       UART3->CR1 &= (uint8_t)(~itpos);
 985  02b3 7b02          	ld	a,(OFST+0,sp)
 986  02b5 43            	cpl	a
 987  02b6 c45244        	and	a,21060
 988  02b9 c75244        	ld	21060,a
 990  02bc 202b          	jra	L113
 991  02be               L313:
 992                     ; 230     else if (uartreg == 0x02)
 994  02be 7b01          	ld	a,(OFST-1,sp)
 995  02c0 a102          	cp	a,#2
 996  02c2 260b          	jrne	L713
 997                     ; 232       UART3->CR2 &= (uint8_t)(~itpos);
 999  02c4 7b02          	ld	a,(OFST+0,sp)
1000  02c6 43            	cpl	a
1001  02c7 c45245        	and	a,21061
1002  02ca c75245        	ld	21061,a
1004  02cd 201a          	jra	L113
1005  02cf               L713:
1006                     ; 234     else if (uartreg == 0x03)
1008  02cf 7b01          	ld	a,(OFST-1,sp)
1009  02d1 a103          	cp	a,#3
1010  02d3 260b          	jrne	L323
1011                     ; 236       UART3->CR4 &= (uint8_t)(~itpos);
1013  02d5 7b02          	ld	a,(OFST+0,sp)
1014  02d7 43            	cpl	a
1015  02d8 c45247        	and	a,21063
1016  02db c75247        	ld	21063,a
1018  02de 2009          	jra	L113
1019  02e0               L323:
1020                     ; 240       UART3->CR6 &= (uint8_t)(~itpos);
1022  02e0 7b02          	ld	a,(OFST+0,sp)
1023  02e2 43            	cpl	a
1024  02e3 c45249        	and	a,21065
1025  02e6 c75249        	ld	21065,a
1026  02e9               L113:
1027                     ; 243 }
1030  02e9 5b04          	addw	sp,#4
1031  02eb 81            	ret
1091                     ; 252 void UART3_LINBreakDetectionConfig(UART3_LINBreakDetectionLength_TypeDef UART3_LINBreakDetectionLength)
1091                     ; 253 {
1092                     	switch	.text
1093  02ec               _UART3_LINBreakDetectionConfig:
1095  02ec 88            	push	a
1096       00000000      OFST:	set	0
1099                     ; 255   assert_param(IS_UART3_LINBREAKDETECTIONLENGTH_OK(UART3_LINBreakDetectionLength));
1101  02ed 4d            	tnz	a
1102  02ee 2704          	jreq	L001
1103  02f0 a101          	cp	a,#1
1104  02f2 2603          	jrne	L67
1105  02f4               L001:
1106  02f4 4f            	clr	a
1107  02f5 2010          	jra	L201
1108  02f7               L67:
1109  02f7 ae00ff        	ldw	x,#255
1110  02fa 89            	pushw	x
1111  02fb ae0000        	ldw	x,#0
1112  02fe 89            	pushw	x
1113  02ff ae0008        	ldw	x,#L741
1114  0302 cd0000        	call	_assert_failed
1116  0305 5b04          	addw	sp,#4
1117  0307               L201:
1118                     ; 257   if (UART3_LINBreakDetectionLength != UART3_LINBREAKDETECTIONLENGTH_10BITS)
1120  0307 0d01          	tnz	(OFST+1,sp)
1121  0309 2706          	jreq	L553
1122                     ; 259     UART3->CR4 |= UART3_CR4_LBDL;
1124  030b 721a5247      	bset	21063,#5
1126  030f 2004          	jra	L753
1127  0311               L553:
1128                     ; 263     UART3->CR4 &= ((uint8_t)~UART3_CR4_LBDL);
1130  0311 721b5247      	bres	21063,#5
1131  0315               L753:
1132                     ; 265 }
1135  0315 84            	pop	a
1136  0316 81            	ret
1258                     ; 277 void UART3_LINConfig(UART3_LinMode_TypeDef UART3_Mode,
1258                     ; 278                      UART3_LinAutosync_TypeDef UART3_Autosync, 
1258                     ; 279                      UART3_LinDivUp_TypeDef UART3_DivUp)
1258                     ; 280 {
1259                     	switch	.text
1260  0317               _UART3_LINConfig:
1262  0317 89            	pushw	x
1263       00000000      OFST:	set	0
1266                     ; 282   assert_param(IS_UART3_SLAVE_OK(UART3_Mode));
1268  0318 9e            	ld	a,xh
1269  0319 4d            	tnz	a
1270  031a 2705          	jreq	L011
1271  031c 9e            	ld	a,xh
1272  031d a101          	cp	a,#1
1273  031f 2603          	jrne	L601
1274  0321               L011:
1275  0321 4f            	clr	a
1276  0322 2010          	jra	L211
1277  0324               L601:
1278  0324 ae011a        	ldw	x,#282
1279  0327 89            	pushw	x
1280  0328 ae0000        	ldw	x,#0
1281  032b 89            	pushw	x
1282  032c ae0008        	ldw	x,#L741
1283  032f cd0000        	call	_assert_failed
1285  0332 5b04          	addw	sp,#4
1286  0334               L211:
1287                     ; 283   assert_param(IS_UART3_AUTOSYNC_OK(UART3_Autosync));
1289  0334 7b02          	ld	a,(OFST+2,sp)
1290  0336 a101          	cp	a,#1
1291  0338 2704          	jreq	L611
1292  033a 0d02          	tnz	(OFST+2,sp)
1293  033c 2603          	jrne	L411
1294  033e               L611:
1295  033e 4f            	clr	a
1296  033f 2010          	jra	L021
1297  0341               L411:
1298  0341 ae011b        	ldw	x,#283
1299  0344 89            	pushw	x
1300  0345 ae0000        	ldw	x,#0
1301  0348 89            	pushw	x
1302  0349 ae0008        	ldw	x,#L741
1303  034c cd0000        	call	_assert_failed
1305  034f 5b04          	addw	sp,#4
1306  0351               L021:
1307                     ; 284   assert_param(IS_UART3_DIVUP_OK(UART3_DivUp));
1309  0351 0d05          	tnz	(OFST+5,sp)
1310  0353 2706          	jreq	L421
1311  0355 7b05          	ld	a,(OFST+5,sp)
1312  0357 a101          	cp	a,#1
1313  0359 2603          	jrne	L221
1314  035b               L421:
1315  035b 4f            	clr	a
1316  035c 2010          	jra	L621
1317  035e               L221:
1318  035e ae011c        	ldw	x,#284
1319  0361 89            	pushw	x
1320  0362 ae0000        	ldw	x,#0
1321  0365 89            	pushw	x
1322  0366 ae0008        	ldw	x,#L741
1323  0369 cd0000        	call	_assert_failed
1325  036c 5b04          	addw	sp,#4
1326  036e               L621:
1327                     ; 286   if (UART3_Mode != UART3_LIN_MODE_MASTER)
1329  036e 0d01          	tnz	(OFST+1,sp)
1330  0370 2706          	jreq	L734
1331                     ; 288     UART3->CR6 |=  UART3_CR6_LSLV;
1333  0372 721a5249      	bset	21065,#5
1335  0376 2004          	jra	L144
1336  0378               L734:
1337                     ; 292     UART3->CR6 &= ((uint8_t)~UART3_CR6_LSLV);
1339  0378 721b5249      	bres	21065,#5
1340  037c               L144:
1341                     ; 295   if (UART3_Autosync != UART3_LIN_AUTOSYNC_DISABLE)
1343  037c 0d02          	tnz	(OFST+2,sp)
1344  037e 2706          	jreq	L344
1345                     ; 297     UART3->CR6 |=  UART3_CR6_LASE ;
1347  0380 72185249      	bset	21065,#4
1349  0384 2004          	jra	L544
1350  0386               L344:
1351                     ; 301     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LASE );
1353  0386 72195249      	bres	21065,#4
1354  038a               L544:
1355                     ; 304   if (UART3_DivUp != UART3_LIN_DIVUP_LBRR1)
1357  038a 0d05          	tnz	(OFST+5,sp)
1358  038c 2706          	jreq	L744
1359                     ; 306     UART3->CR6 |=  UART3_CR6_LDUM;
1361  038e 721e5249      	bset	21065,#7
1363  0392 2004          	jra	L154
1364  0394               L744:
1365                     ; 310     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LDUM);
1367  0394 721f5249      	bres	21065,#7
1368  0398               L154:
1369                     ; 312 }
1372  0398 85            	popw	x
1373  0399 81            	ret
1409                     ; 320 void UART3_LINCmd(FunctionalState NewState)
1409                     ; 321 {
1410                     	switch	.text
1411  039a               _UART3_LINCmd:
1413  039a 88            	push	a
1414       00000000      OFST:	set	0
1417                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1419  039b 4d            	tnz	a
1420  039c 2704          	jreq	L431
1421  039e a101          	cp	a,#1
1422  03a0 2603          	jrne	L231
1423  03a2               L431:
1424  03a2 4f            	clr	a
1425  03a3 2010          	jra	L631
1426  03a5               L231:
1427  03a5 ae0143        	ldw	x,#323
1428  03a8 89            	pushw	x
1429  03a9 ae0000        	ldw	x,#0
1430  03ac 89            	pushw	x
1431  03ad ae0008        	ldw	x,#L741
1432  03b0 cd0000        	call	_assert_failed
1434  03b3 5b04          	addw	sp,#4
1435  03b5               L631:
1436                     ; 325   if (NewState != DISABLE)
1438  03b5 0d01          	tnz	(OFST+1,sp)
1439  03b7 2706          	jreq	L174
1440                     ; 328     UART3->CR3 |= UART3_CR3_LINEN;
1442  03b9 721c5246      	bset	21062,#6
1444  03bd 2004          	jra	L374
1445  03bf               L174:
1446                     ; 333     UART3->CR3 &= ((uint8_t)~UART3_CR3_LINEN);
1448  03bf 721d5246      	bres	21062,#6
1449  03c3               L374:
1450                     ; 335 }
1453  03c3 84            	pop	a
1454  03c4 81            	ret
1512                     ; 343 void UART3_WakeUpConfig(UART3_WakeUp_TypeDef UART3_WakeUp)
1512                     ; 344 {
1513                     	switch	.text
1514  03c5               _UART3_WakeUpConfig:
1516  03c5 88            	push	a
1517       00000000      OFST:	set	0
1520                     ; 346   assert_param(IS_UART3_WAKEUP_OK(UART3_WakeUp));
1522  03c6 4d            	tnz	a
1523  03c7 2704          	jreq	L441
1524  03c9 a108          	cp	a,#8
1525  03cb 2603          	jrne	L241
1526  03cd               L441:
1527  03cd 4f            	clr	a
1528  03ce 2010          	jra	L641
1529  03d0               L241:
1530  03d0 ae015a        	ldw	x,#346
1531  03d3 89            	pushw	x
1532  03d4 ae0000        	ldw	x,#0
1533  03d7 89            	pushw	x
1534  03d8 ae0008        	ldw	x,#L741
1535  03db cd0000        	call	_assert_failed
1537  03de 5b04          	addw	sp,#4
1538  03e0               L641:
1539                     ; 348   UART3->CR1 &= ((uint8_t)~UART3_CR1_WAKE);
1541  03e0 72175244      	bres	21060,#3
1542                     ; 349   UART3->CR1 |= (uint8_t)UART3_WakeUp;
1544  03e4 c65244        	ld	a,21060
1545  03e7 1a01          	or	a,(OFST+1,sp)
1546  03e9 c75244        	ld	21060,a
1547                     ; 350 }
1550  03ec 84            	pop	a
1551  03ed 81            	ret
1588                     ; 358 void UART3_ReceiverWakeUpCmd(FunctionalState NewState)
1588                     ; 359 {
1589                     	switch	.text
1590  03ee               _UART3_ReceiverWakeUpCmd:
1592  03ee 88            	push	a
1593       00000000      OFST:	set	0
1596                     ; 361   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1598  03ef 4d            	tnz	a
1599  03f0 2704          	jreq	L451
1600  03f2 a101          	cp	a,#1
1601  03f4 2603          	jrne	L251
1602  03f6               L451:
1603  03f6 4f            	clr	a
1604  03f7 2010          	jra	L651
1605  03f9               L251:
1606  03f9 ae0169        	ldw	x,#361
1607  03fc 89            	pushw	x
1608  03fd ae0000        	ldw	x,#0
1609  0400 89            	pushw	x
1610  0401 ae0008        	ldw	x,#L741
1611  0404 cd0000        	call	_assert_failed
1613  0407 5b04          	addw	sp,#4
1614  0409               L651:
1615                     ; 363   if (NewState != DISABLE)
1617  0409 0d01          	tnz	(OFST+1,sp)
1618  040b 2706          	jreq	L145
1619                     ; 366     UART3->CR2 |= UART3_CR2_RWU;
1621  040d 72125245      	bset	21061,#1
1623  0411 2004          	jra	L345
1624  0413               L145:
1625                     ; 371     UART3->CR2 &= ((uint8_t)~UART3_CR2_RWU);
1627  0413 72135245      	bres	21061,#1
1628  0417               L345:
1629                     ; 373 }
1632  0417 84            	pop	a
1633  0418 81            	ret
1656                     ; 380 uint8_t UART3_ReceiveData8(void)
1656                     ; 381 {
1657                     	switch	.text
1658  0419               _UART3_ReceiveData8:
1662                     ; 382   return ((uint8_t)UART3->DR);
1664  0419 c65241        	ld	a,21057
1667  041c 81            	ret
1701                     ; 390 uint16_t UART3_ReceiveData9(void)
1701                     ; 391 {
1702                     	switch	.text
1703  041d               _UART3_ReceiveData9:
1705  041d 89            	pushw	x
1706       00000002      OFST:	set	2
1709                     ; 392   uint16_t temp = 0;
1711                     ; 394   temp = (uint16_t)(((uint16_t)((uint16_t)UART3->CR1 & (uint16_t)UART3_CR1_R8)) << 1);
1713  041e c65244        	ld	a,21060
1714  0421 5f            	clrw	x
1715  0422 a480          	and	a,#128
1716  0424 5f            	clrw	x
1717  0425 02            	rlwa	x,a
1718  0426 58            	sllw	x
1719  0427 1f01          	ldw	(OFST-1,sp),x
1720                     ; 395   return (uint16_t)((((uint16_t)UART3->DR) | temp) & ((uint16_t)0x01FF));
1722  0429 c65241        	ld	a,21057
1723  042c 5f            	clrw	x
1724  042d 97            	ld	xl,a
1725  042e 01            	rrwa	x,a
1726  042f 1a02          	or	a,(OFST+0,sp)
1727  0431 01            	rrwa	x,a
1728  0432 1a01          	or	a,(OFST-1,sp)
1729  0434 01            	rrwa	x,a
1730  0435 01            	rrwa	x,a
1731  0436 a4ff          	and	a,#255
1732  0438 01            	rrwa	x,a
1733  0439 a401          	and	a,#1
1734  043b 01            	rrwa	x,a
1737  043c 5b02          	addw	sp,#2
1738  043e 81            	ret
1772                     ; 403 void UART3_SendData8(uint8_t Data)
1772                     ; 404 {
1773                     	switch	.text
1774  043f               _UART3_SendData8:
1778                     ; 406   UART3->DR = Data;
1780  043f c75241        	ld	21057,a
1781                     ; 407 }
1784  0442 81            	ret
1818                     ; 414 void UART3_SendData9(uint16_t Data)
1818                     ; 415 {
1819                     	switch	.text
1820  0443               _UART3_SendData9:
1822  0443 89            	pushw	x
1823       00000000      OFST:	set	0
1826                     ; 417   UART3->CR1 &= ((uint8_t)~UART3_CR1_T8);                  
1828  0444 721d5244      	bres	21060,#6
1829                     ; 420   UART3->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART3_CR1_T8); 
1831  0448 54            	srlw	x
1832  0449 54            	srlw	x
1833  044a 9f            	ld	a,xl
1834  044b a440          	and	a,#64
1835  044d ca5244        	or	a,21060
1836  0450 c75244        	ld	21060,a
1837                     ; 423   UART3->DR   = (uint8_t)(Data);                    
1839  0453 7b02          	ld	a,(OFST+2,sp)
1840  0455 c75241        	ld	21057,a
1841                     ; 424 }
1844  0458 85            	popw	x
1845  0459 81            	ret
1868                     ; 431 void UART3_SendBreak(void)
1868                     ; 432 {
1869                     	switch	.text
1870  045a               _UART3_SendBreak:
1874                     ; 433   UART3->CR2 |= UART3_CR2_SBK;
1876  045a 72105245      	bset	21061,#0
1877                     ; 434 }
1880  045e 81            	ret
1915                     ; 441 void UART3_SetAddress(uint8_t UART3_Address)
1915                     ; 442 {
1916                     	switch	.text
1917  045f               _UART3_SetAddress:
1919  045f 88            	push	a
1920       00000000      OFST:	set	0
1923                     ; 444   assert_param(IS_UART3_ADDRESS_OK(UART3_Address));
1925  0460 a110          	cp	a,#16
1926  0462 2403          	jruge	L471
1927  0464 4f            	clr	a
1928  0465 2010          	jra	L671
1929  0467               L471:
1930  0467 ae01bc        	ldw	x,#444
1931  046a 89            	pushw	x
1932  046b ae0000        	ldw	x,#0
1933  046e 89            	pushw	x
1934  046f ae0008        	ldw	x,#L741
1935  0472 cd0000        	call	_assert_failed
1937  0475 5b04          	addw	sp,#4
1938  0477               L671:
1939                     ; 447   UART3->CR4 &= ((uint8_t)~UART3_CR4_ADD);
1941  0477 c65247        	ld	a,21063
1942  047a a4f0          	and	a,#240
1943  047c c75247        	ld	21063,a
1944                     ; 449   UART3->CR4 |= UART3_Address;
1946  047f c65247        	ld	a,21063
1947  0482 1a01          	or	a,(OFST+1,sp)
1948  0484 c75247        	ld	21063,a
1949                     ; 450 }
1952  0487 84            	pop	a
1953  0488 81            	ret
2111                     ; 458 FlagStatus UART3_GetFlagStatus(UART3_Flag_TypeDef UART3_FLAG)
2111                     ; 459 {
2112                     	switch	.text
2113  0489               _UART3_GetFlagStatus:
2115  0489 89            	pushw	x
2116  048a 88            	push	a
2117       00000001      OFST:	set	1
2120                     ; 460   FlagStatus status = RESET;
2122                     ; 463   assert_param(IS_UART3_FLAG_OK(UART3_FLAG));
2124  048b a30080        	cpw	x,#128
2125  048e 2737          	jreq	L402
2126  0490 a30040        	cpw	x,#64
2127  0493 2732          	jreq	L402
2128  0495 a30020        	cpw	x,#32
2129  0498 272d          	jreq	L402
2130  049a a30010        	cpw	x,#16
2131  049d 2728          	jreq	L402
2132  049f a30008        	cpw	x,#8
2133  04a2 2723          	jreq	L402
2134  04a4 a30004        	cpw	x,#4
2135  04a7 271e          	jreq	L402
2136  04a9 a30002        	cpw	x,#2
2137  04ac 2719          	jreq	L402
2138  04ae a30001        	cpw	x,#1
2139  04b1 2714          	jreq	L402
2140  04b3 a30101        	cpw	x,#257
2141  04b6 270f          	jreq	L402
2142  04b8 a30301        	cpw	x,#769
2143  04bb 270a          	jreq	L402
2144  04bd a30302        	cpw	x,#770
2145  04c0 2705          	jreq	L402
2146  04c2 a30210        	cpw	x,#528
2147  04c5 2603          	jrne	L202
2148  04c7               L402:
2149  04c7 4f            	clr	a
2150  04c8 2010          	jra	L602
2151  04ca               L202:
2152  04ca ae01cf        	ldw	x,#463
2153  04cd 89            	pushw	x
2154  04ce ae0000        	ldw	x,#0
2155  04d1 89            	pushw	x
2156  04d2 ae0008        	ldw	x,#L741
2157  04d5 cd0000        	call	_assert_failed
2159  04d8 5b04          	addw	sp,#4
2160  04da               L602:
2161                     ; 466   if (UART3_FLAG == UART3_FLAG_LBDF)
2163  04da 1e02          	ldw	x,(OFST+1,sp)
2164  04dc a30210        	cpw	x,#528
2165  04df 2611          	jrne	L347
2166                     ; 468     if ((UART3->CR4 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2168  04e1 c65247        	ld	a,21063
2169  04e4 1503          	bcp	a,(OFST+2,sp)
2170  04e6 2706          	jreq	L547
2171                     ; 471       status = SET;
2173  04e8 a601          	ld	a,#1
2174  04ea 6b01          	ld	(OFST+0,sp),a
2176  04ec 2039          	jra	L157
2177  04ee               L547:
2178                     ; 476       status = RESET;
2180  04ee 0f01          	clr	(OFST+0,sp)
2181  04f0 2035          	jra	L157
2182  04f2               L347:
2183                     ; 479   else if (UART3_FLAG == UART3_FLAG_SBK)
2185  04f2 1e02          	ldw	x,(OFST+1,sp)
2186  04f4 a30101        	cpw	x,#257
2187  04f7 2611          	jrne	L357
2188                     ; 481     if ((UART3->CR2 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2190  04f9 c65245        	ld	a,21061
2191  04fc 1503          	bcp	a,(OFST+2,sp)
2192  04fe 2706          	jreq	L557
2193                     ; 484       status = SET;
2195  0500 a601          	ld	a,#1
2196  0502 6b01          	ld	(OFST+0,sp),a
2198  0504 2021          	jra	L157
2199  0506               L557:
2200                     ; 489       status = RESET;
2202  0506 0f01          	clr	(OFST+0,sp)
2203  0508 201d          	jra	L157
2204  050a               L357:
2205                     ; 492   else if ((UART3_FLAG == UART3_FLAG_LHDF) || (UART3_FLAG == UART3_FLAG_LSF))
2207  050a 1e02          	ldw	x,(OFST+1,sp)
2208  050c a30302        	cpw	x,#770
2209  050f 2707          	jreq	L567
2211  0511 1e02          	ldw	x,(OFST+1,sp)
2212  0513 a30301        	cpw	x,#769
2213  0516 2614          	jrne	L367
2214  0518               L567:
2215                     ; 494     if ((UART3->CR6 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2217  0518 c65249        	ld	a,21065
2218  051b 1503          	bcp	a,(OFST+2,sp)
2219  051d 2706          	jreq	L767
2220                     ; 497       status = SET;
2222  051f a601          	ld	a,#1
2223  0521 6b01          	ld	(OFST+0,sp),a
2225  0523 2002          	jra	L157
2226  0525               L767:
2227                     ; 502       status = RESET;
2229  0525 0f01          	clr	(OFST+0,sp)
2230  0527               L157:
2231                     ; 520   return  status;
2233  0527 7b01          	ld	a,(OFST+0,sp)
2236  0529 5b03          	addw	sp,#3
2237  052b 81            	ret
2238  052c               L367:
2239                     ; 507     if ((UART3->SR & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2241  052c c65240        	ld	a,21056
2242  052f 1503          	bcp	a,(OFST+2,sp)
2243  0531 2706          	jreq	L577
2244                     ; 510       status = SET;
2246  0533 a601          	ld	a,#1
2247  0535 6b01          	ld	(OFST+0,sp),a
2249  0537 20ee          	jra	L157
2250  0539               L577:
2251                     ; 515       status = RESET;
2253  0539 0f01          	clr	(OFST+0,sp)
2254  053b 20ea          	jra	L157
2290                     ; 551 void UART3_ClearFlag(UART3_Flag_TypeDef UART3_FLAG)
2290                     ; 552 {
2291                     	switch	.text
2292  053d               _UART3_ClearFlag:
2294  053d 89            	pushw	x
2295       00000000      OFST:	set	0
2298                     ; 554   assert_param(IS_UART3_CLEAR_FLAG_OK(UART3_FLAG));
2300  053e a30020        	cpw	x,#32
2301  0541 270f          	jreq	L412
2302  0543 a30302        	cpw	x,#770
2303  0546 270a          	jreq	L412
2304  0548 a30301        	cpw	x,#769
2305  054b 2705          	jreq	L412
2306  054d a30210        	cpw	x,#528
2307  0550 2603          	jrne	L212
2308  0552               L412:
2309  0552 4f            	clr	a
2310  0553 2010          	jra	L612
2311  0555               L212:
2312  0555 ae022a        	ldw	x,#554
2313  0558 89            	pushw	x
2314  0559 ae0000        	ldw	x,#0
2315  055c 89            	pushw	x
2316  055d ae0008        	ldw	x,#L741
2317  0560 cd0000        	call	_assert_failed
2319  0563 5b04          	addw	sp,#4
2320  0565               L612:
2321                     ; 557   if (UART3_FLAG == UART3_FLAG_RXNE)
2323  0565 1e01          	ldw	x,(OFST+1,sp)
2324  0567 a30020        	cpw	x,#32
2325  056a 2606          	jrne	L7101
2326                     ; 559     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2328  056c 35df5240      	mov	21056,#223
2330  0570 201e          	jra	L1201
2331  0572               L7101:
2332                     ; 562   else if (UART3_FLAG == UART3_FLAG_LBDF)
2334  0572 1e01          	ldw	x,(OFST+1,sp)
2335  0574 a30210        	cpw	x,#528
2336  0577 2606          	jrne	L3201
2337                     ; 564     UART3->CR4 &= (uint8_t)(~UART3_CR4_LBDF);
2339  0579 72195247      	bres	21063,#4
2341  057d 2011          	jra	L1201
2342  057f               L3201:
2343                     ; 567   else if (UART3_FLAG == UART3_FLAG_LHDF)
2345  057f 1e01          	ldw	x,(OFST+1,sp)
2346  0581 a30302        	cpw	x,#770
2347  0584 2606          	jrne	L7201
2348                     ; 569     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2350  0586 72135249      	bres	21065,#1
2352  058a 2004          	jra	L1201
2353  058c               L7201:
2354                     ; 574     UART3->CR6 &= (uint8_t)(~UART3_CR6_LSF);
2356  058c 72115249      	bres	21065,#0
2357  0590               L1201:
2358                     ; 576 }
2361  0590 85            	popw	x
2362  0591 81            	ret
2445                     ; 591 ITStatus UART3_GetITStatus(UART3_IT_TypeDef UART3_IT)
2445                     ; 592 {
2446                     	switch	.text
2447  0592               _UART3_GetITStatus:
2449  0592 89            	pushw	x
2450  0593 89            	pushw	x
2451       00000002      OFST:	set	2
2454                     ; 593   ITStatus pendingbitstatus = RESET;
2456                     ; 594   uint8_t itpos = 0;
2458                     ; 595   uint8_t itmask1 = 0;
2460                     ; 596   uint8_t itmask2 = 0;
2462                     ; 597   uint8_t enablestatus = 0;
2464                     ; 600   assert_param(IS_UART3_GET_IT_OK(UART3_IT));
2466  0594 a30277        	cpw	x,#631
2467  0597 2723          	jreq	L422
2468  0599 a30266        	cpw	x,#614
2469  059c 271e          	jreq	L422
2470  059e a30255        	cpw	x,#597
2471  05a1 2719          	jreq	L422
2472  05a3 a30244        	cpw	x,#580
2473  05a6 2714          	jreq	L422
2474  05a8 a30235        	cpw	x,#565
2475  05ab 270f          	jreq	L422
2476  05ad a30346        	cpw	x,#838
2477  05b0 270a          	jreq	L422
2478  05b2 a30412        	cpw	x,#1042
2479  05b5 2705          	jreq	L422
2480  05b7 a30100        	cpw	x,#256
2481  05ba 2603          	jrne	L222
2482  05bc               L422:
2483  05bc 4f            	clr	a
2484  05bd 2010          	jra	L622
2485  05bf               L222:
2486  05bf ae0258        	ldw	x,#600
2487  05c2 89            	pushw	x
2488  05c3 ae0000        	ldw	x,#0
2489  05c6 89            	pushw	x
2490  05c7 ae0008        	ldw	x,#L741
2491  05ca cd0000        	call	_assert_failed
2493  05cd 5b04          	addw	sp,#4
2494  05cf               L622:
2495                     ; 603   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
2497  05cf 7b04          	ld	a,(OFST+2,sp)
2498  05d1 a40f          	and	a,#15
2499  05d3 5f            	clrw	x
2500  05d4 97            	ld	xl,a
2501  05d5 a601          	ld	a,#1
2502  05d7 5d            	tnzw	x
2503  05d8 2704          	jreq	L032
2504  05da               L232:
2505  05da 48            	sll	a
2506  05db 5a            	decw	x
2507  05dc 26fc          	jrne	L232
2508  05de               L032:
2509  05de 6b01          	ld	(OFST-1,sp),a
2510                     ; 605   itmask1 = (uint8_t)((uint8_t)UART3_IT >> (uint8_t)4);
2512  05e0 7b04          	ld	a,(OFST+2,sp)
2513  05e2 4e            	swap	a
2514  05e3 a40f          	and	a,#15
2515  05e5 6b02          	ld	(OFST+0,sp),a
2516                     ; 607   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2518  05e7 7b02          	ld	a,(OFST+0,sp)
2519  05e9 5f            	clrw	x
2520  05ea 97            	ld	xl,a
2521  05eb a601          	ld	a,#1
2522  05ed 5d            	tnzw	x
2523  05ee 2704          	jreq	L432
2524  05f0               L632:
2525  05f0 48            	sll	a
2526  05f1 5a            	decw	x
2527  05f2 26fc          	jrne	L632
2528  05f4               L432:
2529  05f4 6b02          	ld	(OFST+0,sp),a
2530                     ; 610   if (UART3_IT == UART3_IT_PE)
2532  05f6 1e03          	ldw	x,(OFST+1,sp)
2533  05f8 a30100        	cpw	x,#256
2534  05fb 261c          	jrne	L5701
2535                     ; 613     enablestatus = (uint8_t)((uint8_t)UART3->CR1 & itmask2);
2537  05fd c65244        	ld	a,21060
2538  0600 1402          	and	a,(OFST+0,sp)
2539  0602 6b02          	ld	(OFST+0,sp),a
2540                     ; 616     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2542  0604 c65240        	ld	a,21056
2543  0607 1501          	bcp	a,(OFST-1,sp)
2544  0609 270a          	jreq	L7701
2546  060b 0d02          	tnz	(OFST+0,sp)
2547  060d 2706          	jreq	L7701
2548                     ; 619       pendingbitstatus = SET;
2550  060f a601          	ld	a,#1
2551  0611 6b02          	ld	(OFST+0,sp),a
2553  0613 2064          	jra	L3011
2554  0615               L7701:
2555                     ; 624       pendingbitstatus = RESET;
2557  0615 0f02          	clr	(OFST+0,sp)
2558  0617 2060          	jra	L3011
2559  0619               L5701:
2560                     ; 627   else if (UART3_IT == UART3_IT_LBDF)
2562  0619 1e03          	ldw	x,(OFST+1,sp)
2563  061b a30346        	cpw	x,#838
2564  061e 261c          	jrne	L5011
2565                     ; 630     enablestatus = (uint8_t)((uint8_t)UART3->CR4 & itmask2);
2567  0620 c65247        	ld	a,21063
2568  0623 1402          	and	a,(OFST+0,sp)
2569  0625 6b02          	ld	(OFST+0,sp),a
2570                     ; 632     if (((UART3->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2572  0627 c65247        	ld	a,21063
2573  062a 1501          	bcp	a,(OFST-1,sp)
2574  062c 270a          	jreq	L7011
2576  062e 0d02          	tnz	(OFST+0,sp)
2577  0630 2706          	jreq	L7011
2578                     ; 635       pendingbitstatus = SET;
2580  0632 a601          	ld	a,#1
2581  0634 6b02          	ld	(OFST+0,sp),a
2583  0636 2041          	jra	L3011
2584  0638               L7011:
2585                     ; 640       pendingbitstatus = RESET;
2587  0638 0f02          	clr	(OFST+0,sp)
2588  063a 203d          	jra	L3011
2589  063c               L5011:
2590                     ; 643   else if (UART3_IT == UART3_IT_LHDF)
2592  063c 1e03          	ldw	x,(OFST+1,sp)
2593  063e a30412        	cpw	x,#1042
2594  0641 261c          	jrne	L5111
2595                     ; 646     enablestatus = (uint8_t)((uint8_t)UART3->CR6 & itmask2);
2597  0643 c65249        	ld	a,21065
2598  0646 1402          	and	a,(OFST+0,sp)
2599  0648 6b02          	ld	(OFST+0,sp),a
2600                     ; 648     if (((UART3->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2602  064a c65249        	ld	a,21065
2603  064d 1501          	bcp	a,(OFST-1,sp)
2604  064f 270a          	jreq	L7111
2606  0651 0d02          	tnz	(OFST+0,sp)
2607  0653 2706          	jreq	L7111
2608                     ; 651       pendingbitstatus = SET;
2610  0655 a601          	ld	a,#1
2611  0657 6b02          	ld	(OFST+0,sp),a
2613  0659 201e          	jra	L3011
2614  065b               L7111:
2615                     ; 656       pendingbitstatus = RESET;
2617  065b 0f02          	clr	(OFST+0,sp)
2618  065d 201a          	jra	L3011
2619  065f               L5111:
2620                     ; 662     enablestatus = (uint8_t)((uint8_t)UART3->CR2 & itmask2);
2622  065f c65245        	ld	a,21061
2623  0662 1402          	and	a,(OFST+0,sp)
2624  0664 6b02          	ld	(OFST+0,sp),a
2625                     ; 664     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2627  0666 c65240        	ld	a,21056
2628  0669 1501          	bcp	a,(OFST-1,sp)
2629  066b 270a          	jreq	L5211
2631  066d 0d02          	tnz	(OFST+0,sp)
2632  066f 2706          	jreq	L5211
2633                     ; 667       pendingbitstatus = SET;
2635  0671 a601          	ld	a,#1
2636  0673 6b02          	ld	(OFST+0,sp),a
2638  0675 2002          	jra	L3011
2639  0677               L5211:
2640                     ; 672       pendingbitstatus = RESET;
2642  0677 0f02          	clr	(OFST+0,sp)
2643  0679               L3011:
2644                     ; 676   return  pendingbitstatus;
2646  0679 7b02          	ld	a,(OFST+0,sp)
2649  067b 5b04          	addw	sp,#4
2650  067d 81            	ret
2687                     ; 706 void UART3_ClearITPendingBit(UART3_IT_TypeDef UART3_IT)
2687                     ; 707 {
2688                     	switch	.text
2689  067e               _UART3_ClearITPendingBit:
2691  067e 89            	pushw	x
2692       00000000      OFST:	set	0
2695                     ; 709   assert_param(IS_UART3_CLEAR_IT_OK(UART3_IT));
2697  067f a30255        	cpw	x,#597
2698  0682 270a          	jreq	L442
2699  0684 a30412        	cpw	x,#1042
2700  0687 2705          	jreq	L442
2701  0689 a30346        	cpw	x,#838
2702  068c 2603          	jrne	L242
2703  068e               L442:
2704  068e 4f            	clr	a
2705  068f 2010          	jra	L642
2706  0691               L242:
2707  0691 ae02c5        	ldw	x,#709
2708  0694 89            	pushw	x
2709  0695 ae0000        	ldw	x,#0
2710  0698 89            	pushw	x
2711  0699 ae0008        	ldw	x,#L741
2712  069c cd0000        	call	_assert_failed
2714  069f 5b04          	addw	sp,#4
2715  06a1               L642:
2716                     ; 712   if (UART3_IT == UART3_IT_RXNE)
2718  06a1 1e01          	ldw	x,(OFST+1,sp)
2719  06a3 a30255        	cpw	x,#597
2720  06a6 2606          	jrne	L7411
2721                     ; 714     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2723  06a8 35df5240      	mov	21056,#223
2725  06ac 2011          	jra	L1511
2726  06ae               L7411:
2727                     ; 717   else if (UART3_IT == UART3_IT_LBDF)
2729  06ae 1e01          	ldw	x,(OFST+1,sp)
2730  06b0 a30346        	cpw	x,#838
2731  06b3 2606          	jrne	L3511
2732                     ; 719     UART3->CR4 &= (uint8_t)~(UART3_CR4_LBDF);
2734  06b5 72195247      	bres	21063,#4
2736  06b9 2004          	jra	L1511
2737  06bb               L3511:
2738                     ; 724     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2740  06bb 72135249      	bres	21065,#1
2741  06bf               L1511:
2742                     ; 726 }
2745  06bf 85            	popw	x
2746  06c0 81            	ret
2759                     	xdef	_UART3_ClearITPendingBit
2760                     	xdef	_UART3_GetITStatus
2761                     	xdef	_UART3_ClearFlag
2762                     	xdef	_UART3_GetFlagStatus
2763                     	xdef	_UART3_SetAddress
2764                     	xdef	_UART3_SendBreak
2765                     	xdef	_UART3_SendData9
2766                     	xdef	_UART3_SendData8
2767                     	xdef	_UART3_ReceiveData9
2768                     	xdef	_UART3_ReceiveData8
2769                     	xdef	_UART3_WakeUpConfig
2770                     	xdef	_UART3_ReceiverWakeUpCmd
2771                     	xdef	_UART3_LINCmd
2772                     	xdef	_UART3_LINConfig
2773                     	xdef	_UART3_LINBreakDetectionConfig
2774                     	xdef	_UART3_ITConfig
2775                     	xdef	_UART3_Cmd
2776                     	xdef	_UART3_Init
2777                     	xdef	_UART3_DeInit
2778                     	xref	_assert_failed
2779                     	xref	_CLK_GetClockFreq
2780                     	switch	.const
2781  0008               L741:
2782  0008 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
2783  001a 697665725c73  	dc.b	"iver\src\stm8s_uar"
2784  002c 74332e6300    	dc.b	"t3.c",0
2785                     	xref.b	c_lreg
2786                     	xref.b	c_x
2806                     	xref	c_lursh
2807                     	xref	c_lsub
2808                     	xref	c_smul
2809                     	xref	c_ludv
2810                     	xref	c_rtol
2811                     	xref	c_llsh
2812                     	xref	c_lcmp
2813                     	xref	c_ltor
2814                     	end
