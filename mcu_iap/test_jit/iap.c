/* Private function prototypes -----------------------------------------------*/
//#define _COSMIC_
//#define RAM_EXECUTION (1)

#include "stm8s_flash.h"

/* block boundary - size*/
#define  BLOCK_BYTES          128

/*memory boundaries*/
#define  EEPROM_START         0x004000
#define  EEPROM_END           0x0047FF

//#define  UBC_OPTION_LOCATION  0x004801

#define  FLASH_START          0x008000
#define  FLASH_END            0x010000

/*Default start address for writing*/
#define START_ADD             EEPROM_START

u8 WriteBuffer(u32 DataAddress, u8 DataCount);

u8 WriteBufferFlash(u32 DataAddress, u8 DataCount, FLASH_MemType_TypeDef MemType);

void iap_init(void);

void iap_update(void);

void iap_finish(void);

void iap_updating(void);

void iap_UART1_DeInit(void);

void iap_UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength,
                UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity,
                UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode);

void iap_UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState);

void iap_UART1_Cmd(FunctionalState NewState);

void iap_UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT);

FlagStatus iap_UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG);
uint8_t iap_UART1_ReceiveData8(void);

void iap_print_buf(void);

uint32_t CLK_GetClockFreq(void);

void MAIN_UART1_RX_IRQHandler(void);

u8 pkg_count = 0xF1;	//@0x00
u8 rx_idx = 0xF2;		//@0x01
u32 code_addr;			//@0x02
char buf[128];			//@0x03

CONST uint8_t  iap_HSIDivFactor [4] = {1, 2, 4, 8};	//in const area

//set code section to FLASH_CODE placement
//#pragma section (FLASH_CODE)
/* Private functions ---------------------------------------------------------*/


/* irq18 - UART1 Rx interrupt */
 void MAIN_UART1_RX_IRQHandler(void)
{
    /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
  char c = 0;
  while(iap_UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
  c = iap_UART1_ReceiveData8();
  //UART1_ClearITPendingBit(UART1_IT_RXNE);

  c = 'C';
	c = 'D';
	c = 'E';

  if (pkg_count == 0) {
    buf[rx_idx] = c;
    rx_idx++;

    if (rx_idx == 128) {
      rx_idx = 0;
    }
    //check diff
    //putchar(c);
  }
}

FlagStatus iap_UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
{
  FlagStatus status = RESET;
  
  
  /* Check the status of the specified UART1 flag*/
  if (UART1_FLAG == UART1_FLAG_LBDF)
  {
    if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
    {
      /* UART1_FLAG is set*/
      status = SET;
    }
    else
    {
      /* UART1_FLAG is reset*/
      status = RESET;
    }
  }
  else if (UART1_FLAG == UART1_FLAG_SBK)
  {
    if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
    {
      /* UART1_FLAG is set*/
      status = SET;
    }
    else
    {
      /* UART1_FLAG is reset*/
      status = RESET;
    }
  }
  else
  {
    if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
    {
      /* UART1_FLAG is set*/
      status = SET;
    }
    else
    {
      /* UART1_FLAG is reset*/
      status = RESET;
    }
  }
  /* Return the UART1_FLAG status*/
  return status;
}
uint8_t iap_UART1_ReceiveData8(void)
{
  return ((uint8_t)UART1->DR);
}

char putchar(char c) {
	UART3_SendData8(c);
	while(UART3_GetFlagStatus(UART3_FLAG_TXE) == RESET);	
	return c;
}

void iap_print_buf(void) {
		int i = 0;
			if(buf[3] == 'u') {
				for (i = 0; i < buf[4] + 7; i++) {//or rx_idx
					//printf("%02X", p);
					putchar(buf[i]);
				}
			} else if (buf[3] == 'i' || buf[3] == 'f') {
				for (i = 0; i < 7; i++) {//or rx_idx
					//printf("%02X", p);
					putchar(buf[i]);
				}
			}
}

void iap_init_global(void) {
	pkg_count = 0xF3;
	rx_idx = 0xF4;
	code_addr = 0xF5F5F5F5;//immediate data
}
void iap_init_UART1_lib(void) {

  iap_UART1_DeInit();
  iap_UART1_Init(
    (u32)115200,
    UART1_WORDLENGTH_8D,
    UART1_STOPBITS_1,
    UART1_PARITY_NO,
    UART1_SYNCMODE_CLOCK_DISABLE,
    UART1_MODE_TXRX_ENABLE);
  iap_UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);
  //UART1_ClearITPendingBit(UART3_IT_RXNE);
  //UART1->SR &= (uint8_t)~(UART1_SR_RXNE);
  iap_UART1_Cmd(ENABLE);
	
	rim();
}

