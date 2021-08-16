#ifndef __BU91R64CH_lcd_H
#define __BU91R64Ch_lcd_H


void LCD_Ini(void);
void LCD_Disp_OFF(void);
void LCD_RAM_Clear(void);
void LCD_Data_Update_Sequence(void);
void LCD_Data_Update(void);
void LCD_Time_RT(int, int);
void LCD_BT(int ON_OFF);
void LCD_Data_Transmission(int Enab_Disable);
void LCD_Speaker(int ON_OFF);
void LCD_Speed_RT(long Sp , int Parameter);  //Parameter = 1 for Km/h(X10) and 0 means mi/h(X9)
void LCD_Bat_Volt(float Volt);  // 0 to 999
void LCD_Bat_Temp(int Temp);  // 0 to 999
float map(float x, float in_min, float in_max, float out_min, float out_max);
void LCD_Ignition(int Enab_disab);
void LCD_Error(int Flag);
void LCD_Controller_Temp(float Temp); // range 0 to 100 degree celcius
void LCD_Mode(int Mode);
void LCD_Ambi_Temp(int Temp);
void LCD_Network(int Bar, int Disable);
void LCD_Cal_L_Range(int Val, float MAX);
void LCD_RPM_AMP(int Mode, int val); //mode 1=RPM, 0=AMP  //rpm should be from 0 to 999.9 rpm
void LCD_Trip(int Mode, int Km, long Val);//Mode A=1, B=2  and Km=1, Mi=0
void LCD_T(int Val);
void LCD_RPM_Range(int Mode, int Km_mi , long Val); //mode Range = 1; RPM = 0; Km_ mi  =>  0 = mi and 1= km 
void LCD_Wh_Km(int Mode, int val);
void LCD_RAM_Initialize(void);


#endif