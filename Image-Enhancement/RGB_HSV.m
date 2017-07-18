function HSV = RGB_HSV( RGB )

if size(size(RGB), 2) == 2
   comp = size(RGB,1);
   width = size(RGB,2);
   height = 1;
   container = RGB;
else
    height = size(RGB,1);
    width = size(RGB,2);
    length = height*width;
    comp = size(RGB,3);
    container = reshape(RGB, length, comp)';
end

maximum = max(container);
minimum = min(container);
max_min = maximum-minimum;
HSV = zeros(length,comp);

HSV(:,3) = maximum;
for k = 1:length
    if maximum(k) == minimum(k)
        HSV(k,1) = 0;
    elseif maximum(k) == container(1, k) && container(2, k)>=container(3, k)
        HSV(k,1) = 60*(container(2, k)-container(3, k))/max_min(k);
    elseif maximum(k) == container(1, k) && container(2, k)<container(3, k)
        HSV(k,1) = 60*(container(2, k)-container(3, k))/max_min(k) + 360;
    elseif maximum(k) == container(2, k)
        HSV(k,1) = 60*(container(3, k)-container(1, k))/max_min(k) + 120;
    elseif maximum(k) == container(3, k)
        HSV(k,1) = 60*(container(1, k)-container(2, k))/max_min(k) + 240;
    end
    if max(k)==0
        HSV(k,2) = 0;
    else
        HSV(k,2) = max_min(k)/maximum(k);
    end
end


if size(size(RGB), 2) ~=2
    HSV = reshape(HSV, height, width, comp);
end

end

