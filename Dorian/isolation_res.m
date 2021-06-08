function [I_cut] = isolation_res(I_rot)
%Authors : Axel BRUYERE/Dorian FABREGUE/Hippolyte CADORET

%Input : 
%       ->I_rot : image apres rognage

%Output : 
%       ->I_cut : image apres découpage

%%Binarisation
I=rgb2gray(I_rot);
I_s=imbinarize(I,0.8);
I_s=imcomplement(I_s);

%%Morpho math
SE1= strel('diamond',4);
I_erode=imerode(I_s,SE1);
I_erode=imerode(I_erode,SE1);

[row,col] = find(I_erode==1);

n_d=max(row);
n_g=min(row)+3;
n_h=min(col) - 7;
n_b=max(col) + 5;
  
%%Garanties sur les dimensions
  if n_d - n_g > 35
      n_d = n_d - 10;
  end
  if n_b - n_h > 110
      n_h = n_h + 10;
      n_b = n_b - 10;
  end

%Decoupage
I_cut=I_rot(n_g:n_d,n_h:n_b,:);