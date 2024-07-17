---
title: Mathematical Logic [Lec03 Propositional Logic]
date: 2024-05-13 00:47:03
tags:
cover : true
plugins: 
    - mathjax
---
CS 210: Mathematical Logic Notes

<!-- more -->

#words argument::论证
#words rigorous::严格的
## symbols
![](img1.png)
## Propositional logic(PL)命题语言
![](img2.png)
### PL has tree types of symbols
![](img3.png)
### Expressions 表达式
1. 长度：number of occurrences of symbols 
2. 空表达式：长度为0的表达式，denoted by $\lambda$ 
3. 如果长度和符号的顺序相同，那么两个命题相等
![](img4.png)
### Well-formed formulas （WFF）合式公式（正确的表达式）
判断规则：
	![](img5.png)
![](img6.png)
> 1.非空  2.括号匹配

### The Structure of Formula
1. **segment** 
   ![](img7.png)
	- **proper segment真片段** : non-empty and $v \ne u$ 
2. **initial segment / prefix(前缀)和terminal segment / suffix(后缀)**
	![](img8.png)
	- **proper prefix真前缀 and proper suffix真后缀**
  ![](img9.png)
1. 对于WFF来说
   ![](img10.png)
### Unique Readability Theorem（唯一可读性定理）
是一阶谓词逻辑中的一个定理，它表明每个合式公式（well-formed formula，简称为 wff）都有一个唯一的解析方式，即不论如何组合公式中的符号，最终都只能有一种方式来解释该公式的结构。

### Parse Tree 解析树、语法树
![](img11.png)
**对于（不简化的）解析树来说：**
1. **根结点是整个表达式**
2. **每一个Nodes都是一个WFF** 
3. **所有的叶子节点（链的最后一个节点）都是一个原子命题**
![](img12.png)
对于简化Parse Tree：
1. 所有的Node都是一个逻辑运算符
2. 所有的leaves都是原子命题
3. 取反符号$\lnot$ 只有一子节点

![](img13.png)
>任何一个WFF表达式都有且仅有一个parse tree 

## subformula 子公式
![](img14.png)

### Precedence 优先级
对于逻辑运算符，他们的优先级从高到低为
$$\lnot\ ,\ \land\ ,\ \lor\ ,\ \rightarrow\ ,\ \leftrightarrow$$
