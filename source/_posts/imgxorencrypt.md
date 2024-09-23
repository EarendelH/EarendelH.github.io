---
title : 计算机视觉自学笔记及实践【图像加密与解密】
time : 2024-07-01 18:42:06
tags:
     - Opencv
     - 计算机视觉
cover : false
categories : Computer Vision
---
自学计算机视觉和深度学习的笔记，欢迎大佬们指正
<!-- more -->
## 图像加密（Encryption）与解密（Decryption）xor 异或实现

通过按位异或运算，可以实现图像的加密与解密。

![image.png](imgxorencrypt_files/image.png)

## 加密与解密原理

|a|b|c(a xor b)|c xor b(=a)|c xor a(=b)|
|-|-|-|-|-|
|0|0|0|0|0|
|0|1|1|0|1|
|1|0|1|1|0|
|1|1|0|1|1|

- a是明文，原始数据
- b是密钥
- c是密文，加密后的数据

## 图像整体加密与解密步骤

### 加密

1. 二进制转换，将原始图像O和密钥图像W转换为二进制图像
2. 加密，将原始图像O和密钥图像W进行异或运算，得到加密图像E
3. 二进制转换，将加密图像E转换为十进制图像

### 解密

1. 二进制转换，将加密图像E和密钥图像W转换为二进制图像
2. 解密，将加密图像E和密钥图像W进行异或运算，得到解密图像D
3. 二进制转换，将解密图像D转换为十进制图像

```python
# 异或加密解密程序示例
import cv2
import numpy as np
import matplotlib.pyplot as plt
violet=cv2.imread('violet.jpg',0)
r,c= violet.shape
key=np.random.randint(0,256,(r,c),dtype=np.uint8)
#注意，必须指定数据类型为uint8。这里随机生成了一个与violet相同大小的矩阵作为密钥
encrypt=cv2.bitwise_xor(violet,key)
decrypt=cv2.bitwise_xor(encrypt,key)
plt.subplot(1,3,1)
plt.imshow(violet,cmap='gray')
plt.title('original')
plt.axis('off')
plt.subplot(1,3,2)
plt.imshow(encrypt,cmap='gray')
plt.title('encrypt')
plt.axis('off')
plt.subplot(1,3,3)
plt.imshow(decrypt,cmap='gray')
plt.title('decrypt')
plt.axis('off')
plt.show()

```

![png](imgxorencrypt_files/imgxorencrypt_1_0.png)

```python
# 图像加密解密程序示例2
import cv2
import numpy as np
import matplotlib.pyplot as plt
violet=cv2.imread('violet.jpg',0)
hack=cv2.imread('hack.jpg',0)
r,c= violet.shape
hack_key=cv2.resize(hack,(c,r))
encrypt=cv2.bitwise_xor(violet,hack_key)
decrypt=cv2.bitwise_xor(encrypt,hack_key)
plt.subplot(1,4,1)
plt.imshow(violet,cmap='gray')
plt.title('original')
plt.axis('off')
plt.subplot(1,4,2)
plt.imshow(hack_key,cmap='gray')
plt.title('hack_key')
plt.axis('off')
plt.subplot(1,4,3)
plt.imshow(encrypt,cmap='gray')
plt.title('encrypt')
plt.axis('off')
plt.subplot(1,4,4)
plt.imshow(decrypt,cmap='gray')
plt.title('decrypt')
plt.axis('off')
plt.show()
```

![png](imgxorencrypt_files/imgxorencrypt_2_0.png)

```python
# 图像加密解密程序示例3
import cv2
import numpy as np
import matplotlib.pyplot as plt
violet=cv2.imread('violet.jpg',0)
ying=cv2.imread('ying.png',0)
r,c= violet.shape
ying_key=cv2.resize(ying,(c,r))
encrypt=cv2.bitwise_xor(violet,ying_key)
decrypt=cv2.bitwise_xor(encrypt,ying_key)
plt.subplot(1,4,1)
plt.imshow(violet,cmap='gray')
plt.title('original')
plt.axis('off')
plt.subplot(1,4,2)
plt.imshow(ying_key,cmap='gray')
plt.title('ying_key')
plt.axis('off')
plt.subplot(1,4,3)
plt.imshow(encrypt,cmap='gray')
plt.title('encrypt')
plt.axis('off')
plt.subplot(1,4,4)
plt.imshow(decrypt,cmap='gray')
plt.title('decrypt')
plt.axis('off')
plt.show()
```

![png](imgxorencrypt_files/imgxorencrypt_3_0.png)

> 由此可见，选择适当的加密图像是非常重要的

## 脸部打码与解码

### 打码（掩膜方式实现）

