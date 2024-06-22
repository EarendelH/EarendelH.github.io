---
title : 计算机视觉自学笔记及实践【OpenCV】
time : 2024-6-22
tags: 计算机视觉,OpenCV
cover : true
---

自学计算机视觉和深度学习的笔记，欢迎大佬指正

<!-- more -->

## OpenCV基础笔记
### 图片导入
```python
import cv2
violet=cv2.imread("autoricon.jpg")
print(violet)
```

    [[[212 244 250]
      [211 243 249]
      [210 242 248]
      ...
      [214 243 247]
      [214 243 247]
      [214 243 247]]
    
     [[212 244 250]
      [211 243 249]
      [210 242 248]
      ...
      [215 244 248]
      [215 244 248]
      [215 244 248]]
    
     [[212 244 250]
      [212 244 250]
      [210 242 248]
      ...
      [217 246 250]
      [217 246 250]
      [217 246 250]]
    
     ...
    
     [[216 245 249]
      [216 245 249]
      [216 245 249]
      ...
      [212 244 250]
      [212 244 250]
      [212 244 250]]
    
     [[216 245 249]
      [216 245 249]
      [216 245 249]
      ...
      [212 244 250]
      [212 244 250]
      [212 244 250]]
    
     [[216 245 249]
      [216 245 249]
      [216 245 249]
      ...
      [212 244 250]
      [212 244 250]
      [212 244 250]]]



```python
import cv2
import time
import matplotlib.pyplot as plt
violet=cv2.imread("autoricon.jpg")
plt.imshow(violet)#为了避免cv2.imshow()显示窗口无法关闭的问题，使用plt.imshow()代替

# cv2.imshow("Demo1",violet)
# cv2.imshow("Demo2",violet)
# cv2.waitKey(1)
# cv2.destroyAllWindows()

```

    
![png](learn_2_1.png)
    



```python
#因为opencv读取的图片是BGR格式，而matplotlib是RGB格式，所以需要转换
img_rgb=cv2.cvtColor(violet,cv2.COLOR_BGR2RGB)
plt.imshow(img_rgb)
```

    
![png](learn_3_1.png)
    



```python
import cv2
import time
violet=cv2.imread("autoricon.jpg")
r=cv2.imwrite("violet.jpg",violet)

```

cv2.imread("[PATH]") 读取PATH地址的图片

cv2.imshow("[窗口名称]",图片) 弹出一个窗口来显示图像

cv2.waitKey([delay])  单位ms；空、0、负数：等待直到有按键被按下；正数：在这段时间内按下键盘，返回该键ASCII码，超过时间返回-1并继续后续程序

cv2.destroyAllWindows() 释放（销毁）所有窗口

cv2.imwrite(filepath,img[,params]) filepath是保存目标文件的完整路径名，包含文件扩展名，img是图片，params是可选的保存参数


`cv2.imread` 函数是 OpenCV 中用于读取图像的函数。它的第二个参数是 `flags`，用于指定读取图像的方式。以下是一些常用的 `flags`：

1. **`cv2.IMREAD_COLOR`** (`1`)：以彩色模式读取图像。这是默认参数，忽略图像的透明度通道（如果存在）。如果指定了这个标志，图像将被转换为3通道BGR颜色图像。

2. **`cv2.IMREAD_GRAYSCALE`** (`0`)：以灰度模式读取图像。使用这个标志，图像将被转换为灰度图像（只有一个颜色通道）。

3. **`cv2.IMREAD_UNCHANGED`** (`-1`)：包括图像的alpha通道。使用这个标志，图像将按照文件中的原样读取，包括所有的通道，例如，对于PNG图像，包括透明度通道。

4. **`cv2.IMREAD_ANYDEPTH`** (`2`)：如果图像是16位或32位图像，则按原样读取数据类型，而不是将其转换为8位。

5. **`cv2.IMREAD_ANYCOLOR`** (`4`)：如果图像是任何可能的颜色格式，则读取图像，而不仅仅是标准的BGR颜色图像。

