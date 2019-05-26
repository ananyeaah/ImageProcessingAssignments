function [ J ] = IBRF( I )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Dl=input('enter the lower cutoff frequency ');
Du=input('enter the upper cutoff frequency ');
img=rgb2gray(I);
[m,n]=size(img);
F=fft2(double(img));
u=0:m-1;
v=0:n-1;
idx=find(u>m/2);
u(idx)=u(idx)-m;
idy=find(v>n/2);
v(idy)=v(idy)-n;
[V,U]=meshgrid(v,u); 
D=sqrt(V.^2 + U.^2);
%filter function H for idle low pass filter
H1=double(D<=Du);
%filter function H for idle high pass filter
H2=double(D>=Dl);
H=H1.*H2;
H=1-H;
G=H.*F;
g=real(ifft2(double(G)));
subplot(1,2,1),imshow(img),title('Original Image');
subplot(1,2,2),imshow(g,[]),title('Image after Ideal Band Reject Filter');
end