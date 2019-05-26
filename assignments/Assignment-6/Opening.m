function [Out]=Opening(I)
A=im2bw(I);
figure(1),imshow(A);
B=getnhood(strel('disk',2));
[Out]=erosion(A,B);
dilation(Out,B);
end

function [ D ] = erosion(A,B)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
m=floor(size(B,1)/2);
n=floor(size(B,2)/2);
C=padarray(A,[m n],1);
D=zeros(size(A));
s=size(C);
for i=1:s(1)-(2*m)
    for j=1:s(2)-(2*n)
        tmp=C(i:i+(2*m),j:j+(2*n));
        K=tmp-B;
        D(i,j)=min(K(:));
    end
end
D=~D;
end

function [ D ] = dilation(A,B)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
m=floor(size(B,1)/2);
n=floor(size(B,2)/2);
C=padarray(A,[m n]);
D=zeros(size(A));
s=size(C);
for i=1:s(1)-(2*m)
    for j=1:s(2)-(2*n)
        tmp=C(i:i+(2*m),j:j+(2*n));
        K=tmp-B;
        D(i,j)=max(K(:));
    end
end
figure(2),imshow(D);
end