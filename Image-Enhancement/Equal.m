function output = Equal ( RGB_temp )
[H,W,L] = size(RGB_temp);
output = zeros(H,W,L);
RGB_temp = RGB_temp*511;
RGB_histogram = zeros(512,3);
RGB_accum = zeros(512,3);
% Calculate histogram
for h = 1:H
    for w = 1:W
        for l = 1:L
            RGB_histogram(floor(RGB_temp(h,w,l))+1,l) = RGB_histogram(floor(RGB_temp(h,w,l))+1,l) +1;
        end
    end
end
% Histogram normalization
for l = 1:L
    RGB_histogram(:,l) = RGB_histogram(:,l)/sum(RGB_histogram(:,l));
end

for l = 1:L
    for s = 1:512
        RGB_accum(s,l) = sum(RGB_histogram(1:s,l));
    end
end

for h = 1:H
    for w = 1:W
        for l = 1:L
            output(h,w,l) = RGB_accum(floor(RGB_temp(h,w,l))+1,l);           
        end 
    end
end

end

