   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  14                     	bsct
  15  0000               _TxBuf_sw_rst:
  16  0000 00            	dc.b	0
  17  0001 fd            	dc.b	253
  18  0002 81            	dc.b	129
  19  0003               _TxBuf_Ini:
  20  0003 00            	dc.b	0
  21  0004 c0            	dc.b	192
  22  0005 fd            	dc.b	253
  23  0006 90            	dc.b	144
  24  0007 a0            	dc.b	160
  25  0008 b0            	dc.b	176
  26  0009 c0            	dc.b	192
  27  000a e0            	dc.b	224
  28  000b fc            	dc.b	252
  29  000c ee            	dc.b	238
  30  000d f0            	dc.b	240
  31  000e f8            	dc.b	248
  32  000f e0            	dc.b	224
  33  0010 00            	dc.b	0
  34  0011               _TxBuf_Cntrl_Byte:
  35  0011 40            	dc.b	64
  36  0012               L3_TxBuf_Data:
  37  0012 ff            	dc.b	255
  38  0013 ff            	dc.b	255
  39  0014 ff            	dc.b	255
  40  0015 ff            	dc.b	255
  41  0016 ff            	dc.b	255
  42  0017 ff            	dc.b	255
  43  0018 ff            	dc.b	255
  44  0019 ff            	dc.b	255
  45  001a ff            	dc.b	255
  46  001b ff            	dc.b	255
  47  001c ff            	dc.b	255
  48  001d ff            	dc.b	255
  49  001e ff            	dc.b	255
  50  001f ff            	dc.b	255
  51  0020 ff            	dc.b	255
  52  0021 ff            	dc.b	255
  53  0022 ff            	dc.b	255
  54  0023 ff            	dc.b	255
  55  0024 ff            	dc.b	255
  56  0025 ff            	dc.b	255
  57  0026 ff            	dc.b	255
  58  0027 ff            	dc.b	255
  59  0028 ff            	dc.b	255
  60  0029 ff            	dc.b	255
  61  002a ff            	dc.b	255
  62  002b ff            	dc.b	255
  63  002c ff            	dc.b	255
  64  002d ff            	dc.b	255
  65  002e ff            	dc.b	255
  66  002f ff            	dc.b	255
  67  0030 ff            	dc.b	255
  68  0031 ff            	dc.b	255
  69  0032 ff            	dc.b	255
  70  0033 ff            	dc.b	255
  71  0034 ff            	dc.b	255
  72  0035 ff            	dc.b	255
  73  0036 ff            	dc.b	255
  74  0037 ff            	dc.b	255
  75  0038 ff            	dc.b	255
  76  0039               _TxBuf_Disp:
  77  0039 00            	dc.b	0
  78  003a c8            	dc.b	200
  79  003b               _TxBuf_Data_RAM_0:
  80  003b 005f          	dc.w	95
  81  003d 0050          	dc.w	80
  82  003f 003d          	dc.w	61
  83  0041 0079          	dc.w	121
  84  0043 0072          	dc.w	114
  85  0045 006b          	dc.w	107
  86  0047 006f          	dc.w	111
  87  0049 0051          	dc.w	81
  88  004b 007f          	dc.w	127
  89  004d 007b          	dc.w	123
  90  004f               _TxBuf_Data_RAM_1:
  91  004f 00f5          	dc.w	245
  92  0051 0005          	dc.w	5
  93  0053 00d3          	dc.w	211
  94  0055 0097          	dc.w	151
  95  0057 0027          	dc.w	39
  96  0059 00b6          	dc.w	182
  97  005b 00f6          	dc.w	246
  98  005d 0015          	dc.w	21
  99  005f 00f7          	dc.w	247
 100  0061 00b7          	dc.w	183
 101  0063               _TxBuf_Data_RAM_5:
 102  0063 005f          	dc.w	95
 103  0065 0006          	dc.w	6
 104  0067 006b          	dc.w	107
 105  0069 002f          	dc.w	47
 106  006b 0036          	dc.w	54
 107  006d 003d          	dc.w	61
 108  006f 007d          	dc.w	125
 109  0071 0007          	dc.w	7
 110  0073 007f          	dc.w	127
 111  0075 003f          	dc.w	63
 165                     ; 28 void LCD_Ini(void)
 165                     ; 29  {
 167                     	switch	.text
 168  0000               _LCD_Ini:
 170  0000 89            	pushw	x
 171       00000002      OFST:	set	2
 174                     ; 30   int i = 0;
 176                     ; 31 	GPIO_Init(GPIOD,GPIO_PIN_0,GPIO_MODE_OUT_PP_LOW_FAST);
 178  0001 4be0          	push	#224
 179  0003 4b01          	push	#1
 180  0005 ae500f        	ldw	x,#20495
 181  0008 cd0000        	call	_GPIO_Init
 183  000b 85            	popw	x
 184                     ; 32 	GPIO_WriteHigh(GPIOD, GPIO_PIN_0); //reset
 186  000c 4b01          	push	#1
 187  000e ae500f        	ldw	x,#20495
 188  0011 cd0000        	call	_GPIO_WriteHigh
 190  0014 84            	pop	a
 191                     ; 33   Delay(0x3020);  //wait for 100usec
 193  0015 ae3020        	ldw	x,#12320
 194  0018 89            	pushw	x
 195  0019 ae0000        	ldw	x,#0
 196  001c 89            	pushw	x
 197  001d cd0000        	call	_Delay
 199  0020 5b04          	addw	sp,#4
 200                     ; 35   I2C_GenerateSTART(ENABLE);
 202  0022 a601          	ld	a,#1
 203  0024 cd0000        	call	_I2C_GenerateSTART
 206  0027               L33:
 207                     ; 36 	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
 209  0027 ae0301        	ldw	x,#769
 210  002a cd0000        	call	_I2C_CheckEvent
 212  002d 4d            	tnz	a
 213  002e 27f7          	jreq	L33
 214                     ; 37 	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
 216  0030 ae0301        	ldw	x,#769
 217  0033 cd0000        	call	_I2C_CheckEvent
 219  0036 4d            	tnz	a
 220  0037 2705          	jreq	L73
 221                     ; 39 		I2C_SendData(0xff);
 223  0039 a6ff          	ld	a,#255
 224  003b cd0000        	call	_I2C_SendData
 226  003e               L73:
 227                     ; 43 	I2C_GenerateSTOP(ENABLE);
 229  003e a601          	ld	a,#1
 230  0040 cd0000        	call	_I2C_GenerateSTOP
 232                     ; 46   I2C_GenerateSTART(ENABLE);
 234  0043 a601          	ld	a,#1
 235  0045 cd0000        	call	_I2C_GenerateSTART
 238  0048               L34:
 239                     ; 47 	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
 241  0048 ae0301        	ldw	x,#769
 242  004b cd0000        	call	_I2C_CheckEvent
 244  004e 4d            	tnz	a
 245  004f 27f7          	jreq	L34
 246                     ; 48 	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
 248  0051 ae0301        	ldw	x,#769
 249  0054 cd0000        	call	_I2C_CheckEvent
 251  0057 4d            	tnz	a
 252  0058 2705          	jreq	L74
 253                     ; 50 		I2C_SendData(0xff);
 255  005a a6ff          	ld	a,#255
 256  005c cd0000        	call	_I2C_SendData
 258  005f               L74:
 259                     ; 54 	I2C_GenerateSTOP(ENABLE);
 261  005f a601          	ld	a,#1
 262  0061 cd0000        	call	_I2C_GenerateSTOP
 264                     ; 57 	I2C_GenerateSTART(ENABLE);
 266  0064 a601          	ld	a,#1
 267  0066 cd0000        	call	_I2C_GenerateSTART
 270  0069               L35:
 271                     ; 58 	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
 273  0069 ae0301        	ldw	x,#769
 274  006c cd0000        	call	_I2C_CheckEvent
 276  006f 4d            	tnz	a
 277  0070 27f7          	jreq	L35
 278                     ; 59 	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
 280  0072 ae0301        	ldw	x,#769
 281  0075 cd0000        	call	_I2C_CheckEvent
 283  0078 4d            	tnz	a
 284  0079 2706          	jreq	L36
 285                     ; 61 	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);  //send slave address
 287  007b ae7c00        	ldw	x,#31744
 288  007e cd0000        	call	_I2C_Send7bitAddress
 290  0081               L36:
 291                     ; 65   while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED) == ERROR);
 293  0081 ae0782        	ldw	x,#1922
 294  0084 cd0000        	call	_I2C_CheckEvent
 296  0087 4d            	tnz	a
 297  0088 27f7          	jreq	L36
 298                     ; 66 	i = 0;
 300  008a 5f            	clrw	x
 301  008b 1f01          	ldw	(OFST-1,sp),x
 303                     ; 67 	I2C_SendData(TxBuf_sw_rst[i]);
 305  008d b600          	ld	a,_TxBuf_sw_rst
 306  008f cd0000        	call	_I2C_SendData
 308                     ; 68 	i++;
 310  0092 1e01          	ldw	x,(OFST-1,sp)
 311  0094 1c0001        	addw	x,#1
 312  0097 1f01          	ldw	(OFST-1,sp),x
 315  0099 200d          	jra	L17
 316  009b               L76:
 317                     ; 72 		Delay(0xffff);
 319  009b aeffff        	ldw	x,#65535
 320  009e 89            	pushw	x
 321  009f ae0000        	ldw	x,#0
 322  00a2 89            	pushw	x
 323  00a3 cd0000        	call	_Delay
 325  00a6 5b04          	addw	sp,#4
 326  00a8               L17:
 327                     ; 70 	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING) == ERROR)
 329  00a8 ae0780        	ldw	x,#1920
 330  00ab cd0000        	call	_I2C_CheckEvent
 332  00ae 4d            	tnz	a
 333  00af 27ea          	jreq	L76
 335  00b1 2024          	jra	L77
 336  00b3               L57:
 337                     ; 78 			I2C_SendData(TxBuf_sw_rst[i]);
 339  00b3 1e01          	ldw	x,(OFST-1,sp)
 340  00b5 e600          	ld	a,(_TxBuf_sw_rst,x)
 341  00b7 cd0000        	call	_I2C_SendData
 343                     ; 79 			GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
 345  00ba 4b01          	push	#1
 346  00bc ae500f        	ldw	x,#20495
 347  00bf cd0000        	call	_GPIO_WriteReverse
 349  00c2 84            	pop	a
 350                     ; 80 			Delay(0x0010);  //delay
 352  00c3 ae0010        	ldw	x,#16
 353  00c6 89            	pushw	x
 354  00c7 ae0000        	ldw	x,#0
 355  00ca 89            	pushw	x
 356  00cb cd0000        	call	_Delay
 358  00ce 5b04          	addw	sp,#4
 359                     ; 82 			i++;
 361  00d0 1e01          	ldw	x,(OFST-1,sp)
 362  00d2 1c0001        	addw	x,#1
 363  00d5 1f01          	ldw	(OFST-1,sp),x
 365  00d7               L77:
 366                     ; 75 	while (i < 3)
 368  00d7 9c            	rvf
 369  00d8 1e01          	ldw	x,(OFST-1,sp)
 370  00da a30003        	cpw	x,#3
 371  00dd 2fd4          	jrslt	L57
 373  00df 200d          	jra	L501
 374  00e1               L301:
 375                     ; 87 			Delay(0xffff);
 377  00e1 aeffff        	ldw	x,#65535
 378  00e4 89            	pushw	x
 379  00e5 ae0000        	ldw	x,#0
 380  00e8 89            	pushw	x
 381  00e9 cd0000        	call	_Delay
 383  00ec 5b04          	addw	sp,#4
 384  00ee               L501:
 385                     ; 86 	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED) == ERROR){
 387  00ee ae0784        	ldw	x,#1924
 388  00f1 cd0000        	call	_I2C_CheckEvent
 390  00f4 4d            	tnz	a
 391  00f5 27ea          	jreq	L301
 392                     ; 91 	I2C_GenerateSTOP(ENABLE);
 394  00f7 a601          	ld	a,#1
 395  00f9 cd0000        	call	_I2C_GenerateSTOP
 397                     ; 95 	I2C_GenerateSTART(ENABLE);
 399  00fc a601          	ld	a,#1
 400  00fe cd0000        	call	_I2C_GenerateSTART
 403  0101               L311:
 404                     ; 96 	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
 406  0101 ae0301        	ldw	x,#769
 407  0104 cd0000        	call	_I2C_CheckEvent
 409  0107 4d            	tnz	a
 410  0108 27f7          	jreq	L311
 411                     ; 97 	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
 413  010a ae0301        	ldw	x,#769
 414  010d cd0000        	call	_I2C_CheckEvent
 416  0110 4d            	tnz	a
 417  0111 2706          	jreq	L321
 418                     ; 99 	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);  //send slave address
 420  0113 ae7c00        	ldw	x,#31744
 421  0116 cd0000        	call	_I2C_Send7bitAddress
 423  0119               L321:
 424                     ; 102   while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)== ERROR);
 426  0119 ae0782        	ldw	x,#1922
 427  011c cd0000        	call	_I2C_CheckEvent
 429  011f 4d            	tnz	a
 430  0120 27f7          	jreq	L321
 431                     ; 103 	i = 0;
 433  0122 5f            	clrw	x
 434  0123 1f01          	ldw	(OFST-1,sp),x
 436                     ; 104 	I2C_SendData(TxBuf_Ini[i]);
 438  0125 b603          	ld	a,_TxBuf_Ini
 439  0127 cd0000        	call	_I2C_SendData
 441                     ; 105 	i++;
 443  012a 1e01          	ldw	x,(OFST-1,sp)
 444  012c 1c0001        	addw	x,#1
 445  012f 1f01          	ldw	(OFST-1,sp),x
 448  0131               L131:
 449                     ; 106   while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR);
 451  0131 ae0780        	ldw	x,#1920
 452  0134 cd0000        	call	_I2C_CheckEvent
 454  0137 4d            	tnz	a
 455  0138 27f7          	jreq	L131
 456                     ; 108 		Delay(0xffff);
 458  013a aeffff        	ldw	x,#65535
 459  013d 89            	pushw	x
 460  013e ae0000        	ldw	x,#0
 461  0141 89            	pushw	x
 462  0142 cd0000        	call	_Delay
 464  0145 5b04          	addw	sp,#4
 466  0147 2024          	jra	L731
 467  0149               L531:
 468                     ; 114 		I2C_SendData(TxBuf_Ini[i]);
 470  0149 1e01          	ldw	x,(OFST-1,sp)
 471  014b e603          	ld	a,(_TxBuf_Ini,x)
 472  014d cd0000        	call	_I2C_SendData
 474                     ; 115 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
 476  0150 4b01          	push	#1
 477  0152 ae500f        	ldw	x,#20495
 478  0155 cd0000        	call	_GPIO_WriteReverse
 480  0158 84            	pop	a
 481                     ; 116 		Delay(0x0010);  // delay
 483  0159 ae0010        	ldw	x,#16
 484  015c 89            	pushw	x
 485  015d ae0000        	ldw	x,#0
 486  0160 89            	pushw	x
 487  0161 cd0000        	call	_Delay
 489  0164 5b04          	addw	sp,#4
 490                     ; 117 		i++;
 492  0166 1e01          	ldw	x,(OFST-1,sp)
 493  0168 1c0001        	addw	x,#1
 494  016b 1f01          	ldw	(OFST-1,sp),x
 496  016d               L731:
 497                     ; 111 	while (i < 14)
 499  016d 9c            	rvf
 500  016e 1e01          	ldw	x,(OFST-1,sp)
 501  0170 a3000e        	cpw	x,#14
 502  0173 2fd4          	jrslt	L531
 504  0175 200d          	jra	L541
 505  0177               L341:
 506                     ; 122 		Delay(0xffff);
 508  0177 aeffff        	ldw	x,#65535
 509  017a 89            	pushw	x
 510  017b ae0000        	ldw	x,#0
 511  017e 89            	pushw	x
 512  017f cd0000        	call	_Delay
 514  0182 5b04          	addw	sp,#4
 515  0184               L541:
 516                     ; 120 	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)== ERROR)
 518  0184 ae0784        	ldw	x,#1924
 519  0187 cd0000        	call	_I2C_CheckEvent
 521  018a 4d            	tnz	a
 522  018b 27ea          	jreq	L341
 523                     ; 126 	I2C_GenerateSTOP(ENABLE);
 525  018d a601          	ld	a,#1
 526  018f cd0000        	call	_I2C_GenerateSTOP
 528                     ; 129 	I2C_GenerateSTART(ENABLE);
 530  0192 a601          	ld	a,#1
 531  0194 cd0000        	call	_I2C_GenerateSTART
 534  0197               L351:
 535                     ; 130 	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
 537  0197 ae0301        	ldw	x,#769
 538  019a cd0000        	call	_I2C_CheckEvent
 540  019d 4d            	tnz	a
 541  019e 27f7          	jreq	L351
 542                     ; 131 	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
 544  01a0 ae0301        	ldw	x,#769
 545  01a3 cd0000        	call	_I2C_CheckEvent
 547  01a6 4d            	tnz	a
 548  01a7 2706          	jreq	L361
 549                     ; 134 	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX); //send slave address
 551  01a9 ae7c00        	ldw	x,#31744
 552  01ac cd0000        	call	_I2C_Send7bitAddress
 554  01af               L361:
 555                     ; 137   while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)== ERROR);
 557  01af ae0782        	ldw	x,#1922
 558  01b2 cd0000        	call	_I2C_CheckEvent
 560  01b5 4d            	tnz	a
 561  01b6 27f7          	jreq	L361
 562                     ; 140 	I2C_SendData(TxBuf_Cntrl_Byte);
 564  01b8 b611          	ld	a,_TxBuf_Cntrl_Byte
 565  01ba cd0000        	call	_I2C_SendData
 568  01bd 200d          	jra	L171
 569  01bf               L761:
 570                     ; 145 		Delay(0xffff);
 572  01bf aeffff        	ldw	x,#65535
 573  01c2 89            	pushw	x
 574  01c3 ae0000        	ldw	x,#0
 575  01c6 89            	pushw	x
 576  01c7 cd0000        	call	_Delay
 578  01ca 5b04          	addw	sp,#4
 579  01cc               L171:
 580                     ; 143   while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR)
 582  01cc ae0780        	ldw	x,#1920
 583  01cf cd0000        	call	_I2C_CheckEvent
 585  01d2 4d            	tnz	a
 586  01d3 27ea          	jreq	L761
 587                     ; 147 	i = 0;
 589  01d5 5f            	clrw	x
 590  01d6 1f01          	ldw	(OFST-1,sp),x
 592  01d8               L571:
 593                     ; 151 		I2C_SendData(TxBuf_Data[i]);
 595  01d8 1e01          	ldw	x,(OFST-1,sp)
 596  01da e612          	ld	a,(L3_TxBuf_Data,x)
 597  01dc cd0000        	call	_I2C_SendData
 599                     ; 152 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
 601  01df 4b01          	push	#1
 602  01e1 ae500f        	ldw	x,#20495
 603  01e4 cd0000        	call	_GPIO_WriteReverse
 605  01e7 84            	pop	a
 606                     ; 153 		Delay(0x0010);  // delay
 608  01e8 ae0010        	ldw	x,#16
 609  01eb 89            	pushw	x
 610  01ec ae0000        	ldw	x,#0
 611  01ef 89            	pushw	x
 612  01f0 cd0000        	call	_Delay
 614  01f3 5b04          	addw	sp,#4
 615                     ; 154 		i++;
 617  01f5 1e01          	ldw	x,(OFST-1,sp)
 618  01f7 1c0001        	addw	x,#1
 619  01fa 1f01          	ldw	(OFST-1,sp),x
 621                     ; 148 	while (i < 40)
 621                     ; 149 	{
 621                     ; 150 		/* Send the first Data */
 621                     ; 151 		I2C_SendData(TxBuf_Data[i]);
 621                     ; 152 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
 621                     ; 153 		Delay(0x0010);  // delay
 621                     ; 154 		i++;
 623  01fc 9c            	rvf
 624  01fd 1e01          	ldw	x,(OFST-1,sp)
 625  01ff a30028        	cpw	x,#40
 626  0202 2fd4          	jrslt	L571
 628  0204 200d          	jra	L502
 629  0206               L302:
 630                     ; 159 		Delay(0xffff);
 632  0206 aeffff        	ldw	x,#65535
 633  0209 89            	pushw	x
 634  020a ae0000        	ldw	x,#0
 635  020d 89            	pushw	x
 636  020e cd0000        	call	_Delay
 638  0211 5b04          	addw	sp,#4
 639  0213               L502:
 640                     ; 157 	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)== ERROR)
 642  0213 ae0784        	ldw	x,#1924
 643  0216 cd0000        	call	_I2C_CheckEvent
 645  0219 4d            	tnz	a
 646  021a 27ea          	jreq	L302
 647                     ; 163 	I2C_GenerateSTOP(ENABLE);
 649  021c a601          	ld	a,#1
 650  021e cd0000        	call	_I2C_GenerateSTOP
 652                     ; 166 	I2C_GenerateSTART(ENABLE);
 654  0221 a601          	ld	a,#1
 655  0223 cd0000        	call	_I2C_GenerateSTART
 658  0226               L312:
 659                     ; 167 	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
 661  0226 ae0301        	ldw	x,#769
 662  0229 cd0000        	call	_I2C_CheckEvent
 664  022c 4d            	tnz	a
 665  022d 27f7          	jreq	L312
 666                     ; 168 	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
 668  022f ae0301        	ldw	x,#769
 669  0232 cd0000        	call	_I2C_CheckEvent
 671  0235 4d            	tnz	a
 672  0236 2706          	jreq	L322
 673                     ; 171 	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);  //send slave address
 675  0238 ae7c00        	ldw	x,#31744
 676  023b cd0000        	call	_I2C_Send7bitAddress
 678  023e               L322:
 679                     ; 174  	while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)== ERROR);
 681  023e ae0782        	ldw	x,#1922
 682  0241 cd0000        	call	_I2C_CheckEvent
 684  0244 4d            	tnz	a
 685  0245 27f7          	jreq	L322
 686                     ; 177 	i = 0;
 688  0247 5f            	clrw	x
 689  0248 1f01          	ldw	(OFST-1,sp),x
 691                     ; 178 	I2C_SendData(TxBuf_Disp[i]);
 693  024a b639          	ld	a,_TxBuf_Disp
 694  024c cd0000        	call	_I2C_SendData
 696                     ; 179 	i++;
 698  024f 1e01          	ldw	x,(OFST-1,sp)
 699  0251 1c0001        	addw	x,#1
 700  0254 1f01          	ldw	(OFST-1,sp),x
 703  0256 200d          	jra	L132
 704  0258               L722:
 705                     ; 183 		Delay(0xffff);
 707  0258 aeffff        	ldw	x,#65535
 708  025b 89            	pushw	x
 709  025c ae0000        	ldw	x,#0
 710  025f 89            	pushw	x
 711  0260 cd0000        	call	_Delay
 713  0263 5b04          	addw	sp,#4
 714  0265               L132:
 715                     ; 181   while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR)
 717  0265 ae0780        	ldw	x,#1920
 718  0268 cd0000        	call	_I2C_CheckEvent
 720  026b 4d            	tnz	a
 721  026c 27ea          	jreq	L722
 723  026e 2024          	jra	L732
 724  0270               L532:
 725                     ; 189 		I2C_SendData(TxBuf_Disp[i]);
 727  0270 1e01          	ldw	x,(OFST-1,sp)
 728  0272 e639          	ld	a,(_TxBuf_Disp,x)
 729  0274 cd0000        	call	_I2C_SendData
 731                     ; 190 	 	GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
 733  0277 4b01          	push	#1
 734  0279 ae500f        	ldw	x,#20495
 735  027c cd0000        	call	_GPIO_WriteReverse
 737  027f 84            	pop	a
 738                     ; 191 		Delay(0x0010);  // delay
 740  0280 ae0010        	ldw	x,#16
 741  0283 89            	pushw	x
 742  0284 ae0000        	ldw	x,#0
 743  0287 89            	pushw	x
 744  0288 cd0000        	call	_Delay
 746  028b 5b04          	addw	sp,#4
 747                     ; 192 		i++;
 749  028d 1e01          	ldw	x,(OFST-1,sp)
 750  028f 1c0001        	addw	x,#1
 751  0292 1f01          	ldw	(OFST-1,sp),x
 753  0294               L732:
 754                     ; 186 	while (i < 2)
 756  0294 9c            	rvf
 757  0295 1e01          	ldw	x,(OFST-1,sp)
 758  0297 a30002        	cpw	x,#2
 759  029a 2fd4          	jrslt	L532
 761  029c 200d          	jra	L542
 762  029e               L342:
 763                     ; 197   	Delay(0xffff);
 765  029e aeffff        	ldw	x,#65535
 766  02a1 89            	pushw	x
 767  02a2 ae0000        	ldw	x,#0
 768  02a5 89            	pushw	x
 769  02a6 cd0000        	call	_Delay
 771  02a9 5b04          	addw	sp,#4
 772  02ab               L542:
 773                     ; 195 	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)== ERROR)
 775  02ab ae0784        	ldw	x,#1924
 776  02ae cd0000        	call	_I2C_CheckEvent
 778  02b1 4d            	tnz	a
 779  02b2 27ea          	jreq	L342
 780                     ; 201 	I2C_GenerateSTOP(ENABLE);
 782  02b4 a601          	ld	a,#1
 783  02b6 cd0000        	call	_I2C_GenerateSTOP
 785                     ; 204   Delay(0xFFFF);
 787  02b9 aeffff        	ldw	x,#65535
 788  02bc 89            	pushw	x
 789  02bd ae0000        	ldw	x,#0
 790  02c0 89            	pushw	x
 791  02c1 cd0000        	call	_Delay
 793  02c4 5b04          	addw	sp,#4
 794                     ; 205 }
 797  02c6 85            	popw	x
 798  02c7 81            	ret
 828                     ; 211 	void LCD_Disp_OFF(void){
 829                     	switch	.text
 830  02c8               _LCD_Disp_OFF:
 834                     ; 214 	I2C_GenerateSTART(ENABLE);
 836  02c8 a601          	ld	a,#1
 837  02ca cd0000        	call	_I2C_GenerateSTART
 840  02cd               L362:
 841                     ; 215 	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
 843  02cd ae0301        	ldw	x,#769
 844  02d0 cd0000        	call	_I2C_CheckEvent
 846  02d3 4d            	tnz	a
 847  02d4 27f7          	jreq	L362
 848                     ; 216 	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
 850  02d6 ae0301        	ldw	x,#769
 851  02d9 cd0000        	call	_I2C_CheckEvent
 853  02dc 4d            	tnz	a
 854  02dd 2706          	jreq	L372
 855                     ; 219 	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);
 857  02df ae7c00        	ldw	x,#31744
 858  02e2 cd0000        	call	_I2C_Send7bitAddress
 860  02e5               L372:
 861                     ; 222  	while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)== ERROR);
 863  02e5 ae0782        	ldw	x,#1922
 864  02e8 cd0000        	call	_I2C_CheckEvent
 866  02eb 4d            	tnz	a
 867  02ec 27f7          	jreq	L372
 868                     ; 223 	I2C_SendData(0x00);
 870  02ee 4f            	clr	a
 871  02ef cd0000        	call	_I2C_SendData
 874  02f2 200d          	jra	L103
 875  02f4               L772:
 876                     ; 226 		Delay(0xffff);
 878  02f4 aeffff        	ldw	x,#65535
 879  02f7 89            	pushw	x
 880  02f8 ae0000        	ldw	x,#0
 881  02fb 89            	pushw	x
 882  02fc cd0000        	call	_Delay
 884  02ff 5b04          	addw	sp,#4
 885  0301               L103:
 886                     ; 224   while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR)
 888  0301 ae0780        	ldw	x,#1920
 889  0304 cd0000        	call	_I2C_CheckEvent
 891  0307 4d            	tnz	a
 892  0308 27ea          	jreq	L772
 893                     ; 230 	I2C_SendData(0xC0);
 895  030a a6c0          	ld	a,#192
 896  030c cd0000        	call	_I2C_SendData
 898                     ; 231 	GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
 900  030f 4b01          	push	#1
 901  0311 ae500f        	ldw	x,#20495
 902  0314 cd0000        	call	_GPIO_WriteReverse
 904  0317 84            	pop	a
 905                     ; 232 	Delay(0x0010);  //1msec delay
 907  0318 ae0010        	ldw	x,#16
 908  031b 89            	pushw	x
 909  031c ae0000        	ldw	x,#0
 910  031f 89            	pushw	x
 911  0320 cd0000        	call	_Delay
 913  0323 5b04          	addw	sp,#4
 915  0325 200d          	jra	L703
 916  0327               L503:
 917                     ; 236   	Delay(0xffff);
 919  0327 aeffff        	ldw	x,#65535
 920  032a 89            	pushw	x
 921  032b ae0000        	ldw	x,#0
 922  032e 89            	pushw	x
 923  032f cd0000        	call	_Delay
 925  0332 5b04          	addw	sp,#4
 926  0334               L703:
 927                     ; 234 	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)== ERROR)
 929  0334 ae0784        	ldw	x,#1924
 930  0337 cd0000        	call	_I2C_CheckEvent
 932  033a 4d            	tnz	a
 933  033b 27ea          	jreq	L503
 934                     ; 240 	I2C_GenerateSTOP(ENABLE);
 936  033d a601          	ld	a,#1
 937  033f cd0000        	call	_I2C_GenerateSTOP
 939                     ; 242   Delay(0xFFFF);
 941  0342 aeffff        	ldw	x,#65535
 942  0345 89            	pushw	x
 943  0346 ae0000        	ldw	x,#0
 944  0349 89            	pushw	x
 945  034a cd0000        	call	_Delay
 947  034d 5b04          	addw	sp,#4
 948                     ; 243 }
 951  034f 81            	ret
 994                     ; 248 void LCD_Data_Update_Sequence(void){
 995                     	switch	.text
 996  0350               _LCD_Data_Update_Sequence:
 998  0350 89            	pushw	x
 999       00000002      OFST:	set	2
1002                     ; 249 	int i = 0, j;
1004                     ; 252 	I2C_GenerateSTART(ENABLE);
1006  0351 a601          	ld	a,#1
1007  0353 cd0000        	call	_I2C_GenerateSTART
1010  0356               L333:
1011                     ; 253 	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
1013  0356 ae0301        	ldw	x,#769
1014  0359 cd0000        	call	_I2C_CheckEvent
1016  035c 4d            	tnz	a
1017  035d 27f7          	jreq	L333
1018                     ; 254 	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
1020  035f ae0301        	ldw	x,#769
1021  0362 cd0000        	call	_I2C_CheckEvent
1023  0365 4d            	tnz	a
1024  0366 2706          	jreq	L343
1025                     ; 256 	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);
1027  0368 ae7c00        	ldw	x,#31744
1028  036b cd0000        	call	_I2C_Send7bitAddress
1030  036e               L343:
1031                     ; 259   while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)== ERROR);
1033  036e ae0782        	ldw	x,#1922
1034  0371 cd0000        	call	_I2C_CheckEvent
1036  0374 4d            	tnz	a
1037  0375 27f7          	jreq	L343
1038                     ; 260 	i = 0;
1040  0377 5f            	clrw	x
1041  0378 1f01          	ldw	(OFST-1,sp),x
1043                     ; 261 	I2C_SendData(TxBuf_Ini[i]);
1045  037a b603          	ld	a,_TxBuf_Ini
1046  037c cd0000        	call	_I2C_SendData
1048                     ; 262 	i++;
1050  037f 1e01          	ldw	x,(OFST-1,sp)
1051  0381 1c0001        	addw	x,#1
1052  0384 1f01          	ldw	(OFST-1,sp),x
1055  0386               L153:
1056                     ; 263   while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR);
1058  0386 ae0780        	ldw	x,#1920
1059  0389 cd0000        	call	_I2C_CheckEvent
1061  038c 4d            	tnz	a
1062  038d 27f7          	jreq	L153
1063                     ; 265 		Delay(0xffff);
1065  038f aeffff        	ldw	x,#65535
1066  0392 89            	pushw	x
1067  0393 ae0000        	ldw	x,#0
1068  0396 89            	pushw	x
1069  0397 cd0000        	call	_Delay
1071  039a 5b04          	addw	sp,#4
1073  039c 2032          	jra	L753
1074  039e               L553:
1075                     ; 270 		if(i == 1){
1077  039e 1e01          	ldw	x,(OFST-1,sp)
1078  03a0 a30001        	cpw	x,#1
1079  03a3 2607          	jrne	L363
1080                     ; 271 			I2C_SendData(0xC8);
1082  03a5 a6c8          	ld	a,#200
1083  03a7 cd0000        	call	_I2C_SendData
1086  03aa 2007          	jra	L563
1087  03ac               L363:
1088                     ; 274 			I2C_SendData(TxBuf_Ini[i]);
1090  03ac 1e01          	ldw	x,(OFST-1,sp)
1091  03ae e603          	ld	a,(_TxBuf_Ini,x)
1092  03b0 cd0000        	call	_I2C_SendData
1094  03b3               L563:
1095                     ; 277 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
1097  03b3 4b01          	push	#1
1098  03b5 ae500f        	ldw	x,#20495
1099  03b8 cd0000        	call	_GPIO_WriteReverse
1101  03bb 84            	pop	a
1102                     ; 278 		Delay(0x0010);  //1msec delay
1104  03bc ae0010        	ldw	x,#16
1105  03bf 89            	pushw	x
1106  03c0 ae0000        	ldw	x,#0
1107  03c3 89            	pushw	x
1108  03c4 cd0000        	call	_Delay
1110  03c7 5b04          	addw	sp,#4
1111                     ; 281 		i++;
1113  03c9 1e01          	ldw	x,(OFST-1,sp)
1114  03cb 1c0001        	addw	x,#1
1115  03ce 1f01          	ldw	(OFST-1,sp),x
1117  03d0               L753:
1118                     ; 268 	while (i < 14)
1120  03d0 9c            	rvf
1121  03d1 1e01          	ldw	x,(OFST-1,sp)
1122  03d3 a3000e        	cpw	x,#14
1123  03d6 2fc6          	jrslt	L553
1125  03d8 200d          	jra	L173
1126  03da               L763:
1127                     ; 286 		Delay(0xffff);
1129  03da aeffff        	ldw	x,#65535
1130  03dd 89            	pushw	x
1131  03de ae0000        	ldw	x,#0
1132  03e1 89            	pushw	x
1133  03e2 cd0000        	call	_Delay
1135  03e5 5b04          	addw	sp,#4
1136  03e7               L173:
1137                     ; 284 	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)== ERROR)
1139  03e7 ae0784        	ldw	x,#1924
1140  03ea cd0000        	call	_I2C_CheckEvent
1142  03ed 4d            	tnz	a
1143  03ee 27ea          	jreq	L763
1144                     ; 290 	I2C_GenerateSTOP(ENABLE);
1146  03f0 a601          	ld	a,#1
1147  03f2 cd0000        	call	_I2C_GenerateSTOP
1149                     ; 292 }
1152  03f5 85            	popw	x
1153  03f6 81            	ret
1197                     ; 297 void LCD_Data_Update(void){
1198                     	switch	.text
1199  03f7               _LCD_Data_Update:
1201  03f7 89            	pushw	x
1202       00000002      OFST:	set	2
1205                     ; 298 	int i = 0;
1207                     ; 299 		LCD_Data_Update_Sequence();
1209  03f8 cd0350        	call	_LCD_Data_Update_Sequence
1211                     ; 302 	I2C_GenerateSTART(ENABLE);
1213  03fb a601          	ld	a,#1
1214  03fd cd0000        	call	_I2C_GenerateSTART
1217  0400               L514:
1218                     ; 303 	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
1220  0400 ae0301        	ldw	x,#769
1221  0403 cd0000        	call	_I2C_CheckEvent
1223  0406 4d            	tnz	a
1224  0407 27f7          	jreq	L514
1225                     ; 304 	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
1227  0409 ae0301        	ldw	x,#769
1228  040c cd0000        	call	_I2C_CheckEvent
1230  040f 4d            	tnz	a
1231  0410 2706          	jreq	L524
1232                     ; 307 	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);
1234  0412 ae7c00        	ldw	x,#31744
1235  0415 cd0000        	call	_I2C_Send7bitAddress
1237  0418               L524:
1238                     ; 310   while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)== ERROR);
1240  0418 ae0782        	ldw	x,#1922
1241  041b cd0000        	call	_I2C_CheckEvent
1243  041e 4d            	tnz	a
1244  041f 27f7          	jreq	L524
1245                     ; 312 	I2C_SendData(TxBuf_Cntrl_Byte);  //update data  =0x40
1247  0421 b611          	ld	a,_TxBuf_Cntrl_Byte
1248  0423 cd0000        	call	_I2C_SendData
1251  0426 200d          	jra	L334
1252  0428               L134:
1253                     ; 316 		Delay(0xffff);
1255  0428 aeffff        	ldw	x,#65535
1256  042b 89            	pushw	x
1257  042c ae0000        	ldw	x,#0
1258  042f 89            	pushw	x
1259  0430 cd0000        	call	_Delay
1261  0433 5b04          	addw	sp,#4
1262  0435               L334:
1263                     ; 314   while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR)
1265  0435 ae0780        	ldw	x,#1920
1266  0438 cd0000        	call	_I2C_CheckEvent
1268  043b 4d            	tnz	a
1269  043c 27ea          	jreq	L134
1270                     ; 318 	i = 0;
1272  043e 5f            	clrw	x
1273  043f 1f01          	ldw	(OFST-1,sp),x
1275  0441               L734:
1276                     ; 322 		I2C_SendData(TxBuf_Data[i]);
1278  0441 1e01          	ldw	x,(OFST-1,sp)
1279  0443 e612          	ld	a,(L3_TxBuf_Data,x)
1280  0445 cd0000        	call	_I2C_SendData
1282                     ; 323 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
1284  0448 4b01          	push	#1
1285  044a ae500f        	ldw	x,#20495
1286  044d cd0000        	call	_GPIO_WriteReverse
1288  0450 84            	pop	a
1289                     ; 324 		Delay(0x0010);  //1msec delay
1291  0451 ae0010        	ldw	x,#16
1292  0454 89            	pushw	x
1293  0455 ae0000        	ldw	x,#0
1294  0458 89            	pushw	x
1295  0459 cd0000        	call	_Delay
1297  045c 5b04          	addw	sp,#4
1298                     ; 325 		i++;
1300  045e 1e01          	ldw	x,(OFST-1,sp)
1301  0460 1c0001        	addw	x,#1
1302  0463 1f01          	ldw	(OFST-1,sp),x
1304                     ; 319 	while (i < 40)
1304                     ; 320 	{
1304                     ; 321 		/* Send the first Data */
1304                     ; 322 		I2C_SendData(TxBuf_Data[i]);
1304                     ; 323 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
1304                     ; 324 		Delay(0x0010);  //1msec delay
1304                     ; 325 		i++;
1306  0465 9c            	rvf
1307  0466 1e01          	ldw	x,(OFST-1,sp)
1308  0468 a30028        	cpw	x,#40
1309  046b 2fd4          	jrslt	L734
1311  046d 200d          	jra	L744
1312  046f               L544:
1313                     ; 330 		Delay(0xffff);
1315  046f aeffff        	ldw	x,#65535
1316  0472 89            	pushw	x
1317  0473 ae0000        	ldw	x,#0
1318  0476 89            	pushw	x
1319  0477 cd0000        	call	_Delay
1321  047a 5b04          	addw	sp,#4
1322  047c               L744:
1323                     ; 328 	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)== ERROR)
1325  047c ae0784        	ldw	x,#1924
1326  047f cd0000        	call	_I2C_CheckEvent
1328  0482 4d            	tnz	a
1329  0483 27ea          	jreq	L544
1330                     ; 333 	I2C_GenerateSTOP(ENABLE);
1332  0485 a601          	ld	a,#1
1333  0487 cd0000        	call	_I2C_GenerateSTOP
1335                     ; 335 }
1338  048a 85            	popw	x
1339  048b 81            	ret
1420                     ; 340 void LCD_Time_RT(int hr, int mm){
1421                     	switch	.text
1422  048c               _LCD_Time_RT:
1424  048c 89            	pushw	x
1425  048d 5208          	subw	sp,#8
1426       00000008      OFST:	set	8
1429                     ; 342 	j = hr / 10;
1431  048f a60a          	ld	a,#10
1432  0491 cd0000        	call	c_sdivx
1434  0494 1f01          	ldw	(OFST-7,sp),x
1436                     ; 343 	k = hr % 10;
1438  0496 1e09          	ldw	x,(OFST+1,sp)
1439  0498 a60a          	ld	a,#10
1440  049a cd0000        	call	c_smodx
1442  049d 1f03          	ldw	(OFST-5,sp),x
1444                     ; 344 	l = mm / 10;
1446  049f 1e0d          	ldw	x,(OFST+5,sp)
1447  04a1 a60a          	ld	a,#10
1448  04a3 cd0000        	call	c_sdivx
1450  04a6 1f05          	ldw	(OFST-3,sp),x
1452                     ; 345 	m = mm % 10;
1454  04a8 1e0d          	ldw	x,(OFST+5,sp)
1455  04aa a60a          	ld	a,#10
1456  04ac cd0000        	call	c_smodx
1458  04af 1f07          	ldw	(OFST-1,sp),x
1460                     ; 347 	TxBuf_Data[31] |= TxBuf_Data_RAM_5[j];
1462  04b1 1e01          	ldw	x,(OFST-7,sp)
1463  04b3 58            	sllw	x
1464  04b4 b631          	ld	a,L3_TxBuf_Data+31
1465  04b6 ea64          	or	a,(_TxBuf_Data_RAM_5+1,x)
1466  04b8 b731          	ld	L3_TxBuf_Data+31,a
1467                     ; 348 	TxBuf_Data[32] |= TxBuf_Data_RAM_5[k];
1469  04ba 1e03          	ldw	x,(OFST-5,sp)
1470  04bc 58            	sllw	x
1471  04bd b632          	ld	a,L3_TxBuf_Data+32
1472  04bf ea64          	or	a,(_TxBuf_Data_RAM_5+1,x)
1473  04c1 b732          	ld	L3_TxBuf_Data+32,a
1474                     ; 349 	TxBuf_Data[33] |= TxBuf_Data_RAM_5[l] | 0x80;
1476  04c3 1e05          	ldw	x,(OFST-3,sp)
1477  04c5 58            	sllw	x
1478  04c6 e664          	ld	a,(_TxBuf_Data_RAM_5+1,x)
1479  04c8 aa80          	or	a,#128
1480  04ca ba33          	or	a,L3_TxBuf_Data+33
1481  04cc b733          	ld	L3_TxBuf_Data+33,a
1482                     ; 350 	TxBuf_Data[34] |= TxBuf_Data_RAM_5[m];
1484  04ce 1e07          	ldw	x,(OFST-1,sp)
1485  04d0 58            	sllw	x
1486  04d1 b634          	ld	a,L3_TxBuf_Data+34
1487  04d3 ea64          	or	a,(_TxBuf_Data_RAM_5+1,x)
1488  04d5 b734          	ld	L3_TxBuf_Data+34,a
1489                     ; 352 }
1492  04d7 5b0a          	addw	sp,#10
1493  04d9 81            	ret
1537                     ; 357 void LCD_RAM_Clear(void){
1538                     	switch	.text
1539  04da               _LCD_RAM_Clear:
1541  04da 89            	pushw	x
1542       00000002      OFST:	set	2
1545                     ; 358 	int i = 0;
1547                     ; 361 	I2C_GenerateSTART(ENABLE);
1549  04db a601          	ld	a,#1
1550  04dd cd0000        	call	_I2C_GenerateSTART
1553  04e0               L535:
1554                     ; 362 	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
1556  04e0 ae0301        	ldw	x,#769
1557  04e3 cd0000        	call	_I2C_CheckEvent
1559  04e6 4d            	tnz	a
1560  04e7 27f7          	jreq	L535
1561                     ; 363 	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
1563  04e9 ae0301        	ldw	x,#769
1564  04ec cd0000        	call	_I2C_CheckEvent
1566  04ef 4d            	tnz	a
1567  04f0 2706          	jreq	L545
1568                     ; 365 	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);
1570  04f2 ae7c00        	ldw	x,#31744
1571  04f5 cd0000        	call	_I2C_Send7bitAddress
1573  04f8               L545:
1574                     ; 368   while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)== ERROR);
1576  04f8 ae0782        	ldw	x,#1922
1577  04fb cd0000        	call	_I2C_CheckEvent
1579  04fe 4d            	tnz	a
1580  04ff 27f7          	jreq	L545
1581                     ; 369 	i = 0;
1583  0501 5f            	clrw	x
1584  0502 1f01          	ldw	(OFST-1,sp),x
1586                     ; 370 	I2C_SendData(TxBuf_Ini[i]);
1588  0504 b603          	ld	a,_TxBuf_Ini
1589  0506 cd0000        	call	_I2C_SendData
1591                     ; 371 	i++;
1593  0509 1e01          	ldw	x,(OFST-1,sp)
1594  050b 1c0001        	addw	x,#1
1595  050e 1f01          	ldw	(OFST-1,sp),x
1598  0510               L355:
1599                     ; 372   while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR);
1601  0510 ae0780        	ldw	x,#1920
1602  0513 cd0000        	call	_I2C_CheckEvent
1604  0516 4d            	tnz	a
1605  0517 27f7          	jreq	L355
1606                     ; 374 		Delay(0xffff);
1608  0519 aeffff        	ldw	x,#65535
1609  051c 89            	pushw	x
1610  051d ae0000        	ldw	x,#0
1611  0520 89            	pushw	x
1612  0521 cd0000        	call	_Delay
1614  0524 5b04          	addw	sp,#4
1616  0526 2032          	jra	L165
1617  0528               L755:
1618                     ; 380 		if( i == 1)
1620  0528 1e01          	ldw	x,(OFST-1,sp)
1621  052a a30001        	cpw	x,#1
1622  052d 2607          	jrne	L565
1623                     ; 382 			I2C_SendData(0xc0); //Display ON
1625  052f a6c0          	ld	a,#192
1626  0531 cd0000        	call	_I2C_SendData
1629  0534 2007          	jra	L765
1630  0536               L565:
1631                     ; 386 			I2C_SendData(TxBuf_Ini[i]);
1633  0536 1e01          	ldw	x,(OFST-1,sp)
1634  0538 e603          	ld	a,(_TxBuf_Ini,x)
1635  053a cd0000        	call	_I2C_SendData
1637  053d               L765:
1638                     ; 388 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
1640  053d 4b01          	push	#1
1641  053f ae500f        	ldw	x,#20495
1642  0542 cd0000        	call	_GPIO_WriteReverse
1644  0545 84            	pop	a
1645                     ; 389 		Delay(0x0040);  //1msec delay
1647  0546 ae0040        	ldw	x,#64
1648  0549 89            	pushw	x
1649  054a ae0000        	ldw	x,#0
1650  054d 89            	pushw	x
1651  054e cd0000        	call	_Delay
1653  0551 5b04          	addw	sp,#4
1654                     ; 392 		i++;
1656  0553 1e01          	ldw	x,(OFST-1,sp)
1657  0555 1c0001        	addw	x,#1
1658  0558 1f01          	ldw	(OFST-1,sp),x
1660  055a               L165:
1661                     ; 377 	while (i < 14)
1663  055a 9c            	rvf
1664  055b 1e01          	ldw	x,(OFST-1,sp)
1665  055d a3000e        	cpw	x,#14
1666  0560 2fc6          	jrslt	L755
1668  0562 200d          	jra	L375
1669  0564               L175:
1670                     ; 397 		Delay(0xffff);
1672  0564 aeffff        	ldw	x,#65535
1673  0567 89            	pushw	x
1674  0568 ae0000        	ldw	x,#0
1675  056b 89            	pushw	x
1676  056c cd0000        	call	_Delay
1678  056f 5b04          	addw	sp,#4
1679  0571               L375:
1680                     ; 395 	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)== ERROR)
1682  0571 ae0784        	ldw	x,#1924
1683  0574 cd0000        	call	_I2C_CheckEvent
1685  0577 4d            	tnz	a
1686  0578 27ea          	jreq	L175
1687                     ; 401 	I2C_GenerateSTOP(ENABLE);
1689  057a a601          	ld	a,#1
1690  057c cd0000        	call	_I2C_GenerateSTOP
1692                     ; 404 	I2C_GenerateSTART(ENABLE);
1694  057f a601          	ld	a,#1
1695  0581 cd0000        	call	_I2C_GenerateSTART
1698  0584               L106:
1699                     ; 405 	while(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT)== ERROR);
1701  0584 ae0301        	ldw	x,#769
1702  0587 cd0000        	call	_I2C_CheckEvent
1704  058a 4d            	tnz	a
1705  058b 27f7          	jreq	L106
1706                     ; 406 	if(I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
1708  058d ae0301        	ldw	x,#769
1709  0590 cd0000        	call	_I2C_CheckEvent
1711  0593 4d            	tnz	a
1712  0594 2706          	jreq	L116
1713                     ; 409 	  I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);
1715  0596 ae7c00        	ldw	x,#31744
1716  0599 cd0000        	call	_I2C_Send7bitAddress
1718  059c               L116:
1719                     ; 412   while(I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)== ERROR);
1721  059c ae0782        	ldw	x,#1922
1722  059f cd0000        	call	_I2C_CheckEvent
1724  05a2 4d            	tnz	a
1725  05a3 27f7          	jreq	L116
1726                     ; 415 	I2C_SendData(TxBuf_Cntrl_Byte);  //update data  =0x40
1728  05a5 b611          	ld	a,_TxBuf_Cntrl_Byte
1729  05a7 cd0000        	call	_I2C_SendData
1732  05aa 200d          	jra	L716
1733  05ac               L516:
1734                     ; 420 		Delay(0xffff);
1736  05ac aeffff        	ldw	x,#65535
1737  05af 89            	pushw	x
1738  05b0 ae0000        	ldw	x,#0
1739  05b3 89            	pushw	x
1740  05b4 cd0000        	call	_Delay
1742  05b7 5b04          	addw	sp,#4
1743  05b9               L716:
1744                     ; 418   while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR)
1746  05b9 ae0780        	ldw	x,#1920
1747  05bc cd0000        	call	_I2C_CheckEvent
1749  05bf 4d            	tnz	a
1750  05c0 27ea          	jreq	L516
1751                     ; 423 	for(i = 0; i < 40; ++i)
1753  05c2 5f            	clrw	x
1754  05c3 1f01          	ldw	(OFST-1,sp),x
1756  05c5               L326:
1757                     ; 425 		TxBuf_Data[i] = 0x00;
1759  05c5 1e01          	ldw	x,(OFST-1,sp)
1760  05c7 6f12          	clr	(L3_TxBuf_Data,x)
1761                     ; 423 	for(i = 0; i < 40; ++i)
1763  05c9 1e01          	ldw	x,(OFST-1,sp)
1764  05cb 1c0001        	addw	x,#1
1765  05ce 1f01          	ldw	(OFST-1,sp),x
1769  05d0 9c            	rvf
1770  05d1 1e01          	ldw	x,(OFST-1,sp)
1771  05d3 a30028        	cpw	x,#40
1772  05d6 2fed          	jrslt	L326
1773                     ; 427 	i = 0;
1775  05d8 5f            	clrw	x
1776  05d9 1f01          	ldw	(OFST-1,sp),x
1778  05db               L136:
1779                     ; 431 		I2C_SendData(TxBuf_Data[i]);
1781  05db 1e01          	ldw	x,(OFST-1,sp)
1782  05dd e612          	ld	a,(L3_TxBuf_Data,x)
1783  05df cd0000        	call	_I2C_SendData
1785                     ; 432 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
1787  05e2 4b01          	push	#1
1788  05e4 ae500f        	ldw	x,#20495
1789  05e7 cd0000        	call	_GPIO_WriteReverse
1791  05ea 84            	pop	a
1792                     ; 433 		Delay(0x0040);  //1msec delay
1794  05eb ae0040        	ldw	x,#64
1795  05ee 89            	pushw	x
1796  05ef ae0000        	ldw	x,#0
1797  05f2 89            	pushw	x
1798  05f3 cd0000        	call	_Delay
1800  05f6 5b04          	addw	sp,#4
1801                     ; 435 		i++;
1803  05f8 1e01          	ldw	x,(OFST-1,sp)
1804  05fa 1c0001        	addw	x,#1
1805  05fd 1f01          	ldw	(OFST-1,sp),x
1807                     ; 428 	while (i < 40)
1807                     ; 429 	{
1807                     ; 430 		/* Send the first Data */
1807                     ; 431 		I2C_SendData(TxBuf_Data[i]);
1807                     ; 432 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
1807                     ; 433 		Delay(0x0040);  //1msec delay
1807                     ; 434 		/* Decrement number of bytes */
1807                     ; 435 		i++;
1809  05ff 9c            	rvf
1810  0600 1e01          	ldw	x,(OFST-1,sp)
1811  0602 a30028        	cpw	x,#40
1812  0605 2fd4          	jrslt	L136
1814  0607 200d          	jra	L146
1815  0609               L736:
1816                     ; 440 		Delay(0xffff);
1818  0609 aeffff        	ldw	x,#65535
1819  060c 89            	pushw	x
1820  060d ae0000        	ldw	x,#0
1821  0610 89            	pushw	x
1822  0611 cd0000        	call	_Delay
1824  0614 5b04          	addw	sp,#4
1825  0616               L146:
1826                     ; 438 	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)== ERROR)
1828  0616 ae0784        	ldw	x,#1924
1829  0619 cd0000        	call	_I2C_CheckEvent
1831  061c 4d            	tnz	a
1832  061d 27ea          	jreq	L736
1833                     ; 444 	I2C_GenerateSTOP(ENABLE);
1835  061f a601          	ld	a,#1
1836  0621 cd0000        	call	_I2C_GenerateSTOP
1838                     ; 445 }
1841  0624 85            	popw	x
1842  0625 81            	ret
1877                     ; 451 void LCD_BT(int ON_OFF){
1878                     	switch	.text
1879  0626               _LCD_BT:
1883                     ; 452 	if(ON_OFF ==1)
1885  0626 a30001        	cpw	x,#1
1886  0629 2606          	jrne	L366
1887                     ; 453 	  TxBuf_Data[37] |= 0x40;
1889  062b 721c0037      	bset	L3_TxBuf_Data+37,#6
1891  062f 2002          	jra	L566
1892  0631               L366:
1893                     ; 455 	  TxBuf_Data[37] |= 0x00;
1895  0631 b637          	ld	a,L3_TxBuf_Data+37
1896  0633               L566:
1897                     ; 456 }
1900  0633 81            	ret
1936                     ; 461 void LCD_Data_Transmission(int Enab_Disable){
1937                     	switch	.text
1938  0634               _LCD_Data_Transmission:
1942                     ; 462 	if(Enab_Disable ==1)
1944  0634 a30001        	cpw	x,#1
1945  0637 2606          	jrne	L507
1946                     ; 463 	 	TxBuf_Data[37] |= 0x80;
1948  0639 721e0037      	bset	L3_TxBuf_Data+37,#7
1950  063d 2002          	jra	L707
1951  063f               L507:
1952                     ; 465 		TxBuf_Data[37] |= 0x00;
1954  063f b637          	ld	a,L3_TxBuf_Data+37
1955  0641               L707:
1956                     ; 467 }
1959  0641 81            	ret
1994                     ; 472 void LCD_Speaker(int ON_OFF){
1995                     	switch	.text
1996  0642               _LCD_Speaker:
2000                     ; 473 	if(ON_OFF ==1)
2002  0642 a30001        	cpw	x,#1
2003  0645 2606          	jrne	L727
2004                     ; 474 	  TxBuf_Data[38] |= 0x01;
2006  0647 72100038      	bset	L3_TxBuf_Data+38,#0
2008  064b 2002          	jra	L137
2009  064d               L727:
2010                     ; 476 		TxBuf_Data[38] |= 0x00;
2012  064d b638          	ld	a,L3_TxBuf_Data+38
2013  064f               L137:
2014                     ; 477 }
2017  064f 81            	ret
2020                     .const:	section	.text
2021  0000               L337_a:
2022  0000 0000          	dc.w	0
2023  0002 0000          	dc.w	0
2024  0004 0000          	dc.w	0
2158                     	switch	.const
2159  0006               L03:
2160  0006 000000c8      	dc.l	200
2161  000a               L23:
2162  000a 0000000a      	dc.l	10
2163                     ; 485 void LCD_Speed_RT(long Sp, int Parameter){  //parameter = 1 = km/h
2164                     	switch	.text
2165  0650               _LCD_Speed_RT:
2167  0650 5213          	subw	sp,#19
2168       00000013      OFST:	set	19
2171                     ; 486   int a[3] = { 0, 0, 0};
2173  0652 96            	ldw	x,sp
2174  0653 1c000c        	addw	x,#OFST-7
2175  0656 90ae0000      	ldw	y,#L337_a
2176  065a a606          	ld	a,#6
2177  065c cd0000        	call	c_xymov
2179                     ; 487 	int i = 0, j , k , l;
2181  065f 5f            	clrw	x
2182  0660 1f12          	ldw	(OFST-1,sp),x
2184                     ; 488 	uint8_t temp1 = 0, temp2 = 0, temp3 = 0, temp4 = 0, temp5 = 0;
2194                     ; 489 	if(Sp <= 199 && Sp >= 0)
2196  0662 9c            	rvf
2197  0663 96            	ldw	x,sp
2198  0664 1c0016        	addw	x,#OFST+3
2199  0667 cd0000        	call	c_ltor
2201  066a ae0006        	ldw	x,#L03
2202  066d cd0000        	call	c_lcmp
2204  0670 2e49          	jrsge	L7201
2206  0672 9c            	rvf
2207  0673 9c            	rvf
2208  0674 0d16          	tnz	(OFST+3,sp)
2209  0676 2f43          	jrslt	L7201
2211  0678 2038          	jra	L3301
2212  067a               L1301:
2213                     ; 492 			a[i] = Sp % 10;
2215  067a 96            	ldw	x,sp
2216  067b 1c0016        	addw	x,#OFST+3
2217  067e cd0000        	call	c_ltor
2219  0681 ae000a        	ldw	x,#L23
2220  0684 cd0000        	call	c_lmod
2222  0687 96            	ldw	x,sp
2223  0688 1c000c        	addw	x,#OFST-7
2224  068b 1f01          	ldw	(OFST-18,sp),x
2226  068d 1e12          	ldw	x,(OFST-1,sp)
2227  068f 58            	sllw	x
2228  0690 72fb01        	addw	x,(OFST-18,sp)
2229  0693 90be02        	ldw	y,c_lreg+2
2230  0696 ff            	ldw	(x),y
2231                     ; 493 			Sp = Sp / 10;
2233  0697 96            	ldw	x,sp
2234  0698 1c0016        	addw	x,#OFST+3
2235  069b cd0000        	call	c_ltor
2237  069e ae000a        	ldw	x,#L23
2238  06a1 cd0000        	call	c_ldiv
2240  06a4 96            	ldw	x,sp
2241  06a5 1c0016        	addw	x,#OFST+3
2242  06a8 cd0000        	call	c_rtol
2244                     ; 494 			++i;		
2246  06ab 1e12          	ldw	x,(OFST-1,sp)
2247  06ad 1c0001        	addw	x,#1
2248  06b0 1f12          	ldw	(OFST-1,sp),x
2250  06b2               L3301:
2251                     ; 491 		while(Sp != 0){
2253  06b2 96            	ldw	x,sp
2254  06b3 1c0016        	addw	x,#OFST+3
2255  06b6 cd0000        	call	c_lzmp
2257  06b9 26bf          	jrne	L1301
2258  06bb               L7201:
2259                     ; 498 	j = a[2];  // 1
2261  06bb 1e10          	ldw	x,(OFST-3,sp)
2262  06bd 1f08          	ldw	(OFST-11,sp),x
2264                     ; 499 	k = a[1];  // 3 
2266  06bf 1e0e          	ldw	x,(OFST-5,sp)
2267  06c1 1f12          	ldw	(OFST-1,sp),x
2269                     ; 500 	l = a[0];  //4
2271  06c3 1e0c          	ldw	x,(OFST-7,sp)
2272  06c5 1f0a          	ldw	(OFST-9,sp),x
2274                     ; 502 	TxBuf_Data[15] |= (TxBuf_Data_RAM_5[l] & 0x0F);
2276  06c7 1e0a          	ldw	x,(OFST-9,sp)
2277  06c9 58            	sllw	x
2278  06ca e664          	ld	a,(_TxBuf_Data_RAM_5+1,x)
2279  06cc a40f          	and	a,#15
2280  06ce ba21          	or	a,L3_TxBuf_Data+15
2281  06d0 b721          	ld	L3_TxBuf_Data+15,a
2282                     ; 503 	TxBuf_Data[16] |= (((TxBuf_Data_RAM_5[l] & 0xF0) << 1) |(TxBuf_Data_RAM_5[k] & 0x0F));
2284  06d2 1e12          	ldw	x,(OFST-1,sp)
2285  06d4 58            	sllw	x
2286  06d5 e664          	ld	a,(_TxBuf_Data_RAM_5+1,x)
2287  06d7 a40f          	and	a,#15
2288  06d9 6b02          	ld	(OFST-17,sp),a
2290  06db 1e0a          	ldw	x,(OFST-9,sp)
2291  06dd 58            	sllw	x
2292  06de e664          	ld	a,(_TxBuf_Data_RAM_5+1,x)
2293  06e0 a4f0          	and	a,#240
2294  06e2 48            	sll	a
2295  06e3 1a02          	or	a,(OFST-17,sp)
2296  06e5 ba22          	or	a,L3_TxBuf_Data+16
2297  06e7 b722          	ld	L3_TxBuf_Data+16,a
2298                     ; 505 	if(j == 1){ 
2300  06e9 1e08          	ldw	x,(OFST-11,sp)
2301  06eb a30001        	cpw	x,#1
2302  06ee 260f          	jrne	L7301
2303                     ; 506 	  TxBuf_Data[17] |= ((TxBuf_Data_RAM_5[k] & 0xF0)  | 0x80); //enable 24BC
2305  06f0 1e12          	ldw	x,(OFST-1,sp)
2306  06f2 58            	sllw	x
2307  06f3 e664          	ld	a,(_TxBuf_Data_RAM_5+1,x)
2308  06f5 a4f0          	and	a,#240
2309  06f7 aa80          	or	a,#128
2310  06f9 ba23          	or	a,L3_TxBuf_Data+17
2311  06fb b723          	ld	L3_TxBuf_Data+17,a
2313  06fd 200b          	jra	L1401
2314  06ff               L7301:
2315                     ; 509 	  TxBuf_Data[17] |= (TxBuf_Data_RAM_5[k] & 0xF0) ;
2317  06ff 1e12          	ldw	x,(OFST-1,sp)
2318  0701 58            	sllw	x
2319  0702 e664          	ld	a,(_TxBuf_Data_RAM_5+1,x)
2320  0704 a4f0          	and	a,#240
2321  0706 ba23          	or	a,L3_TxBuf_Data+17
2322  0708 b723          	ld	L3_TxBuf_Data+17,a
2323  070a               L1401:
2324                     ; 512 	if(Parameter == 1)
2326  070a 1e1a          	ldw	x,(OFST+7,sp)
2327  070c a30001        	cpw	x,#1
2328  070f 2606          	jrne	L3401
2329                     ; 514 	 TxBuf_Data[22] |= 0x08;
2331  0711 72160028      	bset	L3_TxBuf_Data+22,#3
2333  0715 2004          	jra	L5401
2334  0717               L3401:
2335                     ; 518 		TxBuf_Data[22] |= 0x04;
2337  0717 72140028      	bset	L3_TxBuf_Data+22,#2
2338  071b               L5401:
2339                     ; 521 }
2342  071b 5b13          	addw	sp,#19
2343  071d 81            	ret
2346                     	switch	.const
2347  000e               L7401_a:
2348  000e 0000          	dc.w	0
2349  0010 0000          	dc.w	0
2350  0012 0000          	dc.w	0
2468                     ; 526 void LCD_Bat_Volt(float Volt){ //display in 0 to 100%
2469                     	switch	.text
2470  071e               _LCD_Bat_Volt:
2472  071e 5212          	subw	sp,#18
2473       00000012      OFST:	set	18
2476                     ; 527  	int y =  map(Volt, 0,(float)Max_Batt_Voltage, 0, 100);
2478  0720 ce0092        	ldw	x,L7511+2
2479  0723 89            	pushw	x
2480  0724 ce0090        	ldw	x,L7511
2481  0727 89            	pushw	x
2482  0728 ce009a        	ldw	x,L7311+2
2483  072b 89            	pushw	x
2484  072c ce0098        	ldw	x,L7311
2485  072f 89            	pushw	x
2486  0730 ce0096        	ldw	x,L7411+2
2487  0733 89            	pushw	x
2488  0734 ce0094        	ldw	x,L7411
2489  0737 89            	pushw	x
2490  0738 ce009a        	ldw	x,L7311+2
2491  073b 89            	pushw	x
2492  073c ce0098        	ldw	x,L7311
2493  073f 89            	pushw	x
2494  0740 1e27          	ldw	x,(OFST+21,sp)
2495  0742 89            	pushw	x
2496  0743 1e27          	ldw	x,(OFST+21,sp)
2497  0745 89            	pushw	x
2498  0746 cd08c7        	call	_map
2500  0749 5b14          	addw	sp,#20
2501  074b cd0000        	call	c_ftoi
2503  074e 1f0f          	ldw	(OFST-3,sp),x
2505                     ; 528 	int ch = y;
2507  0750 1e0f          	ldw	x,(OFST-3,sp)
2508  0752 1f11          	ldw	(OFST-1,sp),x
2510                     ; 529   uint8_t	temp1 = 0, temp2 = 0;
2514                     ; 530 	int a[3] = { 0, 0, 0};
2516  0754 96            	ldw	x,sp
2517  0755 1c0007        	addw	x,#OFST-11
2518  0758 90ae000e      	ldw	y,#L7401_a
2519  075c a606          	ld	a,#6
2520  075e cd0000        	call	c_xymov
2522                     ; 531 	int i = 0, j , k , l;
2524  0761 5f            	clrw	x
2525  0762 1f0d          	ldw	(OFST-5,sp),x
2528  0764 2028          	jra	L7611
2529  0766               L3611:
2530                     ; 533 			a[i] = y % 10;
2532  0766 1e0f          	ldw	x,(OFST-3,sp)
2533  0768 a60a          	ld	a,#10
2534  076a cd0000        	call	c_smodx
2536  076d 9096          	ldw	y,sp
2537  076f 72a90007      	addw	y,#OFST-11
2538  0773 1701          	ldw	(OFST-17,sp),y
2540  0775 160d          	ldw	y,(OFST-5,sp)
2541  0777 9058          	sllw	y
2542  0779 72f901        	addw	y,(OFST-17,sp)
2543  077c 90ff          	ldw	(y),x
2544                     ; 534 			y = y / 10;
2546  077e 1e0f          	ldw	x,(OFST-3,sp)
2547  0780 a60a          	ld	a,#10
2548  0782 cd0000        	call	c_sdivx
2550  0785 1f0f          	ldw	(OFST-3,sp),x
2552                     ; 535 			++i;		
2554  0787 1e0d          	ldw	x,(OFST-5,sp)
2555  0789 1c0001        	addw	x,#1
2556  078c 1f0d          	ldw	(OFST-5,sp),x
2558  078e               L7611:
2559                     ; 532 	while(y != 0){
2561  078e 1e0f          	ldw	x,(OFST-3,sp)
2562  0790 26d4          	jrne	L3611
2563                     ; 538 	j = a[2];  // 1
2565  0792 1e0b          	ldw	x,(OFST-7,sp)
2566  0794 1f05          	ldw	(OFST-13,sp),x
2568                     ; 539 	k = a[1];  // 3 
2570  0796 1e09          	ldw	x,(OFST-9,sp)
2571  0798 1f0f          	ldw	(OFST-3,sp),x
2573                     ; 540 	l = a[0];  //4
2575  079a 1e07          	ldw	x,(OFST-11,sp)
2576  079c 1f0d          	ldw	(OFST-5,sp),x
2578                     ; 543 	TxBuf_Data[0] |= 0x80;  //X4 = logo
2580  079e 721e0012      	bset	L3_TxBuf_Data,#7
2581                     ; 544 	TxBuf_Data[3] |= 0x10;
2583  07a2 72180015      	bset	L3_TxBuf_Data+3,#4
2584                     ; 545 	TxBuf_Data[4] |= 0x08;
2586  07a6 72160016      	bset	L3_TxBuf_Data+4,#3
2587                     ; 546 	TxBuf_Data[7] |= 0x08;  //enable X0
2589  07aa 72160019      	bset	L3_TxBuf_Data+7,#3
2590                     ; 547 	TxBuf_Data[8] |= 0x80;  //enable X0
2592  07ae 721e001a      	bset	L3_TxBuf_Data+8,#7
2593                     ; 549 	TxBuf_Data[0] |= TxBuf_Data_RAM_0[j]  | 0x80;  //Digit 7  and X4=logo
2595  07b2 1e05          	ldw	x,(OFST-13,sp)
2596  07b4 58            	sllw	x
2597  07b5 e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
2598  07b7 aa80          	or	a,#128
2599  07b9 ba12          	or	a,L3_TxBuf_Data
2600  07bb b712          	ld	L3_TxBuf_Data,a
2601                     ; 550 	TxBuf_Data[1] |= TxBuf_Data_RAM_1[k];  //digit 8
2603  07bd 1e0f          	ldw	x,(OFST-3,sp)
2604  07bf 58            	sllw	x
2605  07c0 b613          	ld	a,L3_TxBuf_Data+1
2606  07c2 ea50          	or	a,(_TxBuf_Data_RAM_1+1,x)
2607  07c4 b713          	ld	L3_TxBuf_Data+1,a
2608                     ; 551 	TxBuf_Data[2] |= TxBuf_Data_RAM_1[l] | 0x08;  //digit 9 and X5 = %
2610  07c6 1e0d          	ldw	x,(OFST-5,sp)
2611  07c8 58            	sllw	x
2612  07c9 e650          	ld	a,(_TxBuf_Data_RAM_1+1,x)
2613  07cb aa08          	or	a,#8
2614  07cd ba14          	or	a,L3_TxBuf_Data+2
2615  07cf b714          	ld	L3_TxBuf_Data+2,a
2616                     ; 554 		if(ch >=10  && ch <20 ){ // 10%
2618  07d1 9c            	rvf
2619  07d2 1e11          	ldw	x,(OFST-1,sp)
2620  07d4 a3000a        	cpw	x,#10
2621  07d7 2f0c          	jrslt	L3711
2623  07d9 9c            	rvf
2624  07da 1e11          	ldw	x,(OFST-1,sp)
2625  07dc a30014        	cpw	x,#20
2626  07df 2e04          	jrsge	L3711
2627                     ; 555 			TxBuf_Data[3] |= 0x20;
2629  07e1 721a0015      	bset	L3_TxBuf_Data+3,#5
2630  07e5               L3711:
2631                     ; 557 		if(ch >=20  && ch <30 ){  //20%
2633  07e5 9c            	rvf
2634  07e6 1e11          	ldw	x,(OFST-1,sp)
2635  07e8 a30014        	cpw	x,#20
2636  07eb 2f0e          	jrslt	L5711
2638  07ed 9c            	rvf
2639  07ee 1e11          	ldw	x,(OFST-1,sp)
2640  07f0 a3001e        	cpw	x,#30
2641  07f3 2e06          	jrsge	L5711
2642                     ; 558 			TxBuf_Data[3] |= 0x21;
2644  07f5 b615          	ld	a,L3_TxBuf_Data+3
2645  07f7 aa21          	or	a,#33
2646  07f9 b715          	ld	L3_TxBuf_Data+3,a
2647  07fb               L5711:
2648                     ; 560 		if(ch >=30  && ch <40 ){ // 30%
2650  07fb 9c            	rvf
2651  07fc 1e11          	ldw	x,(OFST-1,sp)
2652  07fe a3001e        	cpw	x,#30
2653  0801 2f0e          	jrslt	L7711
2655  0803 9c            	rvf
2656  0804 1e11          	ldw	x,(OFST-1,sp)
2657  0806 a30028        	cpw	x,#40
2658  0809 2e06          	jrsge	L7711
2659                     ; 561 			TxBuf_Data[3] |= 0x23;
2661  080b b615          	ld	a,L3_TxBuf_Data+3
2662  080d aa23          	or	a,#35
2663  080f b715          	ld	L3_TxBuf_Data+3,a
2664  0811               L7711:
2665                     ; 563 		if(ch >=40 && ch <50 ){ // 40%
2667  0811 9c            	rvf
2668  0812 1e11          	ldw	x,(OFST-1,sp)
2669  0814 a30028        	cpw	x,#40
2670  0817 2f0e          	jrslt	L1021
2672  0819 9c            	rvf
2673  081a 1e11          	ldw	x,(OFST-1,sp)
2674  081c a30032        	cpw	x,#50
2675  081f 2e06          	jrsge	L1021
2676                     ; 564 			TxBuf_Data[3] |= 0x27;
2678  0821 b615          	ld	a,L3_TxBuf_Data+3
2679  0823 aa27          	or	a,#39
2680  0825 b715          	ld	L3_TxBuf_Data+3,a
2681  0827               L1021:
2682                     ; 566 		if(ch >=50  && ch <60 ){ //50%
2684  0827 9c            	rvf
2685  0828 1e11          	ldw	x,(OFST-1,sp)
2686  082a a30032        	cpw	x,#50
2687  082d 2f12          	jrslt	L3021
2689  082f 9c            	rvf
2690  0830 1e11          	ldw	x,(OFST-1,sp)
2691  0832 a3003c        	cpw	x,#60
2692  0835 2e0a          	jrsge	L3021
2693                     ; 567 			TxBuf_Data[3] |= 0x37;
2695  0837 b615          	ld	a,L3_TxBuf_Data+3
2696  0839 aa37          	or	a,#55
2697  083b b715          	ld	L3_TxBuf_Data+3,a
2698                     ; 568 			TxBuf_Data[4] |= 0x40;
2700  083d 721c0016      	bset	L3_TxBuf_Data+4,#6
2701  0841               L3021:
2702                     ; 570 		if(ch >=60  && ch <70 ){ //60%
2704  0841 9c            	rvf
2705  0842 1e11          	ldw	x,(OFST-1,sp)
2706  0844 a3003c        	cpw	x,#60
2707  0847 2f14          	jrslt	L5021
2709  0849 9c            	rvf
2710  084a 1e11          	ldw	x,(OFST-1,sp)
2711  084c a30046        	cpw	x,#70
2712  084f 2e0c          	jrsge	L5021
2713                     ; 571 			TxBuf_Data[3] |= 0x37;
2715  0851 b615          	ld	a,L3_TxBuf_Data+3
2716  0853 aa37          	or	a,#55
2717  0855 b715          	ld	L3_TxBuf_Data+3,a
2718                     ; 572 			TxBuf_Data[4] |= 0x60;
2720  0857 b616          	ld	a,L3_TxBuf_Data+4
2721  0859 aa60          	or	a,#96
2722  085b b716          	ld	L3_TxBuf_Data+4,a
2723  085d               L5021:
2724                     ; 574 		if(ch >=70  && ch <80 ){ //70%
2726  085d 9c            	rvf
2727  085e 1e11          	ldw	x,(OFST-1,sp)
2728  0860 a30046        	cpw	x,#70
2729  0863 2f14          	jrslt	L7021
2731  0865 9c            	rvf
2732  0866 1e11          	ldw	x,(OFST-1,sp)
2733  0868 a30050        	cpw	x,#80
2734  086b 2e0c          	jrsge	L7021
2735                     ; 575 			TxBuf_Data[3] |= 0x37;
2737  086d b615          	ld	a,L3_TxBuf_Data+3
2738  086f aa37          	or	a,#55
2739  0871 b715          	ld	L3_TxBuf_Data+3,a
2740                     ; 576 			TxBuf_Data[4] |= 0x70;
2742  0873 b616          	ld	a,L3_TxBuf_Data+4
2743  0875 aa70          	or	a,#112
2744  0877 b716          	ld	L3_TxBuf_Data+4,a
2745  0879               L7021:
2746                     ; 578 		if(ch >=80  && ch <90){  //80%
2748  0879 9c            	rvf
2749  087a 1e11          	ldw	x,(OFST-1,sp)
2750  087c a30050        	cpw	x,#80
2751  087f 2f14          	jrslt	L1121
2753  0881 9c            	rvf
2754  0882 1e11          	ldw	x,(OFST-1,sp)
2755  0884 a3005a        	cpw	x,#90
2756  0887 2e0c          	jrsge	L1121
2757                     ; 579 			TxBuf_Data[3] |= 0x37;
2759  0889 b615          	ld	a,L3_TxBuf_Data+3
2760  088b aa37          	or	a,#55
2761  088d b715          	ld	L3_TxBuf_Data+3,a
2762                     ; 580 			TxBuf_Data[4] |= 0x71;
2764  088f b616          	ld	a,L3_TxBuf_Data+4
2765  0891 aa71          	or	a,#113
2766  0893 b716          	ld	L3_TxBuf_Data+4,a
2767  0895               L1121:
2768                     ; 582 		if(ch >=90  && ch <100 ){ //90%
2770  0895 9c            	rvf
2771  0896 1e11          	ldw	x,(OFST-1,sp)
2772  0898 a3005a        	cpw	x,#90
2773  089b 2f14          	jrslt	L3121
2775  089d 9c            	rvf
2776  089e 1e11          	ldw	x,(OFST-1,sp)
2777  08a0 a30064        	cpw	x,#100
2778  08a3 2e0c          	jrsge	L3121
2779                     ; 583 			TxBuf_Data[3] |= 0x37;
2781  08a5 b615          	ld	a,L3_TxBuf_Data+3
2782  08a7 aa37          	or	a,#55
2783  08a9 b715          	ld	L3_TxBuf_Data+3,a
2784                     ; 584 			TxBuf_Data[4] |= 0x73;
2786  08ab b616          	ld	a,L3_TxBuf_Data+4
2787  08ad aa73          	or	a,#115
2788  08af b716          	ld	L3_TxBuf_Data+4,a
2789  08b1               L3121:
2790                     ; 587 		if(ch == 100 ){  //100%
2792  08b1 1e11          	ldw	x,(OFST-1,sp)
2793  08b3 a30064        	cpw	x,#100
2794  08b6 260c          	jrne	L5121
2795                     ; 588 		TxBuf_Data[3] |= 0x27;
2797  08b8 b615          	ld	a,L3_TxBuf_Data+3
2798  08ba aa27          	or	a,#39
2799  08bc b715          	ld	L3_TxBuf_Data+3,a
2800                     ; 589 		TxBuf_Data[4] |= 0x77;
2802  08be b616          	ld	a,L3_TxBuf_Data+4
2803  08c0 aa77          	or	a,#119
2804  08c2 b716          	ld	L3_TxBuf_Data+4,a
2805  08c4               L5121:
2806                     ; 592 }
2809  08c4 5b12          	addw	sp,#18
2810  08c6 81            	ret
2880                     ; 596 float map(float x, float in_min, float in_max, float out_min, float out_max)
2880                     ; 597 {
2881                     	switch	.text
2882  08c7               _map:
2884  08c7 5208          	subw	sp,#8
2885       00000008      OFST:	set	8
2888                     ; 598   return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
2890  08c9 96            	ldw	x,sp
2891  08ca 1c0013        	addw	x,#OFST+11
2892  08cd cd0000        	call	c_ltor
2894  08d0 96            	ldw	x,sp
2895  08d1 1c000f        	addw	x,#OFST+7
2896  08d4 cd0000        	call	c_fsub
2898  08d7 96            	ldw	x,sp
2899  08d8 1c0005        	addw	x,#OFST-3
2900  08db cd0000        	call	c_rtol
2903  08de 96            	ldw	x,sp
2904  08df 1c001b        	addw	x,#OFST+19
2905  08e2 cd0000        	call	c_ltor
2907  08e5 96            	ldw	x,sp
2908  08e6 1c0017        	addw	x,#OFST+15
2909  08e9 cd0000        	call	c_fsub
2911  08ec 96            	ldw	x,sp
2912  08ed 1c0001        	addw	x,#OFST-7
2913  08f0 cd0000        	call	c_rtol
2916  08f3 96            	ldw	x,sp
2917  08f4 1c000b        	addw	x,#OFST+3
2918  08f7 cd0000        	call	c_ltor
2920  08fa 96            	ldw	x,sp
2921  08fb 1c000f        	addw	x,#OFST+7
2922  08fe cd0000        	call	c_fsub
2924  0901 96            	ldw	x,sp
2925  0902 1c0001        	addw	x,#OFST-7
2926  0905 cd0000        	call	c_fmul
2928  0908 96            	ldw	x,sp
2929  0909 1c0005        	addw	x,#OFST-3
2930  090c cd0000        	call	c_fdiv
2932  090f 96            	ldw	x,sp
2933  0910 1c0017        	addw	x,#OFST+15
2934  0913 cd0000        	call	c_fadd
2938  0916 5b08          	addw	sp,#8
2939  0918 81            	ret
2973                     ; 600 void LCD_Bat_Temp(int Temp){
2974                     	switch	.text
2975  0919               _LCD_Bat_Temp:
2979                     ; 602 }
2982  0919 81            	ret
3017                     ; 606 void LCD_Ignition(int Enab_disab){
3018                     	switch	.text
3019  091a               _LCD_Ignition:
3023                     ; 607 	if(Enab_disab == 1){
3025  091a a30001        	cpw	x,#1
3026  091d 2606          	jrne	L1131
3027                     ; 608 		TxBuf_Data[38] |= 0x02;
3029  091f 72120038      	bset	L3_TxBuf_Data+38,#1
3031  0923 2002          	jra	L3131
3032  0925               L1131:
3033                     ; 611 		TxBuf_Data[38] |= 0x00;
3035  0925 b638          	ld	a,L3_TxBuf_Data+38
3036  0927               L3131:
3037                     ; 614 }
3040  0927 81            	ret
3075                     ; 619 void LCD_Error(int Flag){
3076                     	switch	.text
3077  0928               _LCD_Error:
3081                     ; 620 	if(Flag == 1){
3083  0928 a30001        	cpw	x,#1
3084  092b 2606          	jrne	L3331
3085                     ; 621 		TxBuf_Data[7] |= 0x20;
3087  092d 721a0019      	bset	L3_TxBuf_Data+7,#5
3089  0931 2002          	jra	L5331
3090  0933               L3331:
3091                     ; 624 		TxBuf_Data[7] |= 0x00;
3093  0933 b619          	ld	a,L3_TxBuf_Data+7
3094  0935               L5331:
3095                     ; 626 }
3098  0935 81            	ret
3153                     ; 631 void LCD_Controller_Temp(float Temp){
3154                     	switch	.text
3155  0936               _LCD_Controller_Temp:
3157  0936 5208          	subw	sp,#8
3158       00000008      OFST:	set	8
3161                     ; 632 	float y =  map(Temp, 0,(float)Max_Controller_Temp, 0, 100);
3163  0938 ce0092        	ldw	x,L7511+2
3164  093b 89            	pushw	x
3165  093c ce0090        	ldw	x,L7511
3166  093f 89            	pushw	x
3167  0940 ce009a        	ldw	x,L7311+2
3168  0943 89            	pushw	x
3169  0944 ce0098        	ldw	x,L7311
3170  0947 89            	pushw	x
3171  0948 ce0096        	ldw	x,L7411+2
3172  094b 89            	pushw	x
3173  094c ce0094        	ldw	x,L7411
3174  094f 89            	pushw	x
3175  0950 ce009a        	ldw	x,L7311+2
3176  0953 89            	pushw	x
3177  0954 ce0098        	ldw	x,L7311
3178  0957 89            	pushw	x
3179  0958 1e1d          	ldw	x,(OFST+21,sp)
3180  095a 89            	pushw	x
3181  095b 1e1d          	ldw	x,(OFST+21,sp)
3182  095d 89            	pushw	x
3183  095e cd08c7        	call	_map
3185  0961 5b14          	addw	sp,#20
3186  0963 96            	ldw	x,sp
3187  0964 1c0005        	addw	x,#OFST-3
3188  0967 cd0000        	call	c_rtol
3191                     ; 633 	float ch = y;
3194                     ; 634 	TxBuf_Data[38] |= 0x14;
3196  096a b638          	ld	a,L3_TxBuf_Data+38
3197  096c aa14          	or	a,#20
3198  096e b738          	ld	L3_TxBuf_Data+38,a
3199                     ; 635 	TxBuf_Data[37] |= 0x20;
3201  0970 721a0037      	bset	L3_TxBuf_Data+37,#5
3202                     ; 637 	if(ch >1  && ch <=16.66 ){ // 16.66%
3204  0974 9c            	rvf
3205  0975 a601          	ld	a,#1
3206  0977 cd0000        	call	c_ctof
3208  097a 96            	ldw	x,sp
3209  097b 1c0001        	addw	x,#OFST-7
3210  097e cd0000        	call	c_rtol
3213  0981 96            	ldw	x,sp
3214  0982 1c0005        	addw	x,#OFST-3
3215  0985 cd0000        	call	c_ltor
3217  0988 96            	ldw	x,sp
3218  0989 1c0001        	addw	x,#OFST-7
3219  098c cd0000        	call	c_fcmp
3221  098f 2d14          	jrsle	L5631
3223  0991 9c            	rvf
3224  0992 96            	ldw	x,sp
3225  0993 1c0005        	addw	x,#OFST-3
3226  0996 cd0000        	call	c_ltor
3228  0999 ae008c        	ldw	x,#L3731
3229  099c cd0000        	call	c_fcmp
3231  099f 2c04          	jrsgt	L5631
3232                     ; 638 		TxBuf_Data[38] |= 0x08;
3234  09a1 72160038      	bset	L3_TxBuf_Data+38,#3
3235  09a5               L5631:
3236                     ; 640 	if(ch >16.66  && ch <=33.33 ){  //33.33%
3238  09a5 9c            	rvf
3239  09a6 96            	ldw	x,sp
3240  09a7 1c0005        	addw	x,#OFST-3
3241  09aa cd0000        	call	c_ltor
3243  09ad ae008c        	ldw	x,#L3731
3244  09b0 cd0000        	call	c_fcmp
3246  09b3 2d18          	jrsle	L7731
3248  09b5 9c            	rvf
3249  09b6 96            	ldw	x,sp
3250  09b7 1c0005        	addw	x,#OFST-3
3251  09ba cd0000        	call	c_ltor
3253  09bd ae0088        	ldw	x,#L5041
3254  09c0 cd0000        	call	c_fcmp
3256  09c3 2c08          	jrsgt	L7731
3257                     ; 641 		TxBuf_Data[37] |= 0x08;
3259  09c5 72160037      	bset	L3_TxBuf_Data+37,#3
3260                     ; 642 		TxBuf_Data[38] |= 0x08;
3262  09c9 72160038      	bset	L3_TxBuf_Data+38,#3
3263  09cd               L7731:
3264                     ; 644 	if(ch >33.33  && ch <=49.98 ){ // 49.98%
3266  09cd 9c            	rvf
3267  09ce 96            	ldw	x,sp
3268  09cf 1c0005        	addw	x,#OFST-3
3269  09d2 cd0000        	call	c_ltor
3271  09d5 ae0088        	ldw	x,#L5041
3272  09d8 cd0000        	call	c_fcmp
3274  09db 2d1a          	jrsle	L1141
3276  09dd 9c            	rvf
3277  09de 96            	ldw	x,sp
3278  09df 1c0005        	addw	x,#OFST-3
3279  09e2 cd0000        	call	c_ltor
3281  09e5 ae0084        	ldw	x,#L7141
3282  09e8 cd0000        	call	c_fcmp
3284  09eb 2c0a          	jrsgt	L1141
3285                     ; 645 		TxBuf_Data[37] |= 0x0C;
3287  09ed b637          	ld	a,L3_TxBuf_Data+37
3288  09ef aa0c          	or	a,#12
3289  09f1 b737          	ld	L3_TxBuf_Data+37,a
3290                     ; 646 		TxBuf_Data[38] |= 0x08;
3292  09f3 72160038      	bset	L3_TxBuf_Data+38,#3
3293  09f7               L1141:
3294                     ; 648 	if(ch >49.98 && ch <=66.48 ){ // 66.48%
3296  09f7 9c            	rvf
3297  09f8 96            	ldw	x,sp
3298  09f9 1c0005        	addw	x,#OFST-3
3299  09fc cd0000        	call	c_ltor
3301  09ff ae0084        	ldw	x,#L7141
3302  0a02 cd0000        	call	c_fcmp
3304  0a05 2d1a          	jrsle	L3241
3306  0a07 9c            	rvf
3307  0a08 96            	ldw	x,sp
3308  0a09 1c0005        	addw	x,#OFST-3
3309  0a0c cd0000        	call	c_ltor
3311  0a0f ae0080        	ldw	x,#L1341
3312  0a12 cd0000        	call	c_fcmp
3314  0a15 2c0a          	jrsgt	L3241
3315                     ; 649 		TxBuf_Data[38] |= 0x08;
3317  0a17 72160038      	bset	L3_TxBuf_Data+38,#3
3318                     ; 650 		TxBuf_Data[37] |= 0x0E;
3320  0a1b b637          	ld	a,L3_TxBuf_Data+37
3321  0a1d aa0e          	or	a,#14
3322  0a1f b737          	ld	L3_TxBuf_Data+37,a
3323  0a21               L3241:
3324                     ; 652 	if(ch >66.48  && ch <=83.3 ){ //83.3%
3326  0a21 9c            	rvf
3327  0a22 96            	ldw	x,sp
3328  0a23 1c0005        	addw	x,#OFST-3
3329  0a26 cd0000        	call	c_ltor
3331  0a29 ae0080        	ldw	x,#L1341
3332  0a2c cd0000        	call	c_fcmp
3334  0a2f 2d1a          	jrsle	L5341
3336  0a31 9c            	rvf
3337  0a32 96            	ldw	x,sp
3338  0a33 1c0005        	addw	x,#OFST-3
3339  0a36 cd0000        	call	c_ltor
3341  0a39 ae007c        	ldw	x,#L3441
3342  0a3c cd0000        	call	c_fcmp
3344  0a3f 2c0a          	jrsgt	L5341
3345                     ; 653 		TxBuf_Data[38] |= 0x08;
3347  0a41 72160038      	bset	L3_TxBuf_Data+38,#3
3348                     ; 654 		TxBuf_Data[37] |= 0x0F;
3350  0a45 b637          	ld	a,L3_TxBuf_Data+37
3351  0a47 aa0f          	or	a,#15
3352  0a49 b737          	ld	L3_TxBuf_Data+37,a
3353  0a4b               L5341:
3354                     ; 656 	if(ch >83.3  && ch <=100 ){ //99.96%
3356  0a4b 9c            	rvf
3357  0a4c 96            	ldw	x,sp
3358  0a4d 1c0005        	addw	x,#OFST-3
3359  0a50 cd0000        	call	c_ltor
3361  0a53 ae007c        	ldw	x,#L3441
3362  0a56 cd0000        	call	c_fcmp
3364  0a59 2d27          	jrsle	L7441
3366  0a5b 9c            	rvf
3367  0a5c a664          	ld	a,#100
3368  0a5e cd0000        	call	c_ctof
3370  0a61 96            	ldw	x,sp
3371  0a62 1c0001        	addw	x,#OFST-7
3372  0a65 cd0000        	call	c_rtol
3375  0a68 96            	ldw	x,sp
3376  0a69 1c0005        	addw	x,#OFST-3
3377  0a6c cd0000        	call	c_ltor
3379  0a6f 96            	ldw	x,sp
3380  0a70 1c0001        	addw	x,#OFST-7
3381  0a73 cd0000        	call	c_fcmp
3383  0a76 2c0a          	jrsgt	L7441
3384                     ; 657 		TxBuf_Data[38] |= 0x08;
3386  0a78 72160038      	bset	L3_TxBuf_Data+38,#3
3387                     ; 658 		TxBuf_Data[37] |= 0x1F;
3389  0a7c b637          	ld	a,L3_TxBuf_Data+37
3390  0a7e aa1f          	or	a,#31
3391  0a80 b737          	ld	L3_TxBuf_Data+37,a
3392  0a82               L7441:
3393                     ; 661 }
3396  0a82 5b08          	addw	sp,#8
3397  0a84 81            	ret
3433                     ; 668 void LCD_Mode(int Mode){
3434                     	switch	.text
3435  0a85               _LCD_Mode:
3439                     ; 669 	switch(Mode){
3442                     ; 680 		default:
3442                     ; 681 			    break;
3443  0a85 5a            	decw	x
3444  0a86 2708          	jreq	L1541
3445  0a88 5a            	decw	x
3446  0a89 2715          	jreq	L3541
3447  0a8b 5a            	decw	x
3448  0a8c 2722          	jreq	L5541
3449  0a8e 202e          	jra	L1051
3450  0a90               L1541:
3451                     ; 670 		case 1:TxBuf_Data[35] |= 0x30 | 0x04 | 0x08;  //Mode 1 represents economy
3453  0a90 b635          	ld	a,L3_TxBuf_Data+35
3454  0a92 aa3c          	or	a,#60
3455  0a94 b735          	ld	L3_TxBuf_Data+35,a
3456                     ; 671 					TxBuf_Data[36] |= 0x80 | TxBuf_Data_RAM_5[1];
3458  0a96 b666          	ld	a,_TxBuf_Data_RAM_5+3
3459  0a98 aa80          	or	a,#128
3460  0a9a ba36          	or	a,L3_TxBuf_Data+36
3461  0a9c b736          	ld	L3_TxBuf_Data+36,a
3462                     ; 673 					break;
3464  0a9e 201e          	jra	L1051
3465  0aa0               L3541:
3466                     ; 674 		case 2:TxBuf_Data[35] |= 0x50 | 0x06 | 0x08;   //mode 2 represents normal
3468  0aa0 b635          	ld	a,L3_TxBuf_Data+35
3469  0aa2 aa5e          	or	a,#94
3470  0aa4 b735          	ld	L3_TxBuf_Data+35,a
3471                     ; 675 					TxBuf_Data[36] |= 0x80 | TxBuf_Data_RAM_5[2];
3473  0aa6 b668          	ld	a,_TxBuf_Data_RAM_5+5
3474  0aa8 aa80          	or	a,#128
3475  0aaa ba36          	or	a,L3_TxBuf_Data+36
3476  0aac b736          	ld	L3_TxBuf_Data+36,a
3477                     ; 676 					break;
3479  0aae 200e          	jra	L1051
3480  0ab0               L5541:
3481                     ; 677 		case 3:TxBuf_Data[35] |= 0x90 | 0x08 | 0x07;  //mode 3 represents sport
3483  0ab0 b635          	ld	a,L3_TxBuf_Data+35
3484  0ab2 aa9f          	or	a,#159
3485  0ab4 b735          	ld	L3_TxBuf_Data+35,a
3486                     ; 678 					TxBuf_Data[36] |= 0x80 | TxBuf_Data_RAM_5[3];
3488  0ab6 b66a          	ld	a,_TxBuf_Data_RAM_5+7
3489  0ab8 aa80          	or	a,#128
3490  0aba ba36          	or	a,L3_TxBuf_Data+36
3491  0abc b736          	ld	L3_TxBuf_Data+36,a
3492                     ; 679 					break;
3494  0abe               L7541:
3495                     ; 680 		default:
3495                     ; 681 			    break;
3497  0abe               L1051:
3498                     ; 684 }
3501  0abe 81            	ret
3504                     	switch	.const
3505  0014               L3051_a:
3506  0014 0000          	dc.w	0
3507  0016 0000          	dc.w	0
3508  0018 0000          	dc.w	0
3579                     ; 688 void LCD_Ambi_Temp(int Temp){
3580                     	switch	.text
3581  0abf               _LCD_Ambi_Temp:
3583  0abf 89            	pushw	x
3584  0ac0 520c          	subw	sp,#12
3585       0000000c      OFST:	set	12
3588                     ; 689 	int a[3] = { 0, 0, 0};
3590  0ac2 96            	ldw	x,sp
3591  0ac3 1c0001        	addw	x,#OFST-11
3592  0ac6 90ae0014      	ldw	y,#L3051_a
3593  0aca a606          	ld	a,#6
3594  0acc cd0000        	call	c_xymov
3596                     ; 690 	int i = 0, k = 0 , l = 0;
3602                     ; 691 		TxBuf_Data[7] |= 0x10;
3604  0acf 72180019      	bset	L3_TxBuf_Data+7,#4
3605                     ; 692 	if(Temp < 0){
3607  0ad3 9c            	rvf
3608  0ad4 1e0d          	ldw	x,(OFST+1,sp)
3609  0ad6 2e06          	jrsge	L3451
3610                     ; 693 			TxBuf_Data[5] = 0x80; //X1
3612  0ad8 35800017      	mov	L3_TxBuf_Data+5,#128
3614  0adc 2002          	jra	L5451
3615  0ade               L3451:
3616                     ; 696 		TxBuf_Data[5] = 0x00; //X1
3618  0ade 3f17          	clr	L3_TxBuf_Data+5
3619  0ae0               L5451:
3620                     ; 699   k = Temp % 10; // =8
3622  0ae0 1e0d          	ldw	x,(OFST+1,sp)
3623  0ae2 a60a          	ld	a,#10
3624  0ae4 cd0000        	call	c_smodx
3626  0ae7 1f09          	ldw	(OFST-3,sp),x
3628                     ; 700 	l = Temp / 10; // = 4
3630  0ae9 1e0d          	ldw	x,(OFST+1,sp)
3631  0aeb a60a          	ld	a,#10
3632  0aed cd0000        	call	c_sdivx
3634  0af0 1f0b          	ldw	(OFST-1,sp),x
3636                     ; 702 	TxBuf_Data[5] |= TxBuf_Data_RAM_5[l];  //Digit 1
3638  0af2 1e0b          	ldw	x,(OFST-1,sp)
3639  0af4 58            	sllw	x
3640  0af5 b617          	ld	a,L3_TxBuf_Data+5
3641  0af7 ea64          	or	a,(_TxBuf_Data_RAM_5+1,x)
3642  0af9 b717          	ld	L3_TxBuf_Data+5,a
3643                     ; 703 	TxBuf_Data[6] |= TxBuf_Data_RAM_5[k];  //digit 2
3645  0afb 1e09          	ldw	x,(OFST-3,sp)
3646  0afd 58            	sllw	x
3647  0afe b618          	ld	a,L3_TxBuf_Data+6
3648  0b00 ea64          	or	a,(_TxBuf_Data_RAM_5+1,x)
3649  0b02 b718          	ld	L3_TxBuf_Data+6,a
3650                     ; 705 }
3653  0b04 5b0e          	addw	sp,#14
3654  0b06 81            	ret
3698                     ; 713 void LCD_Network(int Bar, int Disable){
3699                     	switch	.text
3700  0b07               _LCD_Network:
3702  0b07 89            	pushw	x
3703       00000000      OFST:	set	0
3706                     ; 714 	if(Disable == 1){
3708  0b08 1e05          	ldw	x,(OFST+5,sp)
3709  0b0a a30001        	cpw	x,#1
3710  0b0d 2608          	jrne	L3061
3711                     ; 715 		TxBuf_Data[30] |= 0x01;
3713  0b0f 72100030      	bset	L3_TxBuf_Data+30,#0
3714                     ; 716 		TxBuf_Data[31] |= 0x00;
3716  0b13 b631          	ld	a,L3_TxBuf_Data+31
3718  0b15 2018          	jra	L5061
3719  0b17               L3061:
3720                     ; 720 		switch(Bar)
3722  0b17 1e01          	ldw	x,(OFST+1,sp)
3724                     ; 733 							break;
3725  0b19 5a            	decw	x
3726  0b1a 270f          	jreq	L7451
3727  0b1c 5a            	decw	x
3728  0b1d 2712          	jreq	L1551
3729  0b1f 5a            	decw	x
3730  0b20 2717          	jreq	L3551
3731  0b22 5a            	decw	x
3732  0b23 271c          	jreq	L5551
3733  0b25               L7551:
3734                     ; 731 				default:TxBuf_Data[30] |= 0x00;
3736  0b25 b630          	ld	a,L3_TxBuf_Data+30
3737                     ; 732 								TxBuf_Data[31] |= 0x00;
3739  0b27 b631          	ld	a,L3_TxBuf_Data+31
3740                     ; 733 							break;
3742  0b29 2004          	jra	L5061
3743  0b2b               L7451:
3744                     ; 722 				case 1:TxBuf_Data[30] |= 0x02;
3746  0b2b 72120030      	bset	L3_TxBuf_Data+30,#1
3747                     ; 723 							break;
3748  0b2f               L5061:
3749                     ; 736 }
3752  0b2f 85            	popw	x
3753  0b30 81            	ret
3754  0b31               L1551:
3755                     ; 724 				case 2:TxBuf_Data[30] |= 0x06;
3757  0b31 b630          	ld	a,L3_TxBuf_Data+30
3758  0b33 aa06          	or	a,#6
3759  0b35 b730          	ld	L3_TxBuf_Data+30,a
3760                     ; 725 							break;
3762  0b37 20f6          	jra	L5061
3763  0b39               L3551:
3764                     ; 726 				case 3:TxBuf_Data[30] |= 0x0E;
3766  0b39 b630          	ld	a,L3_TxBuf_Data+30
3767  0b3b aa0e          	or	a,#14
3768  0b3d b730          	ld	L3_TxBuf_Data+30,a
3769                     ; 727 							break;
3771  0b3f 20ee          	jra	L5061
3772  0b41               L5551:
3773                     ; 728 				case 4:TxBuf_Data[30] |= 0x0E;
3775  0b41 b630          	ld	a,L3_TxBuf_Data+30
3776  0b43 aa0e          	or	a,#14
3777  0b45 b730          	ld	L3_TxBuf_Data+30,a
3778                     ; 729 							TxBuf_Data[31] |= 0x80;
3780  0b47 721e0031      	bset	L3_TxBuf_Data+31,#7
3781                     ; 730 							break;
3783  0b4b 20e2          	jra	L5061
3784  0b4d               L1161:
3785  0b4d 20e0          	jra	L5061
3839                     ; 743 void LCD_RPM_AMP(int Mode,int Val){
3840                     	switch	.text
3841  0b4f               _LCD_RPM_AMP:
3843  0b4f 89            	pushw	x
3844  0b50 89            	pushw	x
3845       00000002      OFST:	set	2
3848                     ; 744 	int val = Val;
3850  0b51 1e07          	ldw	x,(OFST+5,sp)
3851  0b53 1f01          	ldw	(OFST-1,sp),x
3853                     ; 745 	if(Mode == 1)  //RPM
3855  0b55 1e03          	ldw	x,(OFST+1,sp)
3856  0b57 a30001        	cpw	x,#1
3857  0b5a 2614          	jrne	L1461
3858                     ; 747 		TxBuf_Data[19] |= 0x08; //X7
3860  0b5c 72160025      	bset	L3_TxBuf_Data+19,#3
3861                     ; 748 	  LCD_Cal_L_Range(val, (float)MAX_RPM);
3863  0b60 ce0096        	ldw	x,L7411+2
3864  0b63 89            	pushw	x
3865  0b64 ce0094        	ldw	x,L7411
3866  0b67 89            	pushw	x
3867  0b68 1e05          	ldw	x,(OFST+3,sp)
3868  0b6a ad19          	call	_LCD_Cal_L_Range
3870  0b6c 5b04          	addw	sp,#4
3872  0b6e 2012          	jra	L3461
3873  0b70               L1461:
3874                     ; 751 	TxBuf_Data[19] |= 0x04;
3876  0b70 72140025      	bset	L3_TxBuf_Data+19,#2
3877                     ; 752 	LCD_Cal_L_Range(val, (float)MAX_AMP);
3879  0b74 ce0096        	ldw	x,L7411+2
3880  0b77 89            	pushw	x
3881  0b78 ce0094        	ldw	x,L7411
3882  0b7b 89            	pushw	x
3883  0b7c 1e05          	ldw	x,(OFST+3,sp)
3884  0b7e ad05          	call	_LCD_Cal_L_Range
3886  0b80 5b04          	addw	sp,#4
3887  0b82               L3461:
3888                     ; 754 }
3891  0b82 5b04          	addw	sp,#4
3892  0b84 81            	ret
3963                     	switch	.const
3964  001a               L46:
3965  001a 0bd6          	dc.w	L5461
3966  001c 0bde          	dc.w	L7461
3967  001e 0be8          	dc.w	L1561
3968  0020 0bf2          	dc.w	L3561
3969  0022 0bfc          	dc.w	L5561
3970  0024 0c0a          	dc.w	L7561
3971  0026 0c1a          	dc.w	L1661
3972  0028 0c2a          	dc.w	L3661
3973  002a 0c3a          	dc.w	L5661
3974  002c 0c4a          	dc.w	L7661
3975  002e 0c5a          	dc.w	L1761
3976  0030 0c6a          	dc.w	L3761
3977  0032 0c7a          	dc.w	L5761
3978  0034 0c8e          	dc.w	L7761
3979  0036 0ca4          	dc.w	L1071
3980  0038 0cba          	dc.w	L3071
3981  003a 0cd0          	dc.w	L5071
3982  003c 0cea          	dc.w	L7071
3983  003e 0d06          	dc.w	L1171
3984  0040 0d22          	dc.w	L3171
3985  0042 0d3e          	dc.w	L5171
3986  0044 0d5e          	dc.w	L7171
3987  0046 0d80          	dc.w	L1271
3988  0048 0da2          	dc.w	L3271
3989  004a 0dc4          	dc.w	L5271
3990  004c 0dea          	dc.w	L7271
3991  004e 0e12          	dc.w	L1371
3992  0050 0e3a          	dc.w	L3371
3993  0052 0e62          	dc.w	L5371
3994  0054 0e8a          	dc.w	L7371
3995  0056 0eb6          	dc.w	L1471
3996  0058 0ee4          	dc.w	L3471
3997  005a 0f12          	dc.w	L5471
3998  005c 0f40          	dc.w	L7471
3999  005e 0f6c          	dc.w	L1571
4000  0060 0f98          	dc.w	L3571
4001                     ; 759 void LCD_Cal_L_Range(int Val, float MAX){
4002                     	switch	.text
4003  0b85               _LCD_Cal_L_Range:
4005  0b85 89            	pushw	x
4006  0b86 5206          	subw	sp,#6
4007       00000006      OFST:	set	6
4010                     ; 760 	float L =(MAX / 36.0 );  //get 1 unit
4012  0b88 96            	ldw	x,sp
4013  0b89 1c000b        	addw	x,#OFST+5
4014  0b8c cd0000        	call	c_ltor
4016  0b8f ae0078        	ldw	x,#L1202
4017  0b92 cd0000        	call	c_fdiv
4019  0b95 96            	ldw	x,sp
4020  0b96 1c0003        	addw	x,#OFST-3
4021  0b99 cd0000        	call	c_rtol
4024                     ; 761 	float Count = Val / L;
4026  0b9c 1e07          	ldw	x,(OFST+1,sp)
4027  0b9e cd0000        	call	c_itof
4029  0ba1 96            	ldw	x,sp
4030  0ba2 1c0003        	addw	x,#OFST-3
4031  0ba5 cd0000        	call	c_fdiv
4033  0ba8 96            	ldw	x,sp
4034  0ba9 1c0003        	addw	x,#OFST-3
4035  0bac cd0000        	call	c_rtol
4038                     ; 762 	int Ch = Count;
4040  0baf 96            	ldw	x,sp
4041  0bb0 1c0003        	addw	x,#OFST-3
4042  0bb3 cd0000        	call	c_ltor
4044  0bb6 cd0000        	call	c_ftoi
4046  0bb9 1f01          	ldw	(OFST-5,sp),x
4048                     ; 763 	TxBuf_Data[20] |= 0x11; //L0
4050  0bbb b626          	ld	a,L3_TxBuf_Data+20
4051  0bbd aa11          	or	a,#17
4052  0bbf b726          	ld	L3_TxBuf_Data+20,a
4053                     ; 764 	TxBuf_Data[21] |= 0x10; //MAX = X11
4055  0bc1 72180027      	bset	L3_TxBuf_Data+21,#4
4056                     ; 766 	switch(Ch){  //as per value enable L1 to L36
4058  0bc5 1e01          	ldw	x,(OFST-5,sp)
4060                     ; 957 					break;
4061  0bc7 5a            	decw	x
4062  0bc8 a30024        	cpw	x,#36
4063  0bcb 2405          	jruge	L26
4064  0bcd 58            	sllw	x
4065  0bce de001a        	ldw	x,(L46,x)
4066  0bd1 fc            	jp	(x)
4067  0bd2               L26:
4068  0bd2 acc40fc4      	jpf	L5571
4069  0bd6               L5461:
4070                     ; 767 		case 1:TxBuf_Data[19] |= 0x10;
4072  0bd6 72180025      	bset	L3_TxBuf_Data+19,#4
4073                     ; 768 					break;
4075  0bda acd20fd2      	jpf	L7202
4076  0bde               L7461:
4077                     ; 769 		case 2:TxBuf_Data[19] |= 0x30;
4079  0bde b625          	ld	a,L3_TxBuf_Data+19
4080  0be0 aa30          	or	a,#48
4081  0be2 b725          	ld	L3_TxBuf_Data+19,a
4082                     ; 770 					break;
4084  0be4 acd20fd2      	jpf	L7202
4085  0be8               L1561:
4086                     ; 771 		case 3:TxBuf_Data[19] |= 0x70;
4088  0be8 b625          	ld	a,L3_TxBuf_Data+19
4089  0bea aa70          	or	a,#112
4090  0bec b725          	ld	L3_TxBuf_Data+19,a
4091                     ; 772 					break;
4093  0bee acd20fd2      	jpf	L7202
4094  0bf2               L3561:
4095                     ; 773 		case 4:TxBuf_Data[19] |= 0xF0;
4097  0bf2 b625          	ld	a,L3_TxBuf_Data+19
4098  0bf4 aaf0          	or	a,#240
4099  0bf6 b725          	ld	L3_TxBuf_Data+19,a
4100                     ; 774 					break;
4102  0bf8 acd20fd2      	jpf	L7202
4103  0bfc               L5561:
4104                     ; 775 		case 5:TxBuf_Data[19] |= 0xF0;
4106  0bfc b625          	ld	a,L3_TxBuf_Data+19
4107  0bfe aaf0          	or	a,#240
4108  0c00 b725          	ld	L3_TxBuf_Data+19,a
4109                     ; 776 					TxBuf_Data[18] |= 0x08;
4111  0c02 72160024      	bset	L3_TxBuf_Data+18,#3
4112                     ; 777 					break;
4114  0c06 acd20fd2      	jpf	L7202
4115  0c0a               L7561:
4116                     ; 778 		case 6:TxBuf_Data[19] |= 0xF0;
4118  0c0a b625          	ld	a,L3_TxBuf_Data+19
4119  0c0c aaf0          	or	a,#240
4120  0c0e b725          	ld	L3_TxBuf_Data+19,a
4121                     ; 779 					TxBuf_Data[18] |= 0x0C;
4123  0c10 b624          	ld	a,L3_TxBuf_Data+18
4124  0c12 aa0c          	or	a,#12
4125  0c14 b724          	ld	L3_TxBuf_Data+18,a
4126                     ; 780 					break;
4128  0c16 acd20fd2      	jpf	L7202
4129  0c1a               L1661:
4130                     ; 781 		case 7:TxBuf_Data[19] |= 0xF0;
4132  0c1a b625          	ld	a,L3_TxBuf_Data+19
4133  0c1c aaf0          	or	a,#240
4134  0c1e b725          	ld	L3_TxBuf_Data+19,a
4135                     ; 782 					TxBuf_Data[18] |= 0x0E;
4137  0c20 b624          	ld	a,L3_TxBuf_Data+18
4138  0c22 aa0e          	or	a,#14
4139  0c24 b724          	ld	L3_TxBuf_Data+18,a
4140                     ; 783 					break;
4142  0c26 acd20fd2      	jpf	L7202
4143  0c2a               L3661:
4144                     ; 784 		case 8:TxBuf_Data[19] |= 0xF0;
4146  0c2a b625          	ld	a,L3_TxBuf_Data+19
4147  0c2c aaf0          	or	a,#240
4148  0c2e b725          	ld	L3_TxBuf_Data+19,a
4149                     ; 785 					TxBuf_Data[18] |= 0x0F;
4151  0c30 b624          	ld	a,L3_TxBuf_Data+18
4152  0c32 aa0f          	or	a,#15
4153  0c34 b724          	ld	L3_TxBuf_Data+18,a
4154                     ; 786 					break;
4156  0c36 acd20fd2      	jpf	L7202
4157  0c3a               L5661:
4158                     ; 787 		case 9:TxBuf_Data[19] |= 0xF0;
4160  0c3a b625          	ld	a,L3_TxBuf_Data+19
4161  0c3c aaf0          	or	a,#240
4162  0c3e b725          	ld	L3_TxBuf_Data+19,a
4163                     ; 788 					TxBuf_Data[18] |= 0x1F;
4165  0c40 b624          	ld	a,L3_TxBuf_Data+18
4166  0c42 aa1f          	or	a,#31
4167  0c44 b724          	ld	L3_TxBuf_Data+18,a
4168                     ; 789 					break;
4170  0c46 acd20fd2      	jpf	L7202
4171  0c4a               L7661:
4172                     ; 790 		case 10:TxBuf_Data[19] |= 0xF0;
4174  0c4a b625          	ld	a,L3_TxBuf_Data+19
4175  0c4c aaf0          	or	a,#240
4176  0c4e b725          	ld	L3_TxBuf_Data+19,a
4177                     ; 791 					TxBuf_Data[18] |= 0x3F;
4179  0c50 b624          	ld	a,L3_TxBuf_Data+18
4180  0c52 aa3f          	or	a,#63
4181  0c54 b724          	ld	L3_TxBuf_Data+18,a
4182                     ; 792 					break;
4184  0c56 acd20fd2      	jpf	L7202
4185  0c5a               L1761:
4186                     ; 793 		case 11:TxBuf_Data[19] |= 0xF0;
4188  0c5a b625          	ld	a,L3_TxBuf_Data+19
4189  0c5c aaf0          	or	a,#240
4190  0c5e b725          	ld	L3_TxBuf_Data+19,a
4191                     ; 794 					TxBuf_Data[18] |= 0x7F;
4193  0c60 b624          	ld	a,L3_TxBuf_Data+18
4194  0c62 aa7f          	or	a,#127
4195  0c64 b724          	ld	L3_TxBuf_Data+18,a
4196                     ; 795 					break;
4198  0c66 acd20fd2      	jpf	L7202
4199  0c6a               L3761:
4200                     ; 796 		case 12:TxBuf_Data[19] |= 0xF0;
4202  0c6a b625          	ld	a,L3_TxBuf_Data+19
4203  0c6c aaf0          	or	a,#240
4204  0c6e b725          	ld	L3_TxBuf_Data+19,a
4205                     ; 797 					TxBuf_Data[18] |= 0xFF;
4207  0c70 b624          	ld	a,L3_TxBuf_Data+18
4208  0c72 aaff          	or	a,#255
4209  0c74 b724          	ld	L3_TxBuf_Data+18,a
4210                     ; 798 					break;
4212  0c76 acd20fd2      	jpf	L7202
4213  0c7a               L5761:
4214                     ; 799 		case 13:TxBuf_Data[19] |= 0xF0;
4216  0c7a b625          	ld	a,L3_TxBuf_Data+19
4217  0c7c aaf0          	or	a,#240
4218  0c7e b725          	ld	L3_TxBuf_Data+19,a
4219                     ; 800 					TxBuf_Data[18] |= 0xFF;
4221  0c80 b624          	ld	a,L3_TxBuf_Data+18
4222  0c82 aaff          	or	a,#255
4223  0c84 b724          	ld	L3_TxBuf_Data+18,a
4224                     ; 801 					TxBuf_Data[17] |= 0x08;
4226  0c86 72160023      	bset	L3_TxBuf_Data+17,#3
4227                     ; 802 					break;
4229  0c8a acd20fd2      	jpf	L7202
4230  0c8e               L7761:
4231                     ; 803 		case 14:TxBuf_Data[19] |= 0xF0;
4233  0c8e b625          	ld	a,L3_TxBuf_Data+19
4234  0c90 aaf0          	or	a,#240
4235  0c92 b725          	ld	L3_TxBuf_Data+19,a
4236                     ; 804 					TxBuf_Data[18] |= 0xFF;
4238  0c94 b624          	ld	a,L3_TxBuf_Data+18
4239  0c96 aaff          	or	a,#255
4240  0c98 b724          	ld	L3_TxBuf_Data+18,a
4241                     ; 805 					TxBuf_Data[17] |= 0x0C;
4243  0c9a b623          	ld	a,L3_TxBuf_Data+17
4244  0c9c aa0c          	or	a,#12
4245  0c9e b723          	ld	L3_TxBuf_Data+17,a
4246                     ; 806 					break;
4248  0ca0 acd20fd2      	jpf	L7202
4249  0ca4               L1071:
4250                     ; 807 		case 15:TxBuf_Data[19] |= 0xF0;
4252  0ca4 b625          	ld	a,L3_TxBuf_Data+19
4253  0ca6 aaf0          	or	a,#240
4254  0ca8 b725          	ld	L3_TxBuf_Data+19,a
4255                     ; 808 					TxBuf_Data[18] |= 0xFF;
4257  0caa b624          	ld	a,L3_TxBuf_Data+18
4258  0cac aaff          	or	a,#255
4259  0cae b724          	ld	L3_TxBuf_Data+18,a
4260                     ; 809 					TxBuf_Data[17] |= 0x0E;
4262  0cb0 b623          	ld	a,L3_TxBuf_Data+17
4263  0cb2 aa0e          	or	a,#14
4264  0cb4 b723          	ld	L3_TxBuf_Data+17,a
4265                     ; 810 					break;
4267  0cb6 acd20fd2      	jpf	L7202
4268  0cba               L3071:
4269                     ; 811 		case 16:TxBuf_Data[19] |= 0xF0;
4271  0cba b625          	ld	a,L3_TxBuf_Data+19
4272  0cbc aaf0          	or	a,#240
4273  0cbe b725          	ld	L3_TxBuf_Data+19,a
4274                     ; 812 					TxBuf_Data[18] |= 0xFF;
4276  0cc0 b624          	ld	a,L3_TxBuf_Data+18
4277  0cc2 aaff          	or	a,#255
4278  0cc4 b724          	ld	L3_TxBuf_Data+18,a
4279                     ; 813 					TxBuf_Data[17] |= 0x0F;
4281  0cc6 b623          	ld	a,L3_TxBuf_Data+17
4282  0cc8 aa0f          	or	a,#15
4283  0cca b723          	ld	L3_TxBuf_Data+17,a
4284                     ; 814 					break;
4286  0ccc acd20fd2      	jpf	L7202
4287  0cd0               L5071:
4288                     ; 815 		case 17:TxBuf_Data[19] |= 0xF0;
4290  0cd0 b625          	ld	a,L3_TxBuf_Data+19
4291  0cd2 aaf0          	or	a,#240
4292  0cd4 b725          	ld	L3_TxBuf_Data+19,a
4293                     ; 816 					TxBuf_Data[18] |= 0xFF;
4295  0cd6 b624          	ld	a,L3_TxBuf_Data+18
4296  0cd8 aaff          	or	a,#255
4297  0cda b724          	ld	L3_TxBuf_Data+18,a
4298                     ; 817 					TxBuf_Data[17] |= 0x0F;
4300  0cdc b623          	ld	a,L3_TxBuf_Data+17
4301  0cde aa0f          	or	a,#15
4302  0ce0 b723          	ld	L3_TxBuf_Data+17,a
4303                     ; 818 					TxBuf_Data[15] |= 0x10;
4305  0ce2 72180021      	bset	L3_TxBuf_Data+15,#4
4306                     ; 819 					break;
4308  0ce6 acd20fd2      	jpf	L7202
4309  0cea               L7071:
4310                     ; 820 		case 18:TxBuf_Data[19] |= 0xF0;
4312  0cea b625          	ld	a,L3_TxBuf_Data+19
4313  0cec aaf0          	or	a,#240
4314  0cee b725          	ld	L3_TxBuf_Data+19,a
4315                     ; 821 					TxBuf_Data[18] |= 0xFF;
4317  0cf0 b624          	ld	a,L3_TxBuf_Data+18
4318  0cf2 aaff          	or	a,#255
4319  0cf4 b724          	ld	L3_TxBuf_Data+18,a
4320                     ; 822 					TxBuf_Data[17] |= 0x0F;
4322  0cf6 b623          	ld	a,L3_TxBuf_Data+17
4323  0cf8 aa0f          	or	a,#15
4324  0cfa b723          	ld	L3_TxBuf_Data+17,a
4325                     ; 823 					TxBuf_Data[15] |= 0x30;
4327  0cfc b621          	ld	a,L3_TxBuf_Data+15
4328  0cfe aa30          	or	a,#48
4329  0d00 b721          	ld	L3_TxBuf_Data+15,a
4330                     ; 824 					break;
4332  0d02 acd20fd2      	jpf	L7202
4333  0d06               L1171:
4334                     ; 825 		case 19:TxBuf_Data[19] |= 0xF0;
4336  0d06 b625          	ld	a,L3_TxBuf_Data+19
4337  0d08 aaf0          	or	a,#240
4338  0d0a b725          	ld	L3_TxBuf_Data+19,a
4339                     ; 826 					TxBuf_Data[18] |= 0xFF;
4341  0d0c b624          	ld	a,L3_TxBuf_Data+18
4342  0d0e aaff          	or	a,#255
4343  0d10 b724          	ld	L3_TxBuf_Data+18,a
4344                     ; 827 					TxBuf_Data[17] |= 0x0F;
4346  0d12 b623          	ld	a,L3_TxBuf_Data+17
4347  0d14 aa0f          	or	a,#15
4348  0d16 b723          	ld	L3_TxBuf_Data+17,a
4349                     ; 828 					TxBuf_Data[15] |= 0x70;
4351  0d18 b621          	ld	a,L3_TxBuf_Data+15
4352  0d1a aa70          	or	a,#112
4353  0d1c b721          	ld	L3_TxBuf_Data+15,a
4354                     ; 829 					break;
4356  0d1e acd20fd2      	jpf	L7202
4357  0d22               L3171:
4358                     ; 830 		case 20:TxBuf_Data[19] |= 0xF0;
4360  0d22 b625          	ld	a,L3_TxBuf_Data+19
4361  0d24 aaf0          	or	a,#240
4362  0d26 b725          	ld	L3_TxBuf_Data+19,a
4363                     ; 831 					TxBuf_Data[18] |= 0xFF;
4365  0d28 b624          	ld	a,L3_TxBuf_Data+18
4366  0d2a aaff          	or	a,#255
4367  0d2c b724          	ld	L3_TxBuf_Data+18,a
4368                     ; 832 					TxBuf_Data[17] |= 0x0F;
4370  0d2e b623          	ld	a,L3_TxBuf_Data+17
4371  0d30 aa0f          	or	a,#15
4372  0d32 b723          	ld	L3_TxBuf_Data+17,a
4373                     ; 833 					TxBuf_Data[15] |= 0xF0;
4375  0d34 b621          	ld	a,L3_TxBuf_Data+15
4376  0d36 aaf0          	or	a,#240
4377  0d38 b721          	ld	L3_TxBuf_Data+15,a
4378                     ; 834 					break;
4380  0d3a acd20fd2      	jpf	L7202
4381  0d3e               L5171:
4382                     ; 835 		case 21:TxBuf_Data[19] |= 0xF0;
4384  0d3e b625          	ld	a,L3_TxBuf_Data+19
4385  0d40 aaf0          	or	a,#240
4386  0d42 b725          	ld	L3_TxBuf_Data+19,a
4387                     ; 836 					TxBuf_Data[18] |= 0xFF;
4389  0d44 b624          	ld	a,L3_TxBuf_Data+18
4390  0d46 aaff          	or	a,#255
4391  0d48 b724          	ld	L3_TxBuf_Data+18,a
4392                     ; 837 					TxBuf_Data[17] |= 0x0F;
4394  0d4a b623          	ld	a,L3_TxBuf_Data+17
4395  0d4c aa0f          	or	a,#15
4396  0d4e b723          	ld	L3_TxBuf_Data+17,a
4397                     ; 838 					TxBuf_Data[15] |= 0xF0;
4399  0d50 b621          	ld	a,L3_TxBuf_Data+15
4400  0d52 aaf0          	or	a,#240
4401  0d54 b721          	ld	L3_TxBuf_Data+15,a
4402                     ; 839 					TxBuf_Data[23] |= 0x80;
4404  0d56 721e0029      	bset	L3_TxBuf_Data+23,#7
4405                     ; 840 					break;
4407  0d5a acd20fd2      	jpf	L7202
4408  0d5e               L7171:
4409                     ; 841 		case 22:TxBuf_Data[19] |= 0xF0;
4411  0d5e b625          	ld	a,L3_TxBuf_Data+19
4412  0d60 aaf0          	or	a,#240
4413  0d62 b725          	ld	L3_TxBuf_Data+19,a
4414                     ; 842 					TxBuf_Data[18] |= 0xFF;
4416  0d64 b624          	ld	a,L3_TxBuf_Data+18
4417  0d66 aaff          	or	a,#255
4418  0d68 b724          	ld	L3_TxBuf_Data+18,a
4419                     ; 843 					TxBuf_Data[17] |= 0x0F;
4421  0d6a b623          	ld	a,L3_TxBuf_Data+17
4422  0d6c aa0f          	or	a,#15
4423  0d6e b723          	ld	L3_TxBuf_Data+17,a
4424                     ; 844 					TxBuf_Data[15] |= 0xF0;
4426  0d70 b621          	ld	a,L3_TxBuf_Data+15
4427  0d72 aaf0          	or	a,#240
4428  0d74 b721          	ld	L3_TxBuf_Data+15,a
4429                     ; 845 					TxBuf_Data[23] |= 0xC0;
4431  0d76 b629          	ld	a,L3_TxBuf_Data+23
4432  0d78 aac0          	or	a,#192
4433  0d7a b729          	ld	L3_TxBuf_Data+23,a
4434                     ; 846 					break;
4436  0d7c acd20fd2      	jpf	L7202
4437  0d80               L1271:
4438                     ; 847 		case 23:TxBuf_Data[19] |= 0xF0;
4440  0d80 b625          	ld	a,L3_TxBuf_Data+19
4441  0d82 aaf0          	or	a,#240
4442  0d84 b725          	ld	L3_TxBuf_Data+19,a
4443                     ; 848 					TxBuf_Data[18] |= 0xFF;
4445  0d86 b624          	ld	a,L3_TxBuf_Data+18
4446  0d88 aaff          	or	a,#255
4447  0d8a b724          	ld	L3_TxBuf_Data+18,a
4448                     ; 849 					TxBuf_Data[17] |= 0x0F;
4450  0d8c b623          	ld	a,L3_TxBuf_Data+17
4451  0d8e aa0f          	or	a,#15
4452  0d90 b723          	ld	L3_TxBuf_Data+17,a
4453                     ; 850 					TxBuf_Data[15] |= 0xF0;
4455  0d92 b621          	ld	a,L3_TxBuf_Data+15
4456  0d94 aaf0          	or	a,#240
4457  0d96 b721          	ld	L3_TxBuf_Data+15,a
4458                     ; 851 					TxBuf_Data[23] |= 0xE0;
4460  0d98 b629          	ld	a,L3_TxBuf_Data+23
4461  0d9a aae0          	or	a,#224
4462  0d9c b729          	ld	L3_TxBuf_Data+23,a
4463                     ; 852 					break;
4465  0d9e acd20fd2      	jpf	L7202
4466  0da2               L3271:
4467                     ; 853 		case 24:TxBuf_Data[19] |= 0xF0;
4469  0da2 b625          	ld	a,L3_TxBuf_Data+19
4470  0da4 aaf0          	or	a,#240
4471  0da6 b725          	ld	L3_TxBuf_Data+19,a
4472                     ; 854 					TxBuf_Data[18] |= 0xFF;
4474  0da8 b624          	ld	a,L3_TxBuf_Data+18
4475  0daa aaff          	or	a,#255
4476  0dac b724          	ld	L3_TxBuf_Data+18,a
4477                     ; 855 					TxBuf_Data[17] |= 0x0F;
4479  0dae b623          	ld	a,L3_TxBuf_Data+17
4480  0db0 aa0f          	or	a,#15
4481  0db2 b723          	ld	L3_TxBuf_Data+17,a
4482                     ; 856 					TxBuf_Data[15] |= 0xF0;
4484  0db4 b621          	ld	a,L3_TxBuf_Data+15
4485  0db6 aaf0          	or	a,#240
4486  0db8 b721          	ld	L3_TxBuf_Data+15,a
4487                     ; 857 					TxBuf_Data[23] |= 0xF0;
4489  0dba b629          	ld	a,L3_TxBuf_Data+23
4490  0dbc aaf0          	or	a,#240
4491  0dbe b729          	ld	L3_TxBuf_Data+23,a
4492                     ; 858 					break;
4494  0dc0 acd20fd2      	jpf	L7202
4495  0dc4               L5271:
4496                     ; 859 		case 25:TxBuf_Data[19] |= 0xF0;
4498  0dc4 b625          	ld	a,L3_TxBuf_Data+19
4499  0dc6 aaf0          	or	a,#240
4500  0dc8 b725          	ld	L3_TxBuf_Data+19,a
4501                     ; 860 					TxBuf_Data[18] |= 0xFF;
4503  0dca b624          	ld	a,L3_TxBuf_Data+18
4504  0dcc aaff          	or	a,#255
4505  0dce b724          	ld	L3_TxBuf_Data+18,a
4506                     ; 861 					TxBuf_Data[17] |= 0x0F;
4508  0dd0 b623          	ld	a,L3_TxBuf_Data+17
4509  0dd2 aa0f          	or	a,#15
4510  0dd4 b723          	ld	L3_TxBuf_Data+17,a
4511                     ; 862 					TxBuf_Data[15] |= 0xF0;
4513  0dd6 b621          	ld	a,L3_TxBuf_Data+15
4514  0dd8 aaf0          	or	a,#240
4515  0dda b721          	ld	L3_TxBuf_Data+15,a
4516                     ; 863 					TxBuf_Data[23] |= 0xF0;
4518  0ddc b629          	ld	a,L3_TxBuf_Data+23
4519  0dde aaf0          	or	a,#240
4520  0de0 b729          	ld	L3_TxBuf_Data+23,a
4521                     ; 864 					TxBuf_Data[22] |= 0x02;
4523  0de2 72120028      	bset	L3_TxBuf_Data+22,#1
4524                     ; 865 					break;
4526  0de6 acd20fd2      	jpf	L7202
4527  0dea               L7271:
4528                     ; 866 		case 26:TxBuf_Data[19] |= 0xF0;
4530  0dea b625          	ld	a,L3_TxBuf_Data+19
4531  0dec aaf0          	or	a,#240
4532  0dee b725          	ld	L3_TxBuf_Data+19,a
4533                     ; 867 					TxBuf_Data[18] |= 0xFF;
4535  0df0 b624          	ld	a,L3_TxBuf_Data+18
4536  0df2 aaff          	or	a,#255
4537  0df4 b724          	ld	L3_TxBuf_Data+18,a
4538                     ; 868 					TxBuf_Data[17] |= 0x0F;
4540  0df6 b623          	ld	a,L3_TxBuf_Data+17
4541  0df8 aa0f          	or	a,#15
4542  0dfa b723          	ld	L3_TxBuf_Data+17,a
4543                     ; 869 					TxBuf_Data[15] |= 0xF0;
4545  0dfc b621          	ld	a,L3_TxBuf_Data+15
4546  0dfe aaf0          	or	a,#240
4547  0e00 b721          	ld	L3_TxBuf_Data+15,a
4548                     ; 870 					TxBuf_Data[23] |= 0xF0;
4550  0e02 b629          	ld	a,L3_TxBuf_Data+23
4551  0e04 aaf0          	or	a,#240
4552  0e06 b729          	ld	L3_TxBuf_Data+23,a
4553                     ; 871 					TxBuf_Data[22] |= 0x12;
4555  0e08 b628          	ld	a,L3_TxBuf_Data+22
4556  0e0a aa12          	or	a,#18
4557  0e0c b728          	ld	L3_TxBuf_Data+22,a
4558                     ; 872 					break;
4560  0e0e acd20fd2      	jpf	L7202
4561  0e12               L1371:
4562                     ; 873 		case 27:TxBuf_Data[19] |= 0xF0;
4564  0e12 b625          	ld	a,L3_TxBuf_Data+19
4565  0e14 aaf0          	or	a,#240
4566  0e16 b725          	ld	L3_TxBuf_Data+19,a
4567                     ; 874 					TxBuf_Data[18] |= 0xFF;
4569  0e18 b624          	ld	a,L3_TxBuf_Data+18
4570  0e1a aaff          	or	a,#255
4571  0e1c b724          	ld	L3_TxBuf_Data+18,a
4572                     ; 875 					TxBuf_Data[17] |= 0x0F;
4574  0e1e b623          	ld	a,L3_TxBuf_Data+17
4575  0e20 aa0f          	or	a,#15
4576  0e22 b723          	ld	L3_TxBuf_Data+17,a
4577                     ; 876 					TxBuf_Data[15] |= 0xF0;
4579  0e24 b621          	ld	a,L3_TxBuf_Data+15
4580  0e26 aaf0          	or	a,#240
4581  0e28 b721          	ld	L3_TxBuf_Data+15,a
4582                     ; 877 					TxBuf_Data[23] |= 0xF0;
4584  0e2a b629          	ld	a,L3_TxBuf_Data+23
4585  0e2c aaf0          	or	a,#240
4586  0e2e b729          	ld	L3_TxBuf_Data+23,a
4587                     ; 878 					TxBuf_Data[22] |= 0x32;
4589  0e30 b628          	ld	a,L3_TxBuf_Data+22
4590  0e32 aa32          	or	a,#50
4591  0e34 b728          	ld	L3_TxBuf_Data+22,a
4592                     ; 879 					break;
4594  0e36 acd20fd2      	jpf	L7202
4595  0e3a               L3371:
4596                     ; 880 		case 28:TxBuf_Data[19] |= 0xF0;
4598  0e3a b625          	ld	a,L3_TxBuf_Data+19
4599  0e3c aaf0          	or	a,#240
4600  0e3e b725          	ld	L3_TxBuf_Data+19,a
4601                     ; 881 					TxBuf_Data[18] |= 0xFF;
4603  0e40 b624          	ld	a,L3_TxBuf_Data+18
4604  0e42 aaff          	or	a,#255
4605  0e44 b724          	ld	L3_TxBuf_Data+18,a
4606                     ; 882 					TxBuf_Data[17] |= 0x0F;
4608  0e46 b623          	ld	a,L3_TxBuf_Data+17
4609  0e48 aa0f          	or	a,#15
4610  0e4a b723          	ld	L3_TxBuf_Data+17,a
4611                     ; 883 					TxBuf_Data[15] |= 0xF0;
4613  0e4c b621          	ld	a,L3_TxBuf_Data+15
4614  0e4e aaf0          	or	a,#240
4615  0e50 b721          	ld	L3_TxBuf_Data+15,a
4616                     ; 884 					TxBuf_Data[23] |= 0xF0;
4618  0e52 b629          	ld	a,L3_TxBuf_Data+23
4619  0e54 aaf0          	or	a,#240
4620  0e56 b729          	ld	L3_TxBuf_Data+23,a
4621                     ; 885 					TxBuf_Data[22] |= 0x72;
4623  0e58 b628          	ld	a,L3_TxBuf_Data+22
4624  0e5a aa72          	or	a,#114
4625  0e5c b728          	ld	L3_TxBuf_Data+22,a
4626                     ; 886 					break;
4628  0e5e acd20fd2      	jpf	L7202
4629  0e62               L5371:
4630                     ; 887 		case 29:TxBuf_Data[19] |= 0xF0;
4632  0e62 b625          	ld	a,L3_TxBuf_Data+19
4633  0e64 aaf0          	or	a,#240
4634  0e66 b725          	ld	L3_TxBuf_Data+19,a
4635                     ; 888 					TxBuf_Data[18] |= 0xFF;
4637  0e68 b624          	ld	a,L3_TxBuf_Data+18
4638  0e6a aaff          	or	a,#255
4639  0e6c b724          	ld	L3_TxBuf_Data+18,a
4640                     ; 889 					TxBuf_Data[17] |= 0x0F;
4642  0e6e b623          	ld	a,L3_TxBuf_Data+17
4643  0e70 aa0f          	or	a,#15
4644  0e72 b723          	ld	L3_TxBuf_Data+17,a
4645                     ; 890 					TxBuf_Data[15] |= 0xF0;
4647  0e74 b621          	ld	a,L3_TxBuf_Data+15
4648  0e76 aaf0          	or	a,#240
4649  0e78 b721          	ld	L3_TxBuf_Data+15,a
4650                     ; 891 					TxBuf_Data[23] |= 0xF0;
4652  0e7a b629          	ld	a,L3_TxBuf_Data+23
4653  0e7c aaf0          	or	a,#240
4654  0e7e b729          	ld	L3_TxBuf_Data+23,a
4655                     ; 892 					TxBuf_Data[22] |= 0xF2;
4657  0e80 b628          	ld	a,L3_TxBuf_Data+22
4658  0e82 aaf2          	or	a,#242
4659  0e84 b728          	ld	L3_TxBuf_Data+22,a
4660                     ; 893 					break;
4662  0e86 acd20fd2      	jpf	L7202
4663  0e8a               L7371:
4664                     ; 894 		case 30:TxBuf_Data[19] |= 0xF0;
4666  0e8a b625          	ld	a,L3_TxBuf_Data+19
4667  0e8c aaf0          	or	a,#240
4668  0e8e b725          	ld	L3_TxBuf_Data+19,a
4669                     ; 895 					TxBuf_Data[18] |= 0xFF;
4671  0e90 b624          	ld	a,L3_TxBuf_Data+18
4672  0e92 aaff          	or	a,#255
4673  0e94 b724          	ld	L3_TxBuf_Data+18,a
4674                     ; 896 					TxBuf_Data[17] |= 0x0F;
4676  0e96 b623          	ld	a,L3_TxBuf_Data+17
4677  0e98 aa0f          	or	a,#15
4678  0e9a b723          	ld	L3_TxBuf_Data+17,a
4679                     ; 897 					TxBuf_Data[15] |= 0xF0;
4681  0e9c b621          	ld	a,L3_TxBuf_Data+15
4682  0e9e aaf0          	or	a,#240
4683  0ea0 b721          	ld	L3_TxBuf_Data+15,a
4684                     ; 898 					TxBuf_Data[23] |= 0xF0;
4686  0ea2 b629          	ld	a,L3_TxBuf_Data+23
4687  0ea4 aaf0          	or	a,#240
4688  0ea6 b729          	ld	L3_TxBuf_Data+23,a
4689                     ; 899 					TxBuf_Data[22] |= 0xF2;
4691  0ea8 b628          	ld	a,L3_TxBuf_Data+22
4692  0eaa aaf2          	or	a,#242
4693  0eac b728          	ld	L3_TxBuf_Data+22,a
4694                     ; 900 					TxBuf_Data[21] |= 0x08;
4696  0eae 72160027      	bset	L3_TxBuf_Data+21,#3
4697                     ; 901 					break;
4699  0eb2 acd20fd2      	jpf	L7202
4700  0eb6               L1471:
4701                     ; 902 		case 31:TxBuf_Data[19] |= 0xF0;
4703  0eb6 b625          	ld	a,L3_TxBuf_Data+19
4704  0eb8 aaf0          	or	a,#240
4705  0eba b725          	ld	L3_TxBuf_Data+19,a
4706                     ; 903 					TxBuf_Data[18] |= 0xFF;
4708  0ebc b624          	ld	a,L3_TxBuf_Data+18
4709  0ebe aaff          	or	a,#255
4710  0ec0 b724          	ld	L3_TxBuf_Data+18,a
4711                     ; 904 					TxBuf_Data[17] |= 0x0F;
4713  0ec2 b623          	ld	a,L3_TxBuf_Data+17
4714  0ec4 aa0f          	or	a,#15
4715  0ec6 b723          	ld	L3_TxBuf_Data+17,a
4716                     ; 905 					TxBuf_Data[15] |= 0xF0;
4718  0ec8 b621          	ld	a,L3_TxBuf_Data+15
4719  0eca aaf0          	or	a,#240
4720  0ecc b721          	ld	L3_TxBuf_Data+15,a
4721                     ; 906 					TxBuf_Data[23] |= 0xF0;
4723  0ece b629          	ld	a,L3_TxBuf_Data+23
4724  0ed0 aaf0          	or	a,#240
4725  0ed2 b729          	ld	L3_TxBuf_Data+23,a
4726                     ; 907 					TxBuf_Data[22] |= 0xF2;
4728  0ed4 b628          	ld	a,L3_TxBuf_Data+22
4729  0ed6 aaf2          	or	a,#242
4730  0ed8 b728          	ld	L3_TxBuf_Data+22,a
4731                     ; 908 					TxBuf_Data[21] |= 0x0C;
4733  0eda b627          	ld	a,L3_TxBuf_Data+21
4734  0edc aa0c          	or	a,#12
4735  0ede b727          	ld	L3_TxBuf_Data+21,a
4736                     ; 909 					break;
4738  0ee0 acd20fd2      	jpf	L7202
4739  0ee4               L3471:
4740                     ; 910 		case 32:TxBuf_Data[19] |= 0xF0;
4742  0ee4 b625          	ld	a,L3_TxBuf_Data+19
4743  0ee6 aaf0          	or	a,#240
4744  0ee8 b725          	ld	L3_TxBuf_Data+19,a
4745                     ; 911 					TxBuf_Data[18] |= 0xFF;
4747  0eea b624          	ld	a,L3_TxBuf_Data+18
4748  0eec aaff          	or	a,#255
4749  0eee b724          	ld	L3_TxBuf_Data+18,a
4750                     ; 912 					TxBuf_Data[17] |= 0x0F;
4752  0ef0 b623          	ld	a,L3_TxBuf_Data+17
4753  0ef2 aa0f          	or	a,#15
4754  0ef4 b723          	ld	L3_TxBuf_Data+17,a
4755                     ; 913 					TxBuf_Data[15] |= 0xF0;
4757  0ef6 b621          	ld	a,L3_TxBuf_Data+15
4758  0ef8 aaf0          	or	a,#240
4759  0efa b721          	ld	L3_TxBuf_Data+15,a
4760                     ; 914 					TxBuf_Data[23] |= 0xF0;
4762  0efc b629          	ld	a,L3_TxBuf_Data+23
4763  0efe aaf0          	or	a,#240
4764  0f00 b729          	ld	L3_TxBuf_Data+23,a
4765                     ; 915 					TxBuf_Data[22] |= 0xF2;
4767  0f02 b628          	ld	a,L3_TxBuf_Data+22
4768  0f04 aaf2          	or	a,#242
4769  0f06 b728          	ld	L3_TxBuf_Data+22,a
4770                     ; 916 					TxBuf_Data[21] |= 0x0E;
4772  0f08 b627          	ld	a,L3_TxBuf_Data+21
4773  0f0a aa0e          	or	a,#14
4774  0f0c b727          	ld	L3_TxBuf_Data+21,a
4775                     ; 917 					break;
4777  0f0e acd20fd2      	jpf	L7202
4778  0f12               L5471:
4779                     ; 918 		case 33:TxBuf_Data[19] |= 0xF0;
4781  0f12 b625          	ld	a,L3_TxBuf_Data+19
4782  0f14 aaf0          	or	a,#240
4783  0f16 b725          	ld	L3_TxBuf_Data+19,a
4784                     ; 919 					TxBuf_Data[18] |= 0xFF;
4786  0f18 b624          	ld	a,L3_TxBuf_Data+18
4787  0f1a aaff          	or	a,#255
4788  0f1c b724          	ld	L3_TxBuf_Data+18,a
4789                     ; 920 					TxBuf_Data[17] |= 0x0F;
4791  0f1e b623          	ld	a,L3_TxBuf_Data+17
4792  0f20 aa0f          	or	a,#15
4793  0f22 b723          	ld	L3_TxBuf_Data+17,a
4794                     ; 921 					TxBuf_Data[15] |= 0xF0;
4796  0f24 b621          	ld	a,L3_TxBuf_Data+15
4797  0f26 aaf0          	or	a,#240
4798  0f28 b721          	ld	L3_TxBuf_Data+15,a
4799                     ; 922 					TxBuf_Data[23] |= 0xF0;
4801  0f2a b629          	ld	a,L3_TxBuf_Data+23
4802  0f2c aaf0          	or	a,#240
4803  0f2e b729          	ld	L3_TxBuf_Data+23,a
4804                     ; 923 					TxBuf_Data[22] |= 0xF2;
4806  0f30 b628          	ld	a,L3_TxBuf_Data+22
4807  0f32 aaf2          	or	a,#242
4808  0f34 b728          	ld	L3_TxBuf_Data+22,a
4809                     ; 924 					TxBuf_Data[21] |= 0x0F;
4811  0f36 b627          	ld	a,L3_TxBuf_Data+21
4812  0f38 aa0f          	or	a,#15
4813  0f3a b727          	ld	L3_TxBuf_Data+21,a
4814                     ; 925 					break;
4816  0f3c acd20fd2      	jpf	L7202
4817  0f40               L7471:
4818                     ; 926 		case 34:TxBuf_Data[19] |= 0xF0;
4820  0f40 b625          	ld	a,L3_TxBuf_Data+19
4821  0f42 aaf0          	or	a,#240
4822  0f44 b725          	ld	L3_TxBuf_Data+19,a
4823                     ; 927 					TxBuf_Data[18] |= 0xFF;
4825  0f46 b624          	ld	a,L3_TxBuf_Data+18
4826  0f48 aaff          	or	a,#255
4827  0f4a b724          	ld	L3_TxBuf_Data+18,a
4828                     ; 928 					TxBuf_Data[17] |= 0x0F;
4830  0f4c b623          	ld	a,L3_TxBuf_Data+17
4831  0f4e aa0f          	or	a,#15
4832  0f50 b723          	ld	L3_TxBuf_Data+17,a
4833                     ; 929 					TxBuf_Data[15] |= 0xF0;
4835  0f52 b621          	ld	a,L3_TxBuf_Data+15
4836  0f54 aaf0          	or	a,#240
4837  0f56 b721          	ld	L3_TxBuf_Data+15,a
4838                     ; 930 					TxBuf_Data[23] |= 0xF0;
4840  0f58 b629          	ld	a,L3_TxBuf_Data+23
4841  0f5a aaf0          	or	a,#240
4842  0f5c b729          	ld	L3_TxBuf_Data+23,a
4843                     ; 931 					TxBuf_Data[22] |= 0xF2;
4845  0f5e b628          	ld	a,L3_TxBuf_Data+22
4846  0f60 aaf2          	or	a,#242
4847  0f62 b728          	ld	L3_TxBuf_Data+22,a
4848                     ; 932 					TxBuf_Data[21] |= 0x8F;
4850  0f64 b627          	ld	a,L3_TxBuf_Data+21
4851  0f66 aa8f          	or	a,#143
4852  0f68 b727          	ld	L3_TxBuf_Data+21,a
4853                     ; 933 					break;
4855  0f6a 2066          	jra	L7202
4856  0f6c               L1571:
4857                     ; 934 		case 35:TxBuf_Data[19] |= 0xF0;
4859  0f6c b625          	ld	a,L3_TxBuf_Data+19
4860  0f6e aaf0          	or	a,#240
4861  0f70 b725          	ld	L3_TxBuf_Data+19,a
4862                     ; 935 					TxBuf_Data[18] |= 0xFF;
4864  0f72 b624          	ld	a,L3_TxBuf_Data+18
4865  0f74 aaff          	or	a,#255
4866  0f76 b724          	ld	L3_TxBuf_Data+18,a
4867                     ; 936 					TxBuf_Data[17] |= 0x0F;
4869  0f78 b623          	ld	a,L3_TxBuf_Data+17
4870  0f7a aa0f          	or	a,#15
4871  0f7c b723          	ld	L3_TxBuf_Data+17,a
4872                     ; 937 					TxBuf_Data[15] |= 0xF0;
4874  0f7e b621          	ld	a,L3_TxBuf_Data+15
4875  0f80 aaf0          	or	a,#240
4876  0f82 b721          	ld	L3_TxBuf_Data+15,a
4877                     ; 938 					TxBuf_Data[23] |= 0xF0;
4879  0f84 b629          	ld	a,L3_TxBuf_Data+23
4880  0f86 aaf0          	or	a,#240
4881  0f88 b729          	ld	L3_TxBuf_Data+23,a
4882                     ; 939 					TxBuf_Data[22] |= 0xF2;
4884  0f8a b628          	ld	a,L3_TxBuf_Data+22
4885  0f8c aaf2          	or	a,#242
4886  0f8e b728          	ld	L3_TxBuf_Data+22,a
4887                     ; 940 					TxBuf_Data[21] |= 0xCF;
4889  0f90 b627          	ld	a,L3_TxBuf_Data+21
4890  0f92 aacf          	or	a,#207
4891  0f94 b727          	ld	L3_TxBuf_Data+21,a
4892                     ; 941 					break;
4894  0f96 203a          	jra	L7202
4895  0f98               L3571:
4896                     ; 942 		case 36:TxBuf_Data[19] |= 0xF0;
4898  0f98 b625          	ld	a,L3_TxBuf_Data+19
4899  0f9a aaf0          	or	a,#240
4900  0f9c b725          	ld	L3_TxBuf_Data+19,a
4901                     ; 943 					TxBuf_Data[18] |= 0xFF;
4903  0f9e b624          	ld	a,L3_TxBuf_Data+18
4904  0fa0 aaff          	or	a,#255
4905  0fa2 b724          	ld	L3_TxBuf_Data+18,a
4906                     ; 944 					TxBuf_Data[17] |= 0x0F;
4908  0fa4 b623          	ld	a,L3_TxBuf_Data+17
4909  0fa6 aa0f          	or	a,#15
4910  0fa8 b723          	ld	L3_TxBuf_Data+17,a
4911                     ; 945 					TxBuf_Data[15] |= 0xF0;
4913  0faa b621          	ld	a,L3_TxBuf_Data+15
4914  0fac aaf0          	or	a,#240
4915  0fae b721          	ld	L3_TxBuf_Data+15,a
4916                     ; 946 					TxBuf_Data[23] |= 0xF0;
4918  0fb0 b629          	ld	a,L3_TxBuf_Data+23
4919  0fb2 aaf0          	or	a,#240
4920  0fb4 b729          	ld	L3_TxBuf_Data+23,a
4921                     ; 947 					TxBuf_Data[22] |= 0xF2;
4923  0fb6 b628          	ld	a,L3_TxBuf_Data+22
4924  0fb8 aaf2          	or	a,#242
4925  0fba b728          	ld	L3_TxBuf_Data+22,a
4926                     ; 948 					TxBuf_Data[21] |= 0xEF;
4928  0fbc b627          	ld	a,L3_TxBuf_Data+21
4929  0fbe aaef          	or	a,#239
4930  0fc0 b727          	ld	L3_TxBuf_Data+21,a
4931                     ; 949 					break;
4933  0fc2 200e          	jra	L7202
4934  0fc4               L5571:
4935                     ; 950 		default:TxBuf_Data[19] |= 0x00;
4937  0fc4 b625          	ld	a,L3_TxBuf_Data+19
4938                     ; 951 					TxBuf_Data[18] |= 0x00;
4940  0fc6 b624          	ld	a,L3_TxBuf_Data+18
4941                     ; 952 					TxBuf_Data[17] |= 0x00;
4943  0fc8 b623          	ld	a,L3_TxBuf_Data+17
4944                     ; 953 					TxBuf_Data[15] |= 0x00;
4946  0fca b621          	ld	a,L3_TxBuf_Data+15
4947                     ; 954 					TxBuf_Data[23] |= 0x00;
4949  0fcc b629          	ld	a,L3_TxBuf_Data+23
4950                     ; 955 					TxBuf_Data[22] |= 0x00;
4952  0fce b628          	ld	a,L3_TxBuf_Data+22
4953                     ; 956 					TxBuf_Data[21] |= 0x00;
4955  0fd0 b627          	ld	a,L3_TxBuf_Data+21
4956                     ; 957 					break;
4958  0fd2               L7202:
4959                     ; 959 }
4962  0fd2 5b08          	addw	sp,#8
4963  0fd4 81            	ret
4966                     	switch	.const
4967  0062               L1302_z:
4968  0062 0000          	dc.w	0
4969  0064 0000          	dc.w	0
4970  0066 0000          	dc.w	0
4971  0068 0000          	dc.w	0
4972  006a 0000          	dc.w	0
4973  006c 0000          	dc.w	0
4974  006e 0000          	dc.w	0
5108                     ; 963 void LCD_Trip(int Mode, int Km, long Val){
5109                     	switch	.text
5110  0fd5               _LCD_Trip:
5112  0fd5 89            	pushw	x
5113  0fd6 521e          	subw	sp,#30
5114       0000001e      OFST:	set	30
5117                     ; 965 	int z[7] = { 0, 0, 0, 0, 0, 0, 0};
5119  0fd8 96            	ldw	x,sp
5120  0fd9 1c0011        	addw	x,#OFST-13
5121  0fdc 90ae0062      	ldw	y,#L1302_z
5122  0fe0 a60e          	ld	a,#14
5123  0fe2 cd0000        	call	c_xymov
5125                     ; 966 	int i = 0, a, b, c, d, e, f, g;
5127  0fe5 5f            	clrw	x
5128  0fe6 1f0f          	ldw	(OFST-15,sp),x
5131  0fe8 2038          	jra	L1312
5132  0fea               L5212:
5133                     ; 968 			z[i] = Val % 10;
5135  0fea 96            	ldw	x,sp
5136  0feb 1c0025        	addw	x,#OFST+7
5137  0fee cd0000        	call	c_ltor
5139  0ff1 ae000a        	ldw	x,#L23
5140  0ff4 cd0000        	call	c_lmod
5142  0ff7 96            	ldw	x,sp
5143  0ff8 1c0011        	addw	x,#OFST-13
5144  0ffb 1f01          	ldw	(OFST-29,sp),x
5146  0ffd 1e0f          	ldw	x,(OFST-15,sp)
5147  0fff 58            	sllw	x
5148  1000 72fb01        	addw	x,(OFST-29,sp)
5149  1003 90be02        	ldw	y,c_lreg+2
5150  1006 ff            	ldw	(x),y
5151                     ; 969 			Val = Val / 10;
5153  1007 96            	ldw	x,sp
5154  1008 1c0025        	addw	x,#OFST+7
5155  100b cd0000        	call	c_ltor
5157  100e ae000a        	ldw	x,#L23
5158  1011 cd0000        	call	c_ldiv
5160  1014 96            	ldw	x,sp
5161  1015 1c0025        	addw	x,#OFST+7
5162  1018 cd0000        	call	c_rtol
5164                     ; 970 			++i;		
5166  101b 1e0f          	ldw	x,(OFST-15,sp)
5167  101d 1c0001        	addw	x,#1
5168  1020 1f0f          	ldw	(OFST-15,sp),x
5170  1022               L1312:
5171                     ; 967 	while(Val != 0){
5173  1022 96            	ldw	x,sp
5174  1023 1c0025        	addw	x,#OFST+7
5175  1026 cd0000        	call	c_lzmp
5177  1029 26bf          	jrne	L5212
5178                     ; 972 	a = z[0];
5180  102b 1e11          	ldw	x,(OFST-13,sp)
5181  102d 1f03          	ldw	(OFST-27,sp),x
5183                     ; 973 	b = z[1];
5185  102f 1e13          	ldw	x,(OFST-11,sp)
5186  1031 1f05          	ldw	(OFST-25,sp),x
5188                     ; 974 	c = z[2];
5190  1033 1e15          	ldw	x,(OFST-9,sp)
5191  1035 1f07          	ldw	(OFST-23,sp),x
5193                     ; 975 	d = z[3];
5195  1037 1e17          	ldw	x,(OFST-7,sp)
5196  1039 1f09          	ldw	(OFST-21,sp),x
5198                     ; 976 	e = z[4];
5200  103b 1e19          	ldw	x,(OFST-5,sp)
5201  103d 1f0b          	ldw	(OFST-19,sp),x
5203                     ; 977 	f = z[5];
5205  103f 1e1b          	ldw	x,(OFST-3,sp)
5206  1041 1f0d          	ldw	(OFST-17,sp),x
5208                     ; 978 	g = z[6];
5210  1043 1e1d          	ldw	x,(OFST-1,sp)
5211  1045 1f0f          	ldw	(OFST-15,sp),x
5213                     ; 979 	if(Km == 1){
5215  1047 1e23          	ldw	x,(OFST+5,sp)
5216  1049 a30001        	cpw	x,#1
5217  104c 2606          	jrne	L5312
5218                     ; 980 		TxBuf_Data[28] |= 0x80;  //km  == X24
5220  104e 721e002e      	bset	L3_TxBuf_Data+28,#7
5222  1052 2004          	jra	L7312
5223  1054               L5312:
5224                     ; 984 		TxBuf_Data[30] |= 0x80;  //mi
5226  1054 721e0030      	bset	L3_TxBuf_Data+30,#7
5227  1058               L7312:
5228                     ; 986 	if(Mode == 1) //TRIP A
5230  1058 1e1f          	ldw	x,(OFST+1,sp)
5231  105a a30001        	cpw	x,#1
5232  105d 2606          	jrne	L1412
5233                     ; 988 		TxBuf_Data[25] |= 0x00; // B X26 disable
5235  105f b62b          	ld	a,L3_TxBuf_Data+25
5236                     ; 989 		TxBuf_Data[26] |= 0x80;  //A X25	
5238  1061 721e002c      	bset	L3_TxBuf_Data+26,#7
5239  1065               L1412:
5240                     ; 991 	if(Mode == 2) //TRIP B
5242  1065 1e1f          	ldw	x,(OFST+1,sp)
5243  1067 a30002        	cpw	x,#2
5244  106a 260a          	jrne	L3412
5245                     ; 993 		TxBuf_Data[26] |= 0x00;  //A X25 disable
5247  106c b62c          	ld	a,L3_TxBuf_Data+26
5248                     ; 994 		TxBuf_Data[25] |= 0x80; // B X26
5250  106e 721e002b      	bset	L3_TxBuf_Data+25,#7
5251                     ; 995 		TxBuf_Data[27] |= 0x80;  //TRIP X23
5253  1072 721e002d      	bset	L3_TxBuf_Data+27,#7
5254  1076               L3412:
5255                     ; 999 	TxBuf_Data[23] |= (TxBuf_Data_RAM_0[g] & 0x0f);  //digit 16 lower 4 bit
5257  1076 1e0f          	ldw	x,(OFST-15,sp)
5258  1078 58            	sllw	x
5259  1079 e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5260  107b a40f          	and	a,#15
5261  107d ba29          	or	a,L3_TxBuf_Data+23
5262  107f b729          	ld	L3_TxBuf_Data+23,a
5263                     ; 1000 	TxBuf_Data[24] |=  (TxBuf_Data_RAM_0[g] & 0xf0)| (TxBuf_Data_RAM_0[f] & 0x0f);  //digit 16 upper 4 bit and digit 17 lower 4 bit
5265  1081 1e0d          	ldw	x,(OFST-17,sp)
5266  1083 58            	sllw	x
5267  1084 e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5268  1086 a40f          	and	a,#15
5269  1088 6b02          	ld	(OFST-28,sp),a
5271  108a 1e0f          	ldw	x,(OFST-15,sp)
5272  108c 58            	sllw	x
5273  108d e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5274  108f a4f0          	and	a,#240
5275  1091 1a02          	or	a,(OFST-28,sp)
5276  1093 ba2a          	or	a,L3_TxBuf_Data+24
5277  1095 b72a          	ld	L3_TxBuf_Data+24,a
5278                     ; 1001 	TxBuf_Data[25] |= (TxBuf_Data_RAM_0[f] & 0xf0)  | (TxBuf_Data_RAM_0[e] & 0x0f);  //digit 17 upper 4 bit and digit 18 lower 4 bit
5280  1097 1e0b          	ldw	x,(OFST-19,sp)
5281  1099 58            	sllw	x
5282  109a e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5283  109c a40f          	and	a,#15
5284  109e 6b02          	ld	(OFST-28,sp),a
5286  10a0 1e0d          	ldw	x,(OFST-17,sp)
5287  10a2 58            	sllw	x
5288  10a3 e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5289  10a5 a4f0          	and	a,#240
5290  10a7 1a02          	or	a,(OFST-28,sp)
5291  10a9 ba2b          	or	a,L3_TxBuf_Data+25
5292  10ab b72b          	ld	L3_TxBuf_Data+25,a
5293                     ; 1002 	TxBuf_Data[26] |= (TxBuf_Data_RAM_0[e] & 0XF0) | (TxBuf_Data_RAM_0[d] & 0X0f);  //digit 18 upper 4 bit and digit 19 lower 4 bit
5295  10ad 1e09          	ldw	x,(OFST-21,sp)
5296  10af 58            	sllw	x
5297  10b0 e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5298  10b2 a40f          	and	a,#15
5299  10b4 6b02          	ld	(OFST-28,sp),a
5301  10b6 1e0b          	ldw	x,(OFST-19,sp)
5302  10b8 58            	sllw	x
5303  10b9 e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5304  10bb a4f0          	and	a,#240
5305  10bd 1a02          	or	a,(OFST-28,sp)
5306  10bf ba2c          	or	a,L3_TxBuf_Data+26
5307  10c1 b72c          	ld	L3_TxBuf_Data+26,a
5308                     ; 1003 	TxBuf_Data[27] |= (TxBuf_Data_RAM_0[d] & 0XF0) | (TxBuf_Data_RAM_0[c] & 0X0F) | 0x80;  //digit 19 upper 4 bit and digit 20 lower 4 bit
5310  10c3 1e07          	ldw	x,(OFST-23,sp)
5311  10c5 58            	sllw	x
5312  10c6 e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5313  10c8 a40f          	and	a,#15
5314  10ca 6b02          	ld	(OFST-28,sp),a
5316  10cc 1e09          	ldw	x,(OFST-21,sp)
5317  10ce 58            	sllw	x
5318  10cf e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5319  10d1 a4f0          	and	a,#240
5320  10d3 1a02          	or	a,(OFST-28,sp)
5321  10d5 aa80          	or	a,#128
5322  10d7 ba2d          	or	a,L3_TxBuf_Data+27
5323  10d9 b72d          	ld	L3_TxBuf_Data+27,a
5324                     ; 1004 	TxBuf_Data[28] |= (TxBuf_Data_RAM_0[c] & 0XF0) | (TxBuf_Data_RAM_0[b] & 0X0F);  //digit 20 upper 4 bit and digit 21 lower 4 bit
5326  10db 1e05          	ldw	x,(OFST-25,sp)
5327  10dd 58            	sllw	x
5328  10de e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5329  10e0 a40f          	and	a,#15
5330  10e2 6b02          	ld	(OFST-28,sp),a
5332  10e4 1e07          	ldw	x,(OFST-23,sp)
5333  10e6 58            	sllw	x
5334  10e7 e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5335  10e9 a4f0          	and	a,#240
5336  10eb 1a02          	or	a,(OFST-28,sp)
5337  10ed ba2e          	or	a,L3_TxBuf_Data+28
5338  10ef b72e          	ld	L3_TxBuf_Data+28,a
5339                     ; 1005 	TxBuf_Data[29] |= (TxBuf_Data_RAM_0[b] & 0XF0) | (TxBuf_Data_RAM_0[a] & 0X0F) | 0x80; //Dp //digit 21 upper 4 bit and digit 22 lower 4 bit
5341  10f1 1e03          	ldw	x,(OFST-27,sp)
5342  10f3 58            	sllw	x
5343  10f4 e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5344  10f6 a40f          	and	a,#15
5345  10f8 6b02          	ld	(OFST-28,sp),a
5347  10fa 1e05          	ldw	x,(OFST-25,sp)
5348  10fc 58            	sllw	x
5349  10fd e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5350  10ff a4f0          	and	a,#240
5351  1101 1a02          	or	a,(OFST-28,sp)
5352  1103 aa80          	or	a,#128
5353  1105 ba2f          	or	a,L3_TxBuf_Data+29
5354  1107 b72f          	ld	L3_TxBuf_Data+29,a
5355                     ; 1006 	TxBuf_Data[30] |= (TxBuf_Data_RAM_0[a] & 0xf0);  //digit 22 upper 4 bit 		
5357  1109 1e03          	ldw	x,(OFST-27,sp)
5358  110b 58            	sllw	x
5359  110c e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5360  110e a4f0          	and	a,#240
5361  1110 ba30          	or	a,L3_TxBuf_Data+30
5362  1112 b730          	ld	L3_TxBuf_Data+30,a
5363                     ; 1007 }
5366  1114 5b20          	addw	sp,#32
5367  1116 81            	ret
5370                     	switch	.const
5371  0070               L5412_z:
5372  0070 0000          	dc.w	0
5373  0072 0000          	dc.w	0
5374  0074 0000          	dc.w	0
5375  0076 0000          	dc.w	0
5482                     ; 1012 void LCD_RPM_Range(int Mode, int Km_mi , long Val){
5483                     	switch	.text
5484  1117               _LCD_RPM_Range:
5486  1117 89            	pushw	x
5487  1118 5212          	subw	sp,#18
5488       00000012      OFST:	set	18
5491                     ; 1013 	int z[4] = { 0, 0, 0, 0};
5493  111a 96            	ldw	x,sp
5494  111b 1c0009        	addw	x,#OFST-9
5495  111e 90ae0070      	ldw	y,#L5412_z
5496  1122 a608          	ld	a,#8
5497  1124 cd0000        	call	c_xymov
5499                     ; 1014 	int i = 0, a, b, c, d;
5501  1127 5f            	clrw	x
5502  1128 1f11          	ldw	(OFST-1,sp),x
5505  112a 2038          	jra	L1322
5506  112c               L5222:
5507                     ; 1016 			z[i] = Val % 10;
5509  112c 96            	ldw	x,sp
5510  112d 1c0019        	addw	x,#OFST+7
5511  1130 cd0000        	call	c_ltor
5513  1133 ae000a        	ldw	x,#L23
5514  1136 cd0000        	call	c_lmod
5516  1139 96            	ldw	x,sp
5517  113a 1c0009        	addw	x,#OFST-9
5518  113d 1f01          	ldw	(OFST-17,sp),x
5520  113f 1e11          	ldw	x,(OFST-1,sp)
5521  1141 58            	sllw	x
5522  1142 72fb01        	addw	x,(OFST-17,sp)
5523  1145 90be02        	ldw	y,c_lreg+2
5524  1148 ff            	ldw	(x),y
5525                     ; 1017 			Val = Val / 10;
5527  1149 96            	ldw	x,sp
5528  114a 1c0019        	addw	x,#OFST+7
5529  114d cd0000        	call	c_ltor
5531  1150 ae000a        	ldw	x,#L23
5532  1153 cd0000        	call	c_ldiv
5534  1156 96            	ldw	x,sp
5535  1157 1c0019        	addw	x,#OFST+7
5536  115a cd0000        	call	c_rtol
5538                     ; 1018 			++i;		
5540  115d 1e11          	ldw	x,(OFST-1,sp)
5541  115f 1c0001        	addw	x,#1
5542  1162 1f11          	ldw	(OFST-1,sp),x
5544  1164               L1322:
5545                     ; 1015 	while(Val != 0){
5547  1164 96            	ldw	x,sp
5548  1165 1c0019        	addw	x,#OFST+7
5549  1168 cd0000        	call	c_lzmp
5551  116b 26bf          	jrne	L5222
5552                     ; 1020 	a = z[0];  //unit place
5554  116d 1e09          	ldw	x,(OFST-9,sp)
5555  116f 1f03          	ldw	(OFST-15,sp),x
5557                     ; 1021 	b = z[1];  //tenth place
5559  1171 1e0b          	ldw	x,(OFST-7,sp)
5560  1173 1f05          	ldw	(OFST-13,sp),x
5562                     ; 1022 	c = z[2];  //hundreadth place
5564  1175 1e0d          	ldw	x,(OFST-5,sp)
5565  1177 1f07          	ldw	(OFST-11,sp),x
5567                     ; 1023 	d = z[3];  //thousand th place
5569  1179 1e0f          	ldw	x,(OFST-3,sp)
5570  117b 1f11          	ldw	(OFST-1,sp),x
5572                     ; 1024 	if(Mode == 1)  //Range means Distance
5574  117d 1e13          	ldw	x,(OFST+1,sp)
5575  117f a30001        	cpw	x,#1
5576  1182 2606          	jrne	L5322
5577                     ; 1026 		TxBuf_Data[9] |= 0x80; //x15 means Range
5579  1184 721e001b      	bset	L3_TxBuf_Data+9,#7
5581  1188 2004          	jra	L7322
5582  118a               L5322:
5583                     ; 1030 		TxBuf_Data[10] |= 0x80; //x13 means RPM
5585  118a 721e001c      	bset	L3_TxBuf_Data+10,#7
5586  118e               L7322:
5587                     ; 1033 	if(Km_mi == 1) //Km
5589  118e 1e17          	ldw	x,(OFST+5,sp)
5590  1190 a30001        	cpw	x,#1
5591  1193 2606          	jrne	L1422
5592                     ; 1035 		TxBuf_Data[11] |= 0x80; //x14 = km
5594  1195 721e001d      	bset	L3_TxBuf_Data+11,#7
5596  1199 2004          	jra	L3422
5597  119b               L1422:
5598                     ; 1038 		TxBuf_Data[12] |= 0x80;  //x12 = mi
5600  119b 721e001e      	bset	L3_TxBuf_Data+12,#7
5601  119f               L3422:
5602                     ; 1043 	TxBuf_Data[8]  |= (TxBuf_Data_RAM_0[d] & 0x0f);    //digit 10 lower nibble
5604  119f 1e11          	ldw	x,(OFST-1,sp)
5605  11a1 58            	sllw	x
5606  11a2 e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5607  11a4 a40f          	and	a,#15
5608  11a6 ba1a          	or	a,L3_TxBuf_Data+8
5609  11a8 b71a          	ld	L3_TxBuf_Data+8,a
5610                     ; 1044 	TxBuf_Data[9]  |= (TxBuf_Data_RAM_0[d] & 0xf0)| (TxBuf_Data_RAM_0[c] & 0x0f); //digit 10 upper nibble and digit 11 lower nibble
5612  11aa 1e07          	ldw	x,(OFST-11,sp)
5613  11ac 58            	sllw	x
5614  11ad e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5615  11af a40f          	and	a,#15
5616  11b1 6b02          	ld	(OFST-16,sp),a
5618  11b3 1e11          	ldw	x,(OFST-1,sp)
5619  11b5 58            	sllw	x
5620  11b6 e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5621  11b8 a4f0          	and	a,#240
5622  11ba 1a02          	or	a,(OFST-16,sp)
5623  11bc ba1b          	or	a,L3_TxBuf_Data+9
5624  11be b71b          	ld	L3_TxBuf_Data+9,a
5625                     ; 1045 	TxBuf_Data[10] |= (TxBuf_Data_RAM_0[c] & 0xf0)| (TxBuf_Data_RAM_0[b] & 0x0f);//digit 11 upper nibble and digit 12 lower nibble
5627  11c0 1e05          	ldw	x,(OFST-13,sp)
5628  11c2 58            	sllw	x
5629  11c3 e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5630  11c5 a40f          	and	a,#15
5631  11c7 6b02          	ld	(OFST-16,sp),a
5633  11c9 1e07          	ldw	x,(OFST-11,sp)
5634  11cb 58            	sllw	x
5635  11cc e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5636  11ce a4f0          	and	a,#240
5637  11d0 1a02          	or	a,(OFST-16,sp)
5638  11d2 ba1c          	or	a,L3_TxBuf_Data+10
5639  11d4 b71c          	ld	L3_TxBuf_Data+10,a
5640                     ; 1046 	TxBuf_Data[11] |= (TxBuf_Data_RAM_0[b] & 0xf0)| (TxBuf_Data_RAM_0[a] & 0x0f);//digit 12 upper nibble and digit 13 lower nibble
5642  11d6 1e03          	ldw	x,(OFST-15,sp)
5643  11d8 58            	sllw	x
5644  11d9 e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5645  11db a40f          	and	a,#15
5646  11dd 6b02          	ld	(OFST-16,sp),a
5648  11df 1e05          	ldw	x,(OFST-13,sp)
5649  11e1 58            	sllw	x
5650  11e2 e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5651  11e4 a4f0          	and	a,#240
5652  11e6 1a02          	or	a,(OFST-16,sp)
5653  11e8 ba1d          	or	a,L3_TxBuf_Data+11
5654  11ea b71d          	ld	L3_TxBuf_Data+11,a
5655                     ; 1047 	TxBuf_Data[12] |= (TxBuf_Data_RAM_0[a] & 0xf0); //digit 13 upper nibble
5657  11ec 1e03          	ldw	x,(OFST-15,sp)
5658  11ee 58            	sllw	x
5659  11ef e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5660  11f1 a4f0          	and	a,#240
5661  11f3 ba1e          	or	a,L3_TxBuf_Data+12
5662  11f5 b71e          	ld	L3_TxBuf_Data+12,a
5663                     ; 1050 }
5666  11f7 5b14          	addw	sp,#20
5667  11f9 81            	ret
5730                     ; 1054 void LCD_Wh_Km(int Mode, int Val){
5731                     	switch	.text
5732  11fa               _LCD_Wh_Km:
5734  11fa 89            	pushw	x
5735  11fb 5205          	subw	sp,#5
5736       00000005      OFST:	set	5
5739                     ; 1057 	a = Val % 10; //unit place
5741  11fd 1e0a          	ldw	x,(OFST+5,sp)
5742  11ff a60a          	ld	a,#10
5743  1201 cd0000        	call	c_smodx
5745  1204 1f02          	ldw	(OFST-3,sp),x
5747                     ; 1058 	b = Val / 10; //tenth place
5749  1206 1e0a          	ldw	x,(OFST+5,sp)
5750  1208 a60a          	ld	a,#10
5751  120a cd0000        	call	c_sdivx
5753  120d 1f04          	ldw	(OFST-1,sp),x
5755                     ; 1060 	if(Mode == 1) // Wh/Km enable
5757  120f 1e06          	ldw	x,(OFST+1,sp)
5758  1211 a30001        	cpw	x,#1
5759  1214 260c          	jrne	L7722
5760                     ; 1062 		TxBuf_Data[14] |= 0x88;  //x19 x21
5762  1216 b620          	ld	a,L3_TxBuf_Data+14
5763  1218 aa88          	or	a,#136
5764  121a b720          	ld	L3_TxBuf_Data+14,a
5765                     ; 1063 		TxBuf_Data[13] |= 0x80;  //x20
5767  121c 721e001f      	bset	L3_TxBuf_Data+13,#7
5769  1220 2006          	jra	L1032
5770  1222               L7722:
5771                     ; 1066 		TxBuf_Data[14] |= 0x07;   // Wh/mi enable
5773  1222 b620          	ld	a,L3_TxBuf_Data+14
5774  1224 aa07          	or	a,#7
5775  1226 b720          	ld	L3_TxBuf_Data+14,a
5776  1228               L1032:
5777                     ; 1070 		TxBuf_Data[12] |= (TxBuf_Data_RAM_0[b] & 0x0f);  //digit 14 lower nibble
5779  1228 1e04          	ldw	x,(OFST-1,sp)
5780  122a 58            	sllw	x
5781  122b e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5782  122d a40f          	and	a,#15
5783  122f ba1e          	or	a,L3_TxBuf_Data+12
5784  1231 b71e          	ld	L3_TxBuf_Data+12,a
5785                     ; 1071 		TxBuf_Data[13] |= (TxBuf_Data_RAM_0[b] & 0xf0) | (TxBuf_Data_RAM_0[a] & 0x0f);  //digit 14 upper nibble and digit 15 lower nibble
5787  1233 1e02          	ldw	x,(OFST-3,sp)
5788  1235 58            	sllw	x
5789  1236 e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5790  1238 a40f          	and	a,#15
5791  123a 6b01          	ld	(OFST-4,sp),a
5793  123c 1e04          	ldw	x,(OFST-1,sp)
5794  123e 58            	sllw	x
5795  123f e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5796  1241 a4f0          	and	a,#240
5797  1243 1a01          	or	a,(OFST-4,sp)
5798  1245 ba1f          	or	a,L3_TxBuf_Data+13
5799  1247 b71f          	ld	L3_TxBuf_Data+13,a
5800                     ; 1072 		TxBuf_Data[14] |= (TxBuf_Data_RAM_0[a] & 0xf0);  //digit 15 upper nibble
5802  1249 1e02          	ldw	x,(OFST-3,sp)
5803  124b 58            	sllw	x
5804  124c e63c          	ld	a,(_TxBuf_Data_RAM_0+1,x)
5805  124e a4f0          	and	a,#240
5806  1250 ba20          	or	a,L3_TxBuf_Data+14
5807  1252 b720          	ld	L3_TxBuf_Data+14,a
5808                     ; 1073 }
5811  1254 5b07          	addw	sp,#7
5812  1256 81            	ret
5847                     ; 1078 void LCD_RAM_Initialize(void){ 
5848                     	switch	.text
5849  1257               _LCD_RAM_Initialize:
5851  1257 89            	pushw	x
5852       00000002      OFST:	set	2
5855                     ; 1080 	for (i = 0 ; i <= 39 ; ++i){
5857  1258 5f            	clrw	x
5858  1259 1f01          	ldw	(OFST-1,sp),x
5860  125b               L1232:
5861                     ; 1081 		TxBuf_Data[i] = 0x00;
5863  125b 1e01          	ldw	x,(OFST-1,sp)
5864  125d 6f12          	clr	(L3_TxBuf_Data,x)
5865                     ; 1080 	for (i = 0 ; i <= 39 ; ++i){
5867  125f 1e01          	ldw	x,(OFST-1,sp)
5868  1261 1c0001        	addw	x,#1
5869  1264 1f01          	ldw	(OFST-1,sp),x
5873  1266 9c            	rvf
5874  1267 1e01          	ldw	x,(OFST-1,sp)
5875  1269 a30028        	cpw	x,#40
5876  126c 2fed          	jrslt	L1232
5877                     ; 1083 }
5880  126e 85            	popw	x
5881  126f 81            	ret
5975                     	xref	_Delay
5976                     	xdef	_TxBuf_Data_RAM_5
5977                     	xdef	_TxBuf_Data_RAM_1
5978                     	xdef	_TxBuf_Data_RAM_0
5979                     	xdef	_TxBuf_Disp
5980                     	xdef	_TxBuf_Cntrl_Byte
5981                     	xdef	_TxBuf_Ini
5982                     	xdef	_TxBuf_sw_rst
5983                     	xdef	_LCD_RAM_Initialize
5984                     	xdef	_LCD_Wh_Km
5985                     	xdef	_LCD_RPM_Range
5986                     	xdef	_LCD_Trip
5987                     	xdef	_LCD_RPM_AMP
5988                     	xdef	_LCD_Cal_L_Range
5989                     	xdef	_LCD_Network
5990                     	xdef	_LCD_Ambi_Temp
5991                     	xdef	_LCD_Mode
5992                     	xdef	_LCD_Controller_Temp
5993                     	xdef	_LCD_Error
5994                     	xdef	_LCD_Ignition
5995                     	xdef	_map
5996                     	xdef	_LCD_Bat_Temp
5997                     	xdef	_LCD_Bat_Volt
5998                     	xdef	_LCD_Speed_RT
5999                     	xdef	_LCD_Speaker
6000                     	xdef	_LCD_Data_Transmission
6001                     	xdef	_LCD_BT
6002                     	xdef	_LCD_Time_RT
6003                     	xdef	_LCD_Data_Update
6004                     	xdef	_LCD_Data_Update_Sequence
6005                     	xdef	_LCD_RAM_Clear
6006                     	xdef	_LCD_Disp_OFF
6007                     	xdef	_LCD_Ini
6008                     	xref	_I2C_CheckEvent
6009                     	xref	_I2C_SendData
6010                     	xref	_I2C_Send7bitAddress
6011                     	xref	_I2C_GenerateSTOP
6012                     	xref	_I2C_GenerateSTART
6013                     	xref	_GPIO_WriteReverse
6014                     	xref	_GPIO_WriteHigh
6015                     	xref	_GPIO_Init
6016                     	switch	.const
6017  0078               L1202:
6018  0078 42100000      	dc.w	16912,0
6019  007c               L3441:
6020  007c 42a69999      	dc.w	17062,-26215
6021  0080               L1341:
6022  0080 4284f5c2      	dc.w	17028,-2622
6023  0084               L7141:
6024  0084 4247eb85      	dc.w	16967,-5243
6025  0088               L5041:
6026  0088 420551eb      	dc.w	16901,20971
6027  008c               L3731:
6028  008c 418547ae      	dc.w	16773,18350
6029  0090               L7511:
6030  0090 42c80000      	dc.w	17096,0
6031  0094               L7411:
6032  0094 42200000      	dc.w	16928,0
6033  0098               L7311:
6034  0098 00000000      	dc.w	0,0
6035                     	xref.b	c_lreg
6036                     	xref.b	c_x
6056                     	xref	c_itof
6057                     	xref	c_fcmp
6058                     	xref	c_ctof
6059                     	xref	c_fadd
6060                     	xref	c_fdiv
6061                     	xref	c_fmul
6062                     	xref	c_fsub
6063                     	xref	c_ftoi
6064                     	xref	c_lzmp
6065                     	xref	c_rtol
6066                     	xref	c_ldiv
6067                     	xref	c_lmod
6068                     	xref	c_lcmp
6069                     	xref	c_ltor
6070                     	xref	c_xymov
6071                     	xref	c_smodx
6072                     	xref	c_sdivx
6073                     	end
