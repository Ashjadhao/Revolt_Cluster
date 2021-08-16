#include "stm8s.h"
#include "stm8s_gpio.h"
#include "stm8s_i2c.h"
#include "main.h"
#include "BU91R64CH_lcd.h"


__IO uint8_t TxBuf_sw_rst[3] = {0x00, 0xfd, 0x81};
__IO uint8_t TxBuf_Ini[14] = {0x00, 0xc0, 0xfd, 0x90, 0xa0, 0xb0, 0xc0, 0xe0, 0xfc,0xee, 0xf0, 0xf8, 0xe0, 0x00}; //display off initially
__IO uint8_t TxBuf_Cntrl_Byte = 0x40;
static __IO uint8_t TxBuf_Data[39] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
															0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
															0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
															0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
														  };
														 
__IO uint8_t TxBuf_Disp[2] = {0x00, 0xc8};
__IO TxBuf_Data_RAM_0[10] = {0x5F, 0X50, 0X3D, 0X79, 0X72, 0X6B, 0X6F, 0X51, 0X7F, 0X7B}; //digit7  // RAM0 has same mapping as  RAM9, RAM10, RAm11, RAM12, RAM13, RAM14, RAM24, 25, 26, 27, 28, 29, 30, 
__IO TxBuf_Data_RAM_1[10] = {0xF5, 0X05, 0XD3, 0X97, 0X27, 0XB6, 0XF6, 0X15, 0XF7, 0XB7};  //digit8, digit9  // RAM1 has same mapping as  RAM2
__IO TxBuf_Data_RAM_5[10] = {0x5F, 0X06, 0X6B, 0X2F, 0X36, 0X3D, 0X7D, 0X07, 0X7F, 0X3F};  //digit1 , digit2  // RAM5 has same mapping as  RAM31, 32, 33, 34, 36

void Delay(__IO uint32_t nCount);


/*Function Defination,
 *@*LCD Initialization sequence as per slave
 */
void LCD_Ini(void)
 {
  int i = 0;
	GPIO_Init(GPIOD,GPIO_PIN_0,GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_WriteHigh(GPIOD, GPIO_PIN_0); //reset
  Delay(0x3020);  //wait for 100usec
	/* Send START condition */
  I2C_GenerateSTART(ENABLE);
	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
	{
		I2C_SendData(0xff);
  }

	/* Send STOP condition */
	I2C_GenerateSTOP(ENABLE);

  /* Send START condition */
  I2C_GenerateSTART(ENABLE);
	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
	{
		I2C_SendData(0xff);
  }

	/* Send STOP condition */
	I2C_GenerateSTOP(ENABLE);

/* Send START condition */
	I2C_GenerateSTART(ENABLE);
	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
	{
	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);  //send slave address
  }
	
	//send Software reset sequence
  while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED) == ERROR);
	i = 0;
	I2C_SendData(TxBuf_sw_rst[i]);
	i++;
	
	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING) == ERROR)
	{
		Delay(0xffff);
	}

	while (i < 3)
	{
			/* Send the first Data */
			I2C_SendData(TxBuf_sw_rst[i]);
			GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
			Delay(0x0010);  //delay
			/* Decrement number of bytes */
			i++;
	}

		
	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED) == ERROR){
			Delay(0xffff);
  }

	/* Send STOP condition */
	I2C_GenerateSTOP(ENABLE);

	
	/* Send START condition */
	I2C_GenerateSTART(ENABLE);
	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
	{
	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);  //send slave address
  }
	//send initialization sequence
  while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)== ERROR);
	i = 0;
	I2C_SendData(TxBuf_Ini[i]);
	i++;
  while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR);
	{
		Delay(0xffff);
	}
	
	while (i < 14)
	{
		/* Send the first Data */
		I2C_SendData(TxBuf_Ini[i]);
		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
		Delay(0x0010);  // delay
		i++;
	}

	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)== ERROR)
	{
		Delay(0xffff);
	}

	/* Send STOP condition */
	I2C_GenerateSTOP(ENABLE);

	/* Send START condition */
	I2C_GenerateSTART(ENABLE);
	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
	{

	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX); //send slave address
  }
	
  while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)== ERROR);
	
