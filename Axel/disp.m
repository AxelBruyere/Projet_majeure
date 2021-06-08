function disp(I,value)

if value < 1000
    title = 'R = %d\\Omega';
elseif value >= 1000 && value < 1000000
    value = value/1000;
    title = 'R = %dk\\Omega';
elseif value >= 1000000 && value < 1000000000
    value = value/1000000;
    title = 'R = %d M\\Omega';
elseif value >= 1000000000
    value = value/1000000000;
    title = 'R = %d G\\Omega';
end

figure(1000)
imshow(I)
sgtitle(sprintf(title,value))