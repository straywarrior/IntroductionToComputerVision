function [yIndex, xIndex]=find_template_2D(template, img)
    [yIndex, xIndex] = find_template_2D_ver_2(template, img);
end

function [yIndex, xIndex] = find_template_2D_ver_1(template, img)
    res = normxcorr2(template, img);
    [maxColVal, rowIndex] = max(res);
    [maxVal, colIndex] = max(maxColVal);
    xIndex = colIndex;
    yIndex = rowIndex(xIndex);
    yIndex = yIndex - size(template, 1) + 1;
    xIndex = xIndex - size(template, 2) + 1;
end

function [yIndex, xIndex] = find_template_2D_ver_2(template, img)
    res = normxcorr2(template, img);
    [yIndex, xIndex] = find(res == max(res(:)));
    yIndex = yIndex - size(template, 1) + 1;
    xIndex = xIndex - size(template, 2) + 1;
end