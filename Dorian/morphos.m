clear variables; close all; clc;

I = cut(rotate(imread('images/resistance_marron_1.png')));
S = size(I);
N = S(1)*S(2);


%%Changement de repere
%xyz
img = rgb2xyz((I));
img = img(:,:,3);
% %huv 1 
% img = rgb2hsv((I));
% img = img(:,:,1);
% %huv 3
% img = rgb2hsv((I));
% img = img(:,:,3);
%lab
% img = rgb2lab((I));
% img = img(:,:,1)/100;

img0 = img;
mask = img>0.7*max(img(:));
% img = inpaintCoherent(img,mask);


% %Tranformations morphologiques
se1 = strel('line',2*S(1),90);
se2 = strel('line',S(1),90);
se3 = strel('square',3);
se3bis = strel('rectangle',[5 3]);
se4 = strel('square',round(S(2)/20));


I1 = imopen(imclose(img,se3),se3);
% img = imerode(img,se1);
I2 = imerode(I1,se1);
I3 = imdilate(I2,se4);
I3 = imopen(I3,se4);

% figure(1)
% subplot(611)
% imshow(img0,[]);
% title('Image origine');
% subplot(612)
% imshow(mask);
% subplot(613)
% imshow(img,[]);
% title('I');
% subplot(614)
% imshow(I1,[]);
% title('I1');
% subplot(615)
% imshow(I2,[]);
% title('I2');
% subplot(616)
% imshow(I3,[]);
% title('I3');