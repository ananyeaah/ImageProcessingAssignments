function [ J ] = GBPF( I )
%UNTITLED2 Summary of this function goes here     
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
%filter function H for butterworth low pass filter
H1=exp(-(D.^2)./(2*(Du^2)));
%filter function H for butterworth high pass filter
H2=1-exp(-(D.^2)./(2*(Dl^2)));
H=H1.*H2;
G=H.*F;
g=real(ifft2(double(G)));
subplot(1,2,1),imshow(img),title('Original Image');
subplot(1,2,2),imshow(g,[]),title('Image after Gaussian Band Pass Filter');
end

