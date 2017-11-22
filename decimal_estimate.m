function [n] = decimal_estimate(x)

x = abs(x);
n = 0;

while ~mode(floor(x*10^n),1)
    n = n + 1;
end

end