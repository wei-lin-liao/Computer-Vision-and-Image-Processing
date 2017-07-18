function [en_img] = img_enhance ( img )

[H,W,L] = size(img);
RGB_temp = img_gamma_effect(img);

% RGB 空間域 Alpha trimmed 濾波器
discard = 2;

for h = 1:H         % Alpha trimmed
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

% 轉換至 HSV 空間
HSV = RGB_HSV (RGB_temp);
H_img = HSV(:,:,1);
S_img = HSV(:,:,2);
V_img = HSV(:,:,3);

penalty = 0.0001;
F_V = fft(log(V_img + penalty));     
F_V = fftshift(F_V); 

% Homomorphic 頻域濾波器
filter = zeros(H,W);
for h = 1:H
    for w =1:W
        dist = ((h-(H/2))^2 + (w-(W/2))^2)^(0.5);
        dist = (dist)/((H/2)^2+(W/2)^2)^(0.5);
        filter(h,w) = 1.1/(1 + 2.5*exp(-0.3*(dist-1)))+0.01*exp(3*dist);
        
    end
end

% 頻域濾波
F_V = F_V.*filter;

% 頻域轉回空間域
F_V = fftshift(F_V);
inF_V = ifft(F_V);
V_img = exp(real(inF_V));

% 轉回 HSV 再轉回 RGB
HSV = cat(3,H_img,S_img,V_img);
en_img = img_gamma_correct(HSV_RGB(HSV));

for h = 2:H-1          % Laplacian 銳化
    for w = 2:W-1
        for c = 1:L
            container = RGB_temp(h-1:h+1,w-1:w+1,l);
            filter = [1,1,1;1,-8,1;1,1,1];
            sharpness = sum(sum(container.*filter));
            RGB_temp(h,w,l) = RGB_temp(h,w,l)+sharpness;
        end
    end
end

end

