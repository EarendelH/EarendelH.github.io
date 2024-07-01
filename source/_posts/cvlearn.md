---
title : 计算机视觉自学笔记及实践【OpenCV】
time : 2024-07-01 22:34:43
tags:
     - Opencv
     - 计算机视觉
cover : true
---
自学计算机视觉和深度学习的笔记，欢迎大佬们指正

<!-- more -->

# OpenCV基础笔记

## 图片读入


```python
import cv2
import matplotlib.pyplot as plt
violet=cv2.imread("autoricon.jpg")
plt.imshow(violet)#为了避免jupyter-notebook中cv2.imshow()显示窗口无法关闭的问题，使用plt.imshow()代替
plt.show()
# cv2.imshow("Demo1",violet)
# cv2.imshow("Demo2",violet)
# cv2.waitKey(1)
# cv2.destroyAllWindows()

```


    
![png](cvlearn_files/cvlearn_2_0.png)
    


## 显示格式转换 
为了避免jupyter-notebook中`cv2.imshow()`显示窗口无法关闭的问题，使用`plt.imshow()`代替  


因为opencv读取的图片是BGR格式，而matplotlib是RGB格式，所以需要转换颜色映射


```python
img_rgb=cv2.cvtColor(violet,cv2.COLOR_BGR2RGB)
plt.imshow(img_rgb)
plt.show()
```


    
![png](cvlearn_files/cvlearn_4_0.png)
    



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


## 图片写入


```python
import cv2
import time
violet=cv2.imread("autoricon.jpg")
r=cv2.imwrite("violet.jpg",violet)
```

## 小总结
cv2.imread("[PATH]") 读取PATH地址的图片

cv2.imshow("[窗口名称]",图片) 弹出一个窗口来显示图像

cv2.waitKey([delay])  单位ms；空、0、负数：等待直到有按键被按下；正数：在这段时间内按下键盘，返回该键ASCII码，超过时间返回-1并继续后续程序

cv2.destroyAllWindows() 释放（销毁）所有窗口

cv2.imwrite(filepath,img[,params]) filepath是保存目标文件的完整路径名，包含文件扩展名，img是图片，params是可选的保存参数


### cv2.imread(src,[0]) 第二个参数的用法
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
plt.show()
```


    
![png](cvlearn_files/cvlearn_10_0.png)
    


## 用numpy创建一个8*8的黑色图像并修改其中一个像素的值


```python
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



    
![png](cvlearn_files/cvlearn_12_1.png)
    


## 读取一张图片，修改其中一个区域的像素值


```python

plt.figure()
plt.subplot(1,2,1)
plt.imshow(violet,cmap="gray")
print("vilet[50,90]原始值=",violet[50,90])
violet[10:100,80:100]=255
print("violet[50,90]修改后的值=",violet[50,90])
plt.subplot(1,2,2)
plt.imshow(violet,cmap="gray")
plt.show()
```

    vilet[50,90]原始值= [213 245 251]
    violet[50,90]修改后的值= [255 255 255]



    
![png](cvlearn_files/cvlearn_14_1.png)
    


## 按区域修改像素


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
plt.show()
```

    访问violet[0,0]=  [212 244 250]
    访问violet[0,0,0]=  212
    访问violet[0,0,1]=  244
    访问violet[0,0,2]=  250
    访问violet[300,0]=  [212 240 247]
    访问violet[500,0]=  [215 246 249]



    
![png](cvlearn_files/cvlearn_16_1.png)
    


## 通道拆分 Channel splitting
色彩通道拆分的方法
1. img[:,:0]表示b通道，同理img[:,:1]表示g通道，img[:,:2]表示r通道
2. 使用`cv2.split(img)`


```python
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


    
![png](cvlearn_files/cvlearn_18_0.png)
    


## 通道合并


```python
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
plt.show()
```


    
![png](cvlearn_files/cvlearn_20_0.png)
    


## 调整图像大小
`violet=cv2.resize(src,dsize[,fx[,fy[,interpolation]]])`

src:输入图像  
dsize:输出图像的大小，可以是元组，也可以是整数  
#x:沿水平轴的缩放比例  
fy:沿垂直轴的缩放比例  
interpolation:插值方法（缩放（比原来像素值更多）时使用的插值方法）


