/**
 * STM8 study board
 * UART3: print debug info
 *   PD5: TX-----connect to (USB2Serial)write
 *   PD6: RX-----connect to (USB2Serial)green
 * UART1: communication
 *   PA5: TX
 *   PA4: RX
 *
 */
/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "stdio.h"

#include "stm8s207R8.h"
#include "prohead.h"

#define UNIQUE_ID_START_ADDR 0x48CD

#define FREQ            2000000
#define UART1_BAUDRATE   115200
#define UART3_BAUDRATE   115200
//used for init UART1 non-lib way
enum
{
		BAUDRATE_HSI1_BRR2 = ((FREQ/UART1_BAUDRATE)/4096)|((FREQ/UART1_BAUDRATE)%16),
		BAUDRATE_HSI1_BRR1 = (FREQ/UART1_BAUDRATE)/16
};

u8 i;
s16 temp;
u8 t;
u8 *pUniqueId;
char buf[128];

void  delayms(u16 Time);
void  delay(u16 Time);

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

static void init_clock(void) {
  CLK_Source_TypeDef clk_source;
  uint32_t clk_freq;

  delayms(80);

	//default is 2M
  CLK_HSICmd(ENABLE);
  //set HSI to 16M
  //CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  //set HSI to 8M
  //CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);
  //default HSI is 2M ?

  //blow codes failed to enable HSE, but can not delete
  //CLK_HSECmd(ENABLE);
  //while((CLK->ECKR & (u8)CLK_FLAG_HSERDY) == RESET);

  clk_source = CLK_GetSYSCLKSource();
  clk_freq = CLK_GetClockFreq();
  //set break point here to check the clk_source and clk_freq
  nop();
}

void print_clock(void)
{
  CLK_Source_TypeDef clk_source;
  uint32_t clk_freq;
  clk_source = CLK_GetSYSCLKSource();
  clk_freq = CLK_GetClockFreq();
  printf("clk_source = %02X\r\n", clk_source);
  printf("clk_freq   = %02X\r\n", clk_freq);
  printf("clk_freq   = %X\r\n", clk_freq);	//clk_freq = 1E, 2000000 = 0x001E8480
  printf("clk_freq   = %d\r\n", clk_freq);	//clk_freq = 30
  printf("clk_freq   = %i\r\n", clk_freq);	//clk_freq = 30
  printf("clk_freq   = %l\r\n", clk_freq);	//clk_freq = ""
}

char putchar(char c) {
	UART3_SendData8(c);
	while(UART3_GetFlagStatus(UART3_FLAG_TXE) == RESET);
	
	//UART1_SendData8(c);
	//while(UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
	
	return c;
}

void Driver_UARTSendByByter(u8 Data)
{
		while((UART1_SR&CHSBIT7)==0x00);
		UART1_DR = Data;
		
		printf("send '%c'\n", Data);
}

/**
 * used for printf
 */
void init_UART3_lib(void) {
	UART3_Init(
					UART3_BAUDRATE,
					UART3_WORDLENGTH_8D,
					UART3_STOPBITS_1,
					UART3_PARITY_NO,
					UART3_MODE_TXRX_ENABLE);

  //UART3_ClearITPendingBit(UART1_IT_RXNE);
}

/**
 * Used for communication
 */
void init_UART1_lib(void) {

		UART1_Init(
		UART1_BAUDRATE,
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

/**
 * Used for communication
 */
void init_UART1(void) {
	_asm("rim");

	//��UART1ʱ��
	CLK_PCKENR1 |= SETBIT2;
	//��ֹ�շ�
	UART1_CR2 &= CLRBIT2;
	UART1_CR2 &= CLRBIT3;
	//�������趨 ��ʱ��ΪHSI-16M
	UART1_BRR2 = BAUDRATE_HSI1_BRR2;
	UART1_BRR1 = BAUDRATE_HSI1_BRR1;
	//8λ����λ 1λ��ʼλ 1λֹͣλ ��У��
	UART1_CR1 &= CLRBIT4;
	UART1_CR3 &= CLRBIT4;
	UART1_CR3 &= CLRBIT5;
	UART1_CR1 &= CLRBIT2;
	//�رշ����ж�
	UART1_CR2 &= CLRBIT6;
	//��������ж�
	UART1_CR2 |= SETBIT5;
	//ʹ��UART
	UART1_CR1 &= CLRBIT5;
	//�����շ�
	UART1_CR2 |= SETBIT2;
	UART1_CR2 |= SETBIT3;

	Driver_UARTSendByByter('A');
}

void main(void)
{
	//GPIO_Init(GPIOG, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_HIGH_SLOW);
	init_clock();
	init_UART3_lib();
	print_clock();
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
  //Driver_UARTSendByByter('A');

	while (1){
		//Driver_UARTSendByByter('A');
		delay(2000000);	//less than 1s
		putchar('.');
	}
}
	
void  delayms(u16 Time)
{
  u16 i,j;
  for(i = 0; i < Time; i++)
    for(j = 0; j < 340; j++)
    {
      nop();
    }
}

void delay(u16 Time)
{
  u16 i;
  for(i = 0; i < Time; i++);
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
