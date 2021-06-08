function [color,value,factor] =detection_color(I)

%imput: - I=image au format RGB 
  
  %output:- color=nom de la couleur
  %          (retourne false si la couleur n'st pas metallique 
  %       - value=valeur associe a la couleur 
  %       - factor = facteur associe a la couleur 

 I=rgb2hsv(I); % conversion en HSV
  
   
  % moyenne de h,v,s sur l'echantillon
 h=mean(mean(I(:,:,1)));
 s=mean(mean(I(:,:,2)));
 v=mean(mean(I(:,:,3)));
color='error';
if s<0.18 || v<0.37
    if v<0.4
      color='black';
       value=0;
       factor=1;
    elseif  0.7<v  
        color='white';
        value=9;
        factor=1e9;
    else 
      color='gray';
      value=8;
      factor=100e6;
    end
  
 else 

     if  0.04<h && h<0.1
       
       if 0.6<v
         color='orange';
         value=3;
         factor=1e3;
       else 
         color='brown';
         value=1;
         factor=10;
       end 
     
   elseif 0.1<h && h<0.26
     
        if 0.6<v
        color='yellow';
        value=4;
        factor=10e3;
        else 
         color='brown';
         value=1;
         factor=10;
        end 
      
     elseif 0.26<h && h<0.5
       color='green';
       value=0;
       factor=100e3;
     elseif 0.5<h && h<0.62
       color='blue'
       value=6;
       factor=1e6;
       
     elseif 0.62<h || h<0.04
       
         if 0.6<v
            if 0.5<s;
              color='red';
              value=2;
              factor=100;
            else 
              color='purple';
              value=7;
              factor=10e6;
            end 
            
         else 
         color='brown';
         value=1;
         factor=10;
         end
     end
     
    end
 
end
 

  
