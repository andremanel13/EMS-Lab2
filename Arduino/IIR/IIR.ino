/* IIR
 Aproximação de Bessel:
 Numz: [0.00111865 0.00559326 0.01118651 0.01118651 0.00559326 0.00111865]
 Denz: [ 1.         -2.79367066  3.30427614 -2.04390219  0.65598354 -0.08688998]
*/

#define DAC_PIN 26 
#define ADC_PIN 34
float x[]={0,0,0,0,0,0};
float y[]={0,0,0,0,0,0};

void setup() {
  Serial.begin(115200);
}

void loop() {
  x[0] = (float) analogRead(ADC_PIN)*3.3/4096;
  float a[] = {0.00111865, 0.00559326, 0.01118651, 0.01118651, 0.00559326, 0.00111865}; //a = Numz
  float b[] = {1, -2.79367066, 3.30427614, -2.04390219, 0.65598354, -0.08688998}; //b = Denz               
  y[0]=a[0]*x[0]+a[1]*x[1]+a[2]*x[2]+a[3]*x[3]+a[4]*x[4]+a[5]*x[5]-b[1]*y[1]-b[2]*y[2]-b[3]*y[3]-b[4]*y[4]-b[5]*y[5];
  int dacVoltage = (int)(y[0]*256/3.3);
  dacWrite(DAC_PIN,dacVoltage);
  for(int i = 5; i > 0; i--) {
    x[i] = x[i-1];
     y[i] = y[i-1]; 
  }
  delay(1);
}