%Read data from file
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

% Create a new figure
figure;
% Create the first subplot for magnitude
subplot(2, 1, 1);
plot(f, m, 'b'); % Blue color for the first subplot
title('Magnitude');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;
ylim([-50, 10]);
yticks(-50:10:10)
xticks(0:50:max(f));
% Create the second subplot for phase
subplot(2, 1, 2);
plot(f, p, 'r'); % Red color for the second subplot
title('Phase');
xlabel('Frequency (Hz)');
ylabel('Phase (º)');
grid on;
yticks(-200:50:200)
xticks(0:50:max(f));