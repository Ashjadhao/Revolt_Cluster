   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  14                     	bsct
  15  0000               _HEADER_ADDRESS_Read:
  16  0000 f1            	dc.b	241
  17  0001               _Rx_Idx:
  18  0001 00            	dc.b	0
  19  0002               _Tx_Idx:
  20  0002 00            	dc.b	0
  21  0003               _NumByteToRead:
  22  0003 1f            	dc.b	31
  23  0004               _NumOfBytes:
  24  0004 1f            	dc.b	31
  25  0005               _TransferStatus1:
  26  0005 00            	dc.b	0
 117                     .const:	section	.text
 118  0000               L6:
 119  0000 00000029      	dc.l	41
 120                     ; 24 void main()
 120                     ; 25 {
 121                     	scross	off
 122                     	switch	.text
 123  0000               _main:
 125  0000 520c          	subw	sp,#12
 126       0000000c      OFST:	set	12
 129                     ; 26 	int p = 0 ;
 131                     ; 27   int	k = 0, i;
 133                     ; 30   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); //16MHz
 135  0002 4f            	clr	a
 136  0003 cd0000        	call	_CLK_HSIPrescalerConfig
 138                     ; 37 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
 140  0006 ae0001        	ldw	x,#1
 141  0009 cd0000        	call	_CLK_PeripheralClockConfig
 143                     ; 40   I2C_Init(I2C_SPEED, 0xA0, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, 16);
 145  000c 4b10          	push	#16
 146  000e 4b00          	push	#0
 147  0010 4b01          	push	#1
 148  0012 4b00          	push	#0
 149  0014 ae00a0        	ldw	x,#160
 150  0017 89            	pushw	x
 151  0018 ae1a80        	ldw	x,#6784
 152  001b 89            	pushw	x
 153  001c ae0006        	ldw	x,#6
 154  001f 89            	pushw	x
 155  0020 cd0000        	call	_I2C_Init
 157  0023 5b0a          	addw	sp,#10
 158                     ; 41 	I2C_StretchClockCmd(ENABLE);
 160  0025 a601          	ld	a,#1
 161  0027 cd0000        	call	_I2C_StretchClockCmd
 163                     ; 43 	LCD_Ini();
 165  002a cd0000        	call	_LCD_Ini
 167                     ; 45 	LCD_RAM_Clear();  
 169  002d cd0000        	call	_LCD_RAM_Clear
 171  0030               L34:
 172                     ; 50 		for(i = 0, j = 0; i <=199, j <= 40 ; ++i, ++j)
 174  0030 ae0000        	ldw	x,#0
 175  0033 1f03          	ldw	(OFST-9,sp),x
 176  0035 ae0000        	ldw	x,#0
 177  0038 1f01          	ldw	(OFST-11,sp),x
 179  003a ae0000        	ldw	x,#0
 180  003d 1f07          	ldw	(OFST-5,sp),x
 181  003f ae0000        	ldw	x,#0
 182  0042 1f05          	ldw	(OFST-7,sp),x
 184  0044               L74:
 185                     ; 54 			LCD_RAM_Initialize();
 187  0044 cd0000        	call	_LCD_RAM_Initialize
 189                     ; 55 			LCD_BT(1);
 191  0047 ae0001        	ldw	x,#1
 192  004a cd0000        	call	_LCD_BT
 194                     ; 56 			LCD_Data_Transmission(1);
 196  004d ae0001        	ldw	x,#1
 197  0050 cd0000        	call	_LCD_Data_Transmission
 199                     ; 57 			LCD_Error(1);
 201  0053 ae0001        	ldw	x,#1
 202  0056 cd0000        	call	_LCD_Error
 204                     ; 58 			LCD_Ignition(1);
 206  0059 ae0001        	ldw	x,#1
 207  005c cd0000        	call	_LCD_Ignition
 209                     ; 59 			LCD_Speaker(1);
 211  005f ae0001        	ldw	x,#1
 212  0062 cd0000        	call	_LCD_Speaker
 214                     ; 60 			LCD_Ambi_Temp(j); //from 0 to 99
 216  0065 1e07          	ldw	x,(OFST-5,sp)
 217  0067 cd0000        	call	_LCD_Ambi_Temp
 219                     ; 61 			LCD_Network(4,0);
 221  006a 5f            	clrw	x
 222  006b 89            	pushw	x
 223  006c ae0004        	ldw	x,#4
 224  006f cd0000        	call	_LCD_Network
 226  0072 85            	popw	x
 227                     ; 62 			LCD_RPM_AMP(0,j); //Shoule be less than MAX_AMP //should be less than MAX_RPM
 229  0073 1e07          	ldw	x,(OFST-5,sp)
 230  0075 89            	pushw	x
 231  0076 5f            	clrw	x
 232  0077 cd0000        	call	_LCD_RPM_AMP
 234  007a 85            	popw	x
 235                     ; 63 			LCD_Controller_Temp(j);
 237  007b 96            	ldw	x,sp
 238  007c 1c0005        	addw	x,#OFST-7
 239  007f cd0000        	call	c_ltor
 241  0082 cd0000        	call	c_ltof
 243  0085 be02          	ldw	x,c_lreg+2
 244  0087 89            	pushw	x
 245  0088 be00          	ldw	x,c_lreg
 246  008a 89            	pushw	x
 247  008b cd0000        	call	_LCD_Controller_Temp
 249  008e 5b04          	addw	sp,#4
 250                     ; 64 			LCD_RPM_Range(0, 0 ,i); //mode Range = 1; RPM = 0; Km_ mi  =>  0 = mi and 1= km 
 252  0090 1e03          	ldw	x,(OFST-9,sp)
 253  0092 89            	pushw	x
 254  0093 1e03          	ldw	x,(OFST-9,sp)
 255  0095 89            	pushw	x
 256  0096 5f            	clrw	x
 257  0097 89            	pushw	x
 258  0098 5f            	clrw	x
 259  0099 cd0000        	call	_LCD_RPM_Range
 261  009c 5b06          	addw	sp,#6
 262                     ; 65 			LCD_Wh_Km(1,j);
 264  009e 1e07          	ldw	x,(OFST-5,sp)
 265  00a0 89            	pushw	x
 266  00a1 ae0001        	ldw	x,#1
 267  00a4 cd0000        	call	_LCD_Wh_Km
 269  00a7 85            	popw	x
 270                     ; 66 			LCD_Mode(2); //1, 2, 3 only
 272  00a8 ae0002        	ldw	x,#2
 273  00ab cd0000        	call	_LCD_Mode
 275                     ; 68 			LCD_Trip(2, 0, i);  //7 digit val //Mode A=1, B=2  and Km=1, Mi=0
 277  00ae 1e03          	ldw	x,(OFST-9,sp)
 278  00b0 89            	pushw	x
 279  00b1 1e03          	ldw	x,(OFST-9,sp)
 280  00b3 89            	pushw	x
 281  00b4 5f            	clrw	x
 282  00b5 89            	pushw	x
 283  00b6 ae0002        	ldw	x,#2
 284  00b9 cd0000        	call	_LCD_Trip
 286  00bc 5b06          	addw	sp,#6
 287                     ; 69 			LCD_Bat_Volt(j); 
 289  00be 96            	ldw	x,sp
 290  00bf 1c0005        	addw	x,#OFST-7
 291  00c2 cd0000        	call	c_ltor
 293  00c5 cd0000        	call	c_ltof
 295  00c8 be02          	ldw	x,c_lreg+2
 296  00ca 89            	pushw	x
 297  00cb be00          	ldw	x,c_lreg
 298  00cd 89            	pushw	x
 299  00ce cd0000        	call	_LCD_Bat_Volt
 301  00d1 5b04          	addw	sp,#4
 302                     ; 70 		  LCD_Speed_RT(i,1); //don't put distance greater than 199
 304  00d3 ae0001        	ldw	x,#1
 305  00d6 89            	pushw	x
 306  00d7 1e05          	ldw	x,(OFST-7,sp)
 307  00d9 89            	pushw	x
 308  00da 1e05          	ldw	x,(OFST-7,sp)
 309  00dc 89            	pushw	x
 310  00dd cd0000        	call	_LCD_Speed_RT
 312  00e0 5b06          	addw	sp,#6
 313                     ; 71 		  LCD_Time_RT(1,10);
 315  00e2 ae000a        	ldw	x,#10
 316  00e5 89            	pushw	x
 317  00e6 ae0001        	ldw	x,#1
 318  00e9 cd0000        	call	_LCD_Time_RT
 320  00ec 85            	popw	x
 321                     ; 72 			LCD_Data_Update();
 323  00ed cd0000        	call	_LCD_Data_Update
 325                     ; 50 		for(i = 0, j = 0; i <=199, j <= 40 ; ++i, ++j)
 327  00f0 96            	ldw	x,sp
 328  00f1 1c0001        	addw	x,#OFST-11
 329  00f4 a601          	ld	a,#1
 330  00f6 cd0000        	call	c_lgadc
 333  00f9 96            	ldw	x,sp
 334  00fa 1c0005        	addw	x,#OFST-7
 335  00fd a601          	ld	a,#1
 336  00ff cd0000        	call	c_lgadc
 341  0102 9c            	rvf
 342  0103 96            	ldw	x,sp
 343  0104 1c0005        	addw	x,#OFST-7
 344  0107 cd0000        	call	c_ltor
 346  010a ae0000        	ldw	x,#L6
 347  010d cd0000        	call	c_lcmp
 349  0110 2e03          	jrsge	L01
 350  0112 cc0044        	jp	L74
 351  0115               L01:
 353  0115 ac300030      	jpf	L34
 387                     ; 104 void Delay(__IO uint32_t nCount)
 387                     ; 105 {
 388                     	switch	.text
 389  0119               _Delay:
 391       00000000      OFST:	set	0
 394  0119 2009          	jra	L77
 395  011b               L37:
 396                     ; 106   for (; nCount != 0; nCount--);
 399  011b 96            	ldw	x,sp
 400  011c 1c0003        	addw	x,#OFST+3
 401  011f a601          	ld	a,#1
 402  0121 cd0000        	call	c_lgsbc
 404  0124               L77:
 407  0124 96            	ldw	x,sp
 408  0125 1c0003        	addw	x,#OFST+3
 409  0128 cd0000        	call	c_lzmp
 411  012b 26ee          	jrne	L37
 412                     ; 107 }
 415  012d 81            	ret
 450                     ; 113 void assert_failed(uint8_t* file, uint32_t line)
 450                     ; 114 {
 451                     	switch	.text
 452  012e               _assert_failed:
 456  012e               L121:
 457  012e 20fe          	jra	L121
 558                     	xdef	_main
 559                     	xdef	_Delay
 560                     	xdef	_TransferStatus1
 561                     	switch	.ubsct
 562  0000               _RxBuffer:
 563  0000 000000000000  	ds.b	31
 564                     	xdef	_RxBuffer
 565                     	xdef	_NumOfBytes
 566                     	xdef	_NumByteToRead
 567                     	xdef	_Tx_Idx
 568                     	xdef	_Rx_Idx
 569                     	xdef	_HEADER_ADDRESS_Read
 570                     	xref	_LCD_RAM_Initialize
 571                     	xref	_LCD_Wh_Km
 572                     	xref	_LCD_RPM_Range
 573                     	xref	_LCD_Trip
 574                     	xref	_LCD_RPM_AMP
 575                     	xref	_LCD_Network
 576                     	xref	_LCD_Ambi_Temp
 577                     	xref	_LCD_Mode
 578                     	xref	_LCD_Controller_Temp
 579                     	xref	_LCD_Error
 580                     	xref	_LCD_Ignition
 581                     	xref	_LCD_Bat_Volt
 582                     	xref	_LCD_Speed_RT
 583                     	xref	_LCD_Speaker
 584                     	xref	_LCD_Data_Transmission
 585                     	xref	_LCD_BT
 586                     	xref	_LCD_Time_RT
 587                     	xref	_LCD_Data_Update
 588                     	xref	_LCD_RAM_Clear
 589                     	xref	_LCD_Ini
 590                     	xdef	_assert_failed
 591                     	xref	_I2C_StretchClockCmd
 592                     	xref	_I2C_Init
 593                     	xref	_CLK_HSIPrescalerConfig
 594                     	xref	_CLK_PeripheralClockConfig
 595                     	xref.b	c_lreg
 615                     	xref	c_lzmp
 616                     	xref	c_lgsbc
 617                     	xref	c_lcmp
 618                     	xref	c_lgadc
 619                     	xref	c_ltof
 620                     	xref	c_ltor
 621                     	end
