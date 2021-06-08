function [x,incert] = calcul_resistance(V,F,T)
    n = length(V)-2;
    x = 0;
    for i=1:n
        x = x + V{i}*10^(n-i-1);        
    end
    multi = F{n+1};
    x = x*multi;
    incert = T(end);
end