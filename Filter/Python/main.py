import matplotlib.pyplot as plt
import numpy as np
import scipy.io.wavfile as wav
from scipy.fft import fft
from scipy.signal import freqz
import scipy.signal as s
import wave
import pyaudio

FRAMES_PER_BUFFER = 3200
FORMAT = pyaudio.paInt16
CHANNELS = 1
RATE = 16000
p1 = pyaudio.PyAudio()
DURATION = 5

b, a = s.iirfilter(25, [2 * np.pi * 50, 2 * np.pi * 200], rs=60, btype='band', analog=True, ftype='butter')
# w, h = signal.freqs(b, a, 1000)
# fig = plt.figure()
# ax = fig.add_subplot(2, 1, 1)
# ax.semilogx(w / (2 * np.pi), 20 * np.log10(np.maximum(abs(h), 1e-5)))
# ax.set_title('Chebyshev Type II bandpass frequency response')
# ax.set_xlabel('Frequency [Hz]')
# ax.set_ylabel('Amplitude [dB]')
# ax.axis((10, 1000, -100, 10))
# ax.grid(which='both', axis='both')
#
z, p, k = s.iirfilter(25, [2 * np.pi * 50, 2 * np.pi * 200], rs=60, btype='band', analog=True, ftype='butter',
                      output='zpk')


# bx = fig.add_subplot(2, 1, 2)
# bx.plot(np.real(z), np.imag(z), 'ob', markerfacecolor='none')
# bx.plot(np.real(p), np.imag(p), 'xr')
# bx.legend(['Zeros', 'Poles'], loc=2)
# bx.set_title('Pole / Zero Plot')
# bx.set_xlabel('Real')
# bx.set_ylabel('Imaginary')
# bx.grid()
# plt.show()


# # Number of sample points
# N = 10000
# # sample spacing
# T = 1.0 / 800.0
# x = np.linspace(0.0, N * T, N, endpoint=False)
# y = np.sin(50.0 * 2.0 * np.pi * x) + 0.5 * np.sin(80.0 * 2.0 * np.pi * x)
# yf = fft(y)
# w = blackman(N)
# ywf = fft(y * w)
# xf = fftfreq(N, T)[:N // 2]
# plt.semilogy(xf[1:N // 2], 2.0 / N * np.abs(yf[1:N // 2]), '-b')
# plt.semilogy(xf[1:N // 2], 2.0 / N * np.abs(ywf[1:N // 2]), '-r')
# plt.legend(['FFT', 'FFT w. window'])
# plt.grid()
# plt.show()

def plot_response(fs, w, h, title):
    "Utility function to plot response functions"
    fig = plt.figure()
    ax = fig.add_subplot(111)
    ax.plot(0.5 * fs * w / np.pi, 20 * np.log10(np.abs(h)))
    ax.set_ylim(-40, 5)
    ax.set_xlim(0, 0.5 * fs)
    ax.grid(True)
    ax.set_xlabel('Frequency (Hz)')
    ax.set_ylabel('Gain (dB)')
    ax.set_title(title)


fs = 96000.0  # Sample rate, Hz
band = [50, 7000]  # Desired pass band, Hz
trans_width = 10  # Width of transition from pass band to stop band, Hz
numtaps = 10  # Size of the FIR filter.
edges = [0, band[0] - trans_width, band[0], band[1],
         band[1] + trans_width, 0.5 * fs]
taps = s.remez(numtaps, edges, [0, 1, 0], Hz=fs)
w, h = freqz(taps, [1], worN=2000)


def signal_plot_tf():
    ts = np.abs((fft(signal)) / 80000)
    dt = 1 / fd  # sampling interval
    t = np.arange(0, 5, dt)
    fr = np.arange(0, 1, 1 / 80000)

    fig = plt.figure()
    axs = fig.add_subplot(211)
    axs.set_title("Signal")
    axs.plot(t, signal, color='C0')
    axs.set_xlabel("Time")
    axs.set_ylabel("Amplitude")

    bxs = fig.add_subplot(212)
    bxs.set_title("Signal")
    bxs.plot(fr, ts, color='m')
    bxs.set_xlabel("Frequency")
    bxs.set_ylabel("Module")
    plt.show()


V = 4
mean = 0
std = 0.1
N = 80000
step = 1.0 / 10000.0
x = np.linspace(0.0, N * step, N)
bruit_blanc = np.random.normal(mean, std, size=N)
sig = V * np.cos(2 * np.pi * 0.2 * x) + bruit_blanc
yf1 = fft(sig)
b2, a2 = s.butter(2, 0.1)
sortie = s.filtfilt(b2, a2, sig)
yf2 = fft(sortie)
xf = np.linspace(0.0, 1.0 / (2.0 * step), N // 2)
xfe = xf / N
#plt.figure()
#plt.subplot(2, 2, 1)
#plt.plot(sig)
#plt.title("Bruit blanc")
#plt.subplot(2, 2, 2)
#plt.plot(sortie)
#plt.title("Bruit blanc filtré")
#plt.subplot(2, 2, 3)
#plt.plot(xfe, 2.0 / N * abs(yf1[:N // 2]))
#plt.title("Bruit blanc fft")
#plt.subplot(2, 2, 4)
#plt.plot(xfe, 2.0 / N * abs(yf2[:N // 2]))
#plt.title("Bruit blanc filtré fft")
#plt.show()

samplerate, samples = wav.read("output.wav")

normalized_tone = samples
interest = abs(fft(normalized_tone))

normalized_tone2 = s.filtfilt(b2, a2, normalized_tone)

plt.figure()
plt.subplot(2, 1, 1)
plt.title("Etude d'un signal de trombone")
plt.plot(normalized_tone / normalized_tone.max())
plt.xlabel("Echantillon")
plt.ylabel("Amplitude du signal")
plt.subplot(2, 1, 2)
plt.plot(interest)
plt.ylabel("Amplitude spectrale")
plt.xlabel("fréquence")
plt.show()

print(a2, b2)

wav.write("test2.wav", samplerate, normalized_tone)