6. **`cv2.IMREAD_REDUCED_GRAYSCALE_2`**, **`cv2.IMREAD_REDUCED_COLOR_2`**, **`cv2.IMREAD_REDUCED_GRAYSCALE_4`**, **`cv2.IMREAD_REDUCED_COLOR_4`**, **`cv2.IMREAD_REDUCED_GRAYSCALE_8`**, **`cv2.IMREAD_REDUCED_COLOR_8`**：这些标志用于以降低的分辨率读取灰度或彩色图像。数字代表降低的比例（例如，`2` 表示图像大小减少到原来的1/2，`4` 表示减少到1/4，等等）。这对于快速加载大图像进行预览或处理时非常有用。

使用示例：




```python
import cv2
import matplotlib.pyplot as plt
# 以彩色模式读取图像
image_color = cv2.imread('autoricon.jpg', cv2.IMREAD_COLOR)

# 以灰度模式读取图像
image_gray = cv2.imread('autoricon.jpg', cv2.IMREAD_GRAYSCALE)

# 读取图像，包括alpha通道
image_unchanged = cv2.imread('autoricon.jpg', cv2.IMREAD_UNCHANGED)
plt.subplot(1, 3, 1)
plt.imshow(cv2.cvtColor(image_color, cv2.COLOR_BGR2RGB))
plt.subplot(1, 3, 2)
plt.imshow(image_gray, cmap='gray')
plt.subplot(1, 3, 3)
plt.imshow(cv2.cvtColor(image_unchanged, cv2.COLOR_BGR2RGB))
```









    
![png](learn_7_1.png)
    



```python
#用numpy创建一个8*8的黑色图像并修改其中一个像素的值
import cv2
import matplotlib.pyplot as plt
import numpy as np
img = np.zeros((8,8),np.uint8)
print("img=\n",img)
# cv2.imshow("Demo",img)
plt.figure()
plt.subplot(1,2,1)
plt.imshow(img,cmap="gray")
print("img=\n",img)
print("img[0,3]=",img[0,3])
img[0,3]=255
print("img[0,3]=",img[0,3])
plt.subplot(1,2,2)
plt.imshow(img,cmap="gray")
plt.show()
# cv2.imshow("Demo",img)
# cv2.waitKey(0)
# cv2.destroyAllWindows()
```

    img=
     [[0 0 0 0 0 0 0 0]
     [0 0 0 0 0 0 0 0]
     [0 0 0 0 0 0 0 0]
     [0 0 0 0 0 0 0 0]
     [0 0 0 0 0 0 0 0]
     [0 0 0 0 0 0 0 0]
     [0 0 0 0 0 0 0 0]
     [0 0 0 0 0 0 0 0]]
    img=
     [[0 0 0 0 0 0 0 0]
     [0 0 0 0 0 0 0 0]
     [0 0 0 0 0 0 0 0]
     [0 0 0 0 0 0 0 0]
     [0 0 0 0 0 0 0 0]
     [0 0 0 0 0 0 0 0]
     [0 0 0 0 0 0 0 0]
     [0 0 0 0 0 0 0 0]]
    img[0,3]= 0
    img[0,3]= 255



    
![png](learn_8_1.png)
    



```python
#读取一张图片，修改其中一个区域的像素值
plt.figure()
plt.subplot(1,2,1)
plt.imshow(violet,cmap="gray")
print("vilet[50,90]原始值=",violet[50,90])
violet[10:100,80:100]=255
print("violet[50,90]修改后的值=",violet[50,90])
plt.subplot(1,2,2)
plt.imshow(violet,cmap="gray")
```

    vilet[50,90]原始值= [213 245 251]
    violet[50,90]修改后的值= [255 255 255]










    
![png](learn_9_2.png)
    



