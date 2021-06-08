function J = binarization(I)

%%Changement de repere
%xyz
I_z = rgb2xyz((I));
I_z = I_z(:,:,3);
%huv 1 
I_h = rgb2hsv((I));
I_h = I_h(:,:,1);
%huv 3
I_v = rgb2hsv((I));
I_v = I_v(:,:,3);
%lab
I_l = rgb2lab((I));
I_l = I_l(:,:,1)/100;

J1 = redefine_contrast(I_h,0.9);
J2 = redefine_contrast(I_v,0.9);
J3 = redefine_contrast(I_z,1.0);

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

% figure(100)
% subplot(411)
% imshow(J1)
% subplot(412)
% imshow(J2)
% subplot(413)
% imshow(J3)
% subplot(414)
% imshow(J)

end


