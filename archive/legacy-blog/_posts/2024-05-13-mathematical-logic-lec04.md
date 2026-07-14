---
title: "Mathematical Logic [Lec04 Semantics]"
date: 2024-05-13 00:47:04
permalink: /blog/2024/05/13/mathematical-logic-lec04/
categories:
  - "Logic Math"
tags:
---
CS 210: Mathematical Logic Notes

<!-- more -->

## Semantics

### Truth Table

1. 取反  not $\lnot$
   ![image](/images/blog/mathematical-logic-lec04/img1.png)
2. 和  and $\land$  **两个命题都为真才为真**
   ![image](/images/blog/mathematical-logic-lec04/img2.png)
3. 或  or $\lor$  **两个命题存在一个为真就为真**
   ![image](/images/blog/mathematical-logic-lec04/img3.png)
4. 蕴含 if    logical implication $p \rightarrow q$:
   ![image](/images/blog/mathematical-logic-lec04/img4.png)
   **注意！只要q为1，p推q就是1，即使p是0**
   ![image](/images/blog/mathematical-logic-lec04/img5.png)

5. 当且仅当 iff(if and only if) $p \leftrightarrow q$ **两个命题真值相同时为真，不同为假**
 ![image](/images/blog/mathematical-logic-lec04/img6.png)

## Truth Valuation 真值赋值

在逻辑学中，真值赋值（Truth Valuation）是一个函数，它为逻辑公式中的命题变量分配真值，通常为真（True）或假（False）。真值赋值不仅适用于命题逻辑中的简单命题，也适用于更复杂的逻辑表达式，如那些包含逻辑运算符（如与（AND）、或（OR）、非（NOT）、蕴含（IMPLIES）和当且仅当（IFF））的表达式。
![image](/images/blog/mathematical-logic-lec04/img7.png)
![image](/images/blog/mathematical-logic-lec04/img8.png)

## Properties of a formula

![image](/images/blog/mathematical-logic-lec04/img9.png)
可以通过Truth table 来判断一个formula 的属性
eg.![image](/images/blog/mathematical-logic-lec04/img10.png)

## Valuation Tree

![image](/images/blog/mathematical-logic-lec04/img11.png)
![image](/images/blog/mathematical-logic-lec04/img12.png)

## Logical Equivalence

![image](/images/blog/mathematical-logic-lec04/img13.png)
![image](/images/blog/mathematical-logic-lec04/img14.png)
![image](/images/blog/mathematical-logic-lec04/img15.png)

### Substitution 代换

![image](/images/blog/mathematical-logic-lec04/Pasted%20image%2020240504175204.png)
把原表达式代换为等价的表达式
