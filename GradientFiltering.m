%% Gradient Filtering
clear all; close all; clc;
%%
I = imread('coins.png');
imshow(I);
gauss = fspecial('gaussian',5,2);
I = imfilter(I,gauss);
I = im2double(I);
figure(1);
imshow(I);
title('Original Picture');


%% Gradient in Y-Direction
prewitt_Y = fspecial('prewitt');
Grad_Y = imfilter(I,prewitt_Y);
figure(2);
imshow(Grad_Y, []);
title('Prewitt-Filter: Grad. Y-Direction');


%% Gradient in X-Direction
prewitt_X = prewitt_Y;
Grad_X = imfilter(I,prewitt_X);    % Transpose Prewitt
figure(3);
imshow(Grad_X, []);
title('Transpose(Prewitt): Grad. X-Direction');


%% Gradient in X- and Y-Direction
figure(4);
quiver(Grad_X,Grad_Y);
zoom(2);
title('Gradien in X-Y-Direction');


%% Display magnitude values of gradient
% Attention, Entries of M can be greater than 1
M=sqrt(Grad_X.*Grad_X+Grad_Y.*Grad_Y); % Magnitude
figure(5);
imshow(M,[])
colormap(copper)
colorbar


