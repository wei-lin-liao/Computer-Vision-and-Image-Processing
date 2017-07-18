clear;
clc;
%%  方法一 Homomorphic_filter_and_Alpha_trimmed
img1 = imread('input1.bmp');
output1 = img_enhance_homomorphic_and_alpha_trimmed(img1);
imwrite(output1,'output1_homomorphic.bmp');

img2 = imread('input2.bmp');
output2 = img_enhance_homomorphic_and_alpha_trimmed(img2);
imwrite(output2,'output2_homomorphic.bmp');

img3 = imread('input3.bmp');
output3 = img_enhance_homomorphic_and_alpha_trimmed(img3);
imwrite(output3,'output3_homomorphic.bmp');

img4 = imread('input4.bmp');
output4 = img_enhance_homomorphic_and_alpha_trimmed(img4);
imwrite(output4,'output4_homomorphic.bmp');

%%  方法二 Histogram

img1 = imread('input1.bmp');
output1 = img_enhance_histogram(img1);
imwrite(output1,'output1_histogram.bmp');
img2 = imread('input2.bmp');

output2 = img_enhance_histogram(img2);
imwrite(output2,'output2_histogram.bmp');

img3 = imread('input3.bmp');
output3 = img_enhance_histogram(img3);
imwrite(output3,'output3_histogram.bmp');

img4 = imread('input4.bmp');
output4 = img_enhance_histogram(img4);
imwrite(output4,'output4_histogram.bmp');

