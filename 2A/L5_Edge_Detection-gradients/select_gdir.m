function result = select_gdir( gmag, gdir, mag_min, angle_low, angle_high )
    result = select_gdir_ver_2(gmag, gdir, mag_min, angle_low, angle_high);
end

function result = select_gdir_ver_1( gmag, gdir, mag_min, angle_low, angle_high )
    result = zeros(size(gmag));
    for i = 1 : size(gmag, 1)
        for j = 1 : size(gmag, 2)
            cur_mag = gmag(i, j);
            cur_ang = gdir(i, j);
            if cur_mag >= mag_min && angle_low <= cur_ang && cur_ang <= angle_high
                result(i, j) = 1;
            end;
        end
    end
end

% Some more simple version
function result =  select_gdir_ver_2( gmag, gdir, mag_min, angle_low, angle_high )
    result = gmag >= mag_min & gdir >= angle_low & gdir <= angle_high;
end