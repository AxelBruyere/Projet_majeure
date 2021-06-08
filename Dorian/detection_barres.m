%%detection_barres.m
% I = image decoupee de la resistance
% Bars = Structure contenant les images tronquees de chaque barre

function [Ic] = detection_barres(I)

S = size(I);

J = binarization(I);

%Create a binary image
BW = edge(J,'Canny');
for j=1:S(2)
    if BW(3,j)==1
        BW(:,j)=1;
    end
end
for j=2:S(2)
    if BW(3,j)==1 && BW(3,j-1)==1
        BW(:,j-1)=0;
    end
end

%Create the Hough transform using the binary image
[H,T,R] = hough(BW);

%Find peaks in the Hough transform of the image
P  = houghpeaks(H,8,'threshold',ceil(0.9*max(H(:))));

%Find lines 
lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);

%Error message
if length(lines)~=8
    error('Error. \n Number of lines different than 8');
end

%Crop bars for color identidication
% figure(5)
ind=1;
for k=1:2:length(lines)
    ind = round(k/2);
%     subplot(1,length(lines)/2,ind)
    rect = [lines(k).point1+[2 0] , lines(k+1).point2-lines(k).point1-[4 0]];
    Ic{ind} = imcrop(I,rect);
%     imshow(Ic{ind},[]);
end

end