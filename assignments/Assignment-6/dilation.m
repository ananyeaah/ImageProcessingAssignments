function [ J ] = dilation(I)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
A=im2bw(I);
figure(1),imshow(A);
B=getnhood(strel('disk',6));
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
