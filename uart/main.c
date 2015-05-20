/**
  ******************************************************************************
  * @file    Project/main.c 
  * @author  MCD Application Team
  * @version V2.2.0
  * @date    30-September-2014
  * @brief   Main program body
   ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */ 


/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "stdio.h"

#include "stm8s207R8.h"
#include "prohead.h"


#define UNIQUE_ID_START_ADDR 0x48CD

u8 i;
s16 temp;
u8 t;
u8 *pUniqueId;
char buf[128];

/* Private defines -----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/*
char getchar(void) {
	char c = 0;
	while(UART3_GetFlagStatus(UART3_FLAG_RXNE) == RESET);
	c = UART3_ReceiveData8();
	
	//while(UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
	//c = UART1_ReceiveData8();
	return c;
}
*/

char putchar(char c) {
	UART3_SendData8(c);
	while(UART3_GetFlagStatus(UART3_FLAG_TXE) == RESET);
	
	//UART1_SendData8(c);
	//while(UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
	
	return c;
}

void Driver_UARTON(void)
{
		//UART
		#define BAUDRATE 115200
		enum
		{	
				BAUDRATE_HSI1_BRR2 = ((2000000/BAUDRATE)/4096)|((2000000/BAUDRATE)%16),
				BAUDRATE_HSI1_BRR1 = (2000000/BAUDRATE)/16
		};
		//开UART1时钟
		CLK_PCKENR1 |= SETBIT2;
		//禁止收发
		UART1_CR2 &= CLRBIT2;
		UART1_CR2 &= CLRBIT3;
		//波特率设定 主时钟为HSI-16M 
		UART1_BRR2 = BAUDRATE_HSI1_BRR2; 
		UART1_BRR1 = BAUDRATE_HSI1_BRR1;
		//8位数据位 1位起始位 1位停止位 无校验
		UART1_CR1 &= CLRBIT4;
		UART1_CR3 &= CLRBIT4;
		UART1_CR3 &= CLRBIT5;
		UART1_CR1 &= CLRBIT2;
		//关闭发送中断
		UART1_CR2 &= CLRBIT6;
		//允许接收中断
	  UART1_CR2 |= SETBIT5;
		//使能UART
		UART1_CR1 &= CLRBIT5;
		//启动收发
		UART1_CR2 |= SETBIT2;
		UART1_CR2 |= SETBIT3;
}

void Driver_UARTSendByByter(u8 Data)
{
		while((UART1_SR&CHSBIT7)==0x00);
		UART1_DR = Data;
		
		printf("send '%c'\n", Data);
}

void init_UART1_lib(void) {

		UART1_Init(
		115200,
		UART1_WORDLENGTH_8D,
		UART1_STOPBITS_1,
		UART1_PARITY_NO,
		UART1_SYNCMODE_CLOCK_DISABLE,
		UART1_MODE_TXRX_ENABLE);
		UART1_Cmd(ENABLE);
		
		UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);
		UART1_Cmd(ENABLE);
	
		//enable interrupt
		rim();
		Driver_UARTSendByByter('A');
}

void init_UART1(void) {
	_asm("rim");
	Driver_UARTON();
	Driver_UARTSendByByter('A');
}

void main(void)
{
	//GPIO_Init(GPIOG, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_HIGH_SLOW);
	
	//used for printf
	UART3_Init(
					115200,
					UART3_WORDLENGTH_8D,
					UART3_STOPBITS_1,
					UART3_PARITY_NO,
					UART3_MODE_TXRX_ENABLE);

  //UART3_ClearITPendingBit(UART1_IT_RXNE);
	
	//used for transfer
	/*

	*/
	
	/*
	printf("My id is: \n");
	pUniqueId = (u8 *)UNIQUE_ID_START_ADDR;
	for (i = 0; i < 12; i++) {
	  temp = (int) *(pUniqueId++);
		printf("0x%0.2x ", temp);
	}
	printf("\n");
	printf("Input your content: \n");
	*/
	
  //init_UART1();
	
	//init_UART1_lib();

  Driver_UARTSendByByter('A');

	while (1){
		
		//Driver_UARTSendByByter('A');

	  //t = getchar();
		//printf("input is %c\n", t);
		
		//gets(buf);
		//printf("input is %s\n", buf);
		
		//gets(buf);
		//printf("input is %s\n", buf);
	}
}
	
#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
