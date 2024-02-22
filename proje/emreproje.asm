
_main:

;emreproje.c,17 :: 		void main(){
;emreproje.c,18 :: 		ANSEL=0x0F;
	MOVLW      15
	MOVWF      ANSEL+0
;emreproje.c,19 :: 		ANSELH=0;
	CLRF       ANSELH+0
;emreproje.c,21 :: 		C1ON_bit=0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;emreproje.c,22 :: 		C2ON_bit=0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;emreproje.c,25 :: 		TRISE=0X00;
	CLRF       TRISE+0
;emreproje.c,26 :: 		PORTE=0X00;
	CLRF       PORTE+0
;emreproje.c,28 :: 		TRISC=0x00;
	CLRF       TRISC+0
;emreproje.c,29 :: 		PORTC=0X00;
	CLRF       PORTC+0
;emreproje.c,32 :: 		ADC_Init();
	CALL       _ADC_Init+0
;emreproje.c,33 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;emreproje.c,35 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,36 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,38 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;emreproje.c,40 :: 		while(1){
L_main1:
;emreproje.c,43 :: 		gaz= ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _gaz+0
	MOVF       R0+1, 0
	MOVWF      _gaz+1
;emreproje.c,44 :: 		deger= ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _deger+0
	MOVF       R0+1, 0
	MOVWF      _deger+1
;emreproje.c,45 :: 		ses= ADC_Read(3);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+2
	MOVF       R0+1, 0
	MOVWF      FLOC__main+3
	MOVF       FLOC__main+2, 0
	MOVWF      _ses+0
	MOVF       FLOC__main+3, 0
	MOVWF      _ses+1
;emreproje.c,46 :: 		sicaklik_deger= (deger* 5.0 / 1023.0) * 100.0;
	MOVF       _deger+0, 0
	MOVWF      R0+0
	MOVF       _deger+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      192
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _sicaklik_deger+0
	MOVF       R0+1, 0
	MOVWF      _sicaklik_deger+1
	MOVF       R0+2, 0
	MOVWF      _sicaklik_deger+2
	MOVF       R0+3, 0
	MOVWF      _sicaklik_deger+3
;emreproje.c,47 :: 		sicaklik_deger_int=(int)sicaklik_deger;
	CALL       _double2int+0
	CALL       _int2double+0
	MOVF       R0+0, 0
	MOVWF      _sicaklik_deger_int+0
	MOVF       R0+1, 0
	MOVWF      _sicaklik_deger_int+1
	MOVF       R0+2, 0
	MOVWF      _sicaklik_deger_int+2
	MOVF       R0+3, 0
	MOVWF      _sicaklik_deger_int+3
;emreproje.c,48 :: 		gaz= (gaz * 1500.0 / 1022.0);
	MOVF       _gaz+0, 0
	MOVWF      R0+0
	MOVF       _gaz+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      128
	MOVWF      R4+1
	MOVLW      59
	MOVWF      R4+2
	MOVLW      137
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      128
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _double2word+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       FLOC__main+0, 0
	MOVWF      _gaz+0
	MOVF       FLOC__main+1, 0
	MOVWF      _gaz+1
;emreproje.c,49 :: 		ses= (ses* 150.0 / 1023.0);
	MOVF       FLOC__main+2, 0
	MOVWF      R0+0
	MOVF       FLOC__main+3, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      22
	MOVWF      R4+2
	MOVLW      134
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      192
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _double2word+0
	MOVF       R0+0, 0
	MOVWF      _ses+0
	MOVF       R0+1, 0
	MOVWF      _ses+1
;emreproje.c,51 :: 		if(gaz<1000&& sicaklik_deger_int<40&& ses<100){
	MOVLW      3
	SUBWF      FLOC__main+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      232
	SUBWF      FLOC__main+0, 0
L__main21:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      132
	MOVWF      R4+3
	MOVF       _sicaklik_deger_int+0, 0
	MOVWF      R0+0
	MOVF       _sicaklik_deger_int+1, 0
	MOVWF      R0+1
	MOVF       _sicaklik_deger_int+2, 0
	MOVWF      R0+2
	MOVF       _sicaklik_deger_int+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
	MOVLW      0
	SUBWF      _ses+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      100
	SUBWF      _ses+0, 0
L__main22:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
L__main19:
;emreproje.c,52 :: 		PORTC=0X01;
	MOVLW      1
	MOVWF      PORTC+0
;emreproje.c,53 :: 		IntToStr(sicaklik_deger_int, text_one);
	MOVF       _sicaklik_deger_int+0, 0
	MOVWF      R0+0
	MOVF       _sicaklik_deger_int+1, 0
	MOVWF      R0+1
	MOVF       _sicaklik_deger_int+2, 0
	MOVWF      R0+2
	MOVF       _sicaklik_deger_int+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _text_one+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;emreproje.c,54 :: 		Lcd_Out(1, 1, "SICAKLIK:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_emreproje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,55 :: 		Lcd_Out(2, 11, " DERECE");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_emreproje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,56 :: 		Lcd_Out(2, 10, text_one);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text_one+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,58 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;emreproje.c,60 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,61 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,64 :: 		IntToStr(gaz, text_one);
	MOVF       _gaz+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _gaz+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _text_one+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;emreproje.c,65 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,66 :: 		Lcd_Out(1, 1, "Gaz yogunlugu:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_emreproje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,67 :: 		Lcd_Out(2, 1, text_one);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text_one+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,68 :: 		Lcd_Out(2, 11, "PPM");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_emreproje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,70 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;emreproje.c,72 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,73 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,74 :: 		IntToStr(sicaklik_deger_int, text_one);
	MOVF       _sicaklik_deger_int+0, 0
	MOVWF      R0+0
	MOVF       _sicaklik_deger_int+1, 0
	MOVWF      R0+1
	MOVF       _sicaklik_deger_int+2, 0
	MOVWF      R0+2
	MOVF       _sicaklik_deger_int+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _text_one+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;emreproje.c,75 :: 		Lcd_Out(1, 1, "SICAKLIK:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_emreproje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,76 :: 		Lcd_Out(2, 11, " DERECE");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_emreproje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,77 :: 		Lcd_Out(2, 10, text_one);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text_one+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,79 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;emreproje.c,81 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,82 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,84 :: 		IntToStr(ses, text_two);
	MOVF       _ses+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _ses+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _text_two+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;emreproje.c,85 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,86 :: 		Lcd_Out(1, 1, "Ses bilgisi:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_emreproje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,87 :: 		Lcd_Out(2, 1, text_two);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text_two+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,88 :: 		Lcd_Out(2, 11, "dB");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_emreproje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,89 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;emreproje.c,91 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,92 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,94 :: 		PORTE=0X00;
	CLRF       PORTE+0
;emreproje.c,95 :: 		}
	GOTO       L_main10
L_main5:
;emreproje.c,97 :: 		else if(sicaklik_deger_int>=40){
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      132
	MOVWF      R4+3
	MOVF       _sicaklik_deger_int+0, 0
	MOVWF      R0+0
	MOVF       _sicaklik_deger_int+1, 0
	MOVWF      R0+1
	MOVF       _sicaklik_deger_int+2, 0
	MOVWF      R0+2
	MOVF       _sicaklik_deger_int+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main11
;emreproje.c,99 :: 		PORTE=0X01;
	MOVLW      1
	MOVWF      PORTE+0
;emreproje.c,100 :: 		PORTC=0X02;
	MOVLW      2
	MOVWF      PORTC+0
;emreproje.c,102 :: 		IntToStr(sicaklik_deger_int, text_one);
	MOVF       _sicaklik_deger_int+0, 0
	MOVWF      R0+0
	MOVF       _sicaklik_deger_int+1, 0
	MOVWF      R0+1
	MOVF       _sicaklik_deger_int+2, 0
	MOVWF      R0+2
	MOVF       _sicaklik_deger_int+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _text_one+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;emreproje.c,103 :: 		Lcd_Out(1, 1, "Kritik sicaklik!:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_emreproje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,104 :: 		Lcd_Out(2, 10, " Derece");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_emreproje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,105 :: 		Lcd_Out(2, 1, text_one);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text_one+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,107 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;emreproje.c,108 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,109 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,110 :: 		}
	GOTO       L_main13
L_main11:
;emreproje.c,112 :: 		else if(gaz>=1000){
	MOVLW      3
	SUBWF      _gaz+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      232
	SUBWF      _gaz+0, 0
L__main23:
	BTFSS      STATUS+0, 0
	GOTO       L_main14
;emreproje.c,113 :: 		PORTE=0X01;
	MOVLW      1
	MOVWF      PORTE+0
;emreproje.c,114 :: 		PORTC=0X02;
	MOVLW      2
	MOVWF      PORTC+0
;emreproje.c,115 :: 		IntToStr(gaz, text_one);
	MOVF       _gaz+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _gaz+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _text_one+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;emreproje.c,117 :: 		Lcd_Out(1, 1, "Kritik gaz yogunlugu!:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_emreproje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,118 :: 		Lcd_Out(2, 1, text_one);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text_one+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,119 :: 		Lcd_Out(2, 8, "PPM");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_emreproje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,120 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
	NOP
;emreproje.c,122 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,123 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,124 :: 		}
	GOTO       L_main16
L_main14:
;emreproje.c,126 :: 		else if(ses>=120){
	MOVLW      0
	SUBWF      _ses+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      120
	SUBWF      _ses+0, 0
L__main24:
	BTFSS      STATUS+0, 0
	GOTO       L_main17
;emreproje.c,127 :: 		PORTE=0X01;
	MOVLW      1
	MOVWF      PORTE+0
;emreproje.c,128 :: 		PORTC=0X02;
	MOVLW      2
	MOVWF      PORTC+0
;emreproje.c,130 :: 		IntToStr(ses, text_two);
	MOVF       _ses+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _ses+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _text_two+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;emreproje.c,131 :: 		Lcd_Out(1, 1,"Dikkat yuksek ses!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_emreproje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,132 :: 		Lcd_Out(2, 1, text_two);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text_two+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,133 :: 		Lcd_Out(2, 9, "dB");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_emreproje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;emreproje.c,134 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
	NOP
;emreproje.c,136 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,137 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;emreproje.c,138 :: 		}
L_main17:
L_main16:
L_main13:
L_main10:
;emreproje.c,140 :: 		}
	GOTO       L_main1
;emreproje.c,141 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
