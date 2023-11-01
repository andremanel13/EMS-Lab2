% Read data from file
close all
load scopy_data.txt
x = scopy_data;
clear scopy_data;
%File: Sample,Frequency(Hz),Magnitude(dB),Phase(°)
%Sample
s = x(:,1);
%Frequency(Hz)
f = x(:,2);
%Magnitude(dB)
m = x(:,3);
%Phase(º)
p = x(:,4);

figure(1);
% Magnitude Subplot
subplot(2, 1, 1);
plot(f, m, 'b'); 
title('Magnitude');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;
ylim([-50, 10]);
yticks(-50:10:10)
xticks(0:50:max(f));
% Phase Subplot
subplot(2, 1, 2);
plot(f, p, 'r'); 
title('Phase');
xlabel('Frequency (Hz)');
ylabel('Phase (º)');
grid on;
yticks(-200:50:200)
xticks(0:50:max(f));