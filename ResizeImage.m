function ResizeImage()
    YourImage = imread('Chika Dance [1080p] 0280.jpg');
    %figure out the pad value to pad to white
    if isinteger(YourImage)
        pad = intmax(class(YourImage));
    else
        pad = 1;   %white for floating point is 1.0
    end
    % dimensi
    [r, c, ~] = size(YourImage)
    if r > c
        newImage = imresize(YourImage, 854 / c);
        newImage(:, end+1 : 854, :) = pad;
    elseif c > r
        newImage = imresize(YourImage, 480 / r);
        newImage(end+1 : 480, :, :) = pad;
    else
        newImage = imresize(YourImage, [854, 480]);
    end

    figure;imshow(newImage);
    imwrite(newImage,'Chika Dance [480p] 0280.jpg') ;
    msgbox('Gambar berhasil di resize','pemberitahuan');
end