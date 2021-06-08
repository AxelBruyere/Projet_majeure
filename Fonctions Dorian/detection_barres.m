function [Rings] = detection_barres(I)
%-----------------------------------------------------------------------%
%%Role: Détection des barres(ou anneaux) de la résistance et découpage
%       de l'image en 4 parties contenant chacune un anneau
%
%Authors : Axel BRUYERE / Hippolyte CADORET / Dorian FABREGUE
%
%Input : 
%       ->I : Image à traiter (découpée préalablement)
%
%Output : 
%       ->Rings : Structure contenant les images tronquées des 4 anneaux
%-----------------------------------------------------------------------%


S = size(I);
J = binarization(I);

%%Create a binary image
BW = edge(J,'Canny');
%Prolonging edges vertically
for j=1:S(2)
    if BW(3,j)==1
        BW(:,j)=1;
    end
end
%Making sure edges width is 1 pixel large
for j=2:S(2)
    if BW(3,j)==1 && BW(3,j-1)==1
        BW(:,j-1)=0;
    end
end

%Create the Hough transform using the binary image
[H,T,R] = hough(BW);

%Find N peaks in the Hough transform of the image
N = 8;  %since there are 4 rings (so 8 edges) to detect
P  = houghpeaks(H,N,'threshold',ceil(0.9*max(H(:))));

%Find lines 
lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);

%Error message if wrong number of lines
if length(lines)~=8
    error('Error: Number of lines different than 8');
end

%Crop bars for color identidication
for k=1:2:length(lines)
    ind = round(k/2);
    rect = [lines(k).point1+[2 0] , lines(k+1).point2-lines(k).point1-[4 0]];
    Rings{ind} = imcrop(I,rect);
end

end