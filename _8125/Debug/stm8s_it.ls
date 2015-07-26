   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 56 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  44                     ; 57 {
  45                     	switch	.text
  46  0000               f_NonHandledInterrupt:
  50                     ; 61 }
  53  0000 80            	iret
  75                     ; 69 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  75                     ; 70 {
  76                     	switch	.text
  77  0001               f_TRAP_IRQHandler:
  81                     ; 74 }
  84  0001 80            	iret
 106                     ; 81 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 106                     ; 82 
 106                     ; 83 {
 107                     	switch	.text
 108  0002               f_TLI_IRQHandler:
 112                     ; 87 }
 115  0002 80            	iret
 137                     ; 94 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 137                     ; 95 {
 138                     	switch	.text
 139  0003               f_AWU_IRQHandler:
 143                     ; 99 }
 146  0003 80            	iret
 168                     ; 106 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 168                     ; 107 {
 169                     	switch	.text
 170  0004               f_CLK_IRQHandler:
 174                     ; 111 }
 177  0004 80            	iret
 200                     ; 118 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 200                     ; 119 {
 201                     	switch	.text
 202  0005               f_EXTI_PORTA_IRQHandler:
 206                     ; 123 }
 209  0005 80            	iret
 232                     ; 130 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 232                     ; 131 {
 233                     	switch	.text
 234  0006               f_EXTI_PORTB_IRQHandler:
 238                     ; 135 }
 241  0006 80            	iret
 264                     ; 142 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 264                     ; 143 {
 265                     	switch	.text
 266  0007               f_EXTI_PORTC_IRQHandler:
 270                     ; 147 }
 273  0007 80            	iret
 296                     ; 154 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 296                     ; 155 {
 297                     	switch	.text
 298  0008               f_EXTI_PORTD_IRQHandler:
 302                     ; 159 }
 305  0008 80            	iret
 328                     ; 166 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 328                     ; 167 {
 329                     	switch	.text
 330  0009               f_EXTI_PORTE_IRQHandler:
 334                     ; 171 }
 337  0009 80            	iret
 359                     ; 218 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 359                     ; 219 {
 360                     	switch	.text
 361  000a               f_SPI_IRQHandler:
 365                     ; 223 }
 368  000a 80            	iret
 391                     ; 230 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 391                     ; 231 {
 392                     	switch	.text
 393  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 397                     ; 235 }
 400  000b 80            	iret
 423                     ; 242 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 423                     ; 243 {
 424                     	switch	.text
 425  000c               f_TIM1_CAP_COM_IRQHandler:
 429                     ; 247 }
 432  000c 80            	iret
 455                     ; 280  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 455                     ; 281  {
 456                     	switch	.text
 457  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 461                     ; 285  }
 464  000d 80            	iret
 487                     ; 292  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 487                     ; 293  {
 488                     	switch	.text
 489  000e               f_TIM2_CAP_COM_IRQHandler:
 493                     ; 297  }
 496  000e 80            	iret
 519                     ; 307  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 519                     ; 308  {
 520                     	switch	.text
 521  000f               f_TIM3_UPD_OVF_BRK_IRQHandler:
 525                     ; 312  }
 528  000f 80            	iret
 551                     ; 319  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 551                     ; 320  {
 552                     	switch	.text
 553  0010               f_TIM3_CAP_COM_IRQHandler:
 557                     ; 324  }
 560  0010 80            	iret
 583                     ; 334  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 583                     ; 335  {
 584                     	switch	.text
 585  0011               f_UART1_TX_IRQHandler:
 589                     ; 339  }
 592  0011 80            	iret
 616                     ; 346  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 616                     ; 347  {
 617                     	switch	.text
 618  0012               f_UART1_RX_IRQHandler:
 620  0012 3b0002        	push	c_x+2
 621  0015 be00          	ldw	x,c_x
 622  0017 89            	pushw	x
 623  0018 3b0002        	push	c_y+2
 624  001b be00          	ldw	x,c_y
 625  001d 89            	pushw	x
 628                     ; 351      UART1_RX_IRQHandler_Impl();
 630  001e cd0000        	call	_UART1_RX_IRQHandler_Impl
 632                     ; 352  }
 635  0021 85            	popw	x
 636  0022 bf00          	ldw	c_y,x
 637  0024 320002        	pop	c_y+2
 638  0027 85            	popw	x
 639  0028 bf00          	ldw	c_x,x
 640  002a 320002        	pop	c_x+2
 641  002d 80            	iret
 663                     ; 386 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 663                     ; 387 {
 664                     	switch	.text
 665  002e               f_I2C_IRQHandler:
 669                     ; 391 }
 672  002e 80            	iret
 695                     ; 425  INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
 695                     ; 426  {
 696                     	switch	.text
 697  002f               f_UART3_TX_IRQHandler:
 701                     ; 430  }
 704  002f 80            	iret
 727                     ; 437  INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
 727                     ; 438  {
 728                     	switch	.text
 729  0030               f_UART3_RX_IRQHandler:
 733                     ; 442  }
 736  0030 80            	iret
 758                     ; 451  INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
 758                     ; 452  {
 759                     	switch	.text
 760  0031               f_ADC2_IRQHandler:
 764                     ; 456  }
 767  0031 80            	iret
 790                     ; 491  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 790                     ; 492  {
 791                     	switch	.text
 792  0032               f_TIM4_UPD_OVF_IRQHandler:
 796                     ; 496  }
 799  0032 80            	iret
 822                     ; 504 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 822                     ; 505 {
 823                     	switch	.text
 824  0033               f_EEPROM_EEC_IRQHandler:
 828                     ; 509 }
 831  0033 80            	iret
 843                     	xref	_UART1_RX_IRQHandler_Impl
 844                     	xdef	f_EEPROM_EEC_IRQHandler
 845                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 846                     	xdef	f_ADC2_IRQHandler
 847                     	xdef	f_UART3_TX_IRQHandler
 848                     	xdef	f_UART3_RX_IRQHandler
 849                     	xdef	f_I2C_IRQHandler
 850                     	xdef	f_UART1_RX_IRQHandler
 851                     	xdef	f_UART1_TX_IRQHandler
 852                     	xdef	f_TIM3_CAP_COM_IRQHandler
 853                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 854                     	xdef	f_TIM2_CAP_COM_IRQHandler
 855                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 856                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 857                     	xdef	f_TIM1_CAP_COM_IRQHandler
 858                     	xdef	f_SPI_IRQHandler
 859                     	xdef	f_EXTI_PORTE_IRQHandler
 860                     	xdef	f_EXTI_PORTD_IRQHandler
 861                     	xdef	f_EXTI_PORTC_IRQHandler
 862                     	xdef	f_EXTI_PORTB_IRQHandler
 863                     	xdef	f_EXTI_PORTA_IRQHandler
 864                     	xdef	f_CLK_IRQHandler
 865                     	xdef	f_AWU_IRQHandler
 866                     	xdef	f_TLI_IRQHandler
 867                     	xdef	f_TRAP_IRQHandler
 868                     	xdef	f_NonHandledInterrupt
 869                     	xref.b	c_x
 870                     	xref.b	c_y
 889                     	end
