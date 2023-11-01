import numpy as np
import matplotlib.pyplot as plt
import scipy.signal as sg

def prewrap(wp,Ts):
    return (2/Ts)*np.tan(wp*Ts/2)

fp=250
wn=2*np.pi*fp
print('wn =',wn)
fs=2500 
N=5

omega=prewrap(wn,1/fs)
num, den=sg.bessel(N, omega, btype='low', analog=True)
w,h=sg.freqs(num,den,plot=None)
ampl=20*np.log10(abs(h))
f=w/(2*np.pi)
plt.semilogx(f,ampl)
plt.ylabel('Amplitude [dB]')
plt.xlabel('Frequency [Hz]')
plt.ylim(min(ampl),max(ampl)+2)
plt.axvline(fp, color='green',linestyle='dashed')
plt.grid(linestyle='dotted')
numz,denz=sg.bilinear(num,den,fs)
wz,hz=sg.freqz(numz,denz)
plt.semilogx(wz*fs/(2*np.pi),20*np.log10(np.abs(hz)))

print(f'Numz: {numz}')
print(f'Denz: {denz}')

