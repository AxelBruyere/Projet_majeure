function [I_cut1,BW] = cut(I_rot)
%Authors : Axel BRUYERE/Hippolyte CADORET/Dorian FABREGUE

%Input : 
%       ->I_rot : Image à traiter (ici, l'image après rotation)

%Output : 
%       ->I_cut1 : Image après rognage


[H,W,p] = size(I_rot);
I_g = rgb2gray(I_rot);


I_cut = I_rot;
%Rognage en hauteur
BW = (I_g<210);
while true
    a = 0;b = 0;
    if mean(BW(length(BW(:,1)),:)) < 0.3
        BW(end,:) = [];
        I_cut(end,:,:) = [];
    else
        a = 1;
    end

    if mean(BW(1,:)) <0.3
        BW(1,:) = [];
        I_cut(1,:,:) = [];
    else
        b = 1;
    end
    if a == 1 & b == 1
        o = 'stoooooop'
        break
    end
    'length(I_cut(:,1,1))'
    length(I_cut(:,1,1))
    if length(I_cut(:,1,1)) < 35
        w = 'Iciiiiiiii'
        
        break
    end
end

%Pré-trairement pour le rognage en largeur
se1 = strel('disk',6);
I_dil = imdilate(BW,se1);
se2 = ones(length(I_dil),1);
I_ero = imerode(I_dil,se2);

%Rognage en largeur
for k = 1:p
    while true
        a = 0;b = 0;
        if mean(I_ero(:,length(I_ero(1,:)))) < 0.5
            I_ero(:,length(I_ero(1,:))) = [];
            I_cut(:,end,:) = [];
        else
            a = 1;
        end

        if mean(I_ero(:,1)) <0.5
            I_ero(:,1) = [];
            I_cut(:,1,:) = [];
        else
            b = 1;
        end
        if a == 1 & b == 1
            break
        end
    end
end

%Finitions du rognage
c = 8; %c doit être pair 
u = length(I_ero)-1.5*c;
v = length(I_ero(:,1))-1.5*c;
I_cut1 = imcrop(I_cut,[c c length(I_ero)-1.5*c length(I_ero(:,1))-2.1*c]);

% I_cut1 = I_cut;
