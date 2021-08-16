#include "stm8s.h"
#include "main.h"
#include "stm8s_gpio.h"
#include "stm8s_i2c.h"
#include "BU91R64CH_lcd.h"



extern uint8_t HEADER_ADDRESS_Read = (((SLAVE_ADDRESS & 0xFF00) >> 7) | 0xF1);
extern uint8_t HEADER_ADDRESS_Write;
/* Private variables ---------------------------------------------------------*/

__IO uint8_t Rx_Idx = 0, Tx_Idx = 0;
__IO uint8_t NumByteToRead = BUFFERSIZE;
__IO uint8_t NumOfBytes = BUFFERSIZE;
__IO uint8_t RxBuffer[BUFFERSIZE];
TestStatus TransferStatus1 = FAILED;
extern __IO uint8_t TxBuffer[BUFFERSIZE];
TestStatus Buffercmp(uint8_t* pBuffer1, uint8_t* pBuffer2, uint16_t BufferLength);
extern void Delay(__IO uint32_t nCount);



void main()
{
	int p = 0 ;
  int	k = 0, i;
#ifdef FAST_I2C_MODE
  /* system_clock / 1 */
  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); //16MHz
#else
  /* system_clock / 2 */
  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);  //8MHz
#endif

	/*Initialize I2C clock  */
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	
  /* I2C Initialize */
  I2C_Init(I2C_SPEED, 0xA0, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, 16);
	I2C_StretchClockCmd(ENABLE);
	/*Initialize LCD */
	LCD_Ini();
	/*Clear all the RAM locations  */
	LCD_RAM_Clear();  

	while(1)
	{
		long i,j;
		for(i = 0, j = 0; i <=199, j <= 40 ; ++i, ++j)
		//for(i = 0; i <=199 ; ++i)
		{
			#if 1
			LCD_RAM_Initialize();
			LCD_BT(1);
			LCD_Data_Transmission(1);
			LCD_Error(1);
			LCD_Ignition(1);
			LCD_Speaker(1);
			LCD_Ambi_Temp(j); //from 0 to 99
			LCD_Network(4,0);
			LCD_RPM_AMP(0,j); //Shoule be less than MAX_AMP //should be less than MAX_RPM
			LCD_Controller_Temp(j);
			LCD_RPM_Range(0, 0 ,i); //mode Range = 1; RPM = 0; Km_ mi  =>  0 = mi and 1= km 
			LCD_Wh_Km(1,j);
			LCD_Mode(2); //1, 2, 3 only
			//LCD_T(1);// 1, 2, 3 only
			LCD_Trip(2, 0, i);  //7 digit val //Mode A=1, B=2  and Km=1, Mi=0
			LCD_Bat_Volt(j); 
		  LCD_Speed_RT(i,1); //don't put distance greater than 199
		  LCD_Time_RT(1,10);
			LCD_Data_Update();
		#endif
			
			
			
		#if 0
			LCD_RAM_Initialize();
			LCD_BT(1);
			LCD_Data_Transmission(1);
			LCD_Error(1);
			LCD_Ignition(1);
			LCD_Speaker(1);
			LCD_Ambi_Temp(50); //from 0 to 99
			LCD_Network(4,0);
			LCD_RPM_AMP(0,12); //Shoule be less than MAX_AMP //should be less than MAX_RPM
			LCD_Controller_Temp(54);
			LCD_RPM_Range(0, 0 , 1234); //mode Range = 1; RPM = 0; Km_ mi  =>  0 = mi and 1= km 
			LCD_Wh_Km(1,94);
			LCD_Mode(2); //1, 2, 3 only
			//LCD_T(1);// 1, 2, 3 only
			LCD_Trip(2, 0, 1234567);  //7 digit val //Mode A=1, B=2  and Km=1, Mi=0
			LCD_Bat_Volt(38.7); 
		  LCD_Speed_RT(i,1); //don't put distance greater than 199
		  LCD_Time_RT(1,10);
			LCD_Data_Update();
		#endif
				 
		}
 }
 
}

void Delay(__IO uint32_t nCount)
{
  for (; nCount != 0; nCount--);
}



#ifdef  USE_FULL_ASSERT

void assert_failed(uint8_t* file, uint32_t line)
{
  
  while (1)
  {}
}
#endif
