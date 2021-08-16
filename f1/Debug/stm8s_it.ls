   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  14                     	bsct
  15  0000               _HEADER_ADDRESS_Write:
  16  0000 f0            	dc.b	240
  46                     ; 685 @far @interrupt void NonHandledInterrupt(void)
  46                     ; 686 {
  47                     	switch	.text
  48  0000               f_NonHandledInterrupt:
  52                     ; 690 }
  55  0000 80            	iret
  77                     ; 697 @far @interrupt void TRAP_IRQHandler(void)
  77                     ; 698 {
  78                     	switch	.text
  79  0001               f_TRAP_IRQHandler:
  83                     ; 702 }
  86  0001 80            	iret
 108                     ; 724 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 108                     ; 725 {
 109                     	switch	.text
 110  0002               f_TLI_IRQHandler:
 114                     ; 729 }
 117  0002 80            	iret
 139                     ; 737 INTERRUPT_HANDLER(AWU_IRQHandler, 1)	
 139                     ; 738 {
 140                     	switch	.text
 141  0003               f_AWU_IRQHandler:
 145                     ; 742 }
 148  0003 80            	iret
 170                     ; 750 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 170                     ; 751 {
 171                     	switch	.text
 172  0004               f_CLK_IRQHandler:
 176                     ; 755 }
 179  0004 80            	iret
 202                     ; 763 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 202                     ; 764 {
 203                     	switch	.text
 204  0005               f_EXTI_PORTA_IRQHandler:
 208                     ; 768 }
 211  0005 80            	iret
 234                     ; 775 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 234                     ; 776 {
 235                     	switch	.text
 236  0006               f_EXTI_PORTB_IRQHandler:
 240                     ; 780 }
 243  0006 80            	iret
 266                     ; 788 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 266                     ; 789 {
 267                     	switch	.text
 268  0007               f_EXTI_PORTC_IRQHandler:
 272                     ; 793 }
 275  0007 80            	iret
 298                     ; 801 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 298                     ; 802 {
 299                     	switch	.text
 300  0008               f_EXTI_PORTD_IRQHandler:
 304                     ; 806 }
 307  0008 80            	iret
 330                     ; 814 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 330                     ; 815 {
 331                     	switch	.text
 332  0009               f_EXTI_PORTE_IRQHandler:
 336                     ; 819 }
 339  0009 80            	iret
 361                     ; 869 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 361                     ; 870 {
 362                     	switch	.text
 363  000a               f_SPI_IRQHandler:
 367                     ; 874 }
 370  000a 80            	iret
 393                     ; 882 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 393                     ; 883 {
 394                     	switch	.text
 395  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 399                     ; 887 }
 402  000b 80            	iret
 425                     ; 895 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 425                     ; 896 {
 426                     	switch	.text
 427  000c               f_TIM1_CAP_COM_IRQHandler:
 431                     ; 900 }
 434  000c 80            	iret
 457                     ; 935  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 457                     ; 936 {
 458                     	switch	.text
 459  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 463                     ; 940 }
 466  000d 80            	iret
 489                     ; 948  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 489                     ; 949 {
 490                     	switch	.text
 491  000e               f_TIM2_CAP_COM_IRQHandler:
 495                     ; 953 }
 498  000e 80            	iret
 521                     ; 964  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 521                     ; 965 {
 522                     	switch	.text
 523  000f               f_TIM3_UPD_OVF_BRK_IRQHandler:
 527                     ; 969 }
 530  000f 80            	iret
 553                     ; 977  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 553                     ; 978 {
 554                     	switch	.text
 555  0010               f_TIM3_CAP_COM_IRQHandler:
 559                     ; 982 }
 562  0010 80            	iret
 595                     ; 1020 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 595                     ; 1021 {
 596                     	switch	.text
 597  0011               f_I2C_IRQHandler:
 599  0011 8a            	push	cc
 600  0012 84            	pop	a
 601  0013 a4bf          	and	a,#191
 602  0015 88            	push	a
 603  0016 86            	pop	cc
 604  0017 3b0002        	push	c_x+2
 605  001a be00          	ldw	x,c_x
 606  001c 89            	pushw	x
 607  001d 3b0002        	push	c_y+2
 608  0020 be00          	ldw	x,c_y
 609  0022 89            	pushw	x
 612                     ; 1022   switch (I2C_GetLastEvent())
 614  0023 cd0000        	call	_I2C_GetLastEvent
 617                     ; 1092     default:
 617                     ; 1093       break;
 618  0026 1d0301        	subw	x,#769
 619  0029 271b          	jreq	L122
 620  002b 1d047f        	subw	x,#1151
 621  002e 2604acc000c0  	jreq	L522
 622  0034 1d0002        	subw	x,#2
 623  0037 2752          	jreq	L322
 624  0039 1d0002        	subw	x,#2
 625  003c 2604          	jrne	L05
 626  003e acf100f1      	jpf	L722
 627  0042               L05:
 628  0042 acfc00fc      	jpf	L542
 629  0046               L122:
 630                     ; 1025     case I2C_EVENT_MASTER_MODE_SELECT :
 630                     ; 1026 
 630                     ; 1027 #ifdef TEN_BITS_ADDRESS
 630                     ; 1028       /* Send Header to Slave for write */
 630                     ; 1029       I2C_SendData(HEADER_ADDRESS_Write);
 630                     ; 1030       break;
 630                     ; 1031 
 630                     ; 1032       /* EV9 */
 630                     ; 1033     case I2C_EVENT_MASTER_MODE_ADDRESS10:
 630                     ; 1034       /* Send slave Address for write */
 630                     ; 1035       I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);
 630                     ; 1036 			
 630                     ; 1037 			
 630                     ; 1038       break;
 630                     ; 1039 #else
 630                     ; 1040       /* Send slave Address for write */
 630                     ; 1041       I2C_Send7bitAddress(SLAVE_ADDRESS, I2C_DIRECTION_TX);
 632  0046 ae7c00        	ldw	x,#31744
 633  0049 cd0000        	call	_I2C_Send7bitAddress
 635                     ; 1043 				GPIO_WriteLow(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
 637  004c 4b01          	push	#1
 638  004e ae500f        	ldw	x,#20495
 639  0051 cd0000        	call	_GPIO_WriteLow
 641  0054 84            	pop	a
 642                     ; 1044 				Delay(0xFFFF);
 644  0055 aeffff        	ldw	x,#65535
 645  0058 89            	pushw	x
 646  0059 ae0000        	ldw	x,#0
 647  005c 89            	pushw	x
 648  005d cd0000        	call	_Delay
 650  0060 5b04          	addw	sp,#4
 651                     ; 1045 				Delay(0xFFFF);
 653  0062 aeffff        	ldw	x,#65535
 654  0065 89            	pushw	x
 655  0066 ae0000        	ldw	x,#0
 656  0069 89            	pushw	x
 657  006a cd0000        	call	_Delay
 659  006d 5b04          	addw	sp,#4
 660                     ; 1046 				Delay(0xFFFF);
 662  006f aeffff        	ldw	x,#65535
 663  0072 89            	pushw	x
 664  0073 ae0000        	ldw	x,#0
 665  0076 89            	pushw	x
 666  0077 cd0000        	call	_Delay
 668  007a 5b04          	addw	sp,#4
 669                     ; 1047 				Delay(0xFFFF);
 671  007c aeffff        	ldw	x,#65535
 672  007f 89            	pushw	x
 673  0080 ae0000        	ldw	x,#0
 674  0083 89            	pushw	x
 675  0084 cd0000        	call	_Delay
 677  0087 5b04          	addw	sp,#4
 678                     ; 1049       break;
 680  0089 2071          	jra	L542
 681  008b               L322:
 682                     ; 1052     case I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED:
 682                     ; 1053       if (NumOfBytes != 0)
 684  008b 3d00          	tnz	_NumOfBytes
 685  008d 2725          	jreq	L742
 686                     ; 1056         I2C_SendData(TxBuffer[Tx_Idx++]);
 688  008f b600          	ld	a,_Tx_Idx
 689  0091 97            	ld	xl,a
 690  0092 3c00          	inc	_Tx_Idx
 691  0094 9f            	ld	a,xl
 692  0095 5f            	clrw	x
 693  0096 97            	ld	xl,a
 694  0097 e600          	ld	a,(_TxBuffer,x)
 695  0099 cd0000        	call	_I2C_SendData
 697                     ; 1057 				GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
 699  009c 4b01          	push	#1
 700  009e ae500f        	ldw	x,#20495
 701  00a1 cd0000        	call	_GPIO_WriteReverse
 703  00a4 84            	pop	a
 704                     ; 1058 				Delay(0xFFFF);
 706  00a5 aeffff        	ldw	x,#65535
 707  00a8 89            	pushw	x
 708  00a9 ae0000        	ldw	x,#0
 709  00ac 89            	pushw	x
 710  00ad cd0000        	call	_Delay
 712  00b0 5b04          	addw	sp,#4
 713                     ; 1060         NumOfBytes--;
 715  00b2 3a00          	dec	_NumOfBytes
 716  00b4               L742:
 717                     ; 1062       if (NumOfBytes == 0)
 719  00b4 3d00          	tnz	_NumOfBytes
 720  00b6 2644          	jrne	L542
 721                     ; 1064         I2C_ITConfig(I2C_IT_BUF, DISABLE);
 723  00b8 ae0400        	ldw	x,#1024
 724  00bb cd0000        	call	_I2C_ITConfig
 726  00be 203c          	jra	L542
 727  00c0               L522:
 728                     ; 1069     case I2C_EVENT_MASTER_BYTE_TRANSMITTING:
 728                     ; 1070       /* Transmit Data */
 728                     ; 1071       I2C_SendData(TxBuffer[Tx_Idx++]);
 730  00c0 b600          	ld	a,_Tx_Idx
 731  00c2 97            	ld	xl,a
 732  00c3 3c00          	inc	_Tx_Idx
 733  00c5 9f            	ld	a,xl
 734  00c6 5f            	clrw	x
 735  00c7 97            	ld	xl,a
 736  00c8 e600          	ld	a,(_TxBuffer,x)
 737  00ca cd0000        	call	_I2C_SendData
 739                     ; 1072 			GPIO_WriteReverse(GPIOD, GPIO_PIN_0);  // LED reset means writeHigh
 741  00cd 4b01          	push	#1
 742  00cf ae500f        	ldw	x,#20495
 743  00d2 cd0000        	call	_GPIO_WriteReverse
 745  00d5 84            	pop	a
 746                     ; 1073 			Delay(0xFFFF);
 748  00d6 aeffff        	ldw	x,#65535
 749  00d9 89            	pushw	x
 750  00da ae0000        	ldw	x,#0
 751  00dd 89            	pushw	x
 752  00de cd0000        	call	_Delay
 754  00e1 5b04          	addw	sp,#4
 755                     ; 1076       NumOfBytes--;
 757  00e3 3a00          	dec	_NumOfBytes
 758                     ; 1078       if (NumOfBytes == 0)
 760  00e5 3d00          	tnz	_NumOfBytes
 761  00e7 2613          	jrne	L542
 762                     ; 1080         I2C_ITConfig(I2C_IT_BUF, DISABLE);
 764  00e9 ae0400        	ldw	x,#1024
 765  00ec cd0000        	call	_I2C_ITConfig
 767  00ef 200b          	jra	L542
 768  00f1               L722:
 769                     ; 1085     case I2C_EVENT_MASTER_BYTE_TRANSMITTED:
 769                     ; 1086       /* Send STOP condition */
 769                     ; 1087       I2C_GenerateSTOP(ENABLE);
 771  00f1 a601          	ld	a,#1
 772  00f3 cd0000        	call	_I2C_GenerateSTOP
 774                     ; 1089       I2C_ITConfig(I2C_IT_EVT, DISABLE);
 776  00f6 ae0200        	ldw	x,#512
 777  00f9 cd0000        	call	_I2C_ITConfig
 779                     ; 1090       break;
 781  00fc               L132:
 782                     ; 1092     default:
 782                     ; 1093       break;
 784  00fc               L542:
 785                     ; 1095 }
 788  00fc 85            	popw	x
 789  00fd bf00          	ldw	c_y,x
 790  00ff 320002        	pop	c_y+2
 791  0102 85            	popw	x
 792  0103 bf00          	ldw	c_x,x
 793  0105 320002        	pop	c_x+2
 794  0108 80            	iret
 817                     ; 1104  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 817                     ; 1105 {
 818                     	switch	.text
 819  0109               f_UART2_TX_IRQHandler:
 823                     ; 1109 }
 826  0109 80            	iret
 849                     ; 1117  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 849                     ; 1118 {
 850                     	switch	.text
 851  010a               f_UART2_RX_IRQHandler:
 855                     ; 1122 }
 858  010a 80            	iret
 880                     ; 1172  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 880                     ; 1173 {
 881                     	switch	.text
 882  010b               f_ADC1_IRQHandler:
 886                     ; 1177 }
 889  010b 80            	iret
 912                     ; 1200  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 912                     ; 1201 {
 913                     	switch	.text
 914  010c               f_TIM4_UPD_OVF_IRQHandler:
 918                     ; 1205 }
 921  010c 80            	iret
 944                     ; 1214 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 944                     ; 1215 {
 945                     	switch	.text
 946  010d               f_EEPROM_EEC_IRQHandler:
 950                     ; 1219 }
 953  010d 80            	iret
 987                     	xref	_Delay
 988                     	xref.b	_Tx_Idx
 989                     	xref.b	_NumOfBytes
 990                     	switch	.ubsct
 991  0000               _TxBuffer:
 992  0000 000000000000  	ds.b	31
 993                     	xdef	_TxBuffer
 994                     	xdef	_HEADER_ADDRESS_Write
 995                     	xdef	f_EEPROM_EEC_IRQHandler
 996                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 997                     	xdef	f_ADC1_IRQHandler
 998                     	xdef	f_UART2_TX_IRQHandler
 999                     	xdef	f_UART2_RX_IRQHandler