//send data sequence after control byte to write
	I2C_SendData(TxBuf_Cntrl_Byte);
	
//send data
  while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR)
	{
		Delay(0xffff);
  }
	i = 0;
	while (i < 40)
	{
		/* Send the first Data */
		I2C_SendData(TxBuf_Data[i]);
		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
		Delay(0x0010);  // delay
		i++;
	}
		
	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)== ERROR)
  {
		Delay(0xffff);
  }

	/* Send STOP condition */
	I2C_GenerateSTOP(ENABLE);
	
	/* Send START condition */
	I2C_GenerateSTART(ENABLE);
	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
	{

	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);  //send slave address
  }
	
 	while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)== ERROR);

	//send display ON sequence
	i = 0;
	I2C_SendData(TxBuf_Disp[i]);
	i++;

  while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR)
	{
		Delay(0xffff);
	}

	while (i < 2)
	{
		/* Send the first Data */
		I2C_SendData(TxBuf_Disp[i]);
	 	GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
		Delay(0x0010);  // delay
		i++;
	}
		
	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)== ERROR)
  {
  	Delay(0xffff);
  }
	
	/* Send STOP condition */
	I2C_GenerateSTOP(ENABLE);
	
  /* Add a delay to be sure that communication is finished */
  Delay(0xFFFF);
}


/*Function Defination,
 *@*Disable LCD display
 */
	void LCD_Disp_OFF(void){
		
			/* Send START condition */
	I2C_GenerateSTART(ENABLE);
	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
	{

	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);
  }
	
 	while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)== ERROR);
	I2C_SendData(0x00);
  while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR)
	{
		Delay(0xffff);
	}

	/* Send the first Data */
	I2C_SendData(0xC0);
	GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
	Delay(0x0010);  //1msec delay
	
	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)== ERROR)
  {
  	Delay(0xffff);
  }
	
	/* Send STOP condition */
	I2C_GenerateSTOP(ENABLE);
	  /* Add a delay to be sure that communication is finished */
  Delay(0xFFFF);
}
	
/*Function Defination,
 *@*Data update sequence as per slave, need to be send before data update
 */
void LCD_Data_Update_Sequence(void){
	int i = 0, j;
	 
	/* Send START condition */
	I2C_GenerateSTART(ENABLE);
	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
	{
	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);
  }
	
  while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)== ERROR);
	i = 0;
	I2C_SendData(TxBuf_Ini[i]);
	i++;
  while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR);
	{
		Delay(0xffff);
	}
	
	while (i < 14)
	{
		if(i == 1){
			I2C_SendData(0xC8);
		}
		else{
			I2C_SendData(TxBuf_Ini[i]);
		}
	
		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
		Delay(0x0010);  //1msec delay
		
		/* Decrement number of bytes */
		i++;
	}

	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)== ERROR)
	{
		Delay(0xffff);
	}

	/* Send STOP condition */
	I2C_GenerateSTOP(ENABLE);

}

/*Function Defination,
 *@*Update LCD data
 */
void LCD_Data_Update(void){
	int i = 0;
		LCD_Data_Update_Sequence();
				
		/* Send START condition */
	I2C_GenerateSTART(ENABLE);
	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
	{

	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);
  }
	
  while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)== ERROR);
	
	I2C_SendData(TxBuf_Cntrl_Byte);  //update data  =0x40

  while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR)
	{
		Delay(0xffff);
  }
	i = 0;
	while (i < 40)
	{
		/* Send the first Data */
		I2C_SendData(TxBuf_Data[i]);
		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
		Delay(0x0010);  //1msec delay
		i++;
	}
		
	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)== ERROR)
  {
		Delay(0xffff);
  }
	/* Send STOP condition */
	I2C_GenerateSTOP(ENABLE);
	
}

