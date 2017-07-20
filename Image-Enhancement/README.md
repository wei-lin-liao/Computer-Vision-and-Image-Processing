# Image Enhancement

---

Description of problem

---

Enhance low-contrast, partially-low-luminosity, noisy bmp images.


Original image 01


![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Image-Enhancement/images/input1.bmp)

Original image 02

![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Image-Enhancement/images/input2.bmp)

Original image 03

![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Image-Enhancement/images/input3.bmp)

Original image 04

![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Image-Enhancement/images/input4.bmp)


---

Outcome

---

「 Histogram equalization + Alpha trimmed filter 」

Output image 01 

![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Image-Enhancement/images/output1_histogram.bmp)

Output image 02 

![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Image-Enhancement/images/output2_histogram.bmp)

Output image 03

![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Image-Enhancement/images/output3_histogram.bmp)

Output image 04 

![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Image-Enhancement/images/output4_histogram.bmp)

「 Homomorphic filter + Alpha trimmed filter 」

Homomorphic filter ( frequency domain )

![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Image-Enhancement/images/Homomorphic_filter.PNG)

Ouput image 01

![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Image-Enhancement/images/output1_homomorphic.bmp)

Ouput image 02

![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Image-Enhancement/images/output2_homomorphic.bmp)

Ouput image 03

![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Image-Enhancement/images/output3_homomorphic.bmp)

Ouput image 04

![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Image-Enhancement/images/output4_homomorphic.bmp)

---

Methods

---

「 Alpha trimmed filtering 」

step (1) Size of mask is 3 x 3 ( Same value as edge padding )

step (2) Sort the value of mask , and delete the max and min two value .

step (3) Calculate the mean value of mask as the output of central pixel.



「 Homomorphic and Alpha trimmed filtering 」

step (1) Transform image RGB to HSV , and get the ln values of V components.

step (2) Get the frequency domain of ln values of V components by FFT.

step (3) Filtering with Homomorphic filter.

step (4) Recover spacial domain by computing IFFT. 

step (5) Compute the exponential value to recover RGB color space image.
