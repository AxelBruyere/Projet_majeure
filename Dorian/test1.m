clear all;
close all;
pkg load image 
image=3


switch image 
  case 0
I= imread('resistance_simple.PNG');%brown/black/brown
I_1=I(96:156,143:148,:);
I_2=I(105:149,173:179,:);
I_3=I(102:151,206:212,:);
I_4=I(101:155,234:241,:);

case 1
I= imread('resistance_1.png');%orange/orange/green
I_1=I(63:66,15:44,:);
I_2=I(79:81,17:42,:);
I_3=I(92:94,19:41,:);
I_4=I(114:117,17:44,:);

case 2
I= imread('resistance_2.png');%green/gray/yellow
I_1=I(63:66,15:44,:);
I_2=I(79:81,17:42,:);
I_3=I(92:94,19:41,:);
I_4=I(136:140,17:50,:);

case 3
I= imread('resistance_3.png');%green/gray/yellow
I_1=I(71:74,16:39,:);
I_2=I(83:85,17:42,:);
I_3=I(98:101,19:41,:);
I_4=I(118:120,13:42,:);

case 4
I= imread('resistance_4.png');%orange/white/orange
I_1=I(55:65,18:61,:);
I_2=I(80:90,25:62,:);
I_3=I(105:112,26:63,:);
I_4=I(132:135,21:47,:);

case 5
I= imread('resistance_5.png');%green/gray/yellow
I_1=I(63:70,18:61,:);
I_2=I(88:97,25:62,:);
I_3=I(114:121,26:63,:);
I_4=I(:,:,:);

  case 6
I= imread('resistance_6.png');%brown/green/red
I_1=I(64:73,23:65,:);
I_2=I(86:97,26:62,:);
I_3=I(111:121,26:63,:);
I_4=I(:,:,:);

  case 7
I= imread('resistance_7.png');%brown/green/red
I_1=I(59:66,23:64,:);
I_2=I(80:89,26:60,:);
I_3=I(104:111,26:62,:);
I_4=I(:,:,:);

  case 8
I= imread('resistance_8.png');%brown/green/red
I_1=I(59:66,23:64,:);
I_2=I(80:89,26:62,:);
I_3=I(104:111,26:62,:);
I_4=I(:,:,:);

  case 9
I= imread('resistance_9.png');%yellow/purple/orange
I_1=I(63:70,18:61,:);
I_2=I(88:97,25:62,:);
I_3=I(111:121,26:63,:);
I_4=I(:,:,:);

  case 10
I= imread('resistance_marron_1.png');%green/blue/green
I_1=I(59:67,18:45,:);
I_2=I(76:82,16:45,:);
I_3=I(92:97,14:45,:);
I_4=I(109:116,14:49,:);
  
  case 11
I= imread('resistance_marron_2.png');%green/blue/green
I_1=I(59:67,18:45,:);
I_2=I(78:83,16:45,:);
I_3=I(92:97,14:45,:);
I_4=I(112:117,18:45,:);
 
end 

figure(1)
subplot(241)
imshow(I)
subplot(245)
imshow(I_1)
subplot(246)
imshow(I_2)
subplot(247)
imshow(I_3)
subplot(248)
imshow(I_4)

[v1,f1,t1,c1,ct1]=detection_color(I_1);
c1
[v2,f2,t2,c2,ct2]=detection_color(I_2);
c2
[v3,f3,t3,c3,ct3]=detection_color(I_3);
c3
[v4,f4,t4,c4,ct4]=detection_color(I_4);
c4
ct4



