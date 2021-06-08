%---------------------------------------------------------------%
%%Role: Affichage des composantes de l'image dans les espaces
%       couleurs HSV,XYZ,Lab,RGB
%
%Authors : Axel BRUYERE / Hippolyte CADORET / Dorian FABREGUE
%---------------------------------------------------------------%
clear all; close all; clc;

Irgb  = cut(rotate(imread('images/resistance_bleue_2.png')));

Ihsv = rgb2hsv(Irgb);
Ixyz = rgb2xyz(Irgb);
Ilab = rgb2lab(Irgb);

figure(1)
%XYZ
subplot(441)
imshow(Irgb);
title('RGB');
subplot(442)
imshow(Ixyz(:,:,1),[]);
title('X');
subplot(443)
imshow(Ixyz(:,:,2),[]);
title('Y');
subplot(444)
imshow(Ixyz(:,:,3),[]);
title('Z');
%HUV
subplot(445)
imshow(Irgb);
title('RGB');
subplot(446)
imshow(Ihsv(:,:,1),[]);
title('H');
subplot(447)
imshow(Ihsv(:,:,2),[]);
title('S');
subplot(448)
imshow(Ihsv(:,:,3),[]);
title('V');
%LAB
subplot(449)
imshow(Irgb);
title('RGB');
subplot(4,4,10)
imshow(Ilab(:,:,1),[]);
title('L');
subplot(4,4,11)
imshow(Ilab(:,:,2),[]);
title('a');
subplot(4,4,12)
imshow(Ilab(:,:,3),[]);
title('b');
%LAB
subplot(4,4,13)
imshow(Irgb);
title('RGB');
subplot(4,4,14)
imshow(Irgb(:,:,1),[]);
title('R');
subplot(4,4,15)
imshow(Irgb(:,:,2),[]);
title('G');
subplot(4,4,16)
imshow(Irgb(:,:,3),[]);
title('B');

