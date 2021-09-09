%===================
% Transformasi DCT
%===================
clc;
close all;
clear all;
YourImage = imread('Game Changer [1080p] 0250 Ycbcr.jpg');
if size(YourImage,3) == 3 %Jika citranya RGB, jadikan Grayscale
    YourImage = rgb2gray(YourImage);
end
figure,imshow(YourImage),title('CITRA ASLI');

% Transformasi DCT
Image2Dct = dct2(double(YourImage));
figure,imshow(uint8(Image2Dct)),title('CITRA DCT');
imwrite(Image2Dct,'Game Changer [1080p] 0250 DCT.jpg');

% Invers DCT
%Dct2Image = idct2(Image2Dct);
%figure,imshow(uint8(Dct2Image)),title('CITRA INVERS DCT');