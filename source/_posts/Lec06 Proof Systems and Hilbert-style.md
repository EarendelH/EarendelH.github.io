---
title: Mathematical Logic [Lec06 Proof Systems and Hilbert-style]
date: 2024-05-13 00:47:06
tags:
cover : false
categories : Logic Math
plugins: 
    - mathjax
---
CS 210: Mathematical Logic Notes

<!-- more -->

## Proof Systems

![image](img1.png)
![image](img2.png)

### Types of Proof Systems

1. Hilbert-style system 希尔伯特风格系统（$\Sigma \vdash_{H}A$）：many axioms and only one rule.The deduction is linear.
2. Natural Deduction system自然演绎系统（$\Sigma \vdash_{ND}A$）：Few axioms(even none) and many rules The deductions are tree-like .
3. Resolution 归结系统（$\Sigma\vdash_{Res}A$）：used to prove contradictions

## Hilbert-style Proof System

![image](img3.png)
![image](img4.png)
分离规则：如果有前提
 1. A为真
 2. A可以推出B
 那么可以推出结论：B为真

### 推理链

![image](img5.png)

---

![image](img6.png)
![image](img7.png)
![image](img8.png)

### Derived rules in $\mathcal{H}$ 衍生规则

1. 反证法
 ![image](img9.png)
2. 演绎法
 ![image](img10.png)
 当且仅当在$\Gamma$成立的的系统下A可以推理出B时有“$\Gamma \cup \{A\}$“成立的系统下可以推理出B。
 使用演绎法可以推理出下面这个结论![image](img.png)
3. Transitivity rule 传递率
 ![image](img11.png)
4. Exchange of antecedent rule 交换律
 ![image](img12.png)
5. Double negation rule 二次取反规则
 ![image](img13.png)
 ![image](img14.png)
6. 反证法2
 ![image](img15.png)

$$
\vdash (\lnot A \rightarrow A)\rightarrow A
$$
