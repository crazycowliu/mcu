#include "main_it.h"

void MAIN_UART1_RX_IRQHandler(void);

/**
 * NOTE!!!!!!: For IAP, you CAN NOT update any statement in any handler.!!!!!!
 * And put this at MAIN_USER_RESET_ADDR, before main.o
 */
#ifdef _COSMIC_
/**
  * @brief Dummy Interrupt routine
  * @par Parameters:
  * None
  * @retval
  * None
*/
INTERRUPT_HANDLER(NonHandledInterrupt, 25)
{
  MAIN_NonHandledInterrupt();
}
#endif /*_COSMIC_*/

/**
  * @brief TRAP Interrupt routine
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
{
  MAIN_TRAP_IRQHandler();
}

/**
  * @brief Top Level Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TLI_IRQHandler, 0)
{
  MAIN_TLI_IRQHandler();
}

/**
  * @brief Auto Wake Up Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(AWU_IRQHandler, 1)
{
  MAIN_AWU_IRQHandler();
}

/**
  * @brief Clock Controller Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(CLK_IRQHandler, 2)
{
  MAIN_CLK_IRQHandler();
}

/**
  * @brief External Interrupt PORTA Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
{
  MAIN_EXTI_PORTA_IRQHandler();
}

/**
  * @brief External Interrupt PORTB Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
{
  MAIN_EXTI_PORTB_IRQHandler();
}

/**
  * @brief External Interrupt PORTC Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
{
  MAIN_EXTI_PORTC_IRQHandler();
}

/**
  * @brief External Interrupt PORTD Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
{
  MAIN_EXTI_PORTD_IRQHandler();
}

/**
  * @brief External Interrupt PORTE Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
{
  MAIN_EXTI_PORTE_IRQHandler();
}

#if defined (STM8S208)
/**
  * @brief CAN RX Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
 {
   MAIN_CAN_RX_IRQHandler();
 }

/**
  * @brief CAN TX Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
 {
   MAIN_CAN_TX_IRQHandler();
 }
#endif /* (STM8S208) */

/**
  * @brief SPI Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(SPI_IRQHandler, 10)
{
  MAIN_SPI_IRQHandler();
}

/**
  * @brief Timer1 Update/Overflow/Trigger/Break Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
{
  MAIN_TIM1_UPD_OVF_TRG_BRK_IRQHandler();
}

/**
  * @brief Timer1 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
{
  MAIN_TIM1_CAP_COM_IRQHandler();
}

/**
  * @brief Timer2 Update/Overflow/Break Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 {
   MAIN_TIM2_UPD_OVF_BRK_IRQHandler();
 }

/**
  * @brief Timer2 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 {
   MAIN_TIM2_CAP_COM_IRQHandler();
 }

 /**
   * @brief Timer3 Update/Overflow/Break Interrupt routine.
   * @param  None
   * @retval None
   */
  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
  {
    MAIN_TIM3_UPD_OVF_BRK_IRQHandler();
  }

 /**
   * @brief Timer3 Capture/Compare Interrupt routine.
   * @param  None
   * @retval None
   */
  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
  {
    MAIN_TIM3_CAP_COM_IRQHandler();
  }

/**
  * @brief UART1 TX Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 {
   MAIN_UART1_TX_IRQHandler();
 }

/**
  * @brief UART1 RX Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 {
   MAIN_UART1_RX_IRQHandler();
 }

/**
  * @brief I2C Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(I2C_IRQHandler, 19)
{
  MAIN_I2C_IRQHandler();
}

/**
  * @brief UART3 TX interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
 {
   MAIN_UART3_TX_IRQHandler();
 }

/**
  * @brief UART3 RX interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
 {
   MAIN_UART3_RX_IRQHandler();
 }
 /**
   * @brief ADC2 interrupt routine.
   * @param  None
   * @retval None
   */
  INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
  {
    MAIN_ADC2_IRQHandler();
  }

  /**
    * @brief Timer4 Update/Overflow Interrupt routine.
    * @param  None
    * @retval None
    */
   INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
   {
     MAIN_TIM4_UPD_OVF_IRQHandler();
   }

/**
  * @brief Eeprom EEC Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
{
  MAIN_EEPROM_EEC_IRQHandler();
}
