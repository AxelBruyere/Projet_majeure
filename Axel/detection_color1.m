function [value,factor,tolerence,color,color_tolerence] =detection_color(I)
  r=mean(mean(I(:,:,1)))
  g=mean(mean(I(:,:,2)))
  b=mean(mean(I(:,:,3)))

  
  if(r<100 && g<100 && b<100)
  value=0;
  factor=1;
  tolerence=5;
  color='black';
  color_tolerence='gold';
  
  elseif( (100<r && r<150) && g<110 && b<120)
  value=1;
  factor=10;
  tolerence=5;
  color='brown';
  color_tolerence='gold';
  
  elseif(150<r && g<100 && b<100)
  value=2;
  factor=100;
  tolerence=5;
  color='red';  
  color_tolerence='gold';
  
  elseif(150<r && ( 80<g&& g<150) && b<110)
  value=3;
  factor=1e3;
  tolerence=5;
  color='orange';
  color_tolerence='gold';
  
  elseif(150<r && 150<g && b<120)
  value=4;
  factor=10e3;
  tolerence=5;
  color='yellow';
  color_tolerence='gold';
  
  elseif((r<130 && 100<g && b<130))
  value=5;
  factor=100e3;
  tolerence=5;
  color='green';
  color_tolerence='gold';
  
  elseif(r<100 && g<120 && 130<b)
  value=6;
  factor=1e6;
  tolerence=10;
  color='blue';
  color_tolerence='silver';
  
  elseif(150<r && (100<g && g<150) && 150<b)
  value=7;
  factor=10e6;
  tolerence=10;
  color='purple';
  color_tolerence='silver';
  
  elseif( (90<r && r<150) &&  g<110 && b<150)
  value=8;
  factor=100e6;
  tolerence=10;
  color='gray';
  color_tolerence='silver';
  
  elseif(200<r && 200<g && 200<b)
  value=9;
  factor=1e9;
  tolerence=10;
  color='white';
  color_tolerence='silver';
  
  else
  color='error';
  factor='error';
  tolerence='error';
  value='error';
  color_tolerence='error';
  
end 

  if  (150<r && 150<g && 150<b)
    color_tolerence='silver';
    tolerence=10;
    
  else
    color_tolerence='gold';
    tolerence=5;
  end 
end 