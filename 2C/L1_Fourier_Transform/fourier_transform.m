img = imread('images/man_made_road.jpg');
%img = imread('images/lena.png');
img_gray = rgb2gray(img);

%{
imshow(img_gray);
pause;
%}

img_dft = fft2(img_gray);

% to move the zero to the center
% and also we care more about the power
img_dft_abs = log(abs(fftshift(img_dft)));
imshow(mat2gray(img_dft_abs));