```python
violet=cv2.imread("autoricon.jpg")
width,height=violet.shape[:2]
violet=cv2.resize(violet,(200,200))
violet_rgb=cv2.cvtColor(violet,cv2.COLOR_BGR2RGB)
plt.imshow(violet_rgb)
plt.title(f'Resized Image from {width}x{height} to 200x200')
plt.show()
```


    
![png](cvlearn_files/cvlearn_22_0.png)
    


### 插值方法
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

## ROI：感兴趣区域 Region of Interest


```python
violet=cv2.imread("autoricon.jpg")
face=violet[200:500,250:550]
plt.imshow(cv2.cvtColor(face,cv2.COLOR_BGR2RGB))
plt.show()
```


    
![png](cvlearn_files/cvlearn_25_0.png)
    


## 掩膜
`mask=cv2.inRange(src,lowerb,upperb)`  
src:输入图像  
lowerb:下界  
upperb:上界  
### 乘法运算  
将掩膜图像与原图像相乘，可以实现掩膜效果


```python
violet=cv2.imread("autoricon.jpg",1)
h,w,c=violet.shape
m=np.zeros((h,w,c),np.uint8)
m[200:500,250:550]=1
m[500:600,250:300]=1
result=m*violet
plt.imshow(cv2.cvtColor(result,cv2.COLOR_BGR2RGB))
plt.show()
```


    
![png](cvlearn_files/cvlearn_27_0.png)
    


### 逻辑运算实现掩膜效果
像素值和11111111（255）进行按位与运算得到的都是原图像的像素值  
像素值和00000000（0）进行按位与运算得到的都是0


```python
violet=cv2.imread("autoricon.jpg",1)
h,w,c=violet.shape
m=np.zeros((h,w,c),np.uint8)
m[200:500,250:550]=255
m[500:600,250:300]=255
result=cv2.bitwise_and(violet,m)
plt.imshow(cv2.cvtColor(result,cv2.COLOR_BGR2RGB))
plt.show()
```


    
![png](cvlearn_files/cvlearn_29_0.png)
    


### 掩膜作为函数参数
OpenCV中的函数可以接受掩膜作为参数，以便在处理图像时忽略掩膜之外的像素  
例如，`cv2.add(src1,src2[,dst[,mask]])`  
src1:第一个输入图像; src2:第二个输入图像; dst:输出图像; mask:掩膜图像


