clc;
close all;
clear all;

f1 = 1000;
f2 = 3000;
Fs = 44100;
sine = dsp.SineWave('Frequency',[f1,f2],...
    'SampleRate',Fs,...
    'SamplesPerFrame',44100);

Fcutoff = 20000;
[A,B] = butter(15,[25/Fs 10000/Fs],"bandpass");

[C,D] = cheby1(30,0.01,Fcutoff/Fs,"low");
[E,F] = besself(15,[500/Fs 8000/Fs],"bandpass");

% d = designfilt('bandpassiir','FilterOrder',20, ...
%     'HalfPowerFrequency1',500,'HalfPowerFrequency2',560, ...
%     'SampleRate',1500);

s1=conv(A,C);
s2 = conv(s1,E);

ss1=conv(B,D);
ss2=conv(ss1,F);


% sos=tf2sos(A,B);
% fvt = fvtool(sos,'Fs',Fs);

% [s, g]  = zp2sos(z,p,k);
% num = s(:,1:3);
% den = s(:,4:6);
%     
% sosFilter = dsp.SOSFilter(num,den,...
%     'HasScaleValues',true,...
%     'ScaleValues',g);
% 
% fvtool(sosFilter,'Fs',8000)

He = LowEllip;

[b,a] = sos2tf(He.sosMatrix,He.ScaleValues);

[H,nu] = freqz(b,a,1024);

%plot(nu*Fs,20*log(abs(H)))

t = 0:1/Fs:4;
y = chirp(t,20,1,10000,'quadratic');
pspectrum(y,1e3,'spectrogram','TimeResolution',0.1, ...
    'OverlapPercent',99,'Leakage',0.85)

audiowrite("in.wav",y,Fs)


out = filter(b,a,y2);

audiowrite("out.wav",out/max(abs(out)),Fs)
%%
clc;
close all;
clear all;

n = 18;
fc = 10;

[zb,pb,kb] = butter(n,2*pi*fc,"s");
[bb,ab] = zp2tf(zb,pb,kb);
[hb,wb] = freqs(bb,ab,4096);

[s2,g2]=zp2sos(zb,pb,kb);
num2 = s2(:,1:3);
den2 = s2(:,4:6);
    
sosFilter2 = dsp.SOSFilter(den2,num2,...
    'HasScaleValues',true,...
    'ScaleValues',g2);

fvtool(sosFilter2,'Fs',44100)

plot(wb,mag2db(abs(hb)))


%%

Fs = 44100;

K = [ 1.04694851e+06 -1.03691685e+08  1.10815335e+10  1.00000000e+00 1.18902054e-08  7.19293442e+29;
  1.00000000e+00 -1.35746052e+00  5.26687381e-01  1.00000000e+00   1.61990387e-17  0.00000000e+00;
  1.00000000e+00  8.84387365e-01  5.42314235e-01  1.00000000e+00   4.23352704e-02  1.44489260e-03;
  1.00000000e+00 -9.76345002e-02  4.91037609e-01  1.00000000e+00  -4.23352707e-02  1.44489260e-03;
  1.00000000e+00 -7.25856204e-01  4.14401599e-01  1.00000000e+00  -6.31683426e-02  1.44635925e-03;
  1.00000000e+00  1.29757146e+00  4.47993948e-01  1.00000000e+00   6.31683430e-02  1.44635927e-03;
  1.00000000e+00  2.01277755e-01  2.11180097e-02  1.00000000e+00   7.47996476e-02  1.45489428e-03;
  1.00000000e+00 -2.16420687e-01  2.26883978e-02  1.00000000e+00  -7.47996478e-02  1.45489429e-03;
  1.00000000e+00  9.90559546e+01  1.40027873e+00  1.00000000e+00   1.50261967e-02  1.45549812e-03;
  1.00000000e+00  0.00000000e+00  0.00000000e+00  1.00000000e+00  -1.50261965e-02  1.45549813e-03];

[b2,a2] = sos2tf(K);

[H2,nu2] = freqz(b2,a2,1024);

plot(nu2*Fs,20*log(abs(H2)))
