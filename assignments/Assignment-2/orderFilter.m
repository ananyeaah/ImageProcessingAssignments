function [ J ] = orderFilter( I )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
p=input('enter the value of pth index [1<=p<= 9] (^_^)');
modify = padarray(I,[1 1]);
[n,m,d]=size(modify);
x = [1,2,3]';
y = [1,2,3]';
for i=1:n-2
    for j=1:m-2
        for k=1:d
        img =reshape(modify(i+x-1,j+y-1,k),[],1);
        sort(img);
        J(i,j,k)=img(p);
        end
    end
end
%imshow(J);
subplot(1,2,1),subimage(I),title('Original Image');
subplot(1,2,2),subimage(J),title('Image after MEDIAN FILTER');
end