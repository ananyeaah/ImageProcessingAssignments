function [ J ] = LogTransform( I )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%IN THIS METHOD REPLACE EVERY PIXEL VALUE WITH s = A*log(1+R)
%WHERE R=ORIGINAL PIXEL_VALUE
%      A=CONSTANT
A=input('enter the value of constant A ');
%a=rgb2gray(I);
[n,m,d]=size(I);
for i=1:n
    for j=1:m
        for k=1:d
           x=double(I(i,j,k));
           J(i,j,k)=A.*log10(1+x);
        end
    end
end
subplot(1,2,1),subimage(uint8(I)),title('Original Image');
subplot(1,2,2),subimage(uint8(J)),title('Image after logarthmic transfrom'),xlabel(sprintf('Constant A is  %g\n',A));
end

