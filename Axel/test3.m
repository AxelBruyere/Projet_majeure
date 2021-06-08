
clear all;
close all;
pkg load image 
image=9


switch image 
  case 0
I= imread('resistance_simple.PNG');%brown/black/brown
I_1=I(96:156,143:148,:);
I_2=I(105:149,173:178,:);
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
I_2=I(91:97,25:62,:);
I_3=I(114:121,26:63,:);
I_4=I(140:146,26:69,:);

  case 6
I= imread('resistance_6.png');%brown/green/red
I_1=I(64:73,23:65,:);
I_2=I(86:97,26:62,:);
I_3=I(111:121,26:63,:);
I_4=I(138:143,24:63,:);

  case 7
I= imread('resistance_7.png');%brown/green/red
I_1=I(56:62,23:64,:);
I_2=I(80:89,26:58,:);
I_3=I(104:111,26:60,:);
I_4=I(130:136,19:64,:);

  case 8
I= imread('resistance_8.png');%brown/green/red
I_1=I(55:62,23:64,:);
I_2=I(80:89,26:62,:);
I_3=I(104:111,26:62,:);
I_4=I(130:136,19:64,:);

  case 9
I= imread('resistance_9.png');%yellow/purple/orange
I_1=I(63:70,18:61,:);
I_2=I(88:97,25:62,:);
I_3=I(111:121,26:63,:);
I_4=I(139:145,21:64,:);

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

c=detection_metallic(I_1)
c=detection_metallic(I_2)
c=detection_metallic(I_3)
c=detection_metallic(I_4)