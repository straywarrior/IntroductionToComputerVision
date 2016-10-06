function [image_edge, gx, gy] = find_image_edge(srcimg)
    filter_y = fspecial('sobel');
    img_y_filtered = imfilter(double(srcimg), filter_y);

    filter_x = rot90(filter_y, -1);
    img_x_filtered = imfilter(double(srcimg), filter_x);

    image_edge = sqrt(img_x_filtered.^2 + img_y_filtered.^2);
    gx = img_x_filtered;
    gy = img_y_filtered;
end