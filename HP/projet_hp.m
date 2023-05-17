clc;
close all;
clear all;

r1 = 7.34;
r2 = 7.95 ; 
l1 = 2.55e-4;
l2= 3.8e-4;
c2 = 7.6e-5;

opts = bodeoptions('cstprefs');
opts.MagUnits = 'abs';



num = [r2*l2 , 0];
den = [r2*l1*c2 , r1*r2*c2 + l1*l2 , r2*l2+r1*l2+r2*l1 , r1*r2];

sys = tf(num,den)

bodeplot(sys,opts)
xlim([20,20000]);
grid on


%%

r1 = 7.34;
r2 = 7.95 ; 
l1 = 2.55e-4;
l2= 3.8e-4;
c2 = 7.6e-5;

w0 = 594.05*2*pi;
q = l2*w0/r2;

%%
clc;
close all;
clear ztest;

% freq = datahp(:,1);
% mod = datahp(:,2);
% phase = deg2rad(datahp(:,3));
% save("impedancemesure.mat", "freq","mod","phase")

load("impedancemesure.mat")

puls = 2*pi.*freq;

% problème de modèle, croissance de 5dB/dec -> non linéaire

r1 = 7.34;
l1 = 2.55e-4;
r2=7.95;
q = 7.8;
w0 = 594*2*pi;

x = w0./puls;

l2=r2*q/w0;
c2 = 1/(l2*w0^2);

ztest = abs(r1+1j*l1*puls+r2./(1-(1j/q.*(x-1./x)));

subplot(2,1,1)
plot(freq,mod)
grid on 
hold on 
xlim([20,3000])
plot(freq,ztest)
xlabel("fréquence (Hz)")
ylabel("Module de l'impédance (Ohms)")
title("Module du HP en fonction de sa fréquence")
legend("Impédance mesurée","Impédance modèle test")
subplot(2,1,2)
plot(freq,phase)
grid on
xlabel("fréquence (Hz)")
ylabel("Phase de l'impédance (Rad)")
title("Phase du HP en fonction de sa fréquence")


