clc;close all;clear variables;

% I  = imread('images/resistance_oblique_2.jpg');
% I  = imread('images/resistance_bleue_2.png');
% I  = imread('images/resistance_2.png');
% I = imread('images/resistance_marron_2.png');

I_rot = rotate(I);
[I_cut,BW] = cut(I_rot);

figure(9)
subplot 211
imshow(I)
subplot 212
imshow(I_cut)













