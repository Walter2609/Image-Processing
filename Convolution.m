
%% 1-D Convolution
clear all;
close all;

f=[2 4 5 5 5 5 2 4 5 8];    % Signal
w=1/4*[1 2 1];              % Filter

filtered_Signal = conv(f,w)
figure(1)
plot(f)
hold on
plot(conv(f,w,'same'),'r')
title('Convoluton - Same');

figure(2)
plot(f)
hold on
plot(filtered_Signal,'r');


