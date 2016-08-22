% Test code:
tablet = imread('stone.jpg');
tablet = rgb2gray(tablet);
imshow(tablet);

glyph = tablet(75:165, 150:185);
imshow(glyph);

[y, x] = find_template_2D(glyph, tablet);
disp([y x]); % should be the top-left corner of template in tablet