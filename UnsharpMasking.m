%% Unsharp Masking
clear all; close all; clc;
%%

I = imread('coins.png');
I = im2double(I);
subplot(3,2,1); imshow(I)
title('Original Image (1)');

%% Create Bluerred Image
GaussFilter = fspecial('gaussian',5,2);
filtered_Image = imfilter(I, GaussFilter); % Blurred Image
subplot(3,2,2); imshow(filtered_Image)
title('Blurred Image (2)');


%% Create Unsharp Mask by suptraction blurred Image from origin Image
unsharpMask = I-filtered_Image;
subplot(3,2,3); imshow(unsharpMask);
title('Unsharp Mask = (1)-(2) = (3)');


%% Sharpened Image by adding Unsharp Mask to origin Image
subplot(3,2,4); imshow(I+unsharpMask);
title('Sharpened Image = (1) + (3)');


%% Sharpened Image with Highboost Masking
boost = 5;
subplot(3,2,5); imshow(boost*unsharpMask);
title('Boosted Unsharp Mask = Boost*(3)');

subplot(3,2,6); imshow(I + unsharpMask);
title('Highboost Sharpened Image = (1) + boost*(3)');