/*Function Defination,
 *@*display Clock in real time
 */
void LCD_Time_RT(int hr, int mm){
	int i, j, k , l, m ;
	j = hr / 10;
	k = hr % 10;
	l = mm / 10;
	m = mm % 10;
	
	TxBuf_Data[31] |= TxBuf_Data_RAM_5[j];
	TxBuf_Data[32] |= TxBuf_Data_RAM_5[k];
	TxBuf_Data[33] |= TxBuf_Data_RAM_5[l] | 0x80;
	TxBuf_Data[34] |= TxBuf_Data_RAM_5[m];

}

/*Function Defination,
 *@*Clear RAM location in LCD
 */
void LCD_RAM_Clear(void){
	int i = 0;
	 
	/* Send START condition */
	I2C_GenerateSTART(ENABLE);
	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
	{
	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);
  }
	
  while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)== ERROR);
	i = 0;
	I2C_SendData(TxBuf_Ini[i]);
	i++;
  while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR);
	{
		Delay(0xffff);
	}
	
	while (i < 14)
	{
		/* Send the first Data */
		if( i == 1)
		{
			I2C_SendData(0xc0); //Display ON
		}
		else
		{
			I2C_SendData(TxBuf_Ini[i]);
	  }
		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
		Delay(0x0040);  //1msec delay
		
		/* Decrement number of bytes */
		i++;
	}

	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)== ERROR)
	{
		Delay(0xffff);
	}

	/* Send STOP condition */
	I2C_GenerateSTOP(ENABLE);

	/* Send START condition */
	I2C_GenerateSTART(ENABLE);
	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
	{

	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);
  }
	
  while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)== ERROR);
	

	I2C_SendData(TxBuf_Cntrl_Byte);  //update data  =0x40
	

  while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR)
	{
		Delay(0xffff);
  }

	for(i = 0; i < 40; ++i)
	{
		TxBuf_Data[i] = 0x00;
  }
	i = 0;
	while (i < 40)
	{
		/* Send the first Data */
		I2C_SendData(TxBuf_Data[i]);
		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
		Delay(0x0040);  //1msec delay
		/* Decrement number of bytes */
		i++;
	}
		
	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)== ERROR)
  {
		Delay(0xffff);
  }

	/* Send STOP condition */
	I2C_GenerateSTOP(ENABLE);
}


/*Function Defination,
 *@*Bluetooth Enable / disable
 */
void LCD_BT(int ON_OFF){
	if(ON_OFF ==1)
	  TxBuf_Data[37] |= 0x40;
	else
	  TxBuf_Data[37] |= 0x00;
}

/*Function Defination,
 *@*data transmission Enable / disable
 */
void LCD_Data_Transmission(int Enab_Disable){
	if(Enab_Disable ==1)
	 	TxBuf_Data[37] |= 0x80;
	else
		TxBuf_Data[37] |= 0x00;

}

 /*Function Defination,
 *@*Speaker Enable / disable
 */
void LCD_Speaker(int ON_OFF){
	if(ON_OFF ==1)
	  TxBuf_Data[38] |= 0x01;
	else
		TxBuf_Data[38] |= 0x00;
}


 /*Function Defination,
 *@* display real time speed of vehicle
 *@* parameter = 1 ==> Km/h
 *@* parameter = 0 ==> mi/h
 */
