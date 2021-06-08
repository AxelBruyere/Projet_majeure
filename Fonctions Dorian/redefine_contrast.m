function J = redefine_contrast(I,seuil)
%-----------------------------------------------------------------------%
%%Role: Transformations morphologiques de l'image du boitier +
%       Adaptation du contraste afin de détecter au mieux les anneaux
%       lors de la création de l'image binaire correspondante
%
%%Authors : Axel BRUYERE / Hippolyte CADORET / Dorian FABREGUE
%
%%Input : 
%       ->I : Image à traiter (boitier de la résistance)
%       ->seuil : Pourcentage de valeurs à ignorer lors de la 
%                 modification du contraste de I
%   
%%Output : 
%       ->J : Image après rotation
%-----------------------------------------------------------------------%

%%Parametres image
S = size(I);

%%Tranformations morphologiques
se1 = strel('line',2*S(1),90);
se3 = strel('square',3);
se4 = strel('square',round(S(1)/12));

I = imclose(I,se3);
I = imopen(I,se3);
I = imerode(I,se1);
I = imclose(I,se4);


%%Ajustement de contraste
figure(101)
nbins = 200;
h = histogram(I,nbins);

i = 1; somme = 0;
while somme<sum(h.Values(:))*seuil
   somme = somme + h.Values(i);
   i = i +1;
end
new_edges = [h.BinEdges(1),h.BinEdges(i)];
I2 = imadjust(I,new_edges,[]);

%Mise a niveau des marges de l'image en fonction de la couleur de fond
%(empeche un anneau de coller au bord de l'image = probleme sur Hough)
I3 = imbinarize(I2);
margin = round(S(2)/40);
if mean(I3(:))>0.5  %marges blanches si fond blanc 
   I3(:,[1:margin,end-margin:end]) = 1; 
else                %marges noires si fond noir
   I3(:,[1:margin,end-margin:end]) = 0; 
end
J = I3;

end
