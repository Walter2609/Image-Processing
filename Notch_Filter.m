%% Notch-Filter
clear all; close all; clc;
%%
% read image
I = imread('coins.png');

% create sinusoidal noise
[M N] = size(I);
for row = 1 : M
    f = 16;
    sinus = sin(row/M * 2*pi*f);
    I(row,:) = I(row,:) * (0.75+0.25*sinus);
end
subplot(2,2,1); imshow(I)
title 'line distortion'


%% Show spectrum of distorted image
F = fftshift(fft2(I));
subplot(2,2,2); imshow(log10(abs(F)+10),[],'Colormap', jet), colorbar


%% Show notch filter
pos=zeros(size(F));
pos(M/2+f,N/2)=1;
pos(M/2-f,N/2)=1;
Gauss=fspecial('Gaussian',30,6);
G=conv2(pos,Gauss,'same');
G=1-mat2gray(G);
subplot(2,2,3); imshow(G,[])
title 'matching filter'


%% Show spectrum of filtered image
subplot(2,2,4); imshow(log10(abs(F.*G)+10),[],'Colormap',jet), colorbar
title 'notch filtered image'


%% Show filtered image
R=real(ifft2(fftshift(F.*G)));
figure(2);
subplot(1,2,1), imshow(I)
title 'original'
subplot(1,2,2), imshow(R,[])
title 'reconstructed'