void LCD_Speed_RT(long Sp, int Parameter){  //parameter = 1 = km/h
  int a[3] = { 0, 0, 0};
	int i = 0, j , k , l;
	uint8_t temp1 = 0, temp2 = 0, temp3 = 0, temp4 = 0, temp5 = 0;
	if(Sp <= 199 && Sp >= 0)
	{
		while(Sp != 0){
			a[i] = Sp % 10;
			Sp = Sp / 10;
			++i;		
		}
	}
	//for 134
	j = a[2];  // 1
	k = a[1];  // 3 
	l = a[0];  //4

	TxBuf_Data[15] |= (TxBuf_Data_RAM_5[l] & 0x0F);
	TxBuf_Data[16] |= (((TxBuf_Data_RAM_5[l] & 0xF0) << 1) |(TxBuf_Data_RAM_5[k] & 0x0F));
	
	if(j == 1){ 
	  TxBuf_Data[17] |= ((TxBuf_Data_RAM_5[k] & 0xF0)  | 0x80); //enable 24BC
	}
	else{
	  TxBuf_Data[17] |= (TxBuf_Data_RAM_5[k] & 0xF0) ;
	}

	if(Parameter == 1)
	{
	 TxBuf_Data[22] |= 0x08;
	}
	else
	{
		TxBuf_Data[22] |= 0x04;
	}
	
}

 /*Function Defination,
 *@*Display battery voltage in terms of percentage as digita and bars
 */
void LCD_Bat_Volt(float Volt){ //display in 0 to 100%
 	int y =  map(Volt, 0,(float)Max_Batt_Voltage, 0, 100);
	int ch = y;
  uint8_t	temp1 = 0, temp2 = 0;
	int a[3] = { 0, 0, 0};
	int i = 0, j , k , l;
	while(y != 0){
			a[i] = y % 10;
			y = y / 10;
			++i;		
		}
			//for 134
	j = a[2];  // 1
	k = a[1];  // 3 
	l = a[0];  //4
 

	TxBuf_Data[0] |= 0x80;  //X4 = logo
	TxBuf_Data[3] |= 0x10;
	TxBuf_Data[4] |= 0x08;
	TxBuf_Data[7] |= 0x08;  //enable X0
	TxBuf_Data[8] |= 0x80;  //enable X0
	
	TxBuf_Data[0] |= TxBuf_Data_RAM_0[j]  | 0x80;  //Digit 7  and X4=logo
	TxBuf_Data[1] |= TxBuf_Data_RAM_1[k];  //digit 8
	TxBuf_Data[2] |= TxBuf_Data_RAM_1[l] | 0x08;  //digit 9 and X5 = %


		if(ch >=10  && ch <20 ){ // 10%
			TxBuf_Data[3] |= 0x20;
		}
		if(ch >=20  && ch <30 ){  //20%
			TxBuf_Data[3] |= 0x21;
		}
		if(ch >=30  && ch <40 ){ // 30%
			TxBuf_Data[3] |= 0x23;
		}
		if(ch >=40 && ch <50 ){ // 40%
			TxBuf_Data[3] |= 0x27;
		}
		if(ch >=50  && ch <60 ){ //50%
			TxBuf_Data[3] |= 0x37;
			TxBuf_Data[4] |= 0x40;
		}
		if(ch >=60  && ch <70 ){ //60%
			TxBuf_Data[3] |= 0x37;
			TxBuf_Data[4] |= 0x60;
		}
		if(ch >=70  && ch <80 ){ //70%
			TxBuf_Data[3] |= 0x37;
			TxBuf_Data[4] |= 0x70;
		}
		if(ch >=80  && ch <90){  //80%
			TxBuf_Data[3] |= 0x37;
			TxBuf_Data[4] |= 0x71;
		}
		if(ch >=90  && ch <100 ){ //90%
			TxBuf_Data[3] |= 0x37;
			TxBuf_Data[4] |= 0x73;
		}
		
		if(ch == 100 ){  //100%
		TxBuf_Data[3] |= 0x27;
		TxBuf_Data[4] |= 0x77;
	  }
 
}
 /*Function Defination,
 *@* map value in a range
 */
float map(float x, float in_min, float in_max, float out_min, float out_max)
{
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}
void LCD_Bat_Temp(int Temp){
	
}
 /*Function Defination,
 *@* Ignition Enable/ Disable 
 */
