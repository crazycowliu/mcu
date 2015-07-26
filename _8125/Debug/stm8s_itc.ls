   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 50 uint8_t ITC_GetCPUCC(void)
  43                     ; 51 {
  45                     	switch	.text
  46  0000               _ITC_GetCPUCC:
  50                     ; 53   _asm("push cc");
  53  0000 8a            push cc
  55                     ; 54   _asm("pop a");
  58  0001 84            pop a
  60                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  63  0002 81            	ret
  86                     ; 80 void ITC_DeInit(void)
  86                     ; 81 {
  87                     	switch	.text
  88  0003               _ITC_DeInit:
  92                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  94  0003 35ff7f70      	mov	32624,#255
  95                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  97  0007 35ff7f71      	mov	32625,#255
  98                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 100  000b 35ff7f72      	mov	32626,#255
 101                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 103  000f 35ff7f73      	mov	32627,#255
 104                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 106  0013 35ff7f74      	mov	32628,#255
 107                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 109  0017 35ff7f75      	mov	32629,#255
 110                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 112  001b 35ff7f76      	mov	32630,#255
 113                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 115  001f 35ff7f77      	mov	32631,#255
 116                     ; 90 }
 119  0023 81            	ret
 144                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 144                     ; 98 {
 145                     	switch	.text
 146  0024               _ITC_GetSoftIntStatus:
 150                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 152  0024 adda          	call	_ITC_GetCPUCC
 154  0026 a428          	and	a,#40
 157  0028 81            	ret
 421                     .const:	section	.text
 422  0000               L62:
 423  0000 0065          	dc.w	L14
 424  0002 0065          	dc.w	L14
 425  0004 0065          	dc.w	L14
 426  0006 0065          	dc.w	L14
 427  0008 006e          	dc.w	L34
 428  000a 006e          	dc.w	L34
 429  000c 006e          	dc.w	L34
 430  000e 006e          	dc.w	L34
 431  0010 00a2          	dc.w	L112
 432  0012 00a2          	dc.w	L112
 433  0014 0077          	dc.w	L54
 434  0016 0077          	dc.w	L54
 435  0018 0080          	dc.w	L74
 436  001a 0080          	dc.w	L74
 437  001c 0080          	dc.w	L74
 438  001e 0080          	dc.w	L74
 439  0020 0089          	dc.w	L15
 440  0022 0089          	dc.w	L15
 441  0024 0089          	dc.w	L15
 442  0026 0089          	dc.w	L15
 443  0028 0092          	dc.w	L35
 444  002a 0092          	dc.w	L35
 445  002c 0092          	dc.w	L35
 446  002e 0092          	dc.w	L35
 447  0030 009b          	dc.w	L55
 448                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 448                     ; 108 {
 449                     	switch	.text
 450  0029               _ITC_GetSoftwarePriority:
 452  0029 88            	push	a
 453  002a 89            	pushw	x
 454       00000002      OFST:	set	2
 457                     ; 109   uint8_t Value = 0;
 459  002b 0f02          	clr	(OFST+0,sp)
 460                     ; 110   uint8_t Mask = 0;
 462                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 464  002d a119          	cp	a,#25
 465  002f 2403          	jruge	L41
 466  0031 4f            	clr	a
 467  0032 2010          	jra	L61
 468  0034               L41:
 469  0034 ae0071        	ldw	x,#113
 470  0037 89            	pushw	x
 471  0038 ae0000        	ldw	x,#0
 472  003b 89            	pushw	x
 473  003c ae0064        	ldw	x,#L502
 474  003f cd0000        	call	_assert_failed
 476  0042 5b04          	addw	sp,#4
 477  0044               L61:
 478                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 480  0044 7b03          	ld	a,(OFST+1,sp)
 481  0046 a403          	and	a,#3
 482  0048 48            	sll	a
 483  0049 5f            	clrw	x
 484  004a 97            	ld	xl,a
 485  004b a603          	ld	a,#3
 486  004d 5d            	tnzw	x
 487  004e 2704          	jreq	L02
 488  0050               L22:
 489  0050 48            	sll	a
 490  0051 5a            	decw	x
 491  0052 26fc          	jrne	L22
 492  0054               L02:
 493  0054 6b01          	ld	(OFST-1,sp),a
 494                     ; 118   switch (IrqNum)
 496  0056 7b03          	ld	a,(OFST+1,sp)
 498                     ; 198   default:
 498                     ; 199     break;
 499  0058 a119          	cp	a,#25
 500  005a 2407          	jruge	L42
 501  005c 5f            	clrw	x
 502  005d 97            	ld	xl,a
 503  005e 58            	sllw	x
 504  005f de0000        	ldw	x,(L62,x)
 505  0062 fc            	jp	(x)
 506  0063               L42:
 507  0063 203d          	jra	L112
 508  0065               L14:
 509                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 509                     ; 121   case ITC_IRQ_AWU:
 509                     ; 122   case ITC_IRQ_CLK:
 509                     ; 123   case ITC_IRQ_PORTA:
 509                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 511  0065 c67f70        	ld	a,32624
 512  0068 1401          	and	a,(OFST-1,sp)
 513  006a 6b02          	ld	(OFST+0,sp),a
 514                     ; 125     break;
 516  006c 2034          	jra	L112
 517  006e               L34:
 518                     ; 127   case ITC_IRQ_PORTB:
 518                     ; 128   case ITC_IRQ_PORTC:
 518                     ; 129   case ITC_IRQ_PORTD:
 518                     ; 130   case ITC_IRQ_PORTE:
 518                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 520  006e c67f71        	ld	a,32625
 521  0071 1401          	and	a,(OFST-1,sp)
 522  0073 6b02          	ld	(OFST+0,sp),a
 523                     ; 132     break;
 525  0075 202b          	jra	L112
 526  0077               L54:
 527                     ; 141   case ITC_IRQ_SPI:
 527                     ; 142   case ITC_IRQ_TIM1_OVF:
 527                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 529  0077 c67f72        	ld	a,32626
 530  007a 1401          	and	a,(OFST-1,sp)
 531  007c 6b02          	ld	(OFST+0,sp),a
 532                     ; 144     break;
 534  007e 2022          	jra	L112
 535  0080               L74:
 536                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 536                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 536                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 536                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 536                     ; 150 #else
 536                     ; 151   case ITC_IRQ_TIM2_OVF:
 536                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 536                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 536                     ; 154   case ITC_IRQ_TIM3_OVF:
 536                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 538  0080 c67f73        	ld	a,32627
 539  0083 1401          	and	a,(OFST-1,sp)
 540  0085 6b02          	ld	(OFST+0,sp),a
 541                     ; 156     break;
 543  0087 2019          	jra	L112
 544  0089               L15:
 545                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 545                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 545                     ; 160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 545                     ; 161   case ITC_IRQ_UART1_TX:
 545                     ; 162   case ITC_IRQ_UART1_RX:
 545                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 545                     ; 164 #if defined(STM8AF622x)
 545                     ; 165   case ITC_IRQ_UART4_TX:
 545                     ; 166   case ITC_IRQ_UART4_RX:
 545                     ; 167 #endif /*STM8AF622x */
 545                     ; 168   case ITC_IRQ_I2C:
 545                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 547  0089 c67f74        	ld	a,32628
 548  008c 1401          	and	a,(OFST-1,sp)
 549  008e 6b02          	ld	(OFST+0,sp),a
 550                     ; 170     break;
 552  0090 2010          	jra	L112
 553  0092               L35:
 554                     ; 178   case ITC_IRQ_UART3_TX:
 554                     ; 179   case ITC_IRQ_UART3_RX:
 554                     ; 180   case ITC_IRQ_ADC2:
 554                     ; 181 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 554                     ; 182 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 554                     ; 183     defined(STM8S903) || defined(STM8AF626x) || defined(STM8AF622x)
 554                     ; 184   case ITC_IRQ_ADC1:
 554                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 554                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 554                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 554                     ; 188 #else
 554                     ; 189   case ITC_IRQ_TIM4_OVF:
 554                     ; 190 #endif /*STM8S903 or STM8AF622x */
 554                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 556  0092 c67f75        	ld	a,32629
 557  0095 1401          	and	a,(OFST-1,sp)
 558  0097 6b02          	ld	(OFST+0,sp),a
 559                     ; 192     break;
 561  0099 2007          	jra	L112
 562  009b               L55:
 563                     ; 194   case ITC_IRQ_EEPROM_EEC:
 563                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 565  009b c67f76        	ld	a,32630
 566  009e 1401          	and	a,(OFST-1,sp)
 567  00a0 6b02          	ld	(OFST+0,sp),a
 568                     ; 196     break;
 570  00a2               L75:
 571                     ; 198   default:
 571                     ; 199     break;
 573  00a2               L112:
 574                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 576  00a2 7b03          	ld	a,(OFST+1,sp)
 577  00a4 a403          	and	a,#3
 578  00a6 48            	sll	a
 579  00a7 5f            	clrw	x
 580  00a8 97            	ld	xl,a
 581  00a9 7b02          	ld	a,(OFST+0,sp)
 582  00ab 5d            	tnzw	x
 583  00ac 2704          	jreq	L03
 584  00ae               L23:
 585  00ae 44            	srl	a
 586  00af 5a            	decw	x
 587  00b0 26fc          	jrne	L23
 588  00b2               L03:
 589  00b2 6b02          	ld	(OFST+0,sp),a
 590                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 592  00b4 7b02          	ld	a,(OFST+0,sp)
 595  00b6 5b03          	addw	sp,#3
 596  00b8 81            	ret
 662                     	switch	.const
 663  0032               L66:
 664  0032 014a          	dc.w	L312
 665  0034 014a          	dc.w	L312
 666  0036 014a          	dc.w	L312
 667  0038 014a          	dc.w	L312
 668  003a 015c          	dc.w	L512
 669  003c 015c          	dc.w	L512
 670  003e 015c          	dc.w	L512
 671  0040 015c          	dc.w	L512
 672  0042 01c6          	dc.w	L762
 673  0044 01c6          	dc.w	L762
 674  0046 016e          	dc.w	L712
 675  0048 016e          	dc.w	L712
 676  004a 0180          	dc.w	L122
 677  004c 0180          	dc.w	L122
 678  004e 0180          	dc.w	L122
 679  0050 0180          	dc.w	L122
 680  0052 0192          	dc.w	L322
 681  0054 0192          	dc.w	L322
 682  0056 0192          	dc.w	L322
 683  0058 0192          	dc.w	L322
 684  005a 01a4          	dc.w	L522
 685  005c 01a4          	dc.w	L522
 686  005e 01a4          	dc.w	L522
 687  0060 01a4          	dc.w	L522
 688  0062 01b6          	dc.w	L722
 689                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 689                     ; 221 {
 690                     	switch	.text
 691  00b9               _ITC_SetSoftwarePriority:
 693  00b9 89            	pushw	x
 694  00ba 89            	pushw	x
 695       00000002      OFST:	set	2
 698                     ; 222   uint8_t Mask = 0;
 700                     ; 223   uint8_t NewPriority = 0;
 702                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 704  00bb 9e            	ld	a,xh
 705  00bc a119          	cp	a,#25
 706  00be 2403          	jruge	L63
 707  00c0 4f            	clr	a
 708  00c1 2010          	jra	L04
 709  00c3               L63:
 710  00c3 ae00e2        	ldw	x,#226
 711  00c6 89            	pushw	x
 712  00c7 ae0000        	ldw	x,#0
 713  00ca 89            	pushw	x
 714  00cb ae0064        	ldw	x,#L502
 715  00ce cd0000        	call	_assert_failed
 717  00d1 5b04          	addw	sp,#4
 718  00d3               L04:
 719                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 721  00d3 7b04          	ld	a,(OFST+2,sp)
 722  00d5 a102          	cp	a,#2
 723  00d7 2710          	jreq	L44
 724  00d9 7b04          	ld	a,(OFST+2,sp)
 725  00db a101          	cp	a,#1
 726  00dd 270a          	jreq	L44
 727  00df 0d04          	tnz	(OFST+2,sp)
 728  00e1 2706          	jreq	L44
 729  00e3 7b04          	ld	a,(OFST+2,sp)
 730  00e5 a103          	cp	a,#3
 731  00e7 2603          	jrne	L24
 732  00e9               L44:
 733  00e9 4f            	clr	a
 734  00ea 2010          	jra	L64
 735  00ec               L24:
 736  00ec ae00e3        	ldw	x,#227
 737  00ef 89            	pushw	x
 738  00f0 ae0000        	ldw	x,#0
 739  00f3 89            	pushw	x
 740  00f4 ae0064        	ldw	x,#L502
 741  00f7 cd0000        	call	_assert_failed
 743  00fa 5b04          	addw	sp,#4
 744  00fc               L64:
 745                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 747  00fc cd0024        	call	_ITC_GetSoftIntStatus
 749  00ff a128          	cp	a,#40
 750  0101 2603          	jrne	L05
 751  0103 4f            	clr	a
 752  0104 2010          	jra	L25
 753  0106               L05:
 754  0106 ae00e6        	ldw	x,#230
 755  0109 89            	pushw	x
 756  010a ae0000        	ldw	x,#0
 757  010d 89            	pushw	x
 758  010e ae0064        	ldw	x,#L502
 759  0111 cd0000        	call	_assert_failed
 761  0114 5b04          	addw	sp,#4
 762  0116               L25:
 763                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 765  0116 7b03          	ld	a,(OFST+1,sp)
 766  0118 a403          	and	a,#3
 767  011a 48            	sll	a
 768  011b 5f            	clrw	x
 769  011c 97            	ld	xl,a
 770  011d a603          	ld	a,#3
 771  011f 5d            	tnzw	x
 772  0120 2704          	jreq	L45
 773  0122               L65:
 774  0122 48            	sll	a
 775  0123 5a            	decw	x
 776  0124 26fc          	jrne	L65
 777  0126               L45:
 778  0126 43            	cpl	a
 779  0127 6b01          	ld	(OFST-1,sp),a
 780                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 782  0129 7b03          	ld	a,(OFST+1,sp)
 783  012b a403          	and	a,#3
 784  012d 48            	sll	a
 785  012e 5f            	clrw	x
 786  012f 97            	ld	xl,a
 787  0130 7b04          	ld	a,(OFST+2,sp)
 788  0132 5d            	tnzw	x
 789  0133 2704          	jreq	L06
 790  0135               L26:
 791  0135 48            	sll	a
 792  0136 5a            	decw	x
 793  0137 26fc          	jrne	L26
 794  0139               L06:
 795  0139 6b02          	ld	(OFST+0,sp),a
 796                     ; 239   switch (IrqNum)
 798  013b 7b03          	ld	a,(OFST+1,sp)
 800                     ; 329   default:
 800                     ; 330     break;
 801  013d a119          	cp	a,#25
 802  013f 2407          	jruge	L46
 803  0141 5f            	clrw	x
 804  0142 97            	ld	xl,a
 805  0143 58            	sllw	x
 806  0144 de0032        	ldw	x,(L66,x)
 807  0147 fc            	jp	(x)
 808  0148               L46:
 809  0148 207c          	jra	L762
 810  014a               L312:
 811                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 811                     ; 242   case ITC_IRQ_AWU:
 811                     ; 243   case ITC_IRQ_CLK:
 811                     ; 244   case ITC_IRQ_PORTA:
 811                     ; 245     ITC->ISPR1 &= Mask;
 813  014a c67f70        	ld	a,32624
 814  014d 1401          	and	a,(OFST-1,sp)
 815  014f c77f70        	ld	32624,a
 816                     ; 246     ITC->ISPR1 |= NewPriority;
 818  0152 c67f70        	ld	a,32624
 819  0155 1a02          	or	a,(OFST+0,sp)
 820  0157 c77f70        	ld	32624,a
 821                     ; 247     break;
 823  015a 206a          	jra	L762
 824  015c               L512:
 825                     ; 249   case ITC_IRQ_PORTB:
 825                     ; 250   case ITC_IRQ_PORTC:
 825                     ; 251   case ITC_IRQ_PORTD:
 825                     ; 252   case ITC_IRQ_PORTE:
 825                     ; 253     ITC->ISPR2 &= Mask;
 827  015c c67f71        	ld	a,32625
 828  015f 1401          	and	a,(OFST-1,sp)
 829  0161 c77f71        	ld	32625,a
 830                     ; 254     ITC->ISPR2 |= NewPriority;
 832  0164 c67f71        	ld	a,32625
 833  0167 1a02          	or	a,(OFST+0,sp)
 834  0169 c77f71        	ld	32625,a
 835                     ; 255     break;
 837  016c 2058          	jra	L762
 838  016e               L712:
 839                     ; 264   case ITC_IRQ_SPI:
 839                     ; 265   case ITC_IRQ_TIM1_OVF:
 839                     ; 266     ITC->ISPR3 &= Mask;
 841  016e c67f72        	ld	a,32626
 842  0171 1401          	and	a,(OFST-1,sp)
 843  0173 c77f72        	ld	32626,a
 844                     ; 267     ITC->ISPR3 |= NewPriority;
 846  0176 c67f72        	ld	a,32626
 847  0179 1a02          	or	a,(OFST+0,sp)
 848  017b c77f72        	ld	32626,a
 849                     ; 268     break;
 851  017e 2046          	jra	L762
 852  0180               L122:
 853                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 853                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 853                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 853                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 853                     ; 274 #else
 853                     ; 275   case ITC_IRQ_TIM2_OVF:
 853                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 853                     ; 277 #endif /*STM8S903 or STM8AF622x */
 853                     ; 278   case ITC_IRQ_TIM3_OVF:
 853                     ; 279     ITC->ISPR4 &= Mask;
 855  0180 c67f73        	ld	a,32627
 856  0183 1401          	and	a,(OFST-1,sp)
 857  0185 c77f73        	ld	32627,a
 858                     ; 280     ITC->ISPR4 |= NewPriority;
 860  0188 c67f73        	ld	a,32627
 861  018b 1a02          	or	a,(OFST+0,sp)
 862  018d c77f73        	ld	32627,a
 863                     ; 281     break;
 865  0190 2034          	jra	L762
 866  0192               L322:
 867                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 867                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 867                     ; 285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 867                     ; 286   case ITC_IRQ_UART1_TX:
 867                     ; 287   case ITC_IRQ_UART1_RX:
 867                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 867                     ; 289 #if defined(STM8AF622x)
 867                     ; 290   case ITC_IRQ_UART4_TX:
 867                     ; 291   case ITC_IRQ_UART4_RX:
 867                     ; 292 #endif /*STM8AF622x */
 867                     ; 293   case ITC_IRQ_I2C:
 867                     ; 294     ITC->ISPR5 &= Mask;
 869  0192 c67f74        	ld	a,32628
 870  0195 1401          	and	a,(OFST-1,sp)
 871  0197 c77f74        	ld	32628,a
 872                     ; 295     ITC->ISPR5 |= NewPriority;
 874  019a c67f74        	ld	a,32628
 875  019d 1a02          	or	a,(OFST+0,sp)
 876  019f c77f74        	ld	32628,a
 877                     ; 296     break;
 879  01a2 2022          	jra	L762
 880  01a4               L522:
 881                     ; 305   case ITC_IRQ_UART3_TX:
 881                     ; 306   case ITC_IRQ_UART3_RX:
 881                     ; 307   case ITC_IRQ_ADC2:
 881                     ; 308 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 881                     ; 309     
 881                     ; 310 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 881                     ; 311     defined(STM8S903) || defined(STM8AF626x) || defined (STM8AF622x)
 881                     ; 312   case ITC_IRQ_ADC1:
 881                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 881                     ; 314     
 881                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 881                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 881                     ; 317 #else
 881                     ; 318   case ITC_IRQ_TIM4_OVF:
 881                     ; 319 #endif /* STM8S903 or STM8AF622x */
 881                     ; 320     ITC->ISPR6 &= Mask;
 883  01a4 c67f75        	ld	a,32629
 884  01a7 1401          	and	a,(OFST-1,sp)
 885  01a9 c77f75        	ld	32629,a
 886                     ; 321     ITC->ISPR6 |= NewPriority;
 888  01ac c67f75        	ld	a,32629
 889  01af 1a02          	or	a,(OFST+0,sp)
 890  01b1 c77f75        	ld	32629,a
 891                     ; 322     break;
 893  01b4 2010          	jra	L762
 894  01b6               L722:
 895                     ; 324   case ITC_IRQ_EEPROM_EEC:
 895                     ; 325     ITC->ISPR7 &= Mask;
 897  01b6 c67f76        	ld	a,32630
 898  01b9 1401          	and	a,(OFST-1,sp)
 899  01bb c77f76        	ld	32630,a
 900                     ; 326     ITC->ISPR7 |= NewPriority;
 902  01be c67f76        	ld	a,32630
 903  01c1 1a02          	or	a,(OFST+0,sp)
 904  01c3 c77f76        	ld	32630,a
 905                     ; 327     break;
 907  01c6               L132:
 908                     ; 329   default:
 908                     ; 330     break;
 910  01c6               L762:
 911                     ; 332 }
 914  01c6 5b04          	addw	sp,#4
 915  01c8 81            	ret
 928                     	xdef	_ITC_GetSoftwarePriority
 929                     	xdef	_ITC_SetSoftwarePriority
 930                     	xdef	_ITC_GetSoftIntStatus
 931                     	xdef	_ITC_DeInit
 932                     	xdef	_ITC_GetCPUCC
 933                     	xref	_assert_failed
 934                     	switch	.const
 935  0064               L502:
 936  0064 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
 937  0076 697665725c73  	dc.b	"iver\src\stm8s_itc"
 938  0088 2e6300        	dc.b	".c",0
 958                     	end
