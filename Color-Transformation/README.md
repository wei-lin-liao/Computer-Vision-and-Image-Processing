# Color Transformation

---

Description of problem

---

Modify the image to make it be like a gloomy autumn day, for example: make the sky darker, adjust the color of the grass … etc.

---

Original image 

---

![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Color-Transformation/images/Original-image.bmp)

---

Transformation outcome

---

![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Color-Transformation/images/Tranformation-image.bmp)

---

Method

---

The following steps are excuted for every pixel of the image.

step (1) Transform 「Nonlinear RGB」 to 「Linear RGB」 ( Gamma effect )

step (2) Transform 「Linear RGB」 to 「HSV color space」 ( RGB to HSV )

step (3) According to the criterion or purpose, process the value of the pixel in HSV color space. ( Color transformation )

step (4) Transform 「HSV color space」 back to 「Linear RGB」 ( HSV to RGB )

step (5) Transform 「Linear RGB」 back to 「Nonlinear RGB」 ( Gamma effect )

---

HSV color space 

---

![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Color-Transformation/images/HSV.PNG)

---

RGB to HSV

---

![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Color-Transformation/images/RGB-to-HSV.PNG)

---

HSV to RGB

---

![alt_text](https://github.com/wei-lin-liao/Computer-Vision-and-Image-Processing/blob/master/Color-Transformation/images/HSV-to-RGB.PNG)
