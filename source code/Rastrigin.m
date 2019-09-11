function y = Rastrigin(x)
    d = length(x);
    sq = x.^2;   
    y = 10*d + sum(sq - 10*cos(2*pi*x));
end