%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Replace D:\Projects\CZ4003-Assignment1\ with your own absolute or%
% relative path                                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% 2.1 Contrast Stretching
% a. Input image to MATLAB matrix variable
Pc = imread('D:\Projects\CZ4003-Assignment1\mrttrainbland.jpg')
whos Pc
P = rgb2gray(Pc)
whos P

% b. View image on imshow
imshow(Pc)
imshow(P)

% c. Check the min and max intensities present in image
min(P(:)),max(P(:))

% d. Perform contrast stretching
rmin = double(min(P(:)))
rmax = double(max(P(:)))
P2(:,:) = imsubtract(P(:,:), rmin)
P2(:,:) = immultiply(P2(:,:), im2double(255 / (rmax - rmin)))
min(P2(:)), max(P2(:))
P2 = uint8(P2)

% e. redisplay image
imshow(P2)
imshow(P2, [])

%%% 2.2 Histogram Equalization

% a. Display image intensity histogram

imhist(P, 10)
imhist(P, 256) % More detailed

% b. Perform historgram equalization

P3 = histeq(P, 255)

imhist(P3, 10)
imhist(P3, 256) % not equalize
% 10 bins more equalized than %255 bins

% c. Rerun histogram equalization on P3

P3_2 = histeq(P3, 255)
imhist(P3_2, 10)
imhist(P3_2, 256)

imshow(P3)

%%% 2.3 Linear Spatial Filtering

% a. i)
x = -2:2;
y = -2:2;
std = 1.0

filter_i = (exp(-((X).^2 + (Y).^2) / (2 * std^2))) / (2 * pi * std^2)
filter_i = filter_i ./ sum(filter_i(:))
mesh(filter_i)

% a. ii)
x = -2:2;
y = -2:2;
std = 2.0

filter_ii = (exp(-((X).^2 + (Y).^2) / (2 * std^2))) / (2 * pi * std^2)
filter_ii = filter_ii ./ sum(filter_ii(:))
mesh(filter_ii)

% b.
ntugn = imread('D:\Projects\CZ4003-Assignment1\ntugn.jpg')
imshow(ntugn)

% c.
ntugn_i = uint8(conv2(ntugn,filter_i))
ntugn_ii = uint8(conv2(ntugn,filter_ii))
imshow(ntugn_i)
imshow(ntugn_ii)

% d.
ntusp = imread('D:\Projects\CZ4003-Assignment1\ntusp.jpg');
imshow(ntusp);

% e.
ntusp_i = uint8(conv2(ntusp,filter_i))
ntusp_ii = uint8(conv2(ntusp,filter_ii))
imshow(ntusp_i)
imshow(ntusp_ii)


%%% 2.4 Median Filtering

% b. - c.
ntugn_mi = medfilt2(ntugn,[3,3])
ntugn_mii = medfilt2(ntugn,[5,5])
imshow(ntugn_mi)
imshow(ntugn_mii)

% d. - e.
ntusp_mi = medfilt2(ntusp,[3,3])
ntusp_mii = medfilt2(ntusp,[5,5])
imshow(ntusp_mi)
imshow(ntusp_mii)

% 2.5 Suppressing Noise Interference Patterns

% a.
pckint = imread('D:\Projects\CZ4003-Assignment1\pckint.jpg')
imshow(pckint)

% b.
F = fft2(pckint)
S = abs(F)
imagesc(fftshift(S.^0.1))
colormap('default')

% c.
imagesc(S.^0.1)
colormap('default')

% d.
x1 = 241
y1 = 9

x2 = 17
y2 = 249

F(x1-2:x1+2, y1-2:y1+2) = 0
F(x2-2:x2+2, y2-2:y2+2) = 0

S = abs(F)
imagesc(fftshift(S.^0.1))
colormap('default')

% e.
reverse = uint8(ifft2(F))
imshow(reverse)

% f.
primatecaged = imread('D:\Projects\CZ4003-Assignment1\primatecaged.jpg')
primatecaged = rgb2gray(primatecaged)
imshow(primatecaged)

F = fft2(primatecaged);   
S = abs(F)
imagesc(S.^0.01)
colormap('default')

x1 = 6
y1 = 247
F(x1-2:x1+2, y1-2:y1+2) = 0

x2 = 10
y2 = 237
F(x2-2:x2+2, y2-2:y2+2) = 0

x3 = 252
y3 = 11
F(x3-2:x3+2, y3-2:y3+2) = 0

x4 = 248
y4 = 22
F(x4-2:x4+2, y4-2:y4+2) = 0

S = abs(F)
imagesc(S.^0.1)
colormap('default')

apestronk = uint8(ifft2(F))
imshow(apestronk)

% 2.6 Undoing Perspective Distortion of Planar Surface

% a.
P = imread('D:\Projects\CZ4003-Assignment1\book.jpg')
imshow(P)

% b.
[X, Y] = ginput(4)
Xim = [0; 210; 210; 0]
Yim = [0; 0; 297; 297]

% c.

A = [
    [X(1), Y(1), 1, 0, 0, 0, -Xim(1) * X(1), -Xim(1) * Y(1)];
    [0, 0, 0, X(1), Y(1), 1, -Yim(1) * X(1), -Yim(1) * Y(1)];
    [X(2), Y(2), 1, 0, 0, 0, -Xim(2) * X(2), -Xim(2) * Y(2)];
    [0, 0, 0, X(2), Y(2), 1, -Yim(2) * X(2), -Yim(2) * Y(2)];
    [X(3), Y(3), 1, 0, 0, 0, -Xim(3) * X(3), -Xim(3) * Y(3)];
    [0, 0, 0, X(3), Y(3), 1, -Yim(3) * X(3), -Yim(3) * Y(3)];
    [X(4), Y(4), 1, 0, 0, 0, -Xim(4) * X(4), -Xim(4) * Y(4)];
    [0, 0, 0, X(4), Y(4), 1, -Yim(4) * X(4), -Yim(4) * Y(4)];
]
v = [Xim(1); Yim(1); Xim(2); Yim(2); Xim(3); Yim(3); Xim(4); Yim(4)]
u = A \ v
U = reshape([u;1], 3, 3)';
w = U*[X'; Y'; ones(1,4)]
w = w ./ (ones(3,1) * w(3,:))

% d.
T = maketform('projective', U');
P2 = imtransform(P, T, 'XData', [0 210], 'YData', [0 297]);

% e.
imshow(P2)



