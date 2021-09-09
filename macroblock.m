function macroblock()
    clc;
    YourImage = imread('Butterfly Effector [1080p] 0239 Ycbcr.jpg');
    % macroblock
    % Image = rgb2gray(YourImage);
    macroblock = reshape(YourImage,16,16,[])
end