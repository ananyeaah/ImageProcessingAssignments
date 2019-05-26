function [ J ] = minFilter( I )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
modify = padarray(I,[1 1]);
[n,m,d]=size(modify);
x = [1,2,3]';
y = [1,2,3]';
for i=1:n-2
    for j=1:m-2
        for k=1:d
        img = modify(i+x-1,j+y-1,k);
        J(i,j,k)=min(img(:)); 
        end
    end
end
subplot(1,2,1),subimage(I),title('Original Image');
subplot(1,2,2),subimage(J),title('Image after MIN FILTER');
end