```python
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


    
![png](cvlearn_files/cvlearn_31_0.png)
    


### 加法操作变化小的问题分析
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



### 按权重的加法
在 `cv2.addWeighted` 函数中，最后一个参数是一个标量，用于在加权和之后添加到所有通道。其主要作用是调整结果图像的亮度。

函数原型如下：

`cv2.addWeighted(src1, alpha, src2, beta, gamma)`




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


    
![png](cvlearn_files/cvlearn_35_0.png)
    


## 色彩处理
常见的色彩空间有：
1. RGB  三原色
2. GRAY  灰度图像
3. YCrCb  
4. HSV
5. HLS
6. CIEL*a*b
7. CIEL*u*v
8. Bayer
**重点介绍GRAY色彩空间和HSV色彩空间**
### GRAY 色彩空间
当图像由RGB空间转换至GRAY色彩空间时，其处理方式如下,OpenCV中的转换也如下：   
$GRAY=0.299\cdot R + 0.587\cdot G+0.114\cdot B$  
简化形式的转换：  
$GRAY=\frac{R+G+B}{3}$

当图像由GRAY色彩空间转换至RGB色彩空间时，最终所有通道的值都将是相同的
- R = GRAY
- G = GRAY
- B = GRAY
### HSV 色彩空间

HSV色彩空间是一种将RGB色彩空间中的颜色信息与亮度信息分离的色彩空间。HSV分别代表色调（Hue）、饱和度（Saturation）和明度（Value）。HSV色彩空间的转换公式如下：
- 色调（Hue）：$H=\arctan(\frac{\sqrt{3}(G-B)}{2R-G-B})$
- 饱和度（Saturation）：$S=1-\frac{3}{R+G+B}\min(R,G,B)$
- 明度（Value）：$V=\frac{R+G+B}{3}$
- 其中，$0\leq H\leq 360$，$0\leq S\leq 1$，$0\leq V\leq 1$
### 色彩空间的转换

- OpenCV中的转换函数为`cv2.cvtColor(src,code[,dst[,dstCn]])`
- src:输入图像
- code:转换代码
- dst:输出图像
- dstCn:输出图像的通道数
- 部分转换代码  

    | Code Value | Description |
    |------------|-------------|
    | `cv2.COLOR_BGR2GRAY` | Convert BGR image to grayscale |
    | `cv2.COLOR_BGR2HSV` | Convert BGR image to HSV color space |
    | `cv2.COLOR_BGR2HLS` | Convert BGR image to HLS color space |
    | `cv2.COLOR_BGR2LAB` | Convert BGR image to CIEL*a*b color space |
    | `cv2.COLOR_BGR2LUV` | Convert BGR image to CIEL*u*v color space |
    | `cv2.COLOR_BGR2XYZ` | Convert BGR image to XYZ color space |
    | `cv2.COLOR_BGR2YCrCb` | Convert BGR image to YCrCb color space |
    | `cv2.COLOR_BGR2YUV` | Convert BGR image to YUV color space |
    | `cv2.COLOR_BGR2RGB` | Convert BGR image to RGB color space |
    | `cv2.COLOR_GRAY2BGR` | Convert grayscale image to BGR color space |
    | `cv2.COLOR_HSV2BGR` | Convert HSV image to BGR color space |
    | `cv2.COLOR_HLS2BGR` | Convert HLS image to BGR color space |
    | `cv2.COLOR_LAB2BGR` | Convert CIEL*a*b image to BGR color space |
    | `cv2.COLOR_LUV2BGR` | Convert CIEL*u*v image to BGR color space |
    | `cv2.COLOR_XYZ2BGR` | Convert XYZ image to BGR color space |
    | `cv2.COLOR_YCrCb2BGR` | Convert YCrCb image to BGR color space |
    | `cv2.COLOR_YUV2BGR` | Convert YUV image to BGR color space |


## 获取肤色范围
使用函数`cv2.inRange`可以获取肤色范围的掩膜图像，从而实现肤色检测。`cv2.inRange`函数的原型如下：
`cv2.inRange(src, lowerb, upperb[, dst])`
- src：输入图像
- lowerb：下界
- upperb：上界
- dst：输出图像
- 返回值：掩膜图像,即在范围内的像素值为255，不在范围内的像素值为0


```python
import cv2
import numpy as np
import matplotlib.pyplot as plt

violet = cv2.imread("autoricon.jpg")

hsv_image = cv2.cvtColor(violet, cv2.COLOR_BGR2HSV)

lower_skin = np.array([0, 48, 80], dtype=np.uint8)
upper_skin = np.array([20, 255, 255], dtype=np.uint8)


skin_mask = cv2.inRange(hsv_image, lower_skin, upper_skin)

skin_image = cv2.bitwise_and(violet, violet, mask=skin_mask)

plt.subplot(1, 3, 1)
plt.imshow(cv2.cvtColor(violet, cv2.COLOR_BGR2RGB))
plt.title("Original Image")
plt.axis("off")

plt.subplot(1, 3, 2)
plt.imshow(skin_mask, cmap="gray")
plt.title("Skin Mask")
plt.axis("off")

plt.subplot(1, 3, 3)
plt.imshow(cv2.cvtColor(skin_image, cv2.COLOR_BGR2RGB))
plt.title("Skin Image")
plt.axis("off")

