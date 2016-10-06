img = imread('images/gantrycrane.png');
img_gray = rgb2gray(img);
edge_binary = edge(img_gray, 'canny');
imshow(edge_binary);
pause;

[hough_mat, theta_vec, rho_vec] = hough(edge_binary,'RhoResolution',0.5,'ThetaResolution',0.5);

imshow(imadjust(mat2gray(hough_mat)), 'XData', theta_vec, 'YData', rho_vec, ...
    'InitialMagnification', 'fit');
axis on, axis normal, hold on;
%colormap(gca,hot);

%pause;

peaks = houghpeaks(hough_mat, 20, 'Threshold', 0.3 * max(hough_mat(:)));
peaks_x = theta_vec(peaks(:, 2));
peaks_y = rho_vec(peaks(:, 1));
plot(peaks_x, peaks_y, 's', 'color', 'red', 'MarkerSize', 10);

pause;
clf;

imshow(img); hold on;
lines = houghlines(edge_binary, theta_vec, rho_vec, peaks, 'FillGap', 100, 'MinLength', 20);
max_len = 0;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:, 1), xy(:, 2), 'LineWidth', 1, 'Color', 'green');
end