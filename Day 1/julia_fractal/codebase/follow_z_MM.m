function [z, nmax] =  follow_z_MM(z1,c)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

z(1) = z1;
n = 1;

while ((abs(z(n)) <= 2) && (n <= 21))
    z(n+1) = z(n)^2 + c;
    n = n+1;
end

nmax = n;



end

