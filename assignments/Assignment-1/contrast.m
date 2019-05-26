function [ J ] = Contrast( I )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[n,m,d]=size(I);
x=input('enter the factor to which contrast should increased ');
for i=1:n
    for j=1:m
        for k=1:d
           J(i,j,k)=mod(x*I(i,j,k),256); 
        end
    end
end
subplot(1,2,1),subimage(I),title('Original Image');
subplot(1,2,2),subimage(J),title('Contrast Image'),xlabel(sprintf('Contrast Increased by a factor of %g\n'));
end

