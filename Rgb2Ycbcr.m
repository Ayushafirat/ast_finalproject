function Rgb2Ycbcr()
    %clc;
    %YourImage = imread('Butterfly Effector [1080p] 0239.jpg');
    % konversi rgb ke ycbcr
    %matriks=[65.481 -37.797 112;
    %       128.553 -74.203 -93.786;
    %        24.966 112 -18.214];
    %konstn=[16;128;128];
    %Img2=double(YourImage)./255;
    %newI=reshape(Img2,[],3)*matriks;
    %newI(:,1)=newI(:,1)+konstn(1);
    %newI(:,2)=newI(:,2)+konstn(2);
    %newI(:,3)=newI(:,3)+konstn(3);
    %newI=reshape(uint8(newI),size(YourImage));
    
    % Konversi toolbox
    %ycbcrImage = rgb2ycbcr(YourImage);
    %newImage = ycbcrImage;
    %filename = strcat('Butterfly Effector [1080p] 0239',' Ycbcr','.jpg');
    %figure;imshow(newImage);
    %imwrite(newImage,filename);
    
    clc;
    image = imread('Game Changer [1080p] 0250.jpg'); 
    ycbcr = rgb2ycbcr(image); 
    imshow(ycbcr); title('Komponen YCbCr');
    filename1 = strcat('Game Changer [1080p] 0250',' YCbCr','.jpg');
    imwrite(ycbcr,filename1);
    y = ycbcr(:,:,1); % y channel 
    cb = ycbcr(:,:,2); % cb channel 
    cr = ycbcr(:,:,3); % cr channel 
    figure(); imshow(y); title('Komponen Y');
    filename2 = strcat('Game Changer [1080p] 0250',' Y','.jpg');
    imwrite(y,filename2);
    figure(); imshow(cb); title('Komponen Cb');
    filename3 = strcat('Game Changer [1080p] 0250',' Cb','.jpg');
    imwrite(cb,filename3);
    figure(); imshow(cr); title('Komponen Cr');
    filename4 = strcat('Game Changer [1080p] 0250',' Cr','.jpg');
    imwrite(cr,filename4);
    msgbox('Konversi YCbCr berhasil','pemberitahuan');
end