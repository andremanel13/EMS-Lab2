% FIR Transfer Function
fs = 2000
Fs1 = tf([-0.018161596335410146 -0.022750945545202503 +0.026960154865719534 +0.14940224353886064 +0.290005928547412 +0.35294963112469024 +0.290005928547412 +0.14940224353886064 +0.026960154865719534 -0.022750945545202503 -0.018161596335410146], 1, 1/fs)

% Make Tranfer Fucntion Causal in order to do the Step and Impulse Response
z = tf('z',1/2000);
Fs2=-0.018161596335410146 -0.022750945545202503*z^-1 + 0.026960154865719534*z^-2 + 0.14940224353886064*z^-3 + 0.290005928547412*z^-4 + 0.35294963112469024*z^-5 + 0.290005928547412*z^-6 + 0.14940224353886064*z^-7 + 0.026960154865719534*z^-8 - 0.022750945545202503*z^-9 - 0.018161596335410146*z^-10

% Bode Diagram
figure(1)
bode(Fs1)
title('FIR - Frequency Response');
grid;

% Step Response
figure(2)
step(Fs2)
title('FIR - Step Response');
grid;
stepinfo(Fs2)

% Impulse Response
figure(3)
impulse(Fs2)
title('FIR - Impulse Response');
grid;

% Group Delay
figure(4)
[gd, w] = grpdelay([-0.018161596335410146 -0.022750945545202503 +0.026960154865719534 +0.14940224353886064 +0.290005928547412 +0.35294963112469024 +0.290005928547412 +0.14940224353886064 +0.026960154865719534 -0.022750945545202503 -0.018161596335410146], 1,1000,"whole",fs);
time_in_seconds = gd*(1/fs)*10e3;
frequency_in_hz = w/(2*pi);   
plot(frequency_in_hz, time_in_seconds);
title('FIR - Group-Delay');
xlabel('Frequency (Hz)');
ylabel('Group Delay (ms)');
grid;