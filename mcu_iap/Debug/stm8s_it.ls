   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  45                     ; 17 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  45                     ; 18 {
  46                     	switch	.text
  47  0000               f_NonHandledInterrupt:
  49  0000 3b0002        	push	c_x+2
  50  0003 be00          	ldw	x,c_x
  51  0005 89            	pushw	x
  52  0006 3b0002        	push	c_y+2
  53  0009 be00          	ldw	x,c_y
  54  000b 89            	pushw	x
  57                     ; 19   MAIN_NonHandledInterrupt();
  59  000c cd0000        	call	_MAIN_NonHandledInterrupt
  61                     ; 20 }
  64  000f 85            	popw	x
  65  0010 bf00          	ldw	c_y,x
  66  0012 320002        	pop	c_y+2
  67  0015 85            	popw	x
  68  0016 bf00          	ldw	c_x,x
  69  0018 320002        	pop	c_x+2
  70  001b 80            	iret
  93                     ; 28 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  93                     ; 29 {
  94                     	switch	.text
  95  001c               f_TRAP_IRQHandler:
  97  001c 3b0002        	push	c_x+2
  98  001f be00          	ldw	x,c_x
  99  0021 89            	pushw	x
 100  0022 3b0002        	push	c_y+2
 101  0025 be00          	ldw	x,c_y
 102  0027 89            	pushw	x
 105                     ; 30   MAIN_TRAP_IRQHandler();
 107  0028 cd0000        	call	_MAIN_TRAP_IRQHandler
 109                     ; 31 }
 112  002b 85            	popw	x
 113  002c bf00          	ldw	c_y,x
 114  002e 320002        	pop	c_y+2
 115  0031 85            	popw	x
 116  0032 bf00          	ldw	c_x,x
 117  0034 320002        	pop	c_x+2
 118  0037 80            	iret
 141                     ; 38 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 141                     ; 39 {
 142                     	switch	.text
 143  0038               f_TLI_IRQHandler:
 145  0038 3b0002        	push	c_x+2
 146  003b be00          	ldw	x,c_x
 147  003d 89            	pushw	x
 148  003e 3b0002        	push	c_y+2
 149  0041 be00          	ldw	x,c_y
 150  0043 89            	pushw	x
 153                     ; 40   MAIN_TLI_IRQHandler();
 155  0044 cd0000        	call	_MAIN_TLI_IRQHandler
 157                     ; 41 }
 160  0047 85            	popw	x
 161  0048 bf00          	ldw	c_y,x
 162  004a 320002        	pop	c_y+2
 163  004d 85            	popw	x
 164  004e bf00          	ldw	c_x,x
 165  0050 320002        	pop	c_x+2
 166  0053 80            	iret
 189                     ; 48 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 189                     ; 49 {
 190                     	switch	.text
 191  0054               f_AWU_IRQHandler:
 193  0054 3b0002        	push	c_x+2
 194  0057 be00          	ldw	x,c_x
 195  0059 89            	pushw	x
 196  005a 3b0002        	push	c_y+2
 197  005d be00          	ldw	x,c_y
 198  005f 89            	pushw	x
 201                     ; 50   MAIN_AWU_IRQHandler();
 203  0060 cd0000        	call	_MAIN_AWU_IRQHandler
 205                     ; 51 }
 208  0063 85            	popw	x
 209  0064 bf00          	ldw	c_y,x
 210  0066 320002        	pop	c_y+2
 211  0069 85            	popw	x
 212  006a bf00          	ldw	c_x,x
 213  006c 320002        	pop	c_x+2
 214  006f 80            	iret
 237                     ; 58 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 237                     ; 59 {
 238                     	switch	.text
 239  0070               f_CLK_IRQHandler:
 241  0070 3b0002        	push	c_x+2
 242  0073 be00          	ldw	x,c_x
 243  0075 89            	pushw	x
 244  0076 3b0002        	push	c_y+2
 245  0079 be00          	ldw	x,c_y
 246  007b 89            	pushw	x
 249                     ; 60   MAIN_CLK_IRQHandler();
 251  007c cd0000        	call	_MAIN_CLK_IRQHandler
 253                     ; 61 }
 256  007f 85            	popw	x
 257  0080 bf00          	ldw	c_y,x
 258  0082 320002        	pop	c_y+2
 259  0085 85            	popw	x
 260  0086 bf00          	ldw	c_x,x
 261  0088 320002        	pop	c_x+2
 262  008b 80            	iret
 286                     ; 68 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 286                     ; 69 {
 287                     	switch	.text
 288  008c               f_EXTI_PORTA_IRQHandler:
 290  008c 3b0002        	push	c_x+2
 291  008f be00          	ldw	x,c_x
 292  0091 89            	pushw	x
 293  0092 3b0002        	push	c_y+2
 294  0095 be00          	ldw	x,c_y
 295  0097 89            	pushw	x
 298                     ; 70   MAIN_EXTI_PORTA_IRQHandler();
 300  0098 cd0000        	call	_MAIN_EXTI_PORTA_IRQHandler
 302                     ; 71 }
 305  009b 85            	popw	x
 306  009c bf00          	ldw	c_y,x
 307  009e 320002        	pop	c_y+2
 308  00a1 85            	popw	x
 309  00a2 bf00          	ldw	c_x,x
 310  00a4 320002        	pop	c_x+2
 311  00a7 80            	iret
 335                     ; 78 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 335                     ; 79 {
 336                     	switch	.text
 337  00a8               f_EXTI_PORTB_IRQHandler:
 339  00a8 3b0002        	push	c_x+2
 340  00ab be00          	ldw	x,c_x
 341  00ad 89            	pushw	x
 342  00ae 3b0002        	push	c_y+2
 343  00b1 be00          	ldw	x,c_y
 344  00b3 89            	pushw	x
 347                     ; 80   MAIN_EXTI_PORTB_IRQHandler();
 349  00b4 cd0000        	call	_MAIN_EXTI_PORTB_IRQHandler
 351                     ; 81 }
 354  00b7 85            	popw	x
 355  00b8 bf00          	ldw	c_y,x
 356  00ba 320002        	pop	c_y+2
 357  00bd 85            	popw	x
 358  00be bf00          	ldw	c_x,x
 359  00c0 320002        	pop	c_x+2
 360  00c3 80            	iret
 384                     ; 88 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 384                     ; 89 {
 385                     	switch	.text
 386  00c4               f_EXTI_PORTC_IRQHandler:
 388  00c4 3b0002        	push	c_x+2
 389  00c7 be00          	ldw	x,c_x
 390  00c9 89            	pushw	x
 391  00ca 3b0002        	push	c_y+2
 392  00cd be00          	ldw	x,c_y
 393  00cf 89            	pushw	x
 396                     ; 90   MAIN_EXTI_PORTC_IRQHandler();
 398  00d0 cd0000        	call	_MAIN_EXTI_PORTC_IRQHandler
 400                     ; 91 }
 403  00d3 85            	popw	x
 404  00d4 bf00          	ldw	c_y,x
 405  00d6 320002        	pop	c_y+2
 406  00d9 85            	popw	x
 407  00da bf00          	ldw	c_x,x
 408  00dc 320002        	pop	c_x+2
 409  00df 80            	iret
 433                     ; 98 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 433                     ; 99 {
 434                     	switch	.text
 435  00e0               f_EXTI_PORTD_IRQHandler:
 437  00e0 3b0002        	push	c_x+2
 438  00e3 be00          	ldw	x,c_x
 439  00e5 89            	pushw	x
 440  00e6 3b0002        	push	c_y+2
 441  00e9 be00          	ldw	x,c_y
 442  00eb 89            	pushw	x
 445                     ; 100   MAIN_EXTI_PORTD_IRQHandler();
 447  00ec cd0000        	call	_MAIN_EXTI_PORTD_IRQHandler
 449                     ; 101 }
 452  00ef 85            	popw	x
 453  00f0 bf00          	ldw	c_y,x
 454  00f2 320002        	pop	c_y+2
 455  00f5 85            	popw	x
 456  00f6 bf00          	ldw	c_x,x
 457  00f8 320002        	pop	c_x+2
 458  00fb 80            	iret
 482                     ; 108 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 482                     ; 109 {
 483                     	switch	.text
 484  00fc               f_EXTI_PORTE_IRQHandler:
 486  00fc 3b0002        	push	c_x+2
 487  00ff be00          	ldw	x,c_x
 488  0101 89            	pushw	x
 489  0102 3b0002        	push	c_y+2
 490  0105 be00          	ldw	x,c_y
 491  0107 89            	pushw	x
 494                     ; 110   MAIN_EXTI_PORTE_IRQHandler();
 496  0108 cd0000        	call	_MAIN_EXTI_PORTE_IRQHandler
 498                     ; 111 }
 501  010b 85            	popw	x
 502  010c bf00          	ldw	c_y,x
 503  010e 320002        	pop	c_y+2
 504  0111 85            	popw	x
 505  0112 bf00          	ldw	c_x,x
 506  0114 320002        	pop	c_x+2
 507  0117 80            	iret
 530                     ; 140 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 530                     ; 141 {
 531                     	switch	.text
 532  0118               f_SPI_IRQHandler:
 534  0118 3b0002        	push	c_x+2
 535  011b be00          	ldw	x,c_x
 536  011d 89            	pushw	x
 537  011e 3b0002        	push	c_y+2
 538  0121 be00          	ldw	x,c_y
 539  0123 89            	pushw	x
 542                     ; 142   MAIN_SPI_IRQHandler();
 544  0124 cd0000        	call	_MAIN_SPI_IRQHandler
 546                     ; 143 }
 549  0127 85            	popw	x
 550  0128 bf00          	ldw	c_y,x
 551  012a 320002        	pop	c_y+2
 552  012d 85            	popw	x
 553  012e bf00          	ldw	c_x,x
 554  0130 320002        	pop	c_x+2
 555  0133 80            	iret
 579                     ; 150 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 579                     ; 151 {
 580                     	switch	.text
 581  0134               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 583  0134 3b0002        	push	c_x+2
 584  0137 be00          	ldw	x,c_x
 585  0139 89            	pushw	x
 586  013a 3b0002        	push	c_y+2
 587  013d be00          	ldw	x,c_y
 588  013f 89            	pushw	x
 591                     ; 152   MAIN_TIM1_UPD_OVF_TRG_BRK_IRQHandler();
 593  0140 cd0000        	call	_MAIN_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 595                     ; 153 }
 598  0143 85            	popw	x
 599  0144 bf00          	ldw	c_y,x
 600  0146 320002        	pop	c_y+2
 601  0149 85            	popw	x
 602  014a bf00          	ldw	c_x,x
 603  014c 320002        	pop	c_x+2
 604  014f 80            	iret
 628                     ; 160 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 628                     ; 161 {
 629                     	switch	.text
 630  0150               f_TIM1_CAP_COM_IRQHandler:
 632  0150 3b0002        	push	c_x+2
 633  0153 be00          	ldw	x,c_x
 634  0155 89            	pushw	x
 635  0156 3b0002        	push	c_y+2
 636  0159 be00          	ldw	x,c_y
 637  015b 89            	pushw	x
 640                     ; 162   MAIN_TIM1_CAP_COM_IRQHandler();
 642  015c cd0000        	call	_MAIN_TIM1_CAP_COM_IRQHandler
 644                     ; 163 }
 647  015f 85            	popw	x
 648  0160 bf00          	ldw	c_y,x
 649  0162 320002        	pop	c_y+2
 650  0165 85            	popw	x
 651  0166 bf00          	ldw	c_x,x
 652  0168 320002        	pop	c_x+2
 653  016b 80            	iret
 677                     ; 170  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 677                     ; 171  {
 678                     	switch	.text
 679  016c               f_TIM2_UPD_OVF_BRK_IRQHandler:
 681  016c 3b0002        	push	c_x+2
 682  016f be00          	ldw	x,c_x
 683  0171 89            	pushw	x
 684  0172 3b0002        	push	c_y+2
 685  0175 be00          	ldw	x,c_y
 686  0177 89            	pushw	x
 689                     ; 172    MAIN_TIM2_UPD_OVF_BRK_IRQHandler();
 691  0178 cd0000        	call	_MAIN_TIM2_UPD_OVF_BRK_IRQHandler
 693                     ; 173  }
 696  017b 85            	popw	x
 697  017c bf00          	ldw	c_y,x
 698  017e 320002        	pop	c_y+2
 699  0181 85            	popw	x
 700  0182 bf00          	ldw	c_x,x
 701  0184 320002        	pop	c_x+2
 702  0187 80            	iret
 726                     ; 180  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 726                     ; 181  {
 727                     	switch	.text
 728  0188               f_TIM2_CAP_COM_IRQHandler:
 730  0188 3b0002        	push	c_x+2
 731  018b be00          	ldw	x,c_x
 732  018d 89            	pushw	x
 733  018e 3b0002        	push	c_y+2
 734  0191 be00          	ldw	x,c_y
 735  0193 89            	pushw	x
 738                     ; 182    MAIN_TIM2_CAP_COM_IRQHandler();
 740  0194 cd0000        	call	_MAIN_TIM2_CAP_COM_IRQHandler
 742                     ; 183  }
 745  0197 85            	popw	x
 746  0198 bf00          	ldw	c_y,x
 747  019a 320002        	pop	c_y+2
 748  019d 85            	popw	x
 749  019e bf00          	ldw	c_x,x
 750  01a0 320002        	pop	c_x+2
 751  01a3 80            	iret
 775                     ; 190   INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 775                     ; 191   {
 776                     	switch	.text
 777  01a4               f_TIM3_UPD_OVF_BRK_IRQHandler:
 779  01a4 3b0002        	push	c_x+2
 780  01a7 be00          	ldw	x,c_x
 781  01a9 89            	pushw	x
 782  01aa 3b0002        	push	c_y+2
 783  01ad be00          	ldw	x,c_y
 784  01af 89            	pushw	x
 787                     ; 192     MAIN_TIM3_UPD_OVF_BRK_IRQHandler();
 789  01b0 cd0000        	call	_MAIN_TIM3_UPD_OVF_BRK_IRQHandler
 791                     ; 193   }
 794  01b3 85            	popw	x
 795  01b4 bf00          	ldw	c_y,x
 796  01b6 320002        	pop	c_y+2
 797  01b9 85            	popw	x
 798  01ba bf00          	ldw	c_x,x
 799  01bc 320002        	pop	c_x+2
 800  01bf 80            	iret
 824                     ; 200   INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 824                     ; 201   {
 825                     	switch	.text
 826  01c0               f_TIM3_CAP_COM_IRQHandler:
 828  01c0 3b0002        	push	c_x+2
 829  01c3 be00          	ldw	x,c_x
 830  01c5 89            	pushw	x
 831  01c6 3b0002        	push	c_y+2
 832  01c9 be00          	ldw	x,c_y
 833  01cb 89            	pushw	x
 836                     ; 202     MAIN_TIM3_CAP_COM_IRQHandler();
 838  01cc cd0000        	call	_MAIN_TIM3_CAP_COM_IRQHandler
 840                     ; 203   }
 843  01cf 85            	popw	x
 844  01d0 bf00          	ldw	c_y,x
 845  01d2 320002        	pop	c_y+2
 846  01d5 85            	popw	x
 847  01d6 bf00          	ldw	c_x,x
 848  01d8 320002        	pop	c_x+2
 849  01db 80            	iret
 873                     ; 210  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 873                     ; 211  {
 874                     	switch	.text
 875  01dc               f_UART1_TX_IRQHandler:
 877  01dc 3b0002        	push	c_x+2
 878  01df be00          	ldw	x,c_x
 879  01e1 89            	pushw	x
 880  01e2 3b0002        	push	c_y+2
 881  01e5 be00          	ldw	x,c_y
 882  01e7 89            	pushw	x
 885                     ; 212    MAIN_UART1_TX_IRQHandler();
 887  01e8 cd0000        	call	_MAIN_UART1_TX_IRQHandler
 889                     ; 213  }
 892  01eb 85            	popw	x
 893  01ec bf00          	ldw	c_y,x
 894  01ee 320002        	pop	c_y+2
 895  01f1 85            	popw	x
 896  01f2 bf00          	ldw	c_x,x
 897  01f4 320002        	pop	c_x+2
 898  01f7 80            	iret
 922                     ; 220  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 922                     ; 221  {
 923                     	switch	.text
 924  01f8               f_UART1_RX_IRQHandler:
 926  01f8 3b0002        	push	c_x+2
 927  01fb be00          	ldw	x,c_x
 928  01fd 89            	pushw	x
 929  01fe 3b0002        	push	c_y+2
 930  0201 be00          	ldw	x,c_y
 931  0203 89            	pushw	x
 934                     ; 222    MAIN_UART1_RX_IRQHandler();
 936  0204 cd0000        	call	_MAIN_UART1_RX_IRQHandler
 938                     ; 223  }
 941  0207 85            	popw	x
 942  0208 bf00          	ldw	c_y,x
 943  020a 320002        	pop	c_y+2
 944  020d 85            	popw	x
 945  020e bf00          	ldw	c_x,x
 946  0210 320002        	pop	c_x+2
 947  0213 80            	iret
 970                     ; 230 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 970                     ; 231 {
 971                     	switch	.text
 972  0214               f_I2C_IRQHandler:
 974  0214 3b0002        	push	c_x+2
 975  0217 be00          	ldw	x,c_x
 976  0219 89            	pushw	x
 977  021a 3b0002        	push	c_y+2
 978  021d be00          	ldw	x,c_y
 979  021f 89            	pushw	x
 982                     ; 232   MAIN_I2C_IRQHandler();
 984  0220 cd0000        	call	_MAIN_I2C_IRQHandler
 986                     ; 233 }
 989  0223 85            	popw	x
 990  0224 bf00          	ldw	c_y,x
 991  0226 320002        	pop	c_y+2
 992  0229 85            	popw	x
 993  022a bf00          	ldw	c_x,x
 994  022c 320002        	pop	c_x+2
 995  022f 80            	iret