void LCD_Ignition(int Enab_disab){
	if(Enab_disab == 1){
		TxBuf_Data[38] |= 0x02;
	}
	else{
		TxBuf_Data[38] |= 0x00;
	}
	
}
 /*Function Defination,
 *@* If there is any Error this flag = 1
 *@* if flag = 0, means No error
 */
void LCD_Error(int Flag){
	if(Flag == 1){
		TxBuf_Data[7] |= 0x20;
	}
	else{
		TxBuf_Data[7] |= 0x00;
	}
}
 /*Function Defination,
 *@* Microcontroller Temperature Display
 *@* convert temperature in celcius to percentage and display as digits and bars 
 */
void LCD_Controller_Temp(float Temp){
	float y =  map(Temp, 0,(float)Max_Controller_Temp, 0, 100);
	float ch = y;
	TxBuf_Data[38] |= 0x14;
	TxBuf_Data[37] |= 0x20;

	if(ch >1  && ch <=16.66 ){ // 16.66%
		TxBuf_Data[38] |= 0x08;
	}
	if(ch >16.66  && ch <=33.33 ){  //33.33%
		TxBuf_Data[37] |= 0x08;
		TxBuf_Data[38] |= 0x08;
	}
	if(ch >33.33  && ch <=49.98 ){ // 49.98%
		TxBuf_Data[37] |= 0x0C;
		TxBuf_Data[38] |= 0x08;
	}
	if(ch >49.98 && ch <=66.48 ){ // 66.48%
		TxBuf_Data[38] |= 0x08;
		TxBuf_Data[37] |= 0x0E;
	}
	if(ch >66.48  && ch <=83.3 ){ //83.3%
		TxBuf_Data[38] |= 0x08;
		TxBuf_Data[37] |= 0x0F;
	}
	if(ch >83.3  && ch <=100 ){ //99.96%
		TxBuf_Data[38] |= 0x08;
		TxBuf_Data[37] |= 0x1F;
	}
	 
}
 /*Function Defination,
 *@* Driving Modes
 *@* Mode 1 represents economy 
 *@* mode 2 represents normal
 *@* mode 3 represents sport
 */
void LCD_Mode(int Mode){
	switch(Mode){
		case 1:TxBuf_Data[35] |= 0x30 | 0x04 | 0x08;  //Mode 1 represents economy
					TxBuf_Data[36] |= 0x80 | TxBuf_Data_RAM_5[1];
					
					break;
		case 2:TxBuf_Data[35] |= 0x50 | 0x06 | 0x08;   //mode 2 represents normal
					TxBuf_Data[36] |= 0x80 | TxBuf_Data_RAM_5[2];
					break;
		case 3:TxBuf_Data[35] |= 0x90 | 0x08 | 0x07;  //mode 3 represents sport
					TxBuf_Data[36] |= 0x80 | TxBuf_Data_RAM_5[3];
					break;
		default:
			    break;
	}
	
}
 /*Function Defination, 
 *@* This Ambient temperature
 */
void LCD_Ambi_Temp(int Temp){
	int a[3] = { 0, 0, 0};
	int i = 0, k = 0 , l = 0;
		TxBuf_Data[7] |= 0x10;
	if(Temp < 0){
			TxBuf_Data[5] = 0x80; //X1
	}
	else{
		TxBuf_Data[5] = 0x00; //X1
	}
	//for 48
  k = Temp % 10; // =8
	l = Temp / 10; // = 4
	
	TxBuf_Data[5] |= TxBuf_Data_RAM_5[l];  //Digit 1
	TxBuf_Data[6] |= TxBuf_Data_RAM_5[k];  //digit 2

}


 /*Function Defination, 
 *@* Calculate Network and Display as Bar
 *@* There are 4 bars, so Bar = 0 to 4 only
 *@* Disable = 1 means disable network, No bar will be seen
 */