```python
violet=cv2.imread("autoricon.jpg")
print("访问violet[0,0]= ",violet[0,0])
print("访问violet[0,0,0]= ",violet[0,0,0])
print("访问violet[0,0,1]= ",violet[0,0,1])
print("访问violet[0,0,2]= ",violet[0,0,2])
print("访问violet[300,0]= ",violet[300,0])
print("访问violet[500,0]= ",violet[500,0])
violet[0:100,0:200,0:3]=255 #白色
violet[100:200,200:400,0:3]=128 #灰色
violet[200:300,400:600,0:3]=0 #黑色
violet[300:400,600:800]=(0,0,255) #红色
violet_rgb=cv2.cvtColor(violet,cv2.COLOR_BGR2RGB)
plt.imshow(violet_rgb)
```

    访问violet[0,0]=  [212 244 250]
    访问violet[0,0,0]=  212
    访问violet[0,0,1]=  244
    访问violet[0,0,2]=  250
    访问violet[300,0]=  [212 240 247]
    访问violet[500,0]=  [215 246 249]










    
![png](learn_10_2.png)
    



```python
#通道拆分
# Channel splitting
violet=cv2.imread("autoricon.jpg")
violet_rgb=cv2.cvtColor(violet,cv2.COLOR_BGR2RGB)
channels = cv2.split(violet_rgb)
for i, channel in enumerate(channels):
    plt.subplot(2, len(channels), i+1)
    plt.imshow(channel, cmap='gray')
    plt.title(f'Channel {i+1}')
    plt.axis('off')
    violet_rgb[:,:,i]= 0
    plt.subplot(2, len(channels), i+1+len(channels))
    plt.imshow(violet_rgb, cmap='gray')
    plt.title(f'Channel {i+1} removed')
    plt.axis('off')
plt.show()
############################################################################################################
# import cv2
# import numpy as np
# violet=cv2.imread("autoricon.jpg")
# b=violet[:,:,0]
# g=violet[:,:,1]
# r=violet[:,:,2]
# cv2.imshow("Blue",b)
# cv2.imshow("Green", g)
# cv2.imshow("Red", r)
# violet[:,:,0]=0
# cv2.imshow("Violetb0",violet)
# violet[:,:,1]=0
# cv2.imshow("Violetg0",violet)
# cv2.waitKey(0)
# cv2.destroyAllWindows() 
```


    
![png](learn_11_0.png)
    



```python
#通道合并
violet=cv2.imread("autoricon.jpg")
b,g,r=cv2.split(violet)
bgr=cv2.merge([b,g,r]) #b通道不变，g通道不变，r通道不变
rgb=cv2.merge([r,g,b]) #输出的b通道是原图r通道，g通道是g通道，输出的r通道是原图b通道
violet_rgb=cv2.cvtColor(violet,cv2.COLOR_BGR2RGB)
bgr_rgb=cv2.cvtColor(bgr,cv2.COLOR_BGR2RGB)
rgb_rgb=cv2.cvtColor(rgb,cv2.COLOR_BGR2RGB)
plt.subplot(1,3,1)
plt.imshow(violet_rgb)
plt.title("Original")
plt.axis("off")
plt.subplot(1,3,2)
plt.imshow(bgr_rgb)
plt.title("BGR")
plt.axis("off")
plt.subplot(1,3,3)
plt.imshow(rgb_rgb)
plt.title("RGB")
plt.axis("off")
```




    (np.float64(-0.5), np.float64(719.5), np.float64(781.5), np.float64(-0.5))




    
![png](learn_12_1.png)
    



```python
#调整图像大小
#violet=cv2.resize(src,dsize[,fx[,fy[,interpolation]]])
#src:输入图像
#dsize:输出图像的大小，可以是元组，也可以是整数
#fx:沿水平轴的缩放比例
#fy:沿垂直轴的缩放比例
#interpolation:插值方法（缩放（比原来像素值更多）时使用的插值方法）
violet=cv2.imread("autoricon.jpg")
width,height=violet.shape[:2]
violet=cv2.resize(violet,(200,200))
violet_rgb=cv2.cvtColor(violet,cv2.COLOR_BGR2RGB)
plt.imshow(violet_rgb)
plt.title(f'Resized Image from {width}x{height} to 200x200')

```




    Text(0.5, 1.0, 'Resized Image from 782x720 to 200x200')




    
![png](learn_13_1.png)
    


OpenCV提供了多种插值方法，主要用于图像缩放、旋转和仿射变换等操作。以下是OpenCV中常用的几种插值方式：