1019                     ; 240  INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
1019                     ; 241  {
1020                     	switch	.text
1021  0230               f_UART3_TX_IRQHandler:
1023  0230 3b0002        	push	c_x+2
1024  0233 be00          	ldw	x,c_x
1025  0235 89            	pushw	x
1026  0236 3b0002        	push	c_y+2
1027  0239 be00          	ldw	x,c_y
1028  023b 89            	pushw	x
1031                     ; 242    MAIN_UART3_TX_IRQHandler();
1033  023c cd0000        	call	_MAIN_UART3_TX_IRQHandler
1035                     ; 243  }
1038  023f 85            	popw	x
1039  0240 bf00          	ldw	c_y,x
1040  0242 320002        	pop	c_y+2
1041  0245 85            	popw	x
1042  0246 bf00          	ldw	c_x,x
1043  0248 320002        	pop	c_x+2
1044  024b 80            	iret
1068                     ; 250  INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
1068                     ; 251  {
1069                     	switch	.text
1070  024c               f_UART3_RX_IRQHandler:
1072  024c 3b0002        	push	c_x+2
1073  024f be00          	ldw	x,c_x
1074  0251 89            	pushw	x
1075  0252 3b0002        	push	c_y+2
1076  0255 be00          	ldw	x,c_y
1077  0257 89            	pushw	x
1080                     ; 252    MAIN_UART3_RX_IRQHandler();
1082  0258 cd0000        	call	_MAIN_UART3_RX_IRQHandler
1084                     ; 253  }
1087  025b 85            	popw	x
1088  025c bf00          	ldw	c_y,x
1089  025e 320002        	pop	c_y+2
1090  0261 85            	popw	x
1091  0262 bf00          	ldw	c_x,x
1092  0264 320002        	pop	c_x+2
1093  0267 80            	iret
1116                     ; 259   INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
1116                     ; 260   {
1117                     	switch	.text
1118  0268               f_ADC2_IRQHandler:
1120  0268 3b0002        	push	c_x+2
1121  026b be00          	ldw	x,c_x
1122  026d 89            	pushw	x
1123  026e 3b0002        	push	c_y+2
1124  0271 be00          	ldw	x,c_y
1125  0273 89            	pushw	x
1128                     ; 261     MAIN_ADC2_IRQHandler();
1130  0274 cd0000        	call	_MAIN_ADC2_IRQHandler
1132                     ; 262   }
1135  0277 85            	popw	x
1136  0278 bf00          	ldw	c_y,x
1137  027a 320002        	pop	c_y+2
1138  027d 85            	popw	x
1139  027e bf00          	ldw	c_x,x
1140  0280 320002        	pop	c_x+2
1141  0283 80            	iret
1165                     ; 269    INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
1165                     ; 270    {
1166                     	switch	.text
1167  0284               f_TIM4_UPD_OVF_IRQHandler:
1169  0284 3b0002        	push	c_x+2
1170  0287 be00          	ldw	x,c_x
1171  0289 89            	pushw	x
1172  028a 3b0002        	push	c_y+2
1173  028d be00          	ldw	x,c_y
1174  028f 89            	pushw	x
1177                     ; 271      MAIN_TIM4_UPD_OVF_IRQHandler();
1179  0290 cd0000        	call	_MAIN_TIM4_UPD_OVF_IRQHandler
1181                     ; 272    }
1184  0293 85            	popw	x
1185  0294 bf00          	ldw	c_y,x
1186  0296 320002        	pop	c_y+2
1187  0299 85            	popw	x
1188  029a bf00          	ldw	c_x,x
1189  029c 320002        	pop	c_x+2
1190  029f 80            	iret
1214                     ; 279 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1214                     ; 280 {
1215                     	switch	.text
1216  02a0               f_EEPROM_EEC_IRQHandler:
1218  02a0 3b0002        	push	c_x+2
1219  02a3 be00          	ldw	x,c_x
1220  02a5 89            	pushw	x
1221  02a6 3b0002        	push	c_y+2
1222  02a9 be00          	ldw	x,c_y
1223  02ab 89            	pushw	x
1226                     ; 281   MAIN_EEPROM_EEC_IRQHandler();
1228  02ac cd0000        	call	_MAIN_EEPROM_EEC_IRQHandler
1230                     ; 282 }
1233  02af 85            	popw	x
1234  02b0 bf00          	ldw	c_y,x
1235  02b2 320002        	pop	c_y+2
1236  02b5 85            	popw	x
1237  02b6 bf00          	ldw	c_x,x
1238  02b8 320002        	pop	c_x+2
1239  02bb 80            	iret
1251                     	xdef	f_EEPROM_EEC_IRQHandler
1252                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1253                     	xdef	f_ADC2_IRQHandler
1254                     	xdef	f_UART3_RX_IRQHandler
1255                     	xdef	f_UART3_TX_IRQHandler
1256                     	xdef	f_I2C_IRQHandler
1257                     	xdef	f_UART1_RX_IRQHandler
1258                     	xdef	f_UART1_TX_IRQHandler
1259                     	xdef	f_TIM3_CAP_COM_IRQHandler
1260                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1261                     	xdef	f_TIM2_CAP_COM_IRQHandler
1262                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1263                     	xdef	f_TIM1_CAP_COM_IRQHandler
1264                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1265                     	xdef	f_SPI_IRQHandler
1266                     	xdef	f_EXTI_PORTE_IRQHandler
1267                     	xdef	f_EXTI_PORTD_IRQHandler
1268                     	xdef	f_EXTI_PORTC_IRQHandler
1269                     	xdef	f_EXTI_PORTB_IRQHandler
1270                     	xdef	f_EXTI_PORTA_IRQHandler
1271                     	xdef	f_CLK_IRQHandler
1272                     	xdef	f_AWU_IRQHandler
1273                     	xdef	f_TLI_IRQHandler
1274                     	xdef	f_TRAP_IRQHandler
1275                     	xdef	f_NonHandledInterrupt
1276                     	xref	_MAIN_UART1_RX_IRQHandler
1277                     	xref	_MAIN_EEPROM_EEC_IRQHandler
1278                     	xref	_MAIN_TIM4_UPD_OVF_IRQHandler
1279                     	xref	_MAIN_ADC2_IRQHandler
1280                     	xref	_MAIN_UART3_TX_IRQHandler
1281                     	xref	_MAIN_UART3_RX_IRQHandler
1282                     	xref	_MAIN_I2C_IRQHandler
1283                     	xref	_MAIN_UART1_TX_IRQHandler
1284                     	xref	_MAIN_TIM3_CAP_COM_IRQHandler
1285                     	xref	_MAIN_TIM3_UPD_OVF_BRK_IRQHandler
1286                     	xref	_MAIN_TIM2_CAP_COM_IRQHandler
1287                     	xref	_MAIN_TIM2_UPD_OVF_BRK_IRQHandler
1288                     	xref	_MAIN_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1289                     	xref	_MAIN_TIM1_CAP_COM_IRQHandler
1290                     	xref	_MAIN_SPI_IRQHandler
1291                     	xref	_MAIN_EXTI_PORTE_IRQHandler
1292                     	xref	_MAIN_EXTI_PORTD_IRQHandler
1293                     	xref	_MAIN_EXTI_PORTC_IRQHandler
1294                     	xref	_MAIN_EXTI_PORTB_IRQHandler
1295                     	xref	_MAIN_EXTI_PORTA_IRQHandler
1296                     	xref	_MAIN_CLK_IRQHandler
1297                     	xref	_MAIN_AWU_IRQHandler
1298                     	xref	_MAIN_TLI_IRQHandler
1299                     	xref	_MAIN_TRAP_IRQHandler
1300                     	xref	_MAIN_NonHandledInterrupt
1301                     	xref.b	c_x
1302                     	xref.b	c_y
1321                     	end
