   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  76                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  76                     ; 88 {
  78                     	switch	.text
  79  0000               _FLASH_Unlock:
  81  0000 88            	push	a
  82       00000000      OFST:	set	0
  85                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  87  0001 a1fd          	cp	a,#253
  88  0003 2704          	jreq	L01
  89  0005 a1f7          	cp	a,#247
  90  0007 2603          	jrne	L6
  91  0009               L01:
  92  0009 4f            	clr	a
  93  000a 2010          	jra	L21
  94  000c               L6:
  95  000c ae005a        	ldw	x,#90
  96  000f 89            	pushw	x
  97  0010 ae0000        	ldw	x,#0
  98  0013 89            	pushw	x
  99  0014 ae0010        	ldw	x,#L73
 100  0017 cd0000        	call	_assert_failed
 102  001a 5b04          	addw	sp,#4
 103  001c               L21:
 104                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
 106  001c 7b01          	ld	a,(OFST+1,sp)
 107  001e a1fd          	cp	a,#253
 108  0020 260a          	jrne	L14
 109                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
 111  0022 35565062      	mov	20578,#86
 112                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
 114  0026 35ae5062      	mov	20578,#174
 116  002a 2008          	jra	L34
 117  002c               L14:
 118                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 120  002c 35ae5064      	mov	20580,#174
 121                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 123  0030 35565064      	mov	20580,#86
 124  0034               L34:
 125                     ; 104 }
 128  0034 84            	pop	a
 129  0035 81            	ret
 165                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 165                     ; 113 {
 166                     	switch	.text
 167  0036               _FLASH_Lock:
 169  0036 88            	push	a
 170       00000000      OFST:	set	0
 173                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 175  0037 a1fd          	cp	a,#253
 176  0039 2704          	jreq	L02
 177  003b a1f7          	cp	a,#247
 178  003d 2603          	jrne	L61
 179  003f               L02:
 180  003f 4f            	clr	a
 181  0040 2010          	jra	L22
 182  0042               L61:
 183  0042 ae0073        	ldw	x,#115
 184  0045 89            	pushw	x
 185  0046 ae0000        	ldw	x,#0
 186  0049 89            	pushw	x
 187  004a ae0010        	ldw	x,#L73
 188  004d cd0000        	call	_assert_failed
 190  0050 5b04          	addw	sp,#4
 191  0052               L22:
 192                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 194  0052 c6505f        	ld	a,20575
 195  0055 1401          	and	a,(OFST+1,sp)
 196  0057 c7505f        	ld	20575,a
 197                     ; 119 }
 200  005a 84            	pop	a
 201  005b 81            	ret
 224                     ; 126 void FLASH_DeInit(void)
 224                     ; 127 {
 225                     	switch	.text
 226  005c               _FLASH_DeInit:
 230                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 232  005c 725f505a      	clr	20570
 233                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 235  0060 725f505b      	clr	20571
 236                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 238  0064 35ff505c      	mov	20572,#255
 239                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 241  0068 7217505f      	bres	20575,#3
 242                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 244  006c 7213505f      	bres	20575,#1
 245                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 247  0070 c6505f        	ld	a,20575
 248                     ; 134 }
 251  0073 81            	ret
 307                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 307                     ; 143 {
 308                     	switch	.text
 309  0074               _FLASH_ITConfig:
 311  0074 88            	push	a
 312       00000000      OFST:	set	0
 315                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 317  0075 4d            	tnz	a
 318  0076 2704          	jreq	L23
 319  0078 a101          	cp	a,#1
 320  007a 2603          	jrne	L03
 321  007c               L23:
 322  007c 4f            	clr	a
 323  007d 2010          	jra	L43
 324  007f               L03:
 325  007f ae0091        	ldw	x,#145
 326  0082 89            	pushw	x
 327  0083 ae0000        	ldw	x,#0
 328  0086 89            	pushw	x
 329  0087 ae0010        	ldw	x,#L73
 330  008a cd0000        	call	_assert_failed
 332  008d 5b04          	addw	sp,#4
 333  008f               L43:
 334                     ; 147   if(NewState != DISABLE)
 336  008f 0d01          	tnz	(OFST+1,sp)
 337  0091 2706          	jreq	L121
 338                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 340  0093 7212505a      	bset	20570,#1
 342  0097 2004          	jra	L321
 343  0099               L121:
 344                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 346  0099 7213505a      	bres	20570,#1
 347  009d               L321:
 348                     ; 155 }
 351  009d 84            	pop	a
 352  009e 81            	ret
 387                     .const:	section	.text
 388  0000               L64:
 389  0000 00008000      	dc.l	32768
 390  0004               L05:
 391  0004 00028000      	dc.l	163840
 392  0008               L25:
 393  0008 00004000      	dc.l	16384
 394  000c               L45:
 395  000c 00004800      	dc.l	18432
 396                     ; 164 void FLASH_EraseByte(uint32_t Address)
 396                     ; 165 {
 397                     	switch	.text
 398  009f               _FLASH_EraseByte:
 400       00000000      OFST:	set	0
 403                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 405  009f 96            	ldw	x,sp
 406  00a0 1c0003        	addw	x,#OFST+3
 407  00a3 cd0000        	call	c_ltor
 409  00a6 ae0000        	ldw	x,#L64
 410  00a9 cd0000        	call	c_lcmp
 412  00ac 250f          	jrult	L44
 413  00ae 96            	ldw	x,sp
 414  00af 1c0003        	addw	x,#OFST+3
 415  00b2 cd0000        	call	c_ltor
 417  00b5 ae0004        	ldw	x,#L05
 418  00b8 cd0000        	call	c_lcmp
 420  00bb 251e          	jrult	L24
 421  00bd               L44:
 422  00bd 96            	ldw	x,sp
 423  00be 1c0003        	addw	x,#OFST+3
 424  00c1 cd0000        	call	c_ltor
 426  00c4 ae0008        	ldw	x,#L25
 427  00c7 cd0000        	call	c_lcmp
 429  00ca 2512          	jrult	L04
 430  00cc 96            	ldw	x,sp
 431  00cd 1c0003        	addw	x,#OFST+3
 432  00d0 cd0000        	call	c_ltor
 434  00d3 ae000c        	ldw	x,#L45
 435  00d6 cd0000        	call	c_lcmp
 437  00d9 2403          	jruge	L04
 438  00db               L24:
 439  00db 4f            	clr	a
 440  00dc 2010          	jra	L65
 441  00de               L04:
 442  00de ae00a7        	ldw	x,#167
 443  00e1 89            	pushw	x
 444  00e2 ae0000        	ldw	x,#0
 445  00e5 89            	pushw	x
 446  00e6 ae0010        	ldw	x,#L73
 447  00e9 cd0000        	call	_assert_failed
 449  00ec 5b04          	addw	sp,#4
 450  00ee               L65:
 451                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 453  00ee 7b04          	ld	a,(OFST+4,sp)
 454  00f0 b700          	ld	c_x,a
 455  00f2 1e05          	ldw	x,(OFST+5,sp)
 456  00f4 bf01          	ldw	c_x+1,x
 457  00f6 4f            	clr	a
 458  00f7 92bd0000      	ldf	[c_x.e],a
 459                     ; 171 }
 462  00fb 81            	ret
 506                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 506                     ; 182 {
 507                     	switch	.text
 508  00fc               _FLASH_ProgramByte:
 510       00000000      OFST:	set	0
 513                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 515  00fc 96            	ldw	x,sp
 516  00fd 1c0003        	addw	x,#OFST+3
 517  0100 cd0000        	call	c_ltor
 519  0103 ae0000        	ldw	x,#L64
 520  0106 cd0000        	call	c_lcmp
 522  0109 250f          	jrult	L66
 523  010b 96            	ldw	x,sp
 524  010c 1c0003        	addw	x,#OFST+3
 525  010f cd0000        	call	c_ltor
 527  0112 ae0004        	ldw	x,#L05
 528  0115 cd0000        	call	c_lcmp
 530  0118 251e          	jrult	L46
 531  011a               L66:
 532  011a 96            	ldw	x,sp
 533  011b 1c0003        	addw	x,#OFST+3
 534  011e cd0000        	call	c_ltor
 536  0121 ae0008        	ldw	x,#L25
 537  0124 cd0000        	call	c_lcmp
 539  0127 2512          	jrult	L26
 540  0129 96            	ldw	x,sp
 541  012a 1c0003        	addw	x,#OFST+3
 542  012d cd0000        	call	c_ltor
 544  0130 ae000c        	ldw	x,#L45
 545  0133 cd0000        	call	c_lcmp
 547  0136 2403          	jruge	L26
 548  0138               L46:
 549  0138 4f            	clr	a
 550  0139 2010          	jra	L07
 551  013b               L26:
 552  013b ae00b8        	ldw	x,#184
 553  013e 89            	pushw	x
 554  013f ae0000        	ldw	x,#0
 555  0142 89            	pushw	x
 556  0143 ae0010        	ldw	x,#L73
 557  0146 cd0000        	call	_assert_failed
 559  0149 5b04          	addw	sp,#4
 560  014b               L07:
 561                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 563  014b 7b07          	ld	a,(OFST+7,sp)
 564  014d 88            	push	a
 565  014e 7b05          	ld	a,(OFST+5,sp)
 566  0150 b700          	ld	c_x,a
 567  0152 1e06          	ldw	x,(OFST+6,sp)
 568  0154 84            	pop	a
 569  0155 bf01          	ldw	c_x+1,x
 570  0157 92bd0000      	ldf	[c_x.e],a
 571                     ; 186 }
 574  015b 81            	ret
 609                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 609                     ; 196 {
 610                     	switch	.text
 611  015c               _FLASH_ReadByte:
 613       00000000      OFST:	set	0
 616                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 618  015c 96            	ldw	x,sp
 619  015d 1c0003        	addw	x,#OFST+3
 620  0160 cd0000        	call	c_ltor
 622  0163 ae0000        	ldw	x,#L64
 623  0166 cd0000        	call	c_lcmp
 625  0169 250f          	jrult	L001
 626  016b 96            	ldw	x,sp
 627  016c 1c0003        	addw	x,#OFST+3
 628  016f cd0000        	call	c_ltor
 630  0172 ae0004        	ldw	x,#L05
 631  0175 cd0000        	call	c_lcmp
 633  0178 251e          	jrult	L67
 634  017a               L001:
 635  017a 96            	ldw	x,sp
 636  017b 1c0003        	addw	x,#OFST+3
 637  017e cd0000        	call	c_ltor
 639  0181 ae0008        	ldw	x,#L25
 640  0184 cd0000        	call	c_lcmp
 642  0187 2512          	jrult	L47
 643  0189 96            	ldw	x,sp
 644  018a 1c0003        	addw	x,#OFST+3
 645  018d cd0000        	call	c_ltor
 647  0190 ae000c        	ldw	x,#L45
 648  0193 cd0000        	call	c_lcmp
 650  0196 2403          	jruge	L47
 651  0198               L67:
 652  0198 4f            	clr	a
 653  0199 2010          	jra	L201
 654  019b               L47:
 655  019b ae00c6        	ldw	x,#198
 656  019e 89            	pushw	x
 657  019f ae0000        	ldw	x,#0
 658  01a2 89            	pushw	x
 659  01a3 ae0010        	ldw	x,#L73
 660  01a6 cd0000        	call	_assert_failed
 662  01a9 5b04          	addw	sp,#4
 663  01ab               L201:
 664                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 666  01ab 7b04          	ld	a,(OFST+4,sp)
 667  01ad b700          	ld	c_x,a
 668  01af 1e05          	ldw	x,(OFST+5,sp)
 669  01b1 bf01          	ldw	c_x+1,x
 670  01b3 92bc0000      	ldf	a,[c_x.e]
 673  01b7 81            	ret
 717                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 717                     ; 213 {
 718                     	switch	.text
 719  01b8               _FLASH_ProgramWord:
 721       00000000      OFST:	set	0
 724                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 726  01b8 96            	ldw	x,sp
 727  01b9 1c0003        	addw	x,#OFST+3
 728  01bc cd0000        	call	c_ltor
 730  01bf ae0000        	ldw	x,#L64
 731  01c2 cd0000        	call	c_lcmp
 733  01c5 250f          	jrult	L211
 734  01c7 96            	ldw	x,sp
 735  01c8 1c0003        	addw	x,#OFST+3
 736  01cb cd0000        	call	c_ltor
 738  01ce ae0004        	ldw	x,#L05
 739  01d1 cd0000        	call	c_lcmp
 741  01d4 251e          	jrult	L011
 742  01d6               L211:
 743  01d6 96            	ldw	x,sp
 744  01d7 1c0003        	addw	x,#OFST+3
 745  01da cd0000        	call	c_ltor
 747  01dd ae0008        	ldw	x,#L25
 748  01e0 cd0000        	call	c_lcmp
 750  01e3 2512          	jrult	L601
 751  01e5 96            	ldw	x,sp
 752  01e6 1c0003        	addw	x,#OFST+3
 753  01e9 cd0000        	call	c_ltor
 755  01ec ae000c        	ldw	x,#L45
 756  01ef cd0000        	call	c_lcmp
 758  01f2 2403          	jruge	L601
 759  01f4               L011:
 760  01f4 4f            	clr	a
 761  01f5 2010          	jra	L411
 762  01f7               L601:
 763  01f7 ae00d7        	ldw	x,#215
 764  01fa 89            	pushw	x
 765  01fb ae0000        	ldw	x,#0
 766  01fe 89            	pushw	x
 767  01ff ae0010        	ldw	x,#L73
 768  0202 cd0000        	call	_assert_failed
 770  0205 5b04          	addw	sp,#4
 771  0207               L411:
 772                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 774  0207 721c505b      	bset	20571,#6
 775                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 777  020b 721d505c      	bres	20572,#6
 778                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 780  020f 7b07          	ld	a,(OFST+7,sp)
 781  0211 88            	push	a
 782  0212 7b05          	ld	a,(OFST+5,sp)
 783  0214 b700          	ld	c_x,a
 784  0216 1e06          	ldw	x,(OFST+6,sp)
 785  0218 84            	pop	a
 786  0219 bf01          	ldw	c_x+1,x
 787  021b 92bd0000      	ldf	[c_x.e],a
 788                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 790  021f 7b08          	ld	a,(OFST+8,sp)
 791  0221 88            	push	a
 792  0222 7b05          	ld	a,(OFST+5,sp)
 793  0224 b700          	ld	c_x,a
 794  0226 1e06          	ldw	x,(OFST+6,sp)
 795  0228 84            	pop	a
 796  0229 90ae0001      	ldw	y,#1
 797  022d bf01          	ldw	c_x+1,x
 798  022f 93            	ldw	x,y
 799  0230 92a70000      	ldf	([c_x.e],x),a
 800                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 802  0234 7b09          	ld	a,(OFST+9,sp)
 803  0236 88            	push	a
 804  0237 7b05          	ld	a,(OFST+5,sp)
 805  0239 b700          	ld	c_x,a
 806  023b 1e06          	ldw	x,(OFST+6,sp)
 807  023d 84            	pop	a
 808  023e 90ae0002      	ldw	y,#2
 809  0242 bf01          	ldw	c_x+1,x
 810  0244 93            	ldw	x,y
 811  0245 92a70000      	ldf	([c_x.e],x),a
 812                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 814  0249 7b0a          	ld	a,(OFST+10,sp)
 815  024b 88            	push	a
 816  024c 7b05          	ld	a,(OFST+5,sp)
 817  024e b700          	ld	c_x,a
 818  0250 1e06          	ldw	x,(OFST+6,sp)
 819  0252 84            	pop	a
 820  0253 90ae0003      	ldw	y,#3
 821  0257 bf01          	ldw	c_x+1,x
 822  0259 93            	ldw	x,y
 823  025a 92a70000      	ldf	([c_x.e],x),a
 824                     ; 229 }
 827  025e 81            	ret
 873                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 873                     ; 238 {
 874                     	switch	.text
 875  025f               _FLASH_ProgramOptionByte:
 877  025f 89            	pushw	x
 878       00000000      OFST:	set	0
 881                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 883  0260 a34800        	cpw	x,#18432
 884  0263 2508          	jrult	L021
 885  0265 a34880        	cpw	x,#18560
 886  0268 2403          	jruge	L021
 887  026a 4f            	clr	a
 888  026b 2010          	jra	L221
 889  026d               L021:
 890  026d ae00f0        	ldw	x,#240
 891  0270 89            	pushw	x
 892  0271 ae0000        	ldw	x,#0
 893  0274 89            	pushw	x
 894  0275 ae0010        	ldw	x,#L73
 895  0278 cd0000        	call	_assert_failed
 897  027b 5b04          	addw	sp,#4
 898  027d               L221:
 899                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 901  027d 721e505b      	bset	20571,#7
 902                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 904  0281 721f505c      	bres	20572,#7
 905                     ; 247   if(Address == 0x4800)
 907  0285 1e01          	ldw	x,(OFST+1,sp)
 908  0287 a34800        	cpw	x,#18432
 909  028a 2607          	jrne	L742
 910                     ; 250     *((NEAR uint8_t*)Address) = Data;
 912  028c 7b05          	ld	a,(OFST+5,sp)
 913  028e 1e01          	ldw	x,(OFST+1,sp)
 914  0290 f7            	ld	(x),a
 916  0291 200c          	jra	L152
 917  0293               L742:
 918                     ; 255     *((NEAR uint8_t*)Address) = Data;
 920  0293 7b05          	ld	a,(OFST+5,sp)
 921  0295 1e01          	ldw	x,(OFST+1,sp)
 922  0297 f7            	ld	(x),a
 923                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 925  0298 7b05          	ld	a,(OFST+5,sp)
 926  029a 43            	cpl	a
 927  029b 1e01          	ldw	x,(OFST+1,sp)
 928  029d e701          	ld	(1,x),a
 929  029f               L152:
 930                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 932  029f a6fd          	ld	a,#253
 933  02a1 cd0000        	call	_FLASH_WaitForLastOperation
 935                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 937  02a4 721f505b      	bres	20571,#7
 938                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 940  02a8 721e505c      	bset	20572,#7
 941                     ; 263 }
 944  02ac 85            	popw	x
 945  02ad 81            	ret
 982                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 982                     ; 271 {
 983                     	switch	.text
 984  02ae               _FLASH_EraseOptionByte:
 986  02ae 89            	pushw	x
 987       00000000      OFST:	set	0
 990                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 992  02af a34800        	cpw	x,#18432
 993  02b2 2508          	jrult	L621
 994  02b4 a34880        	cpw	x,#18560
 995  02b7 2403          	jruge	L621
 996  02b9 4f            	clr	a
 997  02ba 2010          	jra	L031
 998  02bc               L621:
 999  02bc ae0111        	ldw	x,#273
1000  02bf 89            	pushw	x
1001  02c0 ae0000        	ldw	x,#0
1002  02c3 89            	pushw	x
1003  02c4 ae0010        	ldw	x,#L73
1004  02c7 cd0000        	call	_assert_failed
1006  02ca 5b04          	addw	sp,#4
1007  02cc               L031:
1008                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
1010  02cc 721e505b      	bset	20571,#7
1011                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
1013  02d0 721f505c      	bres	20572,#7
1014                     ; 280   if(Address == 0x4800)
1016  02d4 1e01          	ldw	x,(OFST+1,sp)
1017  02d6 a34800        	cpw	x,#18432
1018  02d9 2605          	jrne	L172
1019                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
1021  02db 1e01          	ldw	x,(OFST+1,sp)
1022  02dd 7f            	clr	(x)
1024  02de 2009          	jra	L372
1025  02e0               L172:
1026                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
1028  02e0 1e01          	ldw	x,(OFST+1,sp)
1029  02e2 7f            	clr	(x)
1030                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
1032  02e3 1e01          	ldw	x,(OFST+1,sp)
1033  02e5 a6ff          	ld	a,#255
1034  02e7 e701          	ld	(1,x),a
1035  02e9               L372:
1036                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
1038  02e9 a6fd          	ld	a,#253
1039  02eb cd0000        	call	_FLASH_WaitForLastOperation
1041                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
1043  02ee 721f505b      	bres	20571,#7
1044                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
1046  02f2 721e505c      	bset	20572,#7
1047                     ; 296 }
1050  02f6 85            	popw	x
1051  02f7 81            	ret
1115                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1115                     ; 304 {
1116                     	switch	.text
1117  02f8               _FLASH_ReadOptionByte:
1119  02f8 89            	pushw	x
1120  02f9 5204          	subw	sp,#4
1121       00000004      OFST:	set	4
1124                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
1126                     ; 306   uint16_t res_value = 0;
1128                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1130  02fb a34800        	cpw	x,#18432
1131  02fe 2508          	jrult	L431
1132  0300 a34880        	cpw	x,#18560
1133  0303 2403          	jruge	L431
1134  0305 4f            	clr	a
1135  0306 2010          	jra	L631
1136  0308               L431:
1137  0308 ae0135        	ldw	x,#309
1138  030b 89            	pushw	x
1139  030c ae0000        	ldw	x,#0
1140  030f 89            	pushw	x
1141  0310 ae0010        	ldw	x,#L73
1142  0313 cd0000        	call	_assert_failed
1144  0316 5b04          	addw	sp,#4
1145  0318               L631:
1146                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1148  0318 1e05          	ldw	x,(OFST+1,sp)
1149  031a f6            	ld	a,(x)
1150  031b 6b02          	ld	(OFST-2,sp),a
1151                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1153  031d 1e05          	ldw	x,(OFST+1,sp)
1154  031f e601          	ld	a,(1,x)
1155  0321 6b01          	ld	(OFST-3,sp),a
1156                     ; 315   if(Address == 0x4800)	 
1158  0323 1e05          	ldw	x,(OFST+1,sp)
1159  0325 a34800        	cpw	x,#18432
1160  0328 2608          	jrne	L723
1161                     ; 317     res_value =	 value_optbyte;
1163  032a 7b02          	ld	a,(OFST-2,sp)
1164  032c 5f            	clrw	x
1165  032d 97            	ld	xl,a
1166  032e 1f03          	ldw	(OFST-1,sp),x
1168  0330 2023          	jra	L133
1169  0332               L723:
1170                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
1172  0332 7b01          	ld	a,(OFST-3,sp)
1173  0334 43            	cpl	a
1174  0335 1102          	cp	a,(OFST-2,sp)
1175  0337 2617          	jrne	L333
1176                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1178  0339 7b02          	ld	a,(OFST-2,sp)
1179  033b 5f            	clrw	x
1180  033c 97            	ld	xl,a
1181  033d 4f            	clr	a
1182  033e 02            	rlwa	x,a
1183  033f 1f03          	ldw	(OFST-1,sp),x
1184                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
1186  0341 7b01          	ld	a,(OFST-3,sp)
1187  0343 5f            	clrw	x
1188  0344 97            	ld	xl,a
1189  0345 01            	rrwa	x,a
1190  0346 1a04          	or	a,(OFST+0,sp)
1191  0348 01            	rrwa	x,a
1192  0349 1a03          	or	a,(OFST-1,sp)
1193  034b 01            	rrwa	x,a
1194  034c 1f03          	ldw	(OFST-1,sp),x
1196  034e 2005          	jra	L133
1197  0350               L333:
1198                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
1200  0350 ae5555        	ldw	x,#21845
1201  0353 1f03          	ldw	(OFST-1,sp),x
1202  0355               L133:
1203                     ; 331   return(res_value);
1205  0355 1e03          	ldw	x,(OFST-1,sp)
1208  0357 5b06          	addw	sp,#6
1209  0359 81            	ret
1284                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1284                     ; 341 {
1285                     	switch	.text
1286  035a               _FLASH_SetLowPowerMode:
1288  035a 88            	push	a
1289       00000000      OFST:	set	0
1292                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1294  035b a104          	cp	a,#4
1295  035d 270b          	jreq	L441
1296  035f a108          	cp	a,#8
1297  0361 2707          	jreq	L441
1298  0363 4d            	tnz	a
1299  0364 2704          	jreq	L441
1300  0366 a10c          	cp	a,#12
1301  0368 2603          	jrne	L241
1302  036a               L441:
1303  036a 4f            	clr	a
1304  036b 2010          	jra	L641
1305  036d               L241:
1306  036d ae0157        	ldw	x,#343
1307  0370 89            	pushw	x
1308  0371 ae0000        	ldw	x,#0
1309  0374 89            	pushw	x
1310  0375 ae0010        	ldw	x,#L73
1311  0378 cd0000        	call	_assert_failed
1313  037b 5b04          	addw	sp,#4
1314  037d               L641:
1315                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1317  037d c6505a        	ld	a,20570
1318  0380 a4f3          	and	a,#243
1319  0382 c7505a        	ld	20570,a
1320                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1322  0385 c6505a        	ld	a,20570
1323  0388 1a01          	or	a,(OFST+1,sp)
1324  038a c7505a        	ld	20570,a
1325                     ; 350 }
1328  038d 84            	pop	a
1329  038e 81            	ret
1388                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1388                     ; 359 {
1389                     	switch	.text
1390  038f               _FLASH_SetProgrammingTime:
1392  038f 88            	push	a
1393       00000000      OFST:	set	0
1396                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1398  0390 4d            	tnz	a
1399  0391 2704          	jreq	L451
1400  0393 a101          	cp	a,#1
1401  0395 2603          	jrne	L251
1402  0397               L451:
1403  0397 4f            	clr	a
1404  0398 2010          	jra	L651
1405  039a               L251:
1406  039a ae0169        	ldw	x,#361
1407  039d 89            	pushw	x
1408  039e ae0000        	ldw	x,#0
1409  03a1 89            	pushw	x
1410  03a2 ae0010        	ldw	x,#L73
1411  03a5 cd0000        	call	_assert_failed
1413  03a8 5b04          	addw	sp,#4
1414  03aa               L651:
1415                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1417  03aa 7211505a      	bres	20570,#0
1418                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1420  03ae c6505a        	ld	a,20570
1421  03b1 1a01          	or	a,(OFST+1,sp)
1422  03b3 c7505a        	ld	20570,a
1423                     ; 365 }
1426  03b6 84            	pop	a
1427  03b7 81            	ret
1452                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1452                     ; 373 {
1453                     	switch	.text
1454  03b8               _FLASH_GetLowPowerMode:
1458                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1460  03b8 c6505a        	ld	a,20570
1461  03bb a40c          	and	a,#12
1464  03bd 81            	ret
1489                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1489                     ; 383 {
1490                     	switch	.text
1491  03be               _FLASH_GetProgrammingTime:
1495                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1497  03be c6505a        	ld	a,20570
1498  03c1 a401          	and	a,#1
1501  03c3 81            	ret
1535                     ; 392 uint32_t FLASH_GetBootSize(void)
1535                     ; 393 {
1536                     	switch	.text
1537  03c4               _FLASH_GetBootSize:
1539  03c4 5204          	subw	sp,#4
1540       00000004      OFST:	set	4
1543                     ; 394   uint32_t temp = 0;
1545                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1547  03c6 c6505d        	ld	a,20573
1548  03c9 5f            	clrw	x
1549  03ca 97            	ld	xl,a
1550  03cb 90ae0200      	ldw	y,#512
1551  03cf cd0000        	call	c_umul
1553  03d2 96            	ldw	x,sp
1554  03d3 1c0001        	addw	x,#OFST-3
1555  03d6 cd0000        	call	c_rtol
1557                     ; 400   if(FLASH->FPR == 0xFF)
1559  03d9 c6505d        	ld	a,20573
1560  03dc a1ff          	cp	a,#255
1561  03de 2611          	jrne	L554
1562                     ; 402     temp += 512;
1564  03e0 ae0200        	ldw	x,#512
1565  03e3 bf02          	ldw	c_lreg+2,x
1566  03e5 ae0000        	ldw	x,#0
1567  03e8 bf00          	ldw	c_lreg,x
1568  03ea 96            	ldw	x,sp
1569  03eb 1c0001        	addw	x,#OFST-3
1570  03ee cd0000        	call	c_lgadd
1572  03f1               L554:
1573                     ; 406   return(temp);
1575  03f1 96            	ldw	x,sp
1576  03f2 1c0001        	addw	x,#OFST-3
1577  03f5 cd0000        	call	c_ltor
1581  03f8 5b04          	addw	sp,#4
1582  03fa 81            	ret
1692                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1692                     ; 418 {
1693                     	switch	.text
1694  03fb               _FLASH_GetFlagStatus:
1696  03fb 88            	push	a
1697  03fc 88            	push	a
1698       00000001      OFST:	set	1
1701                     ; 419   FlagStatus status = RESET;
1703                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1705  03fd a140          	cp	a,#64
1706  03ff 2710          	jreq	L271
1707  0401 a108          	cp	a,#8
1708  0403 270c          	jreq	L271
1709  0405 a104          	cp	a,#4
1710  0407 2708          	jreq	L271
1711  0409 a102          	cp	a,#2
1712  040b 2704          	jreq	L271
1713  040d a101          	cp	a,#1
1714  040f 2603          	jrne	L071
1715  0411               L271:
1716  0411 4f            	clr	a
1717  0412 2010          	jra	L471
1718  0414               L071:
1719  0414 ae01a5        	ldw	x,#421
1720  0417 89            	pushw	x
1721  0418 ae0000        	ldw	x,#0
1722  041b 89            	pushw	x
1723  041c ae0010        	ldw	x,#L73
1724  041f cd0000        	call	_assert_failed
1726  0422 5b04          	addw	sp,#4
1727  0424               L471:
1728                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1730  0424 c6505f        	ld	a,20575
1731  0427 1502          	bcp	a,(OFST+1,sp)
1732  0429 2706          	jreq	L725
1733                     ; 426     status = SET; /* FLASH_FLAG is set */
1735  042b a601          	ld	a,#1
1736  042d 6b01          	ld	(OFST+0,sp),a
1738  042f 2002          	jra	L135
1739  0431               L725:
1740                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1742  0431 0f01          	clr	(OFST+0,sp)
1743  0433               L135:
1744                     ; 434   return status;
1746  0433 7b01          	ld	a,(OFST+0,sp)
1749  0435 85            	popw	x
1750  0436 81            	ret
1843                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1843                     ; 550 {
1844                     .FLASH_CODE:	section	.text
1845  0000               _FLASH_WaitForLastOperation:
1847  0000 5203          	subw	sp,#3
1848       00000003      OFST:	set	3
1851                     ; 551   uint8_t flagstatus = 0x00;
1853  0002 0f03          	clr	(OFST+0,sp)
1854                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1856  0004 aeffff        	ldw	x,#65535
1857  0007 1f01          	ldw	(OFST-2,sp),x
1858                     ; 557     if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1860  0009 a1fd          	cp	a,#253
1861  000b 2628          	jrne	L316
1863  000d 200e          	jra	L106
1864  000f               L775:
1865                     ; 561         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1865                     ; 562                                                         FLASH_IAPSR_WR_PG_DIS));
1867  000f c6505f        	ld	a,20575
1868  0012 a405          	and	a,#5
1869  0014 6b03          	ld	(OFST+0,sp),a
1870                     ; 563         timeout--;
1872  0016 1e01          	ldw	x,(OFST-2,sp)
1873  0018 1d0001        	subw	x,#1
1874  001b 1f01          	ldw	(OFST-2,sp),x
1875  001d               L106:
1876                     ; 559       while((flagstatus == 0x00) && (timeout != 0x00))
1878  001d 0d03          	tnz	(OFST+0,sp)
1879  001f 261c          	jrne	L706
1881  0021 1e01          	ldw	x,(OFST-2,sp)
1882  0023 26ea          	jrne	L775
1883  0025 2016          	jra	L706
1884  0027               L116:
1885                     ; 570         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1885                     ; 571                                                         FLASH_IAPSR_WR_PG_DIS));
1887  0027 c6505f        	ld	a,20575
1888  002a a441          	and	a,#65
1889  002c 6b03          	ld	(OFST+0,sp),a
1890                     ; 572         timeout--;
1892  002e 1e01          	ldw	x,(OFST-2,sp)
1893  0030 1d0001        	subw	x,#1
1894  0033 1f01          	ldw	(OFST-2,sp),x
1895  0035               L316:
1896                     ; 568       while((flagstatus == 0x00) && (timeout != 0x00))
1898  0035 0d03          	tnz	(OFST+0,sp)
1899  0037 2604          	jrne	L706
1901  0039 1e01          	ldw	x,(OFST-2,sp)
1902  003b 26ea          	jrne	L116
1903  003d               L706:
1904                     ; 583   if(timeout == 0x00 )
1906  003d 1e01          	ldw	x,(OFST-2,sp)
1907  003f 2604          	jrne	L126
1908                     ; 585     flagstatus = FLASH_STATUS_TIMEOUT;
1910  0041 a602          	ld	a,#2
1911  0043 6b03          	ld	(OFST+0,sp),a
1912  0045               L126:
1913                     ; 588   return((FLASH_Status_TypeDef)flagstatus);
1915  0045 7b03          	ld	a,(OFST+0,sp)
1918  0047 5b03          	addw	sp,#3
1919  0049 81            	ret
1983                     ; 598 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1983                     ; 599 {
1984                     	switch	.FLASH_CODE
1985  004a               _FLASH_EraseBlock:
1987  004a 89            	pushw	x
1988  004b 5207          	subw	sp,#7
1989       00000007      OFST:	set	7
1992                     ; 600   uint32_t startaddress = 0;
1994                     ; 610   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1996  004d 7b0c          	ld	a,(OFST+5,sp)
1997  004f a1fd          	cp	a,#253
1998  0051 2706          	jreq	L402
1999  0053 7b0c          	ld	a,(OFST+5,sp)
2000  0055 a1f7          	cp	a,#247
2001  0057 2603          	jrne	L202
2002  0059               L402:
2003  0059 4f            	clr	a
2004  005a 2010          	jra	L602
2005  005c               L202:
2006  005c ae0262        	ldw	x,#610
2007  005f 89            	pushw	x
2008  0060 ae0000        	ldw	x,#0
2009  0063 89            	pushw	x
2010  0064 ae0010        	ldw	x,#L73
2011  0067 cd0000        	call	_assert_failed
2013  006a 5b04          	addw	sp,#4
2014  006c               L602:
2015                     ; 611   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
2017  006c 7b0c          	ld	a,(OFST+5,sp)
2018  006e a1fd          	cp	a,#253
2019  0070 2626          	jrne	L556
2020                     ; 613     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2022  0072 1e08          	ldw	x,(OFST+1,sp)
2023  0074 a30400        	cpw	x,#1024
2024  0077 2403          	jruge	L012
2025  0079 4f            	clr	a
2026  007a 2010          	jra	L212
2027  007c               L012:
2028  007c ae0265        	ldw	x,#613
2029  007f 89            	pushw	x
2030  0080 ae0000        	ldw	x,#0
2031  0083 89            	pushw	x
2032  0084 ae0010        	ldw	x,#L73
2033  0087 cd0000        	call	_assert_failed
2035  008a 5b04          	addw	sp,#4
2036  008c               L212:
2037                     ; 614     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2039  008c ae8000        	ldw	x,#32768
2040  008f 1f03          	ldw	(OFST-4,sp),x
2041  0091 ae0000        	ldw	x,#0
2042  0094 1f01          	ldw	(OFST-6,sp),x
2044  0096 2024          	jra	L756
2045  0098               L556:
2046                     ; 618     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2048  0098 1e08          	ldw	x,(OFST+1,sp)
2049  009a a30010        	cpw	x,#16
2050  009d 2403          	jruge	L412
2051  009f 4f            	clr	a
2052  00a0 2010          	jra	L612
2053  00a2               L412:
2054  00a2 ae026a        	ldw	x,#618
2055  00a5 89            	pushw	x
2056  00a6 ae0000        	ldw	x,#0
2057  00a9 89            	pushw	x
2058  00aa ae0010        	ldw	x,#L73
2059  00ad cd0000        	call	_assert_failed
2061  00b0 5b04          	addw	sp,#4
2062  00b2               L612:
2063                     ; 619     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2065  00b2 ae4000        	ldw	x,#16384
2066  00b5 1f03          	ldw	(OFST-4,sp),x
2067  00b7 ae0000        	ldw	x,#0
2068  00ba 1f01          	ldw	(OFST-6,sp),x
2069  00bc               L756:
2070                     ; 624   pwFlash = (PointerAttr uint8_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
2072  00bc 1e08          	ldw	x,(OFST+1,sp)
2073  00be a680          	ld	a,#128
2074  00c0 cd0000        	call	c_cmulx
2076  00c3 96            	ldw	x,sp
2077  00c4 1c0001        	addw	x,#OFST-6
2078  00c7 cd0000        	call	c_ladd
2080  00ca 450100        	mov	c_x,c_lreg+1
2081  00cd be02          	ldw	x,c_lreg+2
2082  00cf b600          	ld	a,c_x
2083  00d1 6b05          	ld	(OFST-2,sp),a
2084  00d3 1f06          	ldw	(OFST-1,sp),x
2085                     ; 631   FLASH->CR2 |= FLASH_CR2_ERASE;
2087  00d5 721a505b      	bset	20571,#5
2088                     ; 632   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
2090  00d9 721b505c      	bres	20572,#5
2091                     ; 639     *pwFlash = (uint8_t)0;
2093  00dd 7b05          	ld	a,(OFST-2,sp)
2094  00df b700          	ld	c_x,a
2095  00e1 1e06          	ldw	x,(OFST-1,sp)
2096  00e3 bf01          	ldw	c_x+1,x
2097  00e5 4f            	clr	a
2098  00e6 92bd0000      	ldf	[c_x.e],a
2099                     ; 640   *(pwFlash + 1) = (uint8_t)0;
2101  00ea 7b05          	ld	a,(OFST-2,sp)
2102  00ec b700          	ld	c_x,a
2103  00ee 1e06          	ldw	x,(OFST-1,sp)
2104  00f0 90ae0001      	ldw	y,#1
2105  00f4 bf01          	ldw	c_x+1,x
2106  00f6 93            	ldw	x,y
2107  00f7 4f            	clr	a
2108  00f8 92a70000      	ldf	([c_x.e],x),a
2109                     ; 641   *(pwFlash + 2) = (uint8_t)0;
2111  00fc 7b05          	ld	a,(OFST-2,sp)
2112  00fe b700          	ld	c_x,a
2113  0100 1e06          	ldw	x,(OFST-1,sp)
2114  0102 90ae0002      	ldw	y,#2
2115  0106 bf01          	ldw	c_x+1,x
2116  0108 93            	ldw	x,y
2117  0109 4f            	clr	a
2118  010a 92a70000      	ldf	([c_x.e],x),a
2119                     ; 642   *(pwFlash + 3) = (uint8_t)0;    
2121  010e 7b05          	ld	a,(OFST-2,sp)
2122  0110 b700          	ld	c_x,a
2123  0112 1e06          	ldw	x,(OFST-1,sp)
2124  0114 90ae0003      	ldw	y,#3
2125  0118 bf01          	ldw	c_x+1,x
2126  011a 93            	ldw	x,y
2127  011b 4f            	clr	a
2128  011c 92a70000      	ldf	([c_x.e],x),a
2129                     ; 644 }
2132  0120 5b09          	addw	sp,#9
2133  0122 81            	ret
2238                     ; 655 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2238                     ; 656                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2238                     ; 657 {
2239                     	switch	.FLASH_CODE
2240  0123               _FLASH_ProgramBlock:
2242  0123 89            	pushw	x
2243  0124 5206          	subw	sp,#6
2244       00000006      OFST:	set	6
2247                     ; 658   uint16_t Count = 0;
2249                     ; 659   uint32_t startaddress = 0;
2251                     ; 662   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2253  0126 7b0b          	ld	a,(OFST+5,sp)
2254  0128 a1fd          	cp	a,#253
2255  012a 2706          	jreq	L422
2256  012c 7b0b          	ld	a,(OFST+5,sp)
2257  012e a1f7          	cp	a,#247
2258  0130 2603          	jrne	L222
2259  0132               L422:
2260  0132 4f            	clr	a
2261  0133 2010          	jra	L622
2262  0135               L222:
2263  0135 ae0296        	ldw	x,#662
2264  0138 89            	pushw	x
2265  0139 ae0000        	ldw	x,#0
2266  013c 89            	pushw	x
2267  013d ae0010        	ldw	x,#L73
2268  0140 cd0000        	call	_assert_failed
2270  0143 5b04          	addw	sp,#4
2271  0145               L622:
2272                     ; 663   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2274  0145 0d0c          	tnz	(OFST+6,sp)
2275  0147 2706          	jreq	L232
2276  0149 7b0c          	ld	a,(OFST+6,sp)
2277  014b a110          	cp	a,#16
2278  014d 2603          	jrne	L032
2279  014f               L232:
2280  014f 4f            	clr	a
2281  0150 2010          	jra	L432
2282  0152               L032:
2283  0152 ae0297        	ldw	x,#663
2284  0155 89            	pushw	x
2285  0156 ae0000        	ldw	x,#0
2286  0159 89            	pushw	x
2287  015a ae0010        	ldw	x,#L73
2288  015d cd0000        	call	_assert_failed
2290  0160 5b04          	addw	sp,#4
2291  0162               L432:
2292                     ; 664   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
2294  0162 7b0b          	ld	a,(OFST+5,sp)
2295  0164 a1fd          	cp	a,#253
2296  0166 2626          	jrne	L337
2297                     ; 666     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2299  0168 1e07          	ldw	x,(OFST+1,sp)
2300  016a a30400        	cpw	x,#1024
2301  016d 2403          	jruge	L632
2302  016f 4f            	clr	a
2303  0170 2010          	jra	L042
2304  0172               L632:
2305  0172 ae029a        	ldw	x,#666
2306  0175 89            	pushw	x
2307  0176 ae0000        	ldw	x,#0
2308  0179 89            	pushw	x
2309  017a ae0010        	ldw	x,#L73
2310  017d cd0000        	call	_assert_failed
2312  0180 5b04          	addw	sp,#4
2313  0182               L042:
2314                     ; 667     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2316  0182 ae8000        	ldw	x,#32768
2317  0185 1f03          	ldw	(OFST-3,sp),x
2318  0187 ae0000        	ldw	x,#0
2319  018a 1f01          	ldw	(OFST-5,sp),x
2321  018c 2024          	jra	L537
2322  018e               L337:
2323                     ; 671     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2325  018e 1e07          	ldw	x,(OFST+1,sp)
2326  0190 a30010        	cpw	x,#16
2327  0193 2403          	jruge	L242
2328  0195 4f            	clr	a
2329  0196 2010          	jra	L442
2330  0198               L242:
2331  0198 ae029f        	ldw	x,#671
2332  019b 89            	pushw	x
2333  019c ae0000        	ldw	x,#0
2334  019f 89            	pushw	x
2335  01a0 ae0010        	ldw	x,#L73
2336  01a3 cd0000        	call	_assert_failed
2338  01a6 5b04          	addw	sp,#4
2339  01a8               L442:
2340                     ; 672     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2342  01a8 ae4000        	ldw	x,#16384
2343  01ab 1f03          	ldw	(OFST-3,sp),x
2344  01ad ae0000        	ldw	x,#0
2345  01b0 1f01          	ldw	(OFST-5,sp),x
2346  01b2               L537:
2347                     ; 676   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2349  01b2 1e07          	ldw	x,(OFST+1,sp)
2350  01b4 a680          	ld	a,#128
2351  01b6 cd0000        	call	c_cmulx
2353  01b9 96            	ldw	x,sp
2354  01ba 1c0001        	addw	x,#OFST-5
2355  01bd cd0000        	call	c_lgadd
2357                     ; 679   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2359  01c0 0d0c          	tnz	(OFST+6,sp)
2360  01c2 260a          	jrne	L737
2361                     ; 682     FLASH->CR2 |= FLASH_CR2_PRG;
2363  01c4 7210505b      	bset	20571,#0
2364                     ; 683     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2366  01c8 7211505c      	bres	20572,#0
2368  01cc 2008          	jra	L147
2369  01ce               L737:
2370                     ; 688     FLASH->CR2 |= FLASH_CR2_FPRG;
2372  01ce 7218505b      	bset	20571,#4
2373                     ; 689     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2375  01d2 7219505c      	bres	20572,#4
2376  01d6               L147:
2377                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2379  01d6 5f            	clrw	x
2380  01d7 1f05          	ldw	(OFST-1,sp),x
2381  01d9               L347:
2382                     ; 695     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2384  01d9 1e0d          	ldw	x,(OFST+7,sp)
2385  01db 72fb05        	addw	x,(OFST-1,sp)
2386  01de f6            	ld	a,(x)
2387  01df 88            	push	a
2388  01e0 7b03          	ld	a,(OFST-3,sp)
2389  01e2 b700          	ld	c_x,a
2390  01e4 1e04          	ldw	x,(OFST-2,sp)
2391  01e6 84            	pop	a
2392  01e7 1605          	ldw	y,(OFST-1,sp)
2393  01e9 bf01          	ldw	c_x+1,x
2394  01eb 93            	ldw	x,y
2395  01ec 92a70000      	ldf	([c_x.e],x),a
2396                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2398  01f0 1e05          	ldw	x,(OFST-1,sp)
2399  01f2 1c0001        	addw	x,#1
2400  01f5 1f05          	ldw	(OFST-1,sp),x
2403  01f7 1e05          	ldw	x,(OFST-1,sp)
2404  01f9 a30080        	cpw	x,#128
2405  01fc 25db          	jrult	L347
2406                     ; 697 }
2409  01fe 5b08          	addw	sp,#8
2410  0200 81            	ret
2423                     	xdef	_FLASH_WaitForLastOperation
2424                     	xdef	_FLASH_ProgramBlock
2425                     	xdef	_FLASH_EraseBlock
2426                     	xdef	_FLASH_GetFlagStatus
2427                     	xdef	_FLASH_GetBootSize
2428                     	xdef	_FLASH_GetProgrammingTime
2429                     	xdef	_FLASH_GetLowPowerMode
2430                     	xdef	_FLASH_SetProgrammingTime
2431                     	xdef	_FLASH_SetLowPowerMode
2432                     	xdef	_FLASH_EraseOptionByte
2433                     	xdef	_FLASH_ProgramOptionByte
2434                     	xdef	_FLASH_ReadOptionByte
2435                     	xdef	_FLASH_ProgramWord
2436                     	xdef	_FLASH_ReadByte
2437                     	xdef	_FLASH_ProgramByte
2438                     	xdef	_FLASH_EraseByte
2439                     	xdef	_FLASH_ITConfig
2440                     	xdef	_FLASH_DeInit
2441                     	xdef	_FLASH_Lock
2442                     	xdef	_FLASH_Unlock
2443                     	xref	_assert_failed
2444                     	switch	.const
2445  0010               L73:
2446  0010 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
2447  0022 697665725c73  	dc.b	"iver\src\stm8s_fla"
2448  0034 73682e6300    	dc.b	"sh.c",0
2449                     	xref.b	c_lreg
2450                     	xref.b	c_x
2451                     	xref.b	c_y
2471                     	xref	c_ladd
2472                     	xref	c_cmulx
2473                     	xref	c_lgadd
2474                     	xref	c_rtol
2475                     	xref	c_umul
2476                     	xref	c_lcmp
2477                     	xref	c_ltor
2478                     	end
