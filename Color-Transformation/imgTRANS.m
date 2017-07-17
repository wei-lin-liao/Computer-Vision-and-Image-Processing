% 初始化
clear;
clc;
img1 = imread('Original-image.bmp');
[H,W,L] = size(img1);

% 分離RGB
Red = img1(:,:,1);
Green = img1(:,:,2);
Blue = img1(:,:,3);

% 轉為 double
Red = double(Red);
Green = double(Green);
Blue = double(Blue);

% 轉為 V
vRed = Red / 255;
vGreen = Green / 255;
vBlue = Blue / 255;

% Gamma Effect 使圖片轉成 Linear RGB
linear_Red = gamma_effect (vRed);
linear_Green = gamma_effect (vGreen);
linear_Blue = gamma_effect (vBlue);

% Linear RGB 轉成 HSV
H_img = zeros(H,W);
S_img = zeros(H,W);
V_img = zeros(H,W);
for h = 1: H
    for w = 1:W
        RGB = [linear_Red(h,w);linear_Green(h,w);linear_Blue(h,w)];
        HSV = RGB_to_HSV (RGB);
        H_img (h,w) = HSV(1);
        S_img (h,w) = HSV(2);
        V_img (h,w) = HSV(3);
    end
end

% 色彩轉換處理
Y = 0.01; % 越小越黃
S = 0.01; % 越小越灰
for h = 1: H
    for w = 1:W
        if H_img (h,w) >= 180 && H_img (h,w) < 260
           S_img (h,w) = S_img (h,w)*S;
        end
        if H_img (h,w) < 180 && H_img (h,w) >= 55
           delta = H_img (h,w)-55;
           delta = delta*Y; 
           H_img (h,w) = 55 + delta;
        end
    end
end

% HSV 轉成 Linear RGB 
lRed = zeros(H,W);
lGreen = zeros(H,W);
lBlue = zeros(H,W);
for h = 1: H
    for w = 1:W
        HSV = [H_img(h,w);S_img(h,w);V_img(h,w)];
        lRGB = HSV_to_RGB (HSV);
        lRed(h,w) = lRGB(1);
        lGreen(h,w) = lRGB(2);
        lBlue(h,w) = lRGB(3);
    end
end

% Gamma Correction 使圖片轉回 Nonlinear RGB
nonlinear_Red = gamma_correct (lRed);
nonlinear_Green = gamma_correct (lGreen);
nonlinear_Blue = gamma_correct (lBlue);

% 轉回 L
lRed = nonlinear_Red * 255 ;
lGreen = nonlinear_Green * 255 ;
lBlue = nonlinear_Blue * 255 ;

% 轉回 uint
nonlinear_Red = uint8 (lRed);
nonlinear_Green = uint8 (lGreen);
nonlinear_Blue = uint8 (lBlue);

% 輸出圖片
Balance=cat(3,nonlinear_Red,nonlinear_Green,nonlinear_Blue);
imwrite(Balance,'Tranformation-image.bmp');
