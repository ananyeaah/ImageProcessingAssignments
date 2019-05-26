function [ J ] = Neg( I )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[n,m,d]=size(I);
mx=max(I(:));
for i=1:n
    for j=1:m
        for k=1:d
           J(i,j,k)=mx-I(i,j,k); 
        end
    end
end
imshow(J);
end