1. 按位异或运算，原始图像violet和密钥图像key进行异或运算，得到加密图像violetXorKey
2. 按位与运算，图像violetXorKey与掩膜图像mask进行与运算，得到脸部打码图像encryptFace
3. 按位与运算，原始图像violet与掩膜图像l-mask（与mask相反的掩膜图像）进行与运算，得到无脸部的图像noface
4. 加法运算，无脸部的图像noface与脸部打码图像encryptFace进行加法运算，得到最终打码图像encryptViolet

![image.png](imgxorencrypt_files/image.png)

```python
# 脸部打码
import cv2
import numpy as np
import matplotlib.pyplot as plt
violet=cv2.imread('violet.jpg')
h,w,c= violet.shape
key=np.random.randint(0,256,(h,w,c),dtype=np.uint8)
violetXorKey=cv2.bitwise_xor(violet,key)
mask=np.zeros((h,w,c),dtype=np.uint8)
mask[200:500,250:550]=1
encryptface=cv2.bitwise_and(violetXorKey,mask*255)
noface=cv2.bitwise_and(violet,(1-mask)*255)
encryptViolet=noface+encryptface
# ===============显示结果===========================
plt.subplot(3,3,1)
plt.imshow(cv2.cvtColor(violet,cv2.COLOR_BGR2RGB))
plt.title('original')
plt.axis('off')
plt.subplot(3,3,2)
plt.imshow(cv2.cvtColor(key,cv2.COLOR_BGR2RGB))
plt.title('key')
plt.axis('off')
plt.subplot(3,3,3)
plt.imshow(cv2.cvtColor(mask,cv2.COLOR_BGR2RGB))
plt.title('mask')
plt.axis('off')
plt.subplot(3,3,4)
plt.imshow(cv2.cvtColor(violetXorKey,cv2.COLOR_BGR2RGB))
plt.title('violetXorKey')
plt.axis('off')
plt.subplot(3,3,5)
plt.imshow(cv2.cvtColor(encryptface,cv2.COLOR_BGR2RGB))
plt.title('encryptface')
plt.axis('off')
plt.subplot(3,3,7)
plt.imshow(cv2.cvtColor(noface,cv2.COLOR_BGR2RGB))
plt.title('noface')
plt.axis('off')
plt.subplot(3,3,8)
plt.imshow(cv2.cvtColor(encryptViolet,cv2.COLOR_BGR2RGB))
plt.title('encryptViolet')
plt.axis('off')
plt.show()

```

![png](imgxorencrypt_files/imgxorencrypt_6_0.png)

### 解码（掩膜方式实现）

1. 按位异或运算，脸部打码图像encryptViolet和密钥图像key进行异或运算，得到脸部为解码，其余区域为乱码的图像extractOriginal
2. 按位与运算，脸部打码图像encryptViolet与掩膜图像mask进行与运算，得到脸部打码，其余位置为0的图像extractFace
3. 按位与运算，原始图像violet与掩膜图像l-mask（与mask相反的掩膜图像）进行与运算，得到无脸部的图像noface
4. 加法运算，无脸部的图像noface与脸部打码图像extractFace进行加法运算，得到最终解码图像extractViolet

![image.png](imgxorencrypt_files/image.png)

```python
# 脸部解码
import cv2
import numpy as np
import matplotlib.pyplot as plt
# ===============打码过程===========================
violet=cv2.imread('violet.jpg')
h,w,c= violet.shape
key=np.random.randint(0,256,(h,w,c),dtype=np.uint8)
violetXorKey=cv2.bitwise_xor(violet,key)
mask=np.zeros((h,w,c),dtype=np.uint8)
mask[200:500,250:550]=1
encryptface=cv2.bitwise_and(violetXorKey,mask*255)
noface=cv2.bitwise_and(violet,(1-mask)*255)
encryptViolet=noface+encryptface
# ===============解码过程===========================
extractOringinal=cv2.bitwise_xor(encryptViolet,key)
extractface=cv2.bitwise_and(extractOringinal,mask*255)
extractViolet=noface+extractface
# ===============显示结果===========================
plt.subplot(1,3,1)
plt.imshow(cv2.cvtColor(violet,cv2.COLOR_BGR2RGB))
plt.title('original')
plt.axis('off')
plt.subplot(1,3,2)
plt.imshow(cv2.cvtColor(encryptViolet,cv2.COLOR_BGR2RGB))
plt.title('encryptViolet')
plt.axis('off')
plt.subplot(1,3,3)
plt.imshow(cv2.cvtColor(extractViolet,cv2.COLOR_BGR2RGB))
plt.title('extractViolet')
plt.axis('off')
plt.show()
```

![png](imgxorencrypt_files/imgxorencrypt_8_0.png)

### 打码（ROI方式实现）

ROI指感兴趣区域，roi指具体的一幅图像，表现为矩形框，roi的大小和位置可以通过矩形框的左上角和右下角坐标来确定。

