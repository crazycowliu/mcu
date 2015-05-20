/* BASIC INTERRUPT VECTORS TABLE FOR STM8 devices
 * Copyright (c) 2014 STMicroelectronics
 */
#include "main_it.h"
#include "stdio.h" 

#define MAIN_INTERRUPT_HANDLER(a,b) void a(void)
#define MAIN_INTERRUPT_HANDLER_TRAP(a) void a(void)

extern char buf[128];
extern u8 rx_idx;
extern u8 pkg_count;

/* TRAP - Software interrupt */
MAIN_INTERRUPT_HANDLER_TRAP(MAIN_TRAP_IRQHandler)
{
}

/* irq0 - External Top Level interrupt (TLI) */
MAIN_INTERRUPT_HANDLER(MAIN_TLI_IRQHandler, 0)
{
}

/* irq1 - Auto Wake Up from Halt interrupt */
 void MAIN_AWU_IRQHandler(void)
{
}

/* irq2 - Clock Controller interrupt */
 void MAIN_CLK_IRQHandler(void)
{
}

/* irq3 - External interrupt 0 (GPIOA) */
 void MAIN_EXTI_PORTA_IRQHandler(void)
{
}

/* irq4 - External interrupt 1 (GPIOB) */
 void MAIN_EXTI_PORTB_IRQHandler(void)
{
}

/* irq5 - External interrupt 2 (GPIOC) */
 void MAIN_EXTI_PORTC_IRQHandler(void)
{
}

/* irq6 - External interrupt 3 (GPIOD) */
 void MAIN_EXTI_PORTD_IRQHandler(void)
{
}

/* irq7 - External interrupt 4 (GPIOE) */
 void MAIN_EXTI_PORTE_IRQHandler(void)
{
}

#if defined (STM8S208)
/**
  * @brief CAN RX Interrupt routine.
  * @param  None
  * @retval None
  */
 void MAIN_CAN_RX_IRQHandler(void)
 {
 }

/**
  * @brief CAN TX Interrupt routine.
  * @param  None
  * @retval None
  */
 void MAIN_CAN_TX_IRQHandler(void)
 {
 }
#endif /* (STM8S208) */

/* irq10 - SPI End of transfer interrupt */
 void MAIN_SPI_IRQHandler(void)
{
}

/* irq11 - TIM1 Update/Overflow/Trigger/Break interrupt */
 void MAIN_TIM1_UPD_OVF_TRG_BRK_IRQHandler(void)
{
}

/* irq12 - TIM1 Capture/Compare interrupt */
 void MAIN_TIM1_CAP_COM_IRQHandler(void)
{
}

/* irq13 - TIM2 Update/Overflow/Break interrupt  */
 void MAIN_TIM2_UPD_OVF_BRK_IRQHandler(void)
{
}
/* irq14 - TIM2 Capture/Compare interrupt */
 void MAIN_TIM2_CAP_COM_IRQHandler(void)
{
}

 /* irq15 - TIM3 Update/Overflow/Break interrupt */
 void MAIN_TIM3_UPD_OVF_BRK_IRQHandler(void){

 }

 /* irq16 - TIM3 Capture/Compare interrupt */
 void MAIN_TIM3_CAP_COM_IRQHandler(void){

 }

/* irq17 - UART1 Tx complete interrupt */
 void MAIN_UART1_TX_IRQHandler(void)
{

}

// /* irq18 - UART1 Rx interrupt */
//  void MAIN_UART1_RX_IRQHandler(void)
// {
//     /* In order to detect unexpected events during development,
//      it is recommended to set a breakpoint on the following instruction.
//   */
//   char c = 0;
//   while(UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
//   c = UART1_ReceiveData8();
//   //UART1_ClearITPendingBit(UART1_IT_RXNE);
//
//   if (pkg_count == 0) {
//     buf[rx_idx] = c;
//     rx_idx++;
//
//     if (rx_idx == 128) {
//       rx_idx = 0;
//     }
//
//     //putchar(c);
//   }
// }

/* irq19 - I2C interrupt */
 void MAIN_I2C_IRQHandler(void)
{
}

 /* irq20 - UART3 Tx interrupt */
 void MAIN_UART3_TX_IRQHandler(void)
{
}

 /* irq21 - UART3 Rx interrupt */
 void MAIN_UART3_RX_IRQHandler(void)
{
}

 /* irq22 - ADC2 end of conversion/Analog watchdog interrupts */
  void MAIN_ADC2_IRQHandler(void)
 {
 }

/* irq23 - TIM4 Update/Overflow interrupt */
 void MAIN_TIM4_UPD_OVF_IRQHandler(void)
{
}


 /*irq24 - Eeprom EEC Interrupt routine. */
 void MAIN_EEPROM_EEC_IRQHandler(void)
{
}

/**
 * irq25
 * irq26
 * irq27
 * irq28
 * irq29
 */
 void MAIN_NonHandledInterrupt(void)
{
}


/******************* (C) COPYRIGHT 2014 STMicroelectronics *****END OF FILE****/