1. **最近邻插值（Nearest-neighbor interpolation）**：
   - OpenCV标识：`cv2.INTER_NEAREST`
   - 描述：选择最近的像素值作为新像素的值。速度最快，但图像质量最差，特别是在放大时。

2. **双线性插值（Bilinear interpolation）**：
   - OpenCV标识：`cv2.INTER_LINEAR`
   - 描述：基于目标像素点周围四个最近的像素点，通过线性插值计算得到新的像素值。是**默认的插值方法**，平衡了速度和质量。

3. **双三次插值（Bicubic interpolation）**：
   - OpenCV标识：`cv2.INTER_CUBIC`
   - 描述：考虑目标像素点周围16个像素点（4x4邻域），通过三次多项式插值计算新的像素值。比双线性插值慢，但能得到更高质量的图像。

4. **面积插值（Area interpolation）**：
   - OpenCV标识：`cv2.INTER_AREA`
   - 描述：使用像素区域关系进行重采样。在缩小图像时推荐使用，因为它可以提供无莫尔纹理（Moiré-free）的结果。

5. **Lanczos插值**：
   - OpenCV标识：`cv2.INTER_LANCZOS4`
   - 描述：使用Lanczos窗口的sinc插值方法，考虑目标像素点周围的8x8像素点。在质量上通常优于双三次插值，但计算更为复杂。

选择哪种插值方法取决于具体的应用需求，如对图像质量的要求、处理速度的需求等。例如，对于图像缩放操作，如果需要快速处理且对质量要求不高，可以选择`cv2.INTER_LINEAR`；如果追求高质量的图像结果，可以选择`cv2.INTER_CUBIC`或`cv2.INTER_LANCZOS4`。


```python
#ROI：感兴趣区域 Region of Interest
violet=cv2.imread("autoricon.jpg")
face=violet[200:500,250:550]
plt.imshow(cv2.cvtColor(face,cv2.COLOR_BGR2RGB))
```









    
![png](learn_15_1.png)
    



```python
#掩膜
#mask=cv2.inRange(src,lowerb,upperb)
#src:输入图像
#lowerb:下界
#upperb:上界
#乘法运算
#将掩膜图像与原图像相乘，可以实现掩膜效果
violet=cv2.imread("autoricon.jpg",1)
h,w,c=violet.shape
m=np.zeros((h,w,c),np.uint8)
m[200:500,250:550]=1
m[500:600,250:300]=1
result=m*violet
plt.imshow(cv2.cvtColor(result,cv2.COLOR_BGR2RGB))
```









    
![png](learn_16_1.png)
    



```python
#逻辑运算实现掩膜效果
#像素值和11111111（255）进行按位与运算得到的都是原图像的像素值
#像素值和00000000（0）进行按位与运算得到的都是0
violet=cv2.imread("autoricon.jpg",1)
h,w,c=violet.shape
m=np.zeros((h,w,c),np.uint8)
m[200:500,250:550]=255
m[500:600,250:300]=255
result=cv2.bitwise_and(violet,m)
plt.imshow(cv2.cvtColor(result,cv2.COLOR_BGR2RGB))
```









    
![png](learn_17_1.png)
    



```python
#掩膜作为函数参数
#OpenCV中的函数可以接受掩膜作为参数，以便在处理图像时忽略掩膜之外的像素
#例如，cv2.add(src1,src2[,dst[,mask]])
#src1:第一个输入图像; src2:第二个输入图像; dst:输出图像; mask:掩膜图像
import cv2
import numpy as np
import matplotlib.pyplot as plt

violet = cv2.imread("autoricon.jpg")
img2 = cv2.imread("opencv.png")
img2 = cv2.resize(img2, (violet.shape[1], violet.shape[0]))
h, w, c = violet.shape
m = np.zeros((h, w), np.uint8)
m[200:500, 250:550] = 1
m[500:600, 250:300] = 1
n = np.zeros((h, w,c), np.uint8)
n[200:500, 250:550] = 1
n[500:600, 250:300] = 1
result1 = violet*n
result2 = img2*n
result3 = cv2.add(violet, img2, mask=m)
plt.subplot(2, 3, 1)
plt.imshow(cv2.cvtColor(violet, cv2.COLOR_BGR2RGB))
plt.subplot(2, 3, 2)
plt.imshow(cv2.cvtColor(img2, cv2.COLOR_BGR2RGB))
plt.subplot(2, 3, 3)
plt.imshow(cv2.cvtColor(result1, cv2.COLOR_BGR2RGB))
plt.subplot(2, 3, 4)
plt.imshow(cv2.cvtColor(result2, cv2.COLOR_BGR2RGB))
plt.subplot(2, 3, 5)
plt.imshow(cv2.cvtColor(result3, cv2.COLOR_BGR2RGB))
plt.show()
```


    
![png](learn_18_0.png)
    


