sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
// degiskenler tanýmlandý
char text_one[20],text_two[20];
float sicaklik_deger,sicaklik_deger_int;
unsigned int gaz,ses,deger;
void main(){
ANSEL=0x0F;
ANSELH=0;

C1ON_bit=0;
C2ON_bit=0;


TRISE=0X00;
PORTE=0X00;

TRISC=0x00;
PORTC=0X00;


ADC_Init();
Lcd_Init();

Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);

Delay_ms(500);

while(1){
// sýcaklýk gaz ve ses degerleri hesaplandý

 gaz= ADC_Read(0);
 deger= ADC_Read(1);
 ses= ADC_Read(3);
 sicaklik_deger= (deger* 5.0 / 1023.0) * 100.0;
 sicaklik_deger_int=(int)sicaklik_deger;
 gaz= (gaz * 1500.0 / 1022.0);
 ses= (ses* 150.0 / 1023.0);
    //eþik degerleri belirlendi ve koþullarýn saðlanýp saðlanmadýðý kontrol ediliyor
 if(gaz<1000&& sicaklik_deger_int<40&& ses<100){
 PORTC=0X01;
 IntToStr(sicaklik_deger_int, text_one);
 Lcd_Out(1, 1, "SICAKLIK:");
 Lcd_Out(2, 11, " DERECE");
 Lcd_Out(2, 10, text_one);
 
 Delay_ms(500);
 
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 
 
                          IntToStr(gaz, text_one);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Gaz yogunlugu:");
 Lcd_Out(2, 1, text_one);
 Lcd_Out(2, 11, "PPM");
 
 Delay_ms(500);
 
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 IntToStr(sicaklik_deger_int, text_one);
 Lcd_Out(1, 1, "SICAKLIK:");
 Lcd_Out(2, 11, " DERECE");
 Lcd_Out(2, 10, text_one);

 Delay_ms(500);

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 
 IntToStr(ses, text_two);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Ses bilgisi:");
 Lcd_Out(2, 1, text_two);
 Lcd_Out(2, 11, "dB");
 Delay_ms(500);
 
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 
 PORTE=0X00;
 }
 // sýcaklýk eþik degeri geçtiyse
 else if(sicaklik_deger_int>=40){
 
 PORTE=0X01;
 PORTC=0X02;
 
 IntToStr(sicaklik_deger_int, text_one);
 Lcd_Out(1, 1, "Kritik sicaklik!:");
 Lcd_Out(2, 10, " Derece");
 Lcd_Out(2, 1, text_one);

 delay_ms(500);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 }
 // gaz yogunlugu eþik degeri geçtiyse
  else if(gaz>=1000){
 PORTE=0X01;
 PORTC=0X02;
 IntToStr(gaz, text_one);
 
 Lcd_Out(1, 1, "Kritik gaz yogunlugu!:");
 Lcd_Out(2, 1, text_one);
 Lcd_Out(2, 8, "PPM");
 delay_ms(500);
 
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
}
// ses þiddeti eþik degeri geçtiyse
 else if(ses>=120){
 PORTE=0X01;
 PORTC=0X02;
 
 IntToStr(ses, text_two);
 Lcd_Out(1, 1,"Dikkat yuksek ses!");
 Lcd_Out(2, 1, text_two);
 Lcd_Out(2, 9, "dB");
 delay_ms(500);
 
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 }
 
}
  }