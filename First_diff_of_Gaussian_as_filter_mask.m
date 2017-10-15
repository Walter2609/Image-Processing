%% First derivative of a Gaussian as a filter mask
clear all;
close all;
clc;
% Create Signal
signal = [zeros(1,3) ones(1,3) zeros(1,3)];
my_filter = [1, 2, 1];

figure(1);
plot(signal);
title('Signal');

% Create Filter Mask
gauss = gausswin(21,4);
filter = diff(gauss);

figure(2)
plot(gauss)
title('Gaussian-Window')
figure(3)
plot(filter)
title('Filter: Diff-Gauss')

%% Filtered Signal
signal_filtered = conv(signal, my_filter);
figure(4);
plot(signal_filtered);
title('Filtered Signal');






