function EkstraksiFrame()
    % clc;clear;close all;
    a = VideoReader('Chika Dance [1080p][x264][Medium][33].mp4');
    for img = 1:a.NumberOfFrames;
        filename = strcat('frame',num2str(img),'.jpg');
        b = read(a, img);
        imwrite(b,filename);
    end
end