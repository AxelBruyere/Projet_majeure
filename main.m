clc;close all;clear variables;

% I  = imread('images/resistance_oblique_1.jpg');
% I  = imread('images/resistance_bleue_1.jpg');
% I  = imread('images/resistance_1.png');

I_rot = rotate(I);
[I_cut] = cut(I_rot);

figure(9)
imshow(I_cut)













