function [en_img] = img_enhance_histogram ( img )

[H,W,L] = size(img);
RGB_temp = img_gamma_effect(img);

% RGB Historgram Equalization
RGB_temp = Equal(RGB_temp);


% RGB spatial domain Alpha trimmed filter
discard = 2;
for h = 1:H          % Alpha trimmed
    for w = 1:W
        for l = 1:L
            if w == 1 && h ==1
               container = [RGB_temp(1,1,l),RGB_temp(1,1,l),RGB_temp(1,2,l); ...
                            RGB_temp(1,1,l),RGB_temp(1,1,l),RGB_temp(1,2,l); ...
                            RGB_temp(2,1,l),RGB_temp(2,1,l),RGB_temp(2,2,l)];
            elseif w == 1 && h == H
               container = [RGB_temp(H-1,1,l),RGB_temp(H-1,1,l),RGB_temp(H-1,2,l); ...
                            RGB_temp(H,1,l),RGB_temp(H,1,l),RGB_temp(H,2,l); ...
                            RGB_temp(H,1,l),RGB_temp(H,1,l),RGB_temp(H,2,l)];
            elseif w == W && h == 1
               container = [RGB_temp(1,W-1,l),RGB_temp(1,W,l),RGB_temp(1,W,l); ...
                            RGB_temp(1,W-1,l),RGB_temp(1,W,l),RGB_temp(1,W,l); ...
                            RGB_temp(2,W-1,l),RGB_temp(2,W,l),RGB_temp(2,W,l)];
            elseif w == W && h == H
               container = [RGB_temp(H-1,W-1,l),RGB_temp(H-1,W,l),RGB_temp(H-1,W,l); ...
                            RGB_temp(H,W-1,l),RGB_temp(H,W,l),RGB_temp(H,W,l); ...
                            RGB_temp(H,W-1,l),RGB_temp(H,W,l),RGB_temp(H,W,l)];
            elseif w == 1 && h > 1 && h < H
               container = [RGB_temp(h-1,w,l),RGB_temp(h-1,w,l),RGB_temp(h-1,w+1,l); ...
                            RGB_temp(h,w,l),RGB_temp(h,w,l),RGB_temp(h,w+1,l); ...
                            RGB_temp(h+1,w,l),RGB_temp(h+1,w,l),RGB_temp(h+1,w+1,l)];
            elseif w == W && h > 1 && h < H
               container = [RGB_temp(h-1,w-1,l),RGB_temp(h-1,w,l),RGB_temp(h-1,w,l); ...
                            RGB_temp(h,w-1,l),RGB_temp(h,w,l),RGB_temp(h,w,l); ...
                            RGB_temp(h+1,w-1,l),RGB_temp(h+1,w,l),RGB_temp(h+1,w,l)];
            elseif w > 1 && w < W && h == 1
               container = [RGB_temp(h,w-1,l),RGB_temp(h,w,l),RGB_temp(h,w+1,l); ...
                            RGB_temp(h,w-1,l),RGB_temp(h,w,l),RGB_temp(h,w+1,l); ...
                            RGB_temp(h+1,w-1,l),RGB_temp(h+1,w,l),RGB_temp(h+1,w+1,l)];
            elseif w > 1 && w < W && h == H
               container = [RGB_temp(h-1,w-1,l),RGB_temp(h-1,w,l),RGB_temp(h-1,w+1,l); ...
                            RGB_temp(h,w-1,l),RGB_temp(h,w,l),RGB_temp(h,w+1,l); ...
                            RGB_temp(h,w-1,l),RGB_temp(h,w,l),RGB_temp(h,w+1,l)];
            else
               container = RGB_temp(h-1:h+1,w-1:w+1,l);
            end
            temp = sort(reshape(container,[],1));
            temp = temp(discard:length(temp)-discard);
            RGB_temp(h,w,l) = sum(temp)/length(temp);
        end
    end   
end

size_0 = 1;
discard = 2;

for h = 1+size_0:H-size_0          % Alpha trimmed filter
    for w = 1+size_0:W-size_0
        for l = 1:L
            container = RGB_temp(h-size_0:h+size_0,w-size_0:w+size_0,l);
            temp = sort(reshape(container,[],1));
            temp = temp(discard:length(temp)-discard);
            RGB_temp(h,w,l) = sum(temp)/length(temp);
        end
    end   
end
en_img = img_gamma_correct(RGB_temp);

end

