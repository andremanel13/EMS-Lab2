% IIR Transfer Function
Numz = [0.00128258 0.00641291 0.01282581 0.01282581 0.00641291 0.00128258];
Denz = [1 -2.97542211 3.80601812 -2.54525287 0.88113008 -0.12543062];
fs = 2500;
Fs = tf(Numz,Denz,1/fs)

% Bode Diagram
figure(1)
bode(Fs)
title('IIR - Frequency Response');
grid;

% Step Response
figure(2)
step(Fs)
title('IIR - Step Response');
grid;
 stepinfo(Fs)

% Impulse Response
figure(3)
impulse(Fs)
title('IIR - Impulse Response');
grid;

% Group Delay 
figure(4)
[gd, w] = grpdelay(Numz,Denz,1000,"whole",fs);
time_in_seconds = gd*(1/fs);
frequency_in_hz = w/(2*pi);   
plot(frequency_in_hz, time_in_seconds);
title('IIR - Group-Delay');
xlabel('Frequency (Hz)');
ylabel('Group Delay (s)');
grid;