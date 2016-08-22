srcimg = imread('images/zebra.jpg');
srcimg_gray = double(rgb2gray(srcimg))/255;

%% Compute x, y gradients
[gx, gy] = imgradientxy(srcimg_gray, 'sobel');
%imshow((gx + 4)/8); % something tricky. why? matlab's sobel matrix doesn't normalize is just one of the reasons.
%imshow((gy + 4)/8);

%% Obtain gradient magnitude and direction
[gmag, gdir] = imgradient(gx, gy);
%imshow(gmag / (4 * sqrt(2)));
imshow((gdir + 180.0) / 360.0); % angle in degrees [-180, 180]

%% Find pixels with desired gradient direction
my_grad = select_gdir(gmag, gdir, 1, 30, 60); % 45 +/- 15
imshow(my_grad);  % NOTE: enable after you've implemented select_gdir

%% find edges use self-defined function
%{
img_edge = find_image_edge(srcimg_gray);
imagesc(img_edge);
colormap gray;
%}
