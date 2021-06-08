clear all; 
close all;

I_rgb=rotate(imread('images/test.png'));
%I_rgb=imread('resistance_1.png');
%I_rgb=imread('resistance_bleue_2.png');
%I_rgb=imread('resistance_marron_3.png');
I=rgb2gray(I_rgb);

figure(1)
subplot(221)
imshow(I_rgb)

I_s=im2bw(I,0.8);
I_s=imcomplement(I_s);

subplot(222)
imshow(I_s)

SE1= strel('diamond',10);
SE2= strel('diamond',4);
SE3= strel('rectangle',[1,8])

I_erode=imerode(I_s,SE2);
I_erode=imerode(I_erode,SE2);
%I_erode=imerode(I_erode,SE3);

subplot(223)
imshow(I_erode)

[row,col] = find(I_erode==1);

  n_d=max(row);
  n_g=min(row);
  n_h=min(col);
  n_b=max(col)+5;
  
I_final=I_rgb(n_g:n_d,n_h:n_b,:);
  
subplot(224)
imshow(I_final)