void LCD_Network(int Bar, int Disable){
	if(Disable == 1){
		TxBuf_Data[30] |= 0x01;
		TxBuf_Data[31] |= 0x00;
	}
	else
	{
		switch(Bar)
			{
				case 1:TxBuf_Data[30] |= 0x02;
							break;
				case 2:TxBuf_Data[30] |= 0x06;
							break;
				case 3:TxBuf_Data[30] |= 0x0E;
							break;
				case 4:TxBuf_Data[30] |= 0x0E;
							TxBuf_Data[31] |= 0x80;
							break;
				default:TxBuf_Data[30] |= 0x00;
								TxBuf_Data[31] |= 0x00;
							break;
			}
	}
}
 /*Function Defination, 
 *@* this function Display RPM or AMP as digit and as in Graphics
 *@* mode1 = RPM 
 *@* mode2 = AMP
 */

void LCD_RPM_AMP(int Mode,int Val){
	int val = Val;
	if(Mode == 1)  //RPM
	{
		TxBuf_Data[19] |= 0x08; //X7
	  LCD_Cal_L_Range(val, (float)MAX_RPM);
	}
	else{
	TxBuf_Data[19] |= 0x04;
	LCD_Cal_L_Range(val, (float)MAX_AMP);
  }
}

 /*Function Defination, 
 *@* this function Calculate AMP or RPM out of 36 unit and display
 */
void LCD_Cal_L_Range(int Val, float MAX){
	float L =(MAX / 36.0 );  //get 1 unit
	float Count = Val / L;
	int Ch = Count;
	TxBuf_Data[20] |= 0x11; //L0
	TxBuf_Data[21] |= 0x10; //MAX = X11

	switch(Ch){  //as per value enable L1 to L36
		case 1:TxBuf_Data[19] |= 0x10;
					break;
		case 2:TxBuf_Data[19] |= 0x30;
					break;
		case 3:TxBuf_Data[19] |= 0x70;
					break;
		case 4:TxBuf_Data[19] |= 0xF0;
					break;
		case 5:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0x08;
					break;
		case 6:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0x0C;
					break;
		case 7:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0x0E;
					break;
		case 8:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0x0F;
					break;
		case 9:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0x1F;
					break;
		case 10:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0x3F;
					break;
		case 11:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0x7F;
					break;
		case 12:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					break;
		case 13:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x08;
					break;
		case 14:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0C;
					break;
		case 15:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0E;
					break;
		case 16:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					break;
		case 17:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0x10;
					break;
		case 18:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0x30;
					break;
		case 19:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0x70;
					break;
		case 20:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0xF0;
					break;
		case 21:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0xF0;
					TxBuf_Data[23] |= 0x80;
					break;
		case 22:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0xF0;
					TxBuf_Data[23] |= 0xC0;
					break;
		case 23:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0xF0;
					TxBuf_Data[23] |= 0xE0;
					break;
		case 24:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0xF0;
					TxBuf_Data[23] |= 0xF0;
					break;
		case 25:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0xF0;
					TxBuf_Data[23] |= 0xF0;
					TxBuf_Data[22] |= 0x02;
					break;
		case 26:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0xF0;
					TxBuf_Data[23] |= 0xF0;
					TxBuf_Data[22] |= 0x12;
					break;
		case 27:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0xF0;
					TxBuf_Data[23] |= 0xF0;
					TxBuf_Data[22] |= 0x32;
					break;
		case 28:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0xF0;
					TxBuf_Data[23] |= 0xF0;
					TxBuf_Data[22] |= 0x72;
					break;
		case 29:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0xF0;
					TxBuf_Data[23] |= 0xF0;
					TxBuf_Data[22] |= 0xF2;
					break;
		case 30:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0xF0;
					TxBuf_Data[23] |= 0xF0;
					TxBuf_Data[22] |= 0xF2;
					TxBuf_Data[21] |= 0x08;
					break;
		case 31:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0xF0;
					TxBuf_Data[23] |= 0xF0;
					TxBuf_Data[22] |= 0xF2;
					TxBuf_Data[21] |= 0x0C;
					break;
		case 32:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0xF0;
					TxBuf_Data[23] |= 0xF0;
					TxBuf_Data[22] |= 0xF2;
					TxBuf_Data[21] |= 0x0E;
					break;
		case 33:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0xF0;
					TxBuf_Data[23] |= 0xF0;
					TxBuf_Data[22] |= 0xF2;
					TxBuf_Data[21] |= 0x0F;
					break;
		case 34:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0xF0;
					TxBuf_Data[23] |= 0xF0;
					TxBuf_Data[22] |= 0xF2;
					TxBuf_Data[21] |= 0x8F;
					break;
		case 35:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0xF0;
					TxBuf_Data[23] |= 0xF0;
					TxBuf_Data[22] |= 0xF2;
					TxBuf_Data[21] |= 0xCF;
					break;
		case 36:TxBuf_Data[19] |= 0xF0;
					TxBuf_Data[18] |= 0xFF;
					TxBuf_Data[17] |= 0x0F;
					TxBuf_Data[15] |= 0xF0;
					TxBuf_Data[23] |= 0xF0;
					TxBuf_Data[22] |= 0xF2;
					TxBuf_Data[21] |= 0xEF;
					break;
		default:TxBuf_Data[19] |= 0x00;
					TxBuf_Data[18] |= 0x00;
					TxBuf_Data[17] |= 0x00;
					TxBuf_Data[15] |= 0x00;
					TxBuf_Data[23] |= 0x00;
					TxBuf_Data[22] |= 0x00;
					TxBuf_Data[21] |= 0x00;
					break;
	}
}
 /*TRIP is function having two mode
 *@* mode1 = TRIP A , mode2 = TRIP B 
 */
