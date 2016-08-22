function index = find_template_1D(t, s)
    index = find_template_1D_simple(t, s);
    return;
end

function index = find_template_1D_simple(t, s)
    c = normxcorr2(t, s);
    [maxVal, index] = max(c);
    index = index - size(t, 2) + 1;
    return;
end

function index = find_template_1D_KMP(t, s)
    i = 2;
    j = 1;
    index = -1;
    len_s = size(s, 2);
    len_t = size(t, 2);
    lut = generate_lut(t);
    k = i;
    while i <= len_s
        if k > len_s
            break;
        end
        if s(k)== t(j)
            if j == len_t
                index = i;
                return;
            end
            k = k + 1;
            j = j + 1;
        else
            if j == 1
                i = i + 1;
            else
                i = i + j - 1 - lut(j - 1);
            end
            k = i;
            j = 1;
        end
    end
    return;
end

function lut = generate_lut(t)
    i = 2;
    j = 1;
    len_t = size(t, 2);
    lut = zeros(1, len_t);
    k = i;
    while i <= len_t
        if k > len_t
            break;
        end
        if t(k) == t(j)
            lut(k) = lut(k - 1) + 1;
            k = k + 1;
            j = j + 1;
        else
            if k == i
                i = i + 1;
            else
                if lut(k - i) > 0
                    i = i + (k - i) - lut(k - i);
                else
                    i = k;
                end
            end
            k = i;
            j = 1;
        end
    end
end