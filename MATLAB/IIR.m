% IIR Transfer Function
Numz = [0.00128258 0.00641291 0.01282581 0.01282581 0.00641291 0.00128258]
Denz = [1 -2.97542211 3.80601812 -2.54525287 0.88113008 -0.12543062]
Fs = tf(Numz,Denz,1/2500)

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
