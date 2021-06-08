function [I_rot] = rotate(I)
%Authors : Axel BRUYERE/Hippolyte CADORET/Dorian FABREGUE

%Input : 
%       ->I : Image à traiter

%Output : 
%       ->I_rot : Image après rotation


I_g = rgb2gray(I);
BW = edge(I_g,'canny'); %Détection des contours

%Récupération des lignes de l'image
[H,T,R] = hough(BW);
P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);


vec1 = [lines(1).point2(1)-lines(1).point1(1),...
    lines(1).point2(2)-lines(1).point1(2)];
ref = [0;1];

angle = acos((vec1*ref)/(norm(vec1)*norm(ref))) * 180 / pi;

I_rot = imrotate(I,90-angle);
[h,w,p] = size(I_rot);
for i = 1:h
    for j = 1:w
        for k = 1:p
            if I_rot(i,j,k) == 0;
                I_rot(i,j,k) = I_rot(round(h/4),round(w/2),p);
            end
        end
    end
end



