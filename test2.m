% This file is for you to understand Fourier tranform
% Created by:   Qian Kemao
% Last update: 31/07/2021

%% 0: Atoms for an M*N image
close all
%atom size - you can change the values if you wish
M=8;N=8;
%grid point coordinates for all pixels
[y x]=meshgrid(0:M-1,0:N-1);
%generate the atoms according to our lecture slides. Note that the atoms are 
%complex numbers, which I cannot directly show it. So I only work on the real part.

for u=0:M-1
    for v=0:N-1
        h=cos(2*pi*(u/M*x+v/N*y));
        subplot(M,N,u*N+v+1);imshow(uint8((h+1)*127));
    end
end

%% 1: A constant background and check the spectrum

%image size
M=256;N=256;
%meshgrid
[y x]=meshgrid(0:M-1,0:N-1);
%generate a specific atom with u=v=0, which corresponds to a uniform
%backgorund in space (DC component)
u=0;v=0;
h1=cos(2*pi*(u/M*x+v/N*y));
% It corresponds to a zero-frequency spectrum in the Fourier domain
H1=fft2(h1);
H1s=fftshift(H1);

%% 2: Generate a consine wave and check the sepctrum

%change to u=v=10, what does it mean in two domains?
u=10;v=10;
h2=cos(2*pi*(u/M*x+v/N*y));
H2=fft2(h2);
H2s=fftshift(H2);

%% 3: Generate another cosine wave and check the sepctrum

%change to u=50 and v=206, what does it mean in two domains?
u=50;v=206; 
h3=cos(2*pi*(u/M*x+v/N*y));
H3=fft2(h3);
H3s=fftshift(H3);

%test by yourself what happens if we change to u=50 and v=-50. Why?

%% 4: Add them together and check the sepctrum

f1=h1+h2+h3;
F1=fft2(f1);
F1s=fftshift(F1);

%% 5: Manipulate the spectrum

F1s_new=F1s*0;
F1s_new(100:150,100:150)=F1s(100:150,100:150);
g1=ifft2(ifftshift(F1s_new));

%% 6: Make it noisy

noise=0.5*randn(M,N);
f2=f1+noise;
F2=fft2(f2);
F2s=fftshift(F2);

%% 7: Do the same

F2s_new=F2s*0;
F2s_new(100:150,100:150)=F2s(100:150,100:150);
g2=ifft2(ifftshift(F2s_new));

%% 8: Make it better

F2s_new=F2s*0;
F2s_new(115:145,115:145)=F2s(115:145,115:145);
g2=ifft2(ifftshift(F2s_new));

%% 9: How to make it even better?

%Your turn to try it.