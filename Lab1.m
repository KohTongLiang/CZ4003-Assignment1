%%% 2.1 Contrast Stretching
% a. Input image to MATLAB matrix variable
Pc = imread('mrttrainbland.jpg')
whos Pc
P = rgb2gray(Pc)

% b. View image on imshow
imshow(Pc)
imshow(P)

% c. Check the min and max intensities present in image
min(P(:)),max(P(:))

% d. Perform contrast stretching
rmin = min(P(:))
rmax = max(P(:))
P2(:,:) = imsubtract(im2double(P(:,:)), rmin)
P2(:,:) = immultiply(P2(:,:), 255 / (rmax - rmin))
min(P2(:)), max(P2(:))