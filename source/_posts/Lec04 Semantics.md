---
title: Mathematical Logic [Lec04 Semantics]
date: 2024-05-13 00:47:04
tags:
cover : true
plugins: 
    - mathjax
---
CS 210: Mathematical Logic Notes

<!-- more -->

## Semantics 
### Truth Table
1. 取反  not $\lnot$
   ![image](img1.png)
2. 和  and $\land$  **两个命题都为真才为真**
   ![image](img2.png)
3. 或  or $\lor$  **两个命题存在一个为真就为真**
   ![image](img3.png)
4. 蕴含 if    logical implication $p \rightarrow q$:
   ![image](img4.png)
   **注意！只要q为1，p推q就是1，即使p是0**
   ![image](img5.png)
   
5. 当且仅当 iff(if and only if) $p \leftrightarrow q$ **两个命题真值相同时为真，不同为假**   
	![image](img6.png)
## Truth Valuation 真值赋值
在逻辑学中，真值赋值（Truth Valuation）是一个函数，它为逻辑公式中的命题变量分配真值，通常为真（True）或假（False）。真值赋值不仅适用于命题逻辑中的简单命题，也适用于更复杂的逻辑表达式，如那些包含逻辑运算符（如与（AND）、或（OR）、非（NOT）、蕴含（IMPLIES）和当且仅当（IFF））的表达式。
![image](img7.png)
![image](img8.png)
## Properties of a formula 
![image](img9.png)
可以通过Truth table 来判断一个formula 的属性
eg.![image](img10.png)
## Valuation Tree
![image](img11.png)
![image](img12.png)
## Logical Equivalence 
![image](img13.png)
![image](img14.png)
![image](img15.png)
### Substitution 代换
![image](img16.png)
把原表达式代换为等价的表达式