void LCD_Trip(int Mode, int Km, long Val){

	int z[7] = { 0, 0, 0, 0, 0, 0, 0};
	int i = 0, a, b, c, d, e, f, g;
	while(Val != 0){
			z[i] = Val % 10;
			Val = Val / 10;
			++i;		
	}
	a = z[0];
	b = z[1];
	c = z[2];
	d = z[3];
	e = z[4];
	f = z[5];
	g = z[6];
	if(Km == 1){
		TxBuf_Data[28] |= 0x80;  //km  == X24
		
	}
	else{
		TxBuf_Data[30] |= 0x80;  //mi
	}
	if(Mode == 1) //TRIP A
	{
		TxBuf_Data[25] |= 0x00; // B X26 disable
		TxBuf_Data[26] |= 0x80;  //A X25	
	}
	if(Mode == 2) //TRIP B
	{
		TxBuf_Data[26] |= 0x00;  //A X25 disable
		TxBuf_Data[25] |= 0x80; // B X26
		TxBuf_Data[27] |= 0x80;  //TRIP X23
	}
	
	//Set Transmissio buffer value
	TxBuf_Data[23] |= (TxBuf_Data_RAM_0[g] & 0x0f);  //digit 16 lower 4 bit
	TxBuf_Data[24] |=  (TxBuf_Data_RAM_0[g] & 0xf0)| (TxBuf_Data_RAM_0[f] & 0x0f);  //digit 16 upper 4 bit and digit 17 lower 4 bit
	TxBuf_Data[25] |= (TxBuf_Data_RAM_0[f] & 0xf0)  | (TxBuf_Data_RAM_0[e] & 0x0f);  //digit 17 upper 4 bit and digit 18 lower 4 bit
	TxBuf_Data[26] |= (TxBuf_Data_RAM_0[e] & 0XF0) | (TxBuf_Data_RAM_0[d] & 0X0f);  //digit 18 upper 4 bit and digit 19 lower 4 bit
	TxBuf_Data[27] |= (TxBuf_Data_RAM_0[d] & 0XF0) | (TxBuf_Data_RAM_0[c] & 0X0F) | 0x80;  //digit 19 upper 4 bit and digit 20 lower 4 bit
	TxBuf_Data[28] |= (TxBuf_Data_RAM_0[c] & 0XF0) | (TxBuf_Data_RAM_0[b] & 0X0F);  //digit 20 upper 4 bit and digit 21 lower 4 bit
	TxBuf_Data[29] |= (TxBuf_Data_RAM_0[b] & 0XF0) | (TxBuf_Data_RAM_0[a] & 0X0F) | 0x80; //Dp //digit 21 upper 4 bit and digit 22 lower 4 bit
	TxBuf_Data[30] |= (TxBuf_Data_RAM_0[a] & 0xf0);  //digit 22 upper 4 bit 		
}

 /*Function defination
 *@*LCd_RPM_Range is display Distance covered in RPM
 */
