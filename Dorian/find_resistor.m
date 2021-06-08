function [L_I] = find_resistor(I_p)
  
  L_I={};

  I_rgb=I_p;
  I=rgb2gray(I_rgb);
  
  I_s=im2bw(I,0.9);
  I_s=imcomplement(I_s);
  
  SE1= strel('diamond',10);
  SE2= strel('diamond',4);
 
  I_erode=imerode(I_s,SE2);
  I_dilate=imdilate(I_erode,SE1);

   CC = bwconncomp(I_dilate);
   L = labelmatrix(CC);

   
   N=double(max(max(L)));
   
   for k=1:N

  [row,col] = find(L==k);
  c_i=floor(mean(row));
  c_j=floor(mean(col));
  
  ni_d=max(row);
  ni_g=min(row);
  nj_h=min(col);
  nj_b=max(col);
  I_r=I_rgb(ni_g:ni_d,nj_h:nj_b,:);
  
  L_I{k}=I_r;
  
  end 
  
end 