/*Write buffer function*/
u8 WriteBuffer(u32  DataAddress, u8 DataCount)
{
  //for Flash
  if (((u32)DataAddress >= FLASH_START) && (((u32)DataAddress + DataCount - 1) <= FLASH_END))
    return WriteBufferFlash(DataAddress, DataCount, FLASH_MEMTYPE_PROG);
    
  //for EEPROM
  if (((u32)DataAddress >= EEPROM_START) && (((u32)DataAddress + DataCount - 1) <= EEPROM_END))
    return WriteBufferFlash(DataAddress, DataCount, FLASH_MEMTYPE_DATA);
  
  //otherwise fail
  return 0;
}

/*Write buffer flash function*/
u8 WriteBufferFlash(u32 DataAddress, u8 DataCount, FLASH_MemType_TypeDef MemType)
{
  u32 Address = (u32) DataAddress;
  u8 * DataPointer = &buf[7];
  u32 Offset;
  
  //set offset according memory type
  if(MemType == FLASH_MEMTYPE_PROG)
    Offset = FLASH_START;
  else
    Offset = EEPROM_START;

  //program beginning bytes before words
  while((Address % 4) && (DataCount))
  {
    //RefreshWatchdog();
    FLASH_ProgramByte(Address, *DataPointer);
    Address++;
    DataPointer++;
    DataCount--;
  }
  
  //program beginning words before blocks
  while((Address % BLOCK_BYTES) && (DataCount >= 4))
  {
    //RefreshWatchdog();
    FLASH_ProgramWord(Address, *(u32*)DataPointer);
    Address    += 4;
    DataPointer+= 4;
    DataCount  -= 4;
  }
  
  //program blocks
  while(DataCount >= BLOCK_BYTES)
  {
    //RefreshWatchdog();
    FLASH_ProgramBlock((Address - Offset)/BLOCK_BYTES, MemType, FLASH_PROGRAMMODE_STANDARD, DataPointer);
    Address    += BLOCK_BYTES;
    DataPointer+= BLOCK_BYTES;    
    DataCount  -= BLOCK_BYTES;
  }
  
  //program remaining words (after blocks)
  while(DataCount >= 4)
  {
    //RefreshWatchdog();
    FLASH_ProgramWord(Address, *(u32*)DataPointer);
    Address    += 4;
    DataPointer+= 4;
    DataCount  -= 4;
  }
  
  //program remaining bytes (after words)
  while(DataCount)
  {
    //RefreshWatchdog();
    FLASH_ProgramByte(Address, *DataPointer);
    Address++;
    DataPointer++;
    DataCount--;
  }
  
  return 1;
}//WriteBufferFlash

void iap_init(void) {
	
	FLASH_Unlock(FLASH_MEMTYPE_PROG);
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
	code_addr = 0x009080;
	
	pkg_count = 0;
	while (1){
		iap_updating();
	}
}

/**
 * bbbu[L][AA][code]eee
 */