plt.show()
```


    
![png](cvlearn_files/cvlearn_38_0.png)
    


## 滤波处理 
滤波是图像处理中常用的技术，用于去除图像中的噪声、平滑图像、增强图像细节等。图像滤波**Images Filtering**又称为对图像的平滑处理 **Smoothing Images**。

OpenCV提供了多种滤波方法，包括线性滤波、非线性滤波、自适应滤波等。

一般来说，图像平滑处理是指在一幅图像中若一个像素点与周围像素点的像素值差别较大，则该点的像素值将被替换为周围像素值的近似值。这样可以减少图像中的噪声，平滑图像，使图像更加清晰。  
- 离群点：与周围像素值差别较大的像素点
- 取近似值的方式有很多，主要讨论均值滤波、高斯滤波、中值滤波。
- 图像平滑处理通常伴随图像模糊处理 **Blurring Images**

### 均值滤波
在进行均值滤波时，首先要考虑需要对周围多少个像素点取平均值。通常情况下，会以当前像素点为中心，求行数和列数相等的一块区域内的所有像素点的像素值的平均值。以图中第 5 行第 4 列的像素点为中心，可以对其周围 3×3 区域内所有像素点的像素值求平均值，也可以对其周围 5×5 区域内所有像素点的像素值求平均值。我们对其周围 5×5 区域内的像素点的像素值求平均

![image.png](cvlearn_files/image.png)

对于图像的边界点，并不存在5x5的领域，可以只取图像内存在的周围邻域点的像素值均值。

![image-2.png](cvlearn_files/image-2.png)

根据上述运算，每一个像素点的滤波都可以视为与一个内部值均为$1/25$的5x5的矩阵相乘（并不是矩阵乘法，其实叫做卷积运算）得到均值滤波的计算结果。

![image-3.png](cvlearn_files/image-3.png)
![image-4.png](cvlearn_files/image-4.png)

在OpenCV中，右侧的矩阵称为卷积核，其一般形式为  
![image-5.png](cvlearn_files/image-5.png)  
其中，M和N分别表示卷积核的行数和列数，一般M和N是相等的，且为奇数，例如3x3、5x5、7x7等。

#### 函数语法
`dst=cv2.blur(src, ksize, anchor, borderType)`
- src：输入图像
- ksize：卷积核的大小，一般为奇数
- dst：输出图像
- anchor：锚点，默认为(-1,-1)，是特殊定义以表示卷积核的中心。
- borderType：边界填充类型，默认为`cv2.BORDER_DEFAULT`



```python
# 均值滤波示例
import cv2
import matplotlib.pyplot as plt
o = cv2.imread("violet.jpg")
r3=cv2.blur(o,(3,3))
r11=cv2.blur(o,(11,11))
plt.subplot(1,3,1)
plt.imshow(cv2.cvtColor(o,cv2.COLOR_BGR2RGB))
plt.title("Original")
plt.axis("off")
plt.subplot(1,3,2)
plt.imshow(cv2.cvtColor(r3,cv2.COLOR_BGR2RGB))
plt.title("3x3")
plt.axis("off")
plt.subplot(1,3,3)
plt.imshow(cv2.cvtColor(r11,cv2.COLOR_BGR2RGB))
plt.title("11x11")
plt.axis("off")
plt.show()


```


    
![png](cvlearn_files/cvlearn_40_0.png)
    


从图中可以看出，使用3x3的卷积核进行图像滤波处理失真不明显，而使用11x11的卷积核进行图像滤波处理失真较大。因此，卷积核的大小对图像滤波处理的效果有很大影响，一般情况下，**卷积核的大小越大，去噪效果越好，花费的计算时间越长，图像失真越严重**。在实际应用中，需要在去噪和失真效果之间取得平衡，选择合适的卷积核大小。

### 高斯滤波
高斯滤波是一种线性平滑滤波方法，它使用高斯函数作为卷积核，对图像进行平滑处理。高斯滤波的主要优点是可以有效去除高斯噪声，保留图像的边缘和细节信息。
在高斯滤波中，会将邻近中心像素点的权重值加大，远离中心像素点的权重值减小，在此基础上计算邻域内各像素值不同权重的和。  
![image.png](cvlearn_files/image.png)  
高斯卷积示例图  
![image-2.png](cvlearn_files/image-2.png)  
- 高斯滤波的卷积核的**宽度和高度**可以不同，但是它们必须都是奇数
- 每一种尺寸的卷积核都可以有不同形式的权重比  
![image-3.png](cvlearn_files/image-3.png)

#### 函数语法
`dst=cv2.GaussianBlur(src, ksize, sigmaX, sigmaY, borderType)`
- src：输入图像
- ksize：卷积核的大小，一般为奇数
- sigmaX：X方向的高斯核标准差
- sigmaY：Y方向的高斯核标准差，如果为0，则与sigmaX相同，如果sigmaX和sigmaY都为0，则根据ksize自动计算
  - sigmaX = 0.3*((ksize-1)*0.5-1)+0.8
  - sigmaY = 0.3*((ksize-1)*0.5-1)+0.8  
- borderType：边界填充类型，默认为`cv2.BORDER_DEFAULT`  
  
一般来说，卷积核大小固定时
- sigmaX和sigmaY越大，权重值分布约平缓，图像失真越严重，去噪效果越好，图像越模糊
- sigmaX和sigmaY越小，权重值分布约陡峭，图像失真越轻微，去噪效果越差，图像越清晰


```python
# 高斯滤波示例
import cv2
import matplotlib.pyplot as plt
o = cv2.imread("violet.jpg")
r0 = cv2.GaussianBlur(o,(7,7),0,0) 
r1 = cv2.GaussianBlur(o,(7,7),1,1)
r100 = cv2.GaussianBlur(o,(7,7),100,100)


