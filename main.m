clc;close all;clear variables;

I  = imread('images/resistance_oblique_2.jpg');

I_rot = rotate(I);
[H,W,p] = size(I_rot);



imshow(I_rot)