1. 按位异或运算，原始图像violet和密钥图像key进行异或运算，得到加密图像violetXorKey
2. 获取ROI，获取加密脸所在区域。在violetXorKey中根据roi将已打码脸部区域提取出来，得到脸部打码图像secretFace
3. 划定ROI，在原始图像violet中划定人脸区域。注意，划定一块区域并不会使原始图像有任何变化
4. ROI替换，将secretFace替换到violet的roi区域，得到最终打码图像encryptViolet

![image.png](imgxorencrypt_files/image.png)

```python
# 脸部打码ROI
import cv2
import numpy as np
import matplotlib.pyplot as plt
violet=cv2.imread('violet.jpg')
plt.subplot(2,2,1)
plt.imshow(cv2.cvtColor(violet,cv2.COLOR_BGR2RGB))
plt.title('original')
plt.axis('off')
h,w,c= violet.shape
key=np.random.randint(0,256,(h,w,c),dtype=np.uint8)
violetXorKey=cv2.bitwise_xor(violet,key)
roi=violet[200:500,250:550]  ##roi区域，会随着violet的变化而变化，解释见下面
plt.subplot(2,2,3)
plt.imshow(cv2.cvtColor(roi,cv2.COLOR_BGR2RGB))
plt.title('roi')
plt.axis('off')
secretFace=violetXorKey[200:500,250:550]
violet[200:500,250:550]=secretFace
enface=violet
# ===============显示结果===========================
plt.subplot(2,2,2)
plt.imshow(cv2.cvtColor(violetXorKey,cv2.COLOR_BGR2RGB))
plt.title('violetXorKey')
plt.axis('off')

plt.subplot(2,2,4)
plt.imshow(cv2.cvtColor(enface,cv2.COLOR_BGR2RGB))
plt.title('enface')
plt.axis('off')
plt.show()
```

![png](imgxorencrypt_files/imgxorencrypt_10_0.png)

在 Python 的 OpenCV 或 NumPy 库中，当使用切片操作（如`roi = violet[200:500, 250:550]`）来选择图像的一部分时，得到的 roi 实际上是原始 violet 数组的一个视图，而不是一个副本。这意味着，roi 和 violet 共享相同的数据缓冲区。因此，如果修改 violet 中的任何值，那么 roi 中相应的值也会发生变化，反之亦然。

这种行为设计是为了提高数据处理的效率，避免不必要的数据复制。如果你想要对 roi 进行操作，同时不影响原始的 violet 数组，应该创建 roi 的一个副本，可以使用 .copy() 方法：  
`roi = violet[200:500, 250:550].copy()`

这样，roi 就是一个独立于 violet 的新数组，对 roi 的任何修改都不会影响到 violet。

### 解码（ROI方式实现）

1. 按位异或运算，脸部打码图像enface和密钥图像key进行异或运算，得到脸部为解码，其余区域为乱码的图像extractOriginal
2. 获取ROI，获取解码脸所在区域。在extractOriginal中根据roi将已解码脸部区域提取出来，得到脸部图像extractFace
3. ROI替换，将extractFace替换到enface的roi区域，得到最终解码图像extractViolet

![image.png](imgxorencrypt_files/image.png)

```python
# 脸部解码ROI
import cv2
import numpy as np
import matplotlib.pyplot as plt
violet=cv2.imread('violet.jpg')
plt.subplot(2,2,1)
plt.imshow(cv2.cvtColor(violet,cv2.COLOR_BGR2RGB))
plt.title('original')
plt.axis('off')
# ===============打码过程===========================
h,w,c= violet.shape
key=np.random.randint(0,256,(h,w,c),dtype=np.uint8)
violetXorKey=cv2.bitwise_xor(violet,key)
roi=violet[200:500,250:550] 
secretFace=violetXorKey[200:500,250:550]
violet[200:500,250:550]=secretFace
enface=violet
plt.subplot(2,2,2)
plt.imshow(cv2.cvtColor(enface,cv2.COLOR_BGR2RGB))
plt.title('enface')
plt.axis('off')
plt.subplot(2,2,3)
plt.imshow(cv2.cvtColor(roi,cv2.COLOR_BGR2RGB))
plt.title('roi')
plt.axis('off')

# ===============解码过程===========================
extractOringinal=cv2.bitwise_xor(enface,key)
extractface=extractOringinal[200:500,250:550]
enface[200:500,250:550]=extractface
extractViolet=enface
plt.subplot(2,2,4)
plt.imshow(cv2.cvtColor(extractViolet,cv2.COLOR_BGR2RGB))
plt.title('extractViolet')
plt.axis('off')
plt.show()
```

![png](imgxorencrypt_files/imgxorencrypt_13_0.png)