plt.subplot(2,2,1)
plt.imshow(cv2.cvtColor(o,cv2.COLOR_BGR2RGB))
plt.title("Original")
plt.axis("off")
plt.subplot(2,2,2)
plt.imshow(cv2.cvtColor(r0,cv2.COLOR_BGR2RGB))
plt.title("0")
plt.axis("off")
plt.subplot(2,2,3)
plt.imshow(cv2.cvtColor(r1,cv2.COLOR_BGR2RGB))
plt.title("1")
plt.axis("off")
plt.subplot(2,2,4)
plt.imshow(cv2.cvtColor(r100,cv2.COLOR_BGR2RGB))
plt.title("100")
plt.axis("off")
plt.show()

```


    
![png](cvlearn_files/cvlearn_42_0.png)
    


### 中值滤波
中值滤波是一种非线性滤波方法，它使用邻域内像素值的中值来代替中心像素点的像素值。中值滤波的主要优点是可以有效去除椒盐噪声，保留图像的边缘和细节信息。  
>椒盐噪声是一种常见的图像噪声类型，它表现为图像中随机分布的黑白像素点。这些像素点通常是由于图像采集或传输过程中的干扰引起的，例如传感器故障、信号干扰等。椒盐噪声会导致图像中出现明显的亮点和暗点，降低图像的质量和清晰度。  
中值滤波会取当前像素点及其周围邻近像素点(通常取奇数个像素点，类似于董事会设置奇数个成员，以免出现平局，方便判断投票结果)的像素值，先将这些像素值排序，然后将位于中间位置的像素值作为当前像素点的像素值。    


| 97 | 95 | 94 |
|----|----|----|
| **93** | **78** | **90** |
| **66** | **91** | **101**|

 
将其邻域设置为 3 × 3 大小，对 3 × 3 邻域内像素点的像素值进行排序(升序降序均可)，按 升序排序后得到序列值为[66,78,90,91,93,94,95,97,101]。在该序列中，处于中心位置(也叫中心点或中值点)的值是“93”，用该值作为新像素值替换原来的像素值78，处理结果如图示。  


| 97 | 95 | 94 |
|----|----|----|
| **93** | **93** | **90** |
| **66** | **91** | **101**|

#### 函数语法
`dst=cv2.medianBlur(src, ksize)`
- kszie：卷积核的大小，必须为大于1的奇数，不同于均值滤波和高斯滤波为一个元祖，中值滤波的ksize为一个整数值，同时表示滤波的宽度和高度。


```python
# 中值滤波示例
import cv2
import matplotlib.pyplot as plt
o = cv2.imread("violet.jpg")
r3=cv2.medianBlur(o,3)
r11=cv2.medianBlur(o,11)
plt.subplot(1,3,1)
plt.imshow(cv2.cvtColor(o,cv2.COLOR_BGR2RGB))
plt.title("Original")
plt.axis("off")
plt.subplot(1,3,2)
plt.imshow(cv2.cvtColor(r3,cv2.COLOR_BGR2RGB))
plt.title("3x3")
plt.axis("off")
plt.subplot(1,3,3)
plt.imshow(cv2.cvtColor(r11,cv2.COLOR_BGR2RGB))
plt.title("11x11")
plt.axis("off")
plt.show()
```


    
![png](cvlearn_files/cvlearn_44_0.png)
    


## 形态学
形态学操作是图像处理中的一种基本操作，主要用于图像的预处理和后处理。形态学操作主要包括腐蚀、膨胀、开运算、闭运算、形态学梯度、顶帽和黑帽等。形态学操作可以用于图像的去噪、分割、轮廓提取、图像增强等。
### 腐蚀
腐蚀是一种形态学操作，用于缩小或消除图像中的白色区域。能够消除图像的边界点，使图像沿着边界向内收缩。腐蚀操作会将卷积核覆盖区域内的所有像素点的像素值设置为卷积核内像素点的最小值。腐蚀操作可以用于去除图像中的噪声、分离图像中的连通区域、检测图像中的边缘等。左图是原始图像，右图是对其腐蚀的处理结果。  
![image.png](cvlearn_files/image.png)

在腐蚀过程中，通常使用一个结构元来逐个像素点地扫描图像，当结构元的中心与图像的像素点重合时，将结构元的所有像素点与图像的像素点进行逐个比较
- 如果结构元的所有像素点全部处于前景对象中，则将该像素点的像素值设置为前景色（白色，像素值为1）
- 如果不完全处于或完全不处于前景对象中，设置为背景色（黑色，像素值为0）。  
![image-2.png](cvlearn_files/image-2.png)

#### 函数语法
`dst=cv2.erode(src, kernel, anchor, iterations, borderType, borderValue)`
- kernel：结构元，用于定义腐蚀操作的形状和大小,可以使用`cv2.getStructuringElement`函数创建结构元，也可以自定义结构元。
- anchor：锚点，默认为(-1,-1)，是特殊定义以表示卷积核的中心。
- iterations：腐蚀操作的次数，默认为1
- borderType：边界填充类型，默认为`cv2.BORDER_DEFAULT`
- borderValue：边界填充值，默认为0



```python
# 腐蚀示例
import cv2
import numpy as np
import matplotlib.pyplot as plt
o = cv2.imread("violet.jpg")
kernel = np.ones((5,5),np.uint8)
r1 = cv2.erode(o,kernel,iterations = 1)
r3 = cv2.erode(o,kernel,iterations = 3)
plt.subplot(1,3,1)
plt.imshow(cv2.cvtColor(o,cv2.COLOR_BGR2RGB))
plt.title("Original")
plt.axis("off")
plt.subplot(1,3,2)
plt.imshow(cv2.cvtColor(r,cv2.COLOR_BGR2RGB))
plt.title("Erosion 1 time")
plt.axis("off")
plt.subplot(1,3,3)
plt.imshow(cv2.cvtColor(r3,cv2.COLOR_BGR2RGB))
plt.title("Erosion 3 times")
plt.axis("off")
plt.show()
```


    
![png](cvlearn_files/cvlearn_46_0.png)
    


>！描边大师！

### 膨胀
膨胀是一种形态学操作，用于扩大或增强图像中的白色区域。能够消除图像的边界点，使图像沿着边界向外扩张。膨胀操作会将卷积核覆盖区域内的所有像素点的像素值设置为卷积核内像素点的最大值。膨胀操作可以用于填充图像中的空洞、连接图像中的断裂区域、检测图像中的边缘等。左图是原始图像，右图是对其膨胀的处理结果。  
![image.png](cvlearn_files/image.png)  
- 如果结构元中任意一点处于前景对象中，就将膨胀结果图像中对应像素点处理为前景色。
- 如果结构元完全处于背景对象外，就将膨胀结果图像中对应像素点处理为背景色。  
![image-2.png](cvlearn_files/image-2.png)

#### 函数语法
`dst=cv2.dilate(src, kernel, anchor, iterations, borderType, borderValue)`


```python
# 膨胀示例
import cv2
import numpy as np
import matplotlib.pyplot as plt
o = cv2.imread("violet.jpg")
kernel = np.ones((5,5),np.uint8)
r1 = cv2.dilate(o,kernel,iterations = 1)
r3 = cv2.dilate(o,kernel,iterations = 3)
plt.subplot(1,3,1)
plt.imshow(cv2.cvtColor(o,cv2.COLOR_BGR2RGB))
plt.title("Original")
plt.axis("off")
plt.subplot(1,3,2)
plt.imshow(cv2.cvtColor(r1,cv2.COLOR_BGR2RGB))
plt.title("Dilation 1 time")
plt.axis("off")
plt.subplot(1,3,3)
plt.imshow(cv2.cvtColor(r3,cv2.COLOR_BGR2RGB))
plt.title("Dilation 3 times")
plt.axis("off")
plt.show()
```


    
![png](cvlearn_files/cvlearn_48_0.png)
    



```python
#腐蚀和膨胀是一对相反的操作，腐蚀会使物体变小，膨胀会使物体变大
import cv2
import numpy as np
import matplotlib.pyplot as plt
o = cv2.imread("violet.jpg")
kernel = np.ones((5,5),np.uint8)
r1 = cv2.erode(o, kernel, iterations = 1)
d1 = cv2.dilate(o, kernel, iterations = 1)
rd = cv2.dilate(r1, kernel, iterations = 1)
plt.subplot(2,2,1)
plt.imshow(cv2.cvtColor(o,cv2.COLOR_BGR2RGB))
plt.title("Original")
plt.axis("off")
plt.subplot(2,2,2)
plt.imshow(cv2.cvtColor(r1,cv2.COLOR_BGR2RGB))
plt.title("Erosion 1 time")
plt.axis("off")
plt.subplot(2,2,3)
plt.imshow(cv2.cvtColor(d1,cv2.COLOR_BGR2RGB))
plt.title("Dilation 1 time")
plt.axis("off")
plt.subplot(2,2,4)
plt.imshow(cv2.cvtColor(rd,cv2.COLOR_BGR2RGB))
plt.title("Erosion 1 time + Dilation 1 time")
plt.axis("off")
plt.show()
```


    
![png](cvlearn_files/cvlearn_49_0.png)
    


### 通用形态学操作
腐蚀操作和膨胀操作是形态学操作中最基本的操作，它们可以通过不同的结构元和迭代次数实现不同的效果。除了腐蚀和膨胀操作外，还有一些常用的形态学操作，包括开运算、闭运算、形态学梯度、顶帽和黑帽等。这些操作可以通过腐蚀和膨胀操作的组合实现，用于图像的去噪、分割、轮廓提取、图像增强等。

#### 函数语法
`dst=cv2.morphologyEx(src, op, kernel, anchor, iterations, borderType, borderValue)`
- op：形态学操作类型，包括`cv2.MORPH_OPEN`（开运算）、`cv2.MORPH_CLOSE`（闭运算）、`cv2.MORPH_GRADIENT`（形态学梯度）、`cv2.MORPH_TOPHAT`（顶帽）、`cv2.MORPH_BLACKHAT`（黑帽）等  

| 操作类型 | 描述 |
|----------|------|
| `cv2.MORPH_OPEN` | 开运算，先腐蚀后膨胀，用于去除小物体 |
| `cv2.MORPH_CLOSE` | 闭运算，先膨胀后腐蚀，用于填充小洞 |
| `cv2.MORPH_GRADIENT` | 形态学梯度，膨胀图与腐蚀图之差，用于提取物体边缘 |
| `cv2.MORPH_TOPHAT` | 顶帽，原图与开运算之差，用于突出比邻近区域亮的区域 |
| `cv2.MORPH_BLACKHAT` | 黑帽，闭运算与原图之差，用于突出比邻近区域暗的区域 |


```python
#形态学操作示例
import cv2
import numpy as np
import matplotlib.pyplot as plt
o = cv2.imread("violet.jpg")
kernel = np.ones((5,5),np.uint8)
r1 = cv2.morphologyEx(o, cv2.MORPH_OPEN, kernel)
r2 = cv2.morphologyEx(o, cv2.MORPH_CLOSE, kernel)
r3 = cv2.morphologyEx(o, cv2.MORPH_GRADIENT, kernel)
r4 = cv2.morphologyEx(o, cv2.MORPH_TOPHAT, kernel)
r5 = cv2.morphologyEx(o, cv2.MORPH_BLACKHAT, kernel)
plt.subplot(3,2,1)
plt.imshow(cv2.cvtColor(o,cv2.COLOR_BGR2RGB))
plt.title("Original")
plt.axis("off")
plt.subplot(3,2,2)
plt.imshow(cv2.cvtColor(r1,cv2.COLOR_BGR2RGB))
plt.title("Opening")
plt.axis("off")
plt.subplot(3,2,3)
plt.imshow(cv2.cvtColor(r2,cv2.COLOR_BGR2RGB))
plt.title("Closing")
plt.axis("off")
plt.subplot(3,2,4)
plt.imshow(cv2.cvtColor(r3,cv2.COLOR_BGR2RGB))
plt.title("Gradient")
plt.axis("off")
plt.subplot(3,2,5)
plt.imshow(cv2.cvtColor(r4,cv2.COLOR_BGR2RGB))
plt.title("Top Hat")
plt.axis("off")
plt.subplot(3,2,6)
plt.imshow(cv2.cvtColor(r5,cv2.COLOR_BGR2RGB))
plt.title("Black Hat")
plt.axis("off")
plt.show()
```


    
![png](cvlearn_files/cvlearn_51_0.png)
    