1000                     	xdef	f_I2C_IRQHandler
1001                     	xdef	f_TIM3_CAP_COM_IRQHandler
1002                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1003                     	xdef	f_TIM2_CAP_COM_IRQHandler
1004                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1005                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1006                     	xdef	f_TIM1_CAP_COM_IRQHandler
1007                     	xdef	f_SPI_IRQHandler
1008                     	xdef	f_EXTI_PORTE_IRQHandler
1009                     	xdef	f_EXTI_PORTD_IRQHandler
1010                     	xdef	f_EXTI_PORTC_IRQHandler
1011                     	xdef	f_EXTI_PORTB_IRQHandler
1012                     	xdef	f_EXTI_PORTA_IRQHandler
1013                     	xdef	f_CLK_IRQHandler
1014                     	xdef	f_AWU_IRQHandler
1015                     	xdef	f_TLI_IRQHandler
1016                     	xdef	f_TRAP_IRQHandler
1017                     	xdef	f_NonHandledInterrupt
1018                     	xref	_I2C_GetLastEvent
1019                     	xref	_I2C_SendData
1020                     	xref	_I2C_Send7bitAddress
1021                     	xref	_I2C_ITConfig
1022                     	xref	_I2C_GenerateSTOP
1023                     	xref	_GPIO_WriteReverse
1024                     	xref	_GPIO_WriteLow
1025                     	xref.b	c_x
1026                     	xref.b	c_y
1046                     	end
