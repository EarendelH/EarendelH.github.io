---
title: Mathematical Logic [Lec05 Entailment]
date: 2024-05-13 00:47:05
tags:
cover : false
categories : Logic Math
plugins: 
    - mathjax
---
CS 210: Mathematical Logic Notes

<!-- more -->

## Semantic entailment

Semantic entailment（语义蕴含）是逻辑学和语言学中的一个重要概念，它描述了一种情况，即在一个特定的语境或模型中，一个陈述（或一组陈述）的真值必然导致另一个陈述的真值。在逻辑学中，这通常与模型理论中的满足和有效性相关联。

### Definition

![image](img1.png)
![image](img2.png)

### How to prove $\Sigma \models A$

![image](img3.png)

### How to prove $\Sigma \not\models A$

![image](img4.png)

### Properties

![image](img5.png)

## n-ary logical connectives n元连接词

与多元函数相似，n元连接词可以同时处理n个命题
**个数：** 对于n元连接词，共有$2^{2^{n}}$ 个真值表 （也就是$2^{2^{n}}$ 种连接词）
 解释：
 1. 首先，n个变量每个都有真和假两种赋值，所以就有$2^{n}$
 2. 其次，每一种组合，结果又有真和假两种，所以每次变动都会是一个新的真值表，所以共有$2^{2^{n}}$个真值表

### 二元连接词的补充

![image](img6.png)
![image](img7.png)

### Redundancy冗余 和Adequate Set 完备的集合

因为连接词可以由等价关系转换，那么对于一个连接词集合来说，可以通过集合内其他的符号组合替代的符号，就称为**冗余**，如果所有的逻辑关系可以通过一个集合内的符号来表示，则称这个连接词集合是**Adequate 完备的**
eg.冗余：
![image](img8.png)
完备：
![image](img9.png)

>结论：
>![image](img10.png)
