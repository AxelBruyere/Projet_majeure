function [c,tolerance] =detection_metallic(I)
  %imput: -I=image au format RGB 
  
  %output:-c=nom de la couleur
  %          (retourne false si la couleur n'st pas metallique 
  %       -tolerance=valeur de tolerance associe a la couleur 
  
  I=rgb2hsv(I); % conversion en HSV
  
  % moyenne de h,v,s sur l'echantillon 
 h=mean(mean(I(:,:,1)));
 s=mean(mean(I(:,:,2)));
 v=mean(mean(I(:,:,3)));
  
  c='false';
  tolerance=0;
if v<0.4   % cas ou la couleur est trop sombre 
      c='false';
      tolerance=0;
 elseif 0.15<s &&  not(0.08<h && h<0.2) % cas ou la couleur n'est pas proche du jaune 
      c='false';
      tolerance=0;
 elseif s<0.15 && 0.55<v && v<0.7 % argenté
      c='silver';
     tolerance=10; 
 elseif 0.15< s && s <0.4  %doré proche du jaune 
      c='gold';
     tolerance=5;
 elseif h<0.15 && 0.15< s && 0.4<s && v<0.6 %doré proche du marron 
      c='gold';
     tolerance=5;
end
  
  end 