void LCD_RPM_Range(int Mode, int Km_mi , long Val){
	int z[4] = { 0, 0, 0, 0};
	int i = 0, a, b, c, d;
	while(Val != 0){
			z[i] = Val % 10;
			Val = Val / 10;
			++i;		
	}
	a = z[0];  //unit place
	b = z[1];  //tenth place
	c = z[2];  //hundreadth place
	d = z[3];  //thousand th place
	if(Mode == 1)  //Range means Distance
	{
		TxBuf_Data[9] |= 0x80; //x15 means Range
  }
	else
	{
		TxBuf_Data[10] |= 0x80; //x13 means RPM
	}
	
	if(Km_mi == 1) //Km
	{
		TxBuf_Data[11] |= 0x80; //x14 = km
	}
	else{
		TxBuf_Data[12] |= 0x80;  //x12 = mi
	}
	
	//Display data
	
	TxBuf_Data[8]  |= (TxBuf_Data_RAM_0[d] & 0x0f);    //digit 10 lower nibble
	TxBuf_Data[9]  |= (TxBuf_Data_RAM_0[d] & 0xf0)| (TxBuf_Data_RAM_0[c] & 0x0f); //digit 10 upper nibble and digit 11 lower nibble
	TxBuf_Data[10] |= (TxBuf_Data_RAM_0[c] & 0xf0)| (TxBuf_Data_RAM_0[b] & 0x0f);//digit 11 upper nibble and digit 12 lower nibble
	TxBuf_Data[11] |= (TxBuf_Data_RAM_0[b] & 0xf0)| (TxBuf_Data_RAM_0[a] & 0x0f);//digit 12 upper nibble and digit 13 lower nibble
	TxBuf_Data[12] |= (TxBuf_Data_RAM_0[a] & 0xf0); //digit 13 upper nibble
	

}
 /*Define Wh/Km function here 
 *@*
 */
void LCD_Wh_Km(int Mode, int Val){

	int a, b;
	a = Val % 10; //unit place
	b = Val / 10; //tenth place
	
	if(Mode == 1) // Wh/Km enable
	{
		TxBuf_Data[14] |= 0x88;  //x19 x21
		TxBuf_Data[13] |= 0x80;  //x20
	}
	else {
		TxBuf_Data[14] |= 0x07;   // Wh/mi enable
	}
	
	//Display value
		TxBuf_Data[12] |= (TxBuf_Data_RAM_0[b] & 0x0f);  //digit 14 lower nibble
		TxBuf_Data[13] |= (TxBuf_Data_RAM_0[b] & 0xf0) | (TxBuf_Data_RAM_0[a] & 0x0f);  //digit 14 upper nibble and digit 15 lower nibble
		TxBuf_Data[14] |= (TxBuf_Data_RAM_0[a] & 0xf0);  //digit 15 upper nibble
}

 /*Initialize Tx buffer to 0x00 
 *@*
 */
void LCD_RAM_Initialize(void){ 
	int i ;
	for (i = 0 ; i <= 39 ; ++i){
		TxBuf_Data[i] = 0x00;
	}
}