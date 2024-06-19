---
title: Mathematical Logic
date: 2024-05-13 00:47:45
tags:
---
## Semantics 
### Truth Table
1. 取反  not $\lnot$
   ![[assets/Pasted image 20240504170154.png]]
2. 和  and $\land$  **两个命题都为真才为真**
   ![[assets/Pasted image 20240504170228.png]]
3. 或  or $\lor$  **两个命题存在一个为真就为真**
   ![[assets/Pasted image 20240504170312.png]]
4. 蕴含 if    logical implication $p \rightarrow q$:
   ![[assets/Pasted image 20240504170435.png]]
   **注意！只要q为1，p推q就是1，即使p是0**
   ![[assets/Pasted image 20240504170636.png]]
   
5. 当且仅当 iff(if and only if) $p \leftrightarrow q$ **两个命题真值相同时为真，不同为假**   
	![[assets/Pasted image 20240504171451.png]]
## Truth Valuation 真值赋值
在逻辑学中，真值赋值（Truth Valuation）是一个函数，它为逻辑公式中的命题变量分配真值，通常为真（True）或假（False）。真值赋值不仅适用于命题逻辑中的简单命题，也适用于更复杂的逻辑表达式，如那些包含逻辑运算符（如与（AND）、或（OR）、非（NOT）、蕴含（IMPLIES）和当且仅当（IFF））的表达式。
![[assets/Pasted image 20240504171552.png]]
![[assets/Pasted image 20240504171602.png]]
## Properties of a formula 
![[assets/Pasted image 20240504171928.png]]
可以通过Truth table 来判断一个formula 的属性
eg.![[assets/Pasted image 20240504172244.png]]
## Valuation Tree
![[assets/Pasted image 20240504172400.png]]
![[assets/Pasted image 20240504172408.png]]
## Logical Equivalence 
![[assets/Pasted image 20240504174804.png]]
![[assets/Pasted image 20240504174911.png]]
![[assets/Pasted image 20240504174923.png]]
### Substitution 代换
![[assets/Pasted image 20240504175204.png]]
把原表达式代换为等价的表达式