当你使用 `cv2.add` 对两张图片进行加法操作时，如果观察到结果变化不大，可能是由以下几个原因造成的：

1. **像素饱和度**：OpenCV中的 `cv2.add` 函数对于加法操作有一个特性，即当像素值相加超过255时，结果会被饱和到255。这意味着高亮度区域的变化可能不会很明显，因为它们已经接近或达到了亮度的上限。

2. **图像内容**：如果两张图片在大部分区域内的像素值相差不大，或者一张图片的像素值大部分都很低（接近黑色），那么加法操作后的视觉变化可能不会很明显。

3. **掩膜使用**：如果在加法操作中使用了掩膜，并且掩膜的大部分区域都是0（不允许操作的区域），那么只有少数区域会受到影响，导致整体变化不明显。

4. **图像对比度**：如果两张图片的对比度较低，即使它们被加在一起，结果图像的对比度可能仍然较低，导致视觉上的变化不大。

为了使加法操作后的变化更加明显，你可以尝试以下方法：

- **调整亮度和对比度**：在进行加法操作之前，可以尝试增加一张或两张图片的亮度和对比度，使得它们的像素值有更大的差异。

- **使用权重加法**：使用 `cv2.addWeighted` 函数代替 `cv2.add`，这样可以为每张图片设置不同的权重，可能会得到更加明显的视觉效果。

- **图像融合**：除了简单的加法，还可以尝试其他图像融合技术，如多图像融合、HDR融合等，这些方法可以在保留更多细节的同时，创造出视觉上更加丰富的效果。

下面是使用 `cv2.addWeighted` 的示例代码：



在 `cv2.addWeighted` 函数中，最后一个参数是一个标量，用于在加权和之后添加到所有通道。其主要作用是调整结果图像的亮度。

函数原型如下：




```python
cv2.addWeighted(src1, alpha, src2, beta, gamma)
```



- `src1` 和 `src2` 是要融合的两个图像。
- `alpha` 是 `src1` 的权重。
- `beta` 是 `src2` 的权重。
- `gamma` 是加到最终加权和上的标量值。

这里的 `gamma` 值可以被视为一个调整亮度的参数。当 `gamma` 值为正时，它会使得结果图像整体变亮；当 `gamma` 值为负时，结果图像会变暗。如果 `gamma` 设置为0，那么就不会对结果图像的亮度产生影响，只进行基于 `alpha` 和 `beta` 权重的线性融合。

例如，如果你想在融合两张图像的同时，增加结果图像的亮度，可以将 `gamma` 设置为一个正值：




```python

import cv2
import numpy as np
import matplotlib.pyplot as plt

violet = cv2.imread("autoricon.jpg")
img2 = cv2.imread("opencv.png")
img2 = cv2.resize(img2, (violet.shape[1], violet.shape[0]))
h, w, c = violet.shape
m = np.zeros((h, w), np.uint8)

result = cv2.addWeighted(violet, 0.5 ,img2,0.7 ,30)

plt.subplot(1, 3, 1)
plt.imshow(cv2.cvtColor(violet, cv2.COLOR_BGR2RGB))
plt.subplot(1, 3, 2)
plt.imshow(cv2.cvtColor(img2, cv2.COLOR_BGR2RGB))
plt.subplot(1, 3, 3)
plt.imshow(cv2.cvtColor(result, cv2.COLOR_BGR2RGB))
plt.show()
```


    
![png](learn_23_0.png)
    



```python

```
