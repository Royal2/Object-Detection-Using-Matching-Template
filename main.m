%Detecting objects with template matching
close all; clear all; clc;
%% Cross-correlation Fitler
im1=imread('birds1.jpeg');
im2=imread('template.jpeg');
im_ccf=cross_correlation_filter(im1,im2);
figure; imagesc(im_ccf); colorbar; title('Cross-correlation');
figure; mesh(im_ccf); title('Cross-correlation Image Meshplot');
%% Normalized Cross-correlation
im1=imread('birds1.jpeg');
im2=imread('template.jpeg');
im_nccf=normxcorr2(double(rgb2gray(im2)),double(rgb2gray(im1)));
figure; imagesc(im_nccf); colorbar; title('Normalized Cross-correlation');
%detecting object by marking position of highest normalized cross-correlation score
%{
%location of max value in matrix
[val,idx]=max(im_nccf(:));
[x,y]=ind2sub(size(im_nccf),idx);
%[x, y] = find(ismember(im_nccf, max(im_nccf(:))))
%}
[val,idx]=max(im_nccf(:));
[x,y]=ind2sub(size(im_nccf),idx);
%detection=insertShape(im1,'rectangle',[x y size(im2,2) size(im2,1)],'LineWidth',2);
figure; imagesc(im1); hold on;
rectangle('position',[y-size(im2,1) x-size(im2,2) size(im2,2) size(im2,1)],'LineWidth',2,'EdgeColor','r');

%% Normalized Cross-correlation using birds2.jpeg
im1=imread('birds2.jpeg');
im2=imread('template.jpeg');
im_nccf=normxcorr2(double(rgb2gray(im2)),double(rgb2gray(im1)));
figure; imagesc(im_nccf); colorbar; title('Normalized Cross-correlation');
%detecting object
[val,idx]=max(im_nccf(:));
[x,y]=ind2sub(size(im_nccf),idx);
figure; imagesc(im1); hold on;
rectangle('position',[y-size(im2,1) x-size(im2,2) size(im2,2) size(im2,1)],'LineWidth',2,'EdgeColor','r');
