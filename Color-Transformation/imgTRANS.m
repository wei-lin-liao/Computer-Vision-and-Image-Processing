% ��l��
clear;
clc;
img1 = imread('Original-image.bmp');
[H,W,L] = size(img1);

% ����RGB
Red = img1(:,:,1);
Green = img1(:,:,2);
Blue = img1(:,:,3);

% �ର double
Red = double(Red);
Green = double(Green);
Blue = double(Blue);

% �ର V
vRed = Red / 255;
vGreen = Green / 255;
vBlue = Blue / 255;

% Gamma Effect �ϹϤ��ন Linear RGB
linear_Red = gamma_effect (vRed);
linear_Green = gamma_effect (vGreen);
linear_Blue = gamma_effect (vBlue);

% Linear RGB �ন HSV
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

% ��m�ഫ�B�z
Y = 0.01; % �V�p�V��
S = 0.01; % �V�p�V��
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

% HSV �ন Linear RGB 
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

% Gamma Correction �ϹϤ���^ Nonlinear RGB
nonlinear_Red = gamma_correct (lRed);
nonlinear_Green = gamma_correct (lGreen);
nonlinear_Blue = gamma_correct (lBlue);

% ��^ L
lRed = nonlinear_Red * 255 ;
lGreen = nonlinear_Green * 255 ;
lBlue = nonlinear_Blue * 255 ;

% ��^ uint
nonlinear_Red = uint8 (lRed);
nonlinear_Green = uint8 (lGreen);
nonlinear_Blue = uint8 (lBlue);

% ��X�Ϥ�
Balance=cat(3,nonlinear_Red,nonlinear_Green,nonlinear_Blue);
imwrite(Balance,'Tranformation-image.bmp');
