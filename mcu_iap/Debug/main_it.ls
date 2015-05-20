   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 15 MAIN_INTERRUPT_HANDLER_TRAP(MAIN_TRAP_IRQHandler)
  44                     ; 16 {
  46                     	switch	.text
  47  0000               _MAIN_TRAP_IRQHandler:
  51                     ; 17 }
  54  0000 81            	ret
  78                     ; 20 MAIN_INTERRUPT_HANDLER(MAIN_TLI_IRQHandler, 0)
  78                     ; 21 {
  79                     	switch	.text
  80  0001               _MAIN_TLI_IRQHandler:
  84                     ; 22 }
  87  0001 81            	ret
 111                     ; 25  void MAIN_AWU_IRQHandler(void)
 111                     ; 26 {
 112                     	switch	.text
 113  0002               _MAIN_AWU_IRQHandler:
 117                     ; 27 }
 120  0002 81            	ret
 144                     ; 30  void MAIN_CLK_IRQHandler(void)
 144                     ; 31 {
 145                     	switch	.text
 146  0003               _MAIN_CLK_IRQHandler:
 150                     ; 32 }
 153  0003 81            	ret
 177                     ; 35  void MAIN_EXTI_PORTA_IRQHandler(void)
 177                     ; 36 {
 178                     	switch	.text
 179  0004               _MAIN_EXTI_PORTA_IRQHandler:
 183                     ; 37 }
 186  0004 81            	ret
 210                     ; 40  void MAIN_EXTI_PORTB_IRQHandler(void)
 210                     ; 41 {
 211                     	switch	.text
 212  0005               _MAIN_EXTI_PORTB_IRQHandler:
 216                     ; 42 }
 219  0005 81            	ret
 243                     ; 45  void MAIN_EXTI_PORTC_IRQHandler(void)
 243                     ; 46 {
 244                     	switch	.text
 245  0006               _MAIN_EXTI_PORTC_IRQHandler:
 249                     ; 47 }
 252  0006 81            	ret
 276                     ; 50  void MAIN_EXTI_PORTD_IRQHandler(void)
 276                     ; 51 {
 277                     	switch	.text
 278  0007               _MAIN_EXTI_PORTD_IRQHandler:
 282                     ; 52 }
 285  0007 81            	ret
 309                     ; 55  void MAIN_EXTI_PORTE_IRQHandler(void)
 309                     ; 56 {
 310                     	switch	.text
 311  0008               _MAIN_EXTI_PORTE_IRQHandler:
 315                     ; 57 }
 318  0008 81            	ret
 342                     ; 80  void MAIN_SPI_IRQHandler(void)
 342                     ; 81 {
 343                     	switch	.text
 344  0009               _MAIN_SPI_IRQHandler:
 348                     ; 82 }
 351  0009 81            	ret
 375                     ; 85  void MAIN_TIM1_UPD_OVF_TRG_BRK_IRQHandler(void)
 375                     ; 86 {
 376                     	switch	.text
 377  000a               _MAIN_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 381                     ; 87 }
 384  000a 81            	ret
 408                     ; 90  void MAIN_TIM1_CAP_COM_IRQHandler(void)
 408                     ; 91 {
 409                     	switch	.text
 410  000b               _MAIN_TIM1_CAP_COM_IRQHandler:
 414                     ; 92 }
 417  000b 81            	ret
 441                     ; 95  void MAIN_TIM2_UPD_OVF_BRK_IRQHandler(void)
 441                     ; 96 {
 442                     	switch	.text
 443  000c               _MAIN_TIM2_UPD_OVF_BRK_IRQHandler:
 447                     ; 97 }
 450  000c 81            	ret
 474                     ; 99  void MAIN_TIM2_CAP_COM_IRQHandler(void)
 474                     ; 100 {
 475                     	switch	.text
 476  000d               _MAIN_TIM2_CAP_COM_IRQHandler:
 480                     ; 101 }
 483  000d 81            	ret
 507                     ; 104  void MAIN_TIM3_UPD_OVF_BRK_IRQHandler(void){
 508                     	switch	.text
 509  000e               _MAIN_TIM3_UPD_OVF_BRK_IRQHandler:
 513                     ; 106  }
 516  000e 81            	ret
 540                     ; 109  void MAIN_TIM3_CAP_COM_IRQHandler(void){
 541                     	switch	.text
 542  000f               _MAIN_TIM3_CAP_COM_IRQHandler:
 546                     ; 111  }
 549  000f 81            	ret
 573                     ; 114  void MAIN_UART1_TX_IRQHandler(void)
 573                     ; 115 {
 574                     	switch	.text
 575  0010               _MAIN_UART1_TX_IRQHandler:
 579                     ; 117 }
 582  0010 81            	ret
 606                     ; 143  void MAIN_I2C_IRQHandler(void)
 606                     ; 144 {
 607                     	switch	.text
 608  0011               _MAIN_I2C_IRQHandler:
 612                     ; 145 }
 615  0011 81            	ret
 639                     ; 148  void MAIN_UART3_TX_IRQHandler(void)
 639                     ; 149 {
 640                     	switch	.text
 641  0012               _MAIN_UART3_TX_IRQHandler:
 645                     ; 150 }
 648  0012 81            	ret
 672                     ; 153  void MAIN_UART3_RX_IRQHandler(void)
 672                     ; 154 {
 673                     	switch	.text
 674  0013               _MAIN_UART3_RX_IRQHandler:
 678                     ; 155 }
 681  0013 81            	ret
 705                     ; 158   void MAIN_ADC2_IRQHandler(void)
 705                     ; 159  {
 706                     	switch	.text
 707  0014               _MAIN_ADC2_IRQHandler:
 711                     ; 160  }
 714  0014 81            	ret
 738                     ; 163  void MAIN_TIM4_UPD_OVF_IRQHandler(void)
 738                     ; 164 {
 739                     	switch	.text
 740  0015               _MAIN_TIM4_UPD_OVF_IRQHandler:
 744                     ; 165 }
 747  0015 81            	ret
 771                     ; 169  void MAIN_EEPROM_EEC_IRQHandler(void)
 771                     ; 170 {
 772                     	switch	.text
 773  0016               _MAIN_EEPROM_EEC_IRQHandler:
 777                     ; 171 }
 780  0016 81            	ret
 804                     ; 180  void MAIN_NonHandledInterrupt(void)
 804                     ; 181 {
 805                     	switch	.text
 806  0017               _MAIN_NonHandledInterrupt:
 810                     ; 182 }
 813  0017 81            	ret
 826                     	xdef	_MAIN_EEPROM_EEC_IRQHandler
 827                     	xdef	_MAIN_TIM4_UPD_OVF_IRQHandler
 828                     	xdef	_MAIN_ADC2_IRQHandler
 829                     	xdef	_MAIN_UART3_TX_IRQHandler
 830                     	xdef	_MAIN_UART3_RX_IRQHandler
 831                     	xdef	_MAIN_I2C_IRQHandler
 832                     	xdef	_MAIN_UART1_TX_IRQHandler
 833                     	xdef	_MAIN_TIM3_CAP_COM_IRQHandler
 834                     	xdef	_MAIN_TIM3_UPD_OVF_BRK_IRQHandler
 835                     	xdef	_MAIN_TIM2_CAP_COM_IRQHandler
 836                     	xdef	_MAIN_TIM2_UPD_OVF_BRK_IRQHandler
 837                     	xdef	_MAIN_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 838                     	xdef	_MAIN_TIM1_CAP_COM_IRQHandler
 839                     	xdef	_MAIN_SPI_IRQHandler
 840                     	xdef	_MAIN_EXTI_PORTE_IRQHandler
 841                     	xdef	_MAIN_EXTI_PORTD_IRQHandler
 842                     	xdef	_MAIN_EXTI_PORTC_IRQHandler
 843                     	xdef	_MAIN_EXTI_PORTB_IRQHandler
 844                     	xdef	_MAIN_EXTI_PORTA_IRQHandler
 845                     	xdef	_MAIN_CLK_IRQHandler
 846                     	xdef	_MAIN_AWU_IRQHandler
 847                     	xdef	_MAIN_TLI_IRQHandler
 848                     	xdef	_MAIN_TRAP_IRQHandler
 849                     	xdef	_MAIN_NonHandledInterrupt
 868                     	end
