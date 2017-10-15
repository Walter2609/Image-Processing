%% Gradient Filtering
clear all; close all; clc;
%%
I = imread('coins.png');
figure(1);
imshow(I);
title('Original Picture');


%% Filtered Image => Gaussfilter = Bluered Image
gauss = fspecial('gaussian',5,2);
I = imfilter(I,gauss);
I = im2double(I);
figure(2);
imshow(I);
title('Filtered with Gaussian => Bluered Image');


%% Gradient in Y-Direction
prewitt_Y = fspecial('prewitt');
Grad_Y = imfilter(I,prewitt_Y);
figure(3);
imshow(Grad_Y, []);
title('Prewitt-Filter: Grad. Y-Direction');


%% Gradient in X-Direction
prewitt_X = prewitt_Y';             % Transpose Prewitt
Grad_X = imfilter(I,prewitt_X);    
figure(4);
imshow(Grad_X, []);
title('Transpose(Prewitt): Grad. X-Direction');


%% Gradient in X- and Y-Direction
figure(5);
quiver(Grad_X,Grad_Y);
zoom(2);
title('Gradien in X-Y-Direction');


%% Display magnitude values of gradient
% Attention, Entries of M can be greater than 1
M=sqrt(Grad_X.*Grad_X+Grad_Y.*Grad_Y); % Magnitude
figure(6);
imshow(M,[])
colormap(copper)
colorbar


