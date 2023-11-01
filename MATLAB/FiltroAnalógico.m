% Values of the components
R1=10000;
R2=470;

R11=3900;
C11=100e-9;

R12=2200;
R22=4700;
C12=100e-9;
C22=150e-9;

R13=1200;
R23=2700;
C13=100e-9;
C23=370e-9;

k1=R1;
k2=1/(R12*R22*C12*C22);
k3=1/(R13*R23*C13*C23);
k11=C11*(R1*R2 + R11*R2 + R11*R1);
k22=(1/(R12*C22)) + (1/(R22*C22));
k32=(1/(R13*C23)) + (1/(R23*C23));

% Transfer Function
s=tf("s");
Fs = (k3/(s^2+s*k32+k3)) * (k2/(s^2+s*k22+k2)) * (k1/(s*k11+k1))
b=k3*k2*k1;
a=(s^2+s*k32+k3)*(s^2+s*k22+k2)*(s*k11+k1);

% Bode Diagram
figure(1)
bode(Fs)
title('Frequency Response');
grid;

% Step Response
figure(2)
step(Fs)
title('Step Response');
grid;
stepinfo(Fs)

% Poles&Zeros Map & Root Locus
figure(3)
pzmap(Fs)
grid;
figure(4)
rlocus(Fs)
grid;

% % Group Delay
% figure(3)
% [b, a] = besself(6, 0.2);
% [gd, w] = grpdelay(b, a, 128);
% gd_seconds = gd / (2 * pi);  % Convert group delay from samples to seconds
% frequencies_Hz = w / (2 * pi);  % Convert frequencies from rad/s to Hz
% plot(frequencies_Hz, gd_seconds)
% title('Group Delay (Seconds)');
% grid;
% xlabel('Frequency (Hz)');
% ylabel('Group Delay (s)');
% ylabel('Time (s)');
