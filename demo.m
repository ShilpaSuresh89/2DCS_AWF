%% 2DCS-Adaptive Wiener FILTERING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Two-dimensional CS adaptive FIR Wiener filtering algorithm for the denoising of satellite images
%Shilpa Suresh, Shyam Lal
%Published in: IEEE Journal of Selected Topics in Applied Earth Observations and Remote Sensing ( Volume: 10 , Issue: 12 , Dec. 2017 )
%DOI: 10.1109/JSTARS.2017.2755068
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear all;
close all
  
I = im2double(imread('1.jpg'));
r = I(:,:,1);
g = I(:,:,2);
b = I(:,:,3);
sizeorig=size(I);
 rr = imresize(r,1);
 gr = imresize(g,1);
 br = imresize(b,1);
Im(:,:,1) = rr;
Im(:,:,2) = gr;
Im(:,:,3) = br;
figure;imshow(Im);
nvar =  0.01; %variance of noise
ngrays = imnoise(Im,'gaussian',0,nvar);  %white gaussian noise
figure;imshow(ngrays );

%% Denoised image
y=cuckofilter(Im,ngrays,50);
figure;
imshow(y);


