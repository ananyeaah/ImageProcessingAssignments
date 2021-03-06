function [ J ] = BHPF( I )
%UNTITLED2 Summary of this function goes here     
D0=input('Enter the value of D0 ');
n= input('Enter the value of order n ');
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
H=1./(1+(D0./D).^(2*n));
G=H.*F;
g=real(ifft2(double(G)));
subplot(1,2,1),imshow(img),title('Original Image');
subplot(1,2,2),imshow(g,[]),title('Image after Butterworth High Pass Filter');
end

