function [ J ] = PowerTransform( I )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%IN THIS METHOD REPLACE EVERY PIXEL VALUE WITH s = A*(R^X)
%WHERE R=ORIGINAL PIXEL_VALUE
%      A=CONSTANT
%      X=POWER
A=input('enter the value of constant A ');
x=input('enter the value of power x ');
%a=rgb2gray(I);
[n,m,d]=size(I);
for i=1:n
    for j=1:m
        for k=1:d
           J(i,j,k)=A.*(I(i,j,k)^x);
        end
    end
end
subplot(1,2,1),subimage(I),title('Original Image');
subplot(1,2,2),subimage(J),title('Image after Power transfrom'),xlabel(sprintf('Constant A is  %g\n & Power x is %g',A,x));
end