void iap_update(void) {
  u32  DataAddress = (buf[5] << 8 | buf[6]) & 0x0000FFFF;
	/*
  if (buf[5] == 0x95) {
		if(buf[6] == 0xC0 || buf[6] == 0xE0) {
			//ignore: 0x95C0
			return;
		}
	}
	
	if (buf[5] == 0x96) {
		if(buf[6] == 0x00 || buf[6] == 0x20) {
			//ignore: 0x95C0
			return;
		}
	}
	
	if (buf[5] == 0xB1) {
		if(buf[6] == 0xE0) {
					//ignore: 0x95C0
			return;
		}
	}
	
	if (buf[5] == 0x9E) {
		if(buf[6] == 0xC0) {
					//ignore: 0x95C0
			return;
		}
	}	
		if (buf[5] == 0x9F) {
			if(buf[6] == 0x00) {
					//ignore: 0x95C0
				return;
			}
		}
		
		if (DataAddress >= 0x9F00 && DataAddress <= 0xA145) {
			return;
		}
		
		if (DataAddress >= 0xA940 && DataAddress <= 0xA9CB) {
			return;
		}
	*/
	WriteBufferFlash(DataAddress, buf[4] - 3, FLASH_MEMTYPE_PROG);
}

void iap_finish(void) {
		disableInterrupts();
		// 跳转到指定FLASH空间地址			 
		_asm("LDW X,  SP ");
		_asm("LD  A,  $FF");
		_asm("LD  XL, A  ");
		_asm("LDW SP, X  ");
		_asm("JPF $8000");		//try main first
}

void iap_checking(void) {
		if (pkg_count != 0) {
			return;
		}
		
		if (buf[0] == 'b' && buf[1] == 'b' && buf[2] == 'b') {
      if (rx_idx >= 3 && buf[rx_idx-1] == 'e' && buf[rx_idx-2] == 'e' &&  buf[rx_idx-3] == 'e') {
        
				buf[rx_idx] = 0;
				rx_idx = 0;
        pkg_count = 1;
      }
    }

		if (pkg_count != 1) {
			return;
		}
		iap_print_buf();		
		
		if (buf[3] == 'i') {
			iap_init();
		}
		pkg_count = 0;
}
void iap_updating(void) {
		if (pkg_count != 0) {
			return;
		}
		if (buf[0] == 'b' && buf[1] == 'b' && buf[2] == 'b') {
      if (rx_idx >= 3 && buf[rx_idx-1] == 'e' && buf[rx_idx-2] == 'e' &&  buf[rx_idx-3] == 'e') {
        
				buf[rx_idx] = 0;
				rx_idx = 0;
        pkg_count = 1;
      }
    }
		if (pkg_count != 1) {
			return;
		}
		iap_print_buf();
		if (buf[3] == 'u') {
				//update
				//bbbu[AAAACCCCCC]eee
				//bbbu[AAAACCCCCC]eee
				iap_update();
				
			} else if (buf[3] == 'f') {
				//finish
				//bbbfeee
				iap_finish();
			}
		pkg_count = 0;
}

void iap_UART1_DeInit(void)
{
  /* Clear the Idle Line Detected bit in the status register by a read
  to the UART1_SR register followed by a Read to the UART1_DR register */
  (void)UART1->SR;
  (void)UART1->DR;

  UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */

  UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */

  UART1->GTR = UART1_GTR_RESET_VALUE;
  UART1->PSCR = UART1_PSCR_RESET_VALUE;
}

