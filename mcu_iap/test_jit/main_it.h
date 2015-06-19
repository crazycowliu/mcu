/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_IT_H
#define __MAIN_IT_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"

 void MAIN_NonHandledInterrupt(void);
 
 void MAIN_TRAP_IRQHandler(void); /* TRAP */
 void MAIN_TLI_IRQHandler(void); /* TLI */
 void MAIN_AWU_IRQHandler(void); /* AWU */
 void MAIN_CLK_IRQHandler(void); /* CLOCK */
 void MAIN_EXTI_PORTA_IRQHandler(void); /* EXTI PORTA */
 void MAIN_EXTI_PORTB_IRQHandler(void); /* EXTI PORTB */
 void MAIN_EXTI_PORTC_IRQHandler(void); /* EXTI PORTC */
 void MAIN_EXTI_PORTD_IRQHandler(void); /* EXTI PORTD */
 void MAIN_EXTI_PORTE_IRQHandler(void); /* EXTI PORTE */

#if defined (STM8S208)
 void CAN_RX_IRQHandler(void); /* CAN RX */
 void CAN_TX_IRQHandler(void); /* CAN TX/ER/SC */
#endif /* (STM8S208) || (STM8AF52Ax) */

 void MAIN_SPI_IRQHandler(void); /* SPI */
 void MAIN_TIM1_CAP_COM_IRQHandler(void); /* TIM1 CAP/COM */
 void MAIN_TIM1_UPD_OVF_TRG_BRK_IRQHandler(void); /* TIM1 UPD/OVF/TRG/BRK */

 void MAIN_TIM2_UPD_OVF_BRK_IRQHandler(void); /* TIM2 UPD/OVF/BRK */
 void MAIN_TIM2_CAP_COM_IRQHandler(void); /* TIM2 CAP/COM */

 void MAIN_TIM3_UPD_OVF_BRK_IRQHandler(void); /* TIM3 UPD/OVF/BRK */
 void MAIN_TIM3_CAP_COM_IRQHandler(void); /* TIM3 CAP/COM */

 void MAIN_UART1_TX_IRQHandler(void); /* UART1 TX */
// void MAIN_UART1_RX_IRQHandler(void); /* UART1 RX */

 void MAIN_I2C_IRQHandler(void); /* I2C */

 void MAIN_UART3_RX_IRQHandler(void); /* UART3 RX */
 void MAIN_UART3_TX_IRQHandler(void); /* UART3 TX */

 void MAIN_ADC2_IRQHandler(void); /* ADC2 */

 void MAIN_TIM4_UPD_OVF_IRQHandler(void); /* TIM4 UPD/OVF */

 void MAIN_EEPROM_EEC_IRQHandler(void); /* EEPROM ECC CORRECTION */

#endif /* __MAIN_IT_H */


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
