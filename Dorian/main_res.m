clear all;
close all;
pkg load image;

I_rgb=imread('resistance_multi_1.jpg');
I=rgb2gray(I_rgb);

figure(1)
imshow(I)

I_s=im2bw(I,0.9);
I_s=imcomplement(I_s);

SE1= strel('diamond',10);
SE2= strel('diamond',4);

I_erode=imerode(I_s,SE2);
%I_erode=imerode(I_erode,SE2);
I_dilate=imdilate(I_erode,SE1);


CC = bwconncomp(I_dilate);
L = labelmatrix(CC);
RGB=label2rgb(L);

[Ni,Nj]=size(I);

figure(2)
subplot(221)
imshow(I_s)
subplot(222)
imshow(I_erode)
subplot(223)
imshow(I_dilate)
subplot(224)
imshow(RGB)


N=double(max(max(L)));


figure(3)
for k=1:N

  [row,col] = find(L==k);
  c_i=floor(mean(row));
  c_j=floor(mean(col));
  
  ni_d=max(row);
  ni_g=min(row);
  nj_h=min(col);
  nj_b=max(col);
  
  subplot(1,N,k)
   I_r=I_rgb(ni_g:ni_d,nj_h:nj_b,:);
   imshow(I_r);
  
end
  
##  
##   ni_d= floor(c_i+Ni/N);
##   if ni_d>Ni
##     ni_d=Ni;
##   endif
##   ni_g= floor(c_i-Ni/N);
##   if ni_g<1
##     ni_g=1;
##   endif
##   nj_h= floor(c_j-Nj/N);
##   if nj_h<1
##     nj_h=1;
##   endif
##   nj_b= floor(c_j+Nj/N);
##   if nj_b>Nj
##     nj_b=Nj;
##   endif
##   e=0;
## 
##   
## 
##   while e==0
##       if ( ni_d==ni_g || nj_h==nj_b )
##           break 
##       else 
##           e=1;
##           if (sum(I_dilate(ni_d-1:ni_d,:)) ~= 0)
##             ni_d=ni_d-1;
##             e=0
##           endif
##         
##           if (sum(I_dilate(ni_g:ni_g+1,:)) ~= 0)
##             ni_g=ni_g+1;
##             e=0
##           endif
##           
##           if (sum(I_dilate(:,nj_h:nj_h+1)) ~= 0)
##             nj_h=nj_h+1;
##             e=0
##           endif
##         
##           if (sum(I_dilate(:,nj_b-1:nj_b)) ~=  0)
##             nj_b=nj_b-1;
##             e=0
##           endif
##           
##       end
##   
##   subplot(1,N,k)
##   I_r=I(ni_g:ni_d,nj_h:nj_b);
##   imshow(I_r);
##  end 
##end 