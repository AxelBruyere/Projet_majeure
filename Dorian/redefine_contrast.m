function J = redefine_contrast(I,seuil)

S = size(I);

%%Tranformations morphologiques
se1 = strel('line',2*S(1),90);
se3 = strel('square',3);
%se3bis = strel('rectangle',[round(0.5*S(1)) 3]);
se4 = strel('square',round(S(1)/10));

I = imclose(I,se3);
I = imopen(I,se3);
I = imerode(I,se1);
I = imclose(I,se4);


%%Ajustement de contraste
nbins = 200;
figure(101)
h = histogram(I,nbins);


i = 1; somme = 0;
while somme<sum(h.Values(:))*seuil
   somme = somme + h.Values(i);
   i = i +1;
end
new_edges = [h.BinEdges(1),h.BinEdges(i)];

I2 = imadjust(I,new_edges,[]);
I3 = imbinarize(I2);
margin = round(S(2)/40);
if mean(I3(:))>0.5
   I3(:,[1:margin,end-margin:end]) = 1; 
else
   I3(:,[1:margin,end-margin:end]) = 0; 
end
J = I3;

end