void iap_UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength,
                UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity,
                UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
{
  uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;


  /* Clear the word length bit */
  UART1->CR1 &= (uint8_t)(~UART1_CR1_M);

  /* Set the word length bit according to UART1_WordLength value */
  UART1->CR1 |= (uint8_t)WordLength;

  /* Clear the STOP bits */
  UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);
  /* Set the STOP bits number according to UART1_StopBits value  */
  UART1->CR3 |= (uint8_t)StopBits;

  /* Clear the Parity Control bit */
  UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));
  /* Set the Parity Control bit to UART1_Parity value */
  UART1->CR1 |= (uint8_t)Parity;

  /* Clear the LSB mantissa of UART1DIV  */
  UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);
  /* Clear the MSB mantissa of UART1DIV  */
  UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);
  /* Clear the Fraction bits of UART1DIV */
  UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);

  /* Set the UART1 BaudRates in BRR1 and BRR2 registers according to UART1_BaudRate value */
  BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
  BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
  /* Set the fraction of UART1DIV  */
  UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F);
  /* Set the MSB mantissa of UART1DIV  */
  UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
  /* Set the LSB mantissa of UART1DIV  */
  UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;

  /* Disable the Transmitter and Receiver before setting the LBCL, CPOL and CPHA bits */
  UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN);
  /* Clear the Clock Polarity, lock Phase, Last Bit Clock pulse */
  UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL);
  /* Set the Clock Polarity, lock Phase, Last Bit Clock pulse */
  UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL |
                                                        UART1_CR3_CPHA | UART1_CR3_LBCL));

  if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
  {
    /* Set the Transmitter Enable bit */
    UART1->CR2 |= (uint8_t)UART1_CR2_TEN;
  }
  else
  {
    /* Clear the Transmitter Disable bit */
    UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);
  }
  if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
  {
    /* Set the Receiver Enable bit */
    UART1->CR2 |= (uint8_t)UART1_CR2_REN;
  }
  else
  {
    /* Clear the Receiver Disable bit */
    UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);
  }
  /* Set the Clock Enable bit, lock Polarity, lock Phase and Last Bit Clock
  pulse bits according to UART1_Mode value */
  if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
  {
    /* Clear the Clock Enable bit */
    UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN);
  }
  else
  {
    UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
  }
}

void iap_UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
{
  uint8_t uartreg = 0, itpos = 0x00;


  /* Get the UART1 register index */
  uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
  /* Get the UART1 IT index */
  itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));

  if (NewState != DISABLE)
  {
    /**< Enable the Interrupt bits according to UART1_IT mask */
    if (uartreg == 0x01)
    {
      UART1->CR1 |= itpos;
    }
    else if (uartreg == 0x02)
    {
      UART1->CR2 |= itpos;
    }
    else
    {
      UART1->CR4 |= itpos;
    }
  }
  else
  {
    /**< Disable the interrupt bits according to UART1_IT mask */
    if (uartreg == 0x01)
    {
      UART1->CR1 &= (uint8_t)(~itpos);
    }
    else if (uartreg == 0x02)
    {
      UART1->CR2 &= (uint8_t)(~itpos);
    }
    else
    {
      UART1->CR4 &= (uint8_t)(~itpos);
    }
  }

}

void iap_UART1_Cmd(FunctionalState NewState)
{
  if (NewState != DISABLE)
  {
    /* UART1 Enable */
    UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD);
  }
  else
  {
    /* UART Disable */
    UART1->CR1 |= UART1_CR1_UARTD;
  }
}

void iap_UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
{

  /* Clear the Receive Register Not Empty pending bit */
  if (UART1_IT == UART1_IT_RXNE)
  {
    UART1->SR = (uint8_t)~(UART1_SR_RXNE);
  }
  /* Clear the LIN Break Detection pending bit */
  else
  {
    UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
  }
}

uint32_t iap_CLK_GetClockFreq(void)
{
  uint32_t clockfrequency = 0;
  CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
  uint8_t tmp = 0, presc = 0;

  /* Get CLK source. */
  clocksource = (CLK_Source_TypeDef)CLK->CMSR;

  if (clocksource == CLK_SOURCE_HSI)
  {
    tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
    tmp = (uint8_t)(tmp >> 3);
    presc = iap_HSIDivFactor[tmp];
    clockfrequency = HSI_VALUE / presc;
  }
  else if ( clocksource == CLK_SOURCE_LSI)
  {
    clockfrequency = LSI_VALUE;
  }
  else
  {
    clockfrequency = HSE_VALUE;
  }

  return((uint32_t)clockfrequency);
}

//set back code section to default placement
//#pragma section ()
