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
clc;
close all;
clear all;

l1  = 2.55e-4;
r1  = 7.34;
r2  = 6.45;%7.95 ;
f0  = 594.05;
w0  = f0*2*pi;

fa  = 578;
fb  = 614;
deltaf = fb-fa;
Q   = .045; %f0/deltaf;

l2  = Q*r2/w0; %3.8e-4;
c2  = 1/(Q*r2*w0);%7.6e-5;

% freq = datahp(:,1);
% mod = datahp(:,2);
% phase = deg2rad(datahp(:,3));
% save("impedancemesure.mat", "freq","mod","phase")

load("impedancemesure.mat")

puls = 2*pi*freq;

% problème de modèle, croissance de 5dB/dec -> non linéaire
x = freq/594;%puls/w0;

Z2  = r2./(1+j/Q*(x-1./x));
Z1  = r1+j*l1*puls;
Zest= Z1+Z2;

%ztest = abs(r1+1j*l1*puls+r2./(1+(1j/q.*(x-1./x)));

subplot(211)
    plot(freq,[mod-abs(Z1), abs(Z2)]);
    grid on
    xlim([20,3000])
    xlabel("fréquence (Hz)")
    ylabel("Module de l'impédance (Ohms)")
    title("Module du HP en fonction de sa fréquence")
    legend("|Zmes-Z1|", "|Z2|");
subplot(212)
    plot(freq,[phase, angle(Zest)]);
    xlim([20,3000]);
    grid on
    xlabel("fréquence (Hz)")
    ylabel("Phase de Zmes (Rad)")
    title("Phase du HP en fonction de sa fréquence")
    legend("Arg[Zmes]", "Arg[Z2]");

err_amp = abs(mod-abs(Z1)-abs(Z2));
err_phase = abs(phase - angle(Zest));

figure;
subplot(211)
    plot(freq,err_amp);
    xlim([20,5000]);
    grid on
    xlabel("fréquence (Hz)")
    ylabel("Erreur en amplitude (Ohm)")
    title("Erreur en amplitude du modèle")
    legend("Courbe d'erreur")
subplot(212)
    plot(freq,err_phase);
    xlim([20,5000]);
    grid on
    xlabel("fréquence (Hz)")
    ylabel("Erreur en amplitude (rad)")
    title("Erreur en phase du modèle")
    legend("Courbe d'erreur")
