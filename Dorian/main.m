clc;close all;clear variables;

image = 'images/resistance_oblique_1.jpg';
% image = 'images/resistance_bleue_1.jpg';
% image = 'images/resistance_1.png';
% image = 'images/resistance_marron_1.png'
% image = 'images/resistance_multi.jpg';

I = imread(image);

L_I= find_resistor(I);

N=length(L_I);

%Enregistrement de l'image/des images a traiter
mkdir tempo
for k = 1:N
    figure(1) 
    imshow(L_I{k})
    file = ['res',int2str(k),'.png'];
    saveas(gcf,fullfile('tempo/',file));
end

for i = 1:N
    img = ['tempo/res',int2str(i),'.png'];
    I_rot = rotate(imread(img));
    I_cut = isolation_res(I_rot);
    figure(i)
%     subplot 121
%     imshow(L_I{i})
%     subplot 122
    imshow(I_cut)
    file = ['res',int2str(k),'.png'];
    saveas(gcf,fullfile('tempo/',file));
    
    L_cond{i} = I_cut;
end

%Si le decoupage est mauvais -> changement de fonction
choice = input('Ce decoupage vous convient-il ? 0 si oui, 1 si non \n \n =>');
close all

if choice == 1
    for i = 1:N
        img = ['tempo/res',int2str(i),'.png'];
        I_rot = rotate(imread(img));
        I_cut = cut(I_rot);
        figure(i)
        subplot 121
        imshow(L_I{i})
        subplot 122
        imshow(I_rot)
        
        L_cond{i} = I_cut;
    end
end

for i = 1:N
    figure(i)
    imshow(L_cond{i})
end
rmdir tempo s

for i = 1:N
    Ic = detection_barres(L_cond{i});
    close 101
end

[c,tolerance] = detection_metallic(Ic{1});
% if ne(c,'false')
%     Ic = fliplr(Ic);
% end
color = {};
value = {};
factor = {};
for i = 1:length(Ic)
    [c,v,f] = detection_color(Ic{i});
    color{i} = c;
    value{i} = v;
    factor{i} = f;
end

[u,v] = detection_metallic(Ic{4});

[valeur,incertitude] = calcul_resistance(value,factor,v);

figure(8)
for i = 1:4
subplot (2,2,i)
imshow(Ic{i})
end