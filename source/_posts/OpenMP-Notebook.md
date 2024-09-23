---
title: OpenMP Notebook
date: 2024-03-13 00:47:45
tags:
cover : false
categories : HPC
---
OpenMP 赵学长培训笔记

<!-- more -->

# 2024年三月OpenMP培训笔记

### 一、最简单的一个程序

```c
#include <stdio.h>
int main()
{
 #pragma omp parallel \\通知以下代码是OpenMp的指令和结构化块，也称为构造
  { 
 printf("Hello world \n");
  }
 return 0;
}
```

进行编译(linux)：

```
$ gcc -fopenmp a.c
$ ./a.out
or
$ gcc -fopenmp a.c -o a \\编译a.c程序 
$ ./a
```

​`-fopenmp`​ 指令告诉编译器用OpenMp创造一个多线程程序

```s
$export OMP_NUM_THREADS=4 \\设置线程数为4
$./c
```

修改线程数后无需再次编译，直接运行即可

运行结果：

​​![image](https://github.com/EarendelH/io_data/blob/main/img/image-20240310214101-5vmqznv.png?raw=true)​​

‍

### 二、OpenMP API与两个重要函数

使用OpenMP相关函数时添加头文件：

```c
#include<omp.h>
```

获取线程数的接口

```
omp_get_thread_num() \\获得当前线程的线程数id
omp_get_num_threads() \\获得总线程数
```

Example：

```c
#include <stdio.h>
#include <omp.h>

int main() {
  #pragma omp parallel 
  {
    int tid = omp_get_thread_num();
    int ths = omp_get_num_threads();
    printf("tid=%d  ths=%d \n",tid,ths);
  }
  return 0;
}
```

​![image](https://github.com/EarendelH/io_data/blob/main/img/image-20240310213455-o2ogank.png?raw=true)​

由此图同时可知，线程的运行是无序并行的

### 三、OpenMP 基础语法

#### 3.1 并行处理循环语句

```c
#prama omp parrallel for
for(int i=1=0;i<n;i++){
 ...
}
```

将n次循环分给可用的线程进行处理

```c
#include <stdio.h>
#include<omp.h>
int main()
{
  int ths = omp_get_num_threads();
  #pragma omp parallel for
  for(int i=0;i<16;i++)
  {
    int tid=omp_get_thread_num();
    printf("Thread %d of  threads %d is handling %dth loop\n",tid,ths,i);
  }
return 0;
}
```

​![image](https://github.com/EarendelH/io_data/blob/main/img/image-20240310220127-g8hjg92.png?raw=true)​

注意，此处`#pragma omp parallel for`​外层无需再套一层`pragma omp parallel`​ 否则只能利用一个线程。

```c
#include <stdio.h>
#include<omp.h>
int main()
{
  #pragma omp parallel 
 {
  int ths = omp_get_num_threads();
  #pragma omp parallel for
  for(int i=0;i<16;i++)
  {
    int tid=omp_get_thread_num();
    printf("Thread %d of  threads %d is handling %dth loop\n",tid,ths,i);
  }

 }
return 0;
}
```

​![image](https://github.com/EarendelH/io_data/blob/main/img/image-20240310221552-r85jltz.png?raw=true)​

原因：`parrallel`​为构造一个并行域 ，内层的`#pragma omp parallel for`​相当于利用一个线程再构造了一个并行域运行，  
在此处线程数为4时实际会运行 `4x16`​ 次`printf()`​

‍
