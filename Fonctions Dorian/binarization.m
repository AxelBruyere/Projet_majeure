function J = binarization(I)
%-----------------------------------------------------------------------%
%%Role: Creation de l'image binaire servant pour la transformee de Hough
%       Comparaison de plusieurs images 
%
%Authors : Axel BRUYERE / Hippolyte CADORET / Dorian FABREGUE
%
%Input : 
%       ->I : Image à traiter
%
%Output : 
%       ->J : Image après rotation
%-----------------------------------------------------------------------%

%%Changement de repere
%xyz (Z)
I_z = rgb2xyz((I));
I_z = I_z(:,:,3);
%huv (Hue)
I_h = rgb2hsv((I));
I_h = I_h(:,:,1);
%huv (Value)
I_v = rgb2hsv((I));
I_v = I_v(:,:,3);
%lab (L)
I_l = rgb2lab((I));
I_l = I_l(:,:,1)/100;

%Images binaires obtenues par ajustement de contraste
J1 = redefine_contrast(I_h,0.9);
J2 = redefine_contrast(I_v,0.9);
J3 = redefine_contrast(I_z,1.0);

%Comparaison des images pour obtenir la meilleure image binaire
if round(mean(J1(:)))~=round(mean(J3(:)))
    J1 = max(J1(:)) - J1;
end

if round(mean(J2(:)))~=round(mean(J3(:)))
    J2 = max(J2(:)) - J2;
end

if mean(J3(:))<0.5
    J = max(max(J1,J2),J3);
else
    J = min(max(J1,J2),J3);
end

end


