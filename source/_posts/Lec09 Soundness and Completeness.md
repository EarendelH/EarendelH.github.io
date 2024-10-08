---
title: Mathematical Logic [Lec09 Soundness and Completeness]
date: 2024-05-13 00:47:09
tags:
cover : false
categories : Logic Math
plugins: 
    - mathjax
---
CS 210: Mathematical Logic Notes

<!-- more -->

对于一个证明系统，最重要的是**可靠性Soundness和完备性Completeness**
![image](img1.png)
![image](img2.png)

### 可靠性（Soundness）

一个证明系统是可靠的，如果它从不证明假的命题。换句话说，如果该系统证明了某个命题，那么这个命题在所有可能的解释下都是真的。可靠性保证了证明系统的结论是有效的，即所有通过该系统得出的证明都是正确的。

形式上，对于一个证明系统，如果存在一个证明序列从一组前提 $\Gamma$ 推导出结论 ϕ（表示为$\Gamma \vdash \phi$），那么$\Gamma$的语义蕴含 ϕ（表示为$\Gamma \models \phi$）也必须成立。

### 完备性（Completeness）

一个证明系统是完备的，如果对于任何为真的命题，都存在一个证明。这意味着如果一个命题是可满足的（即存在某种解释或模型使得它为真），那么这个命题可以通过该证明系统从某个前提集合推导出来。

形式上，如果一个命题 ϕ 是从一组前提 $\Gamma$ 语义上可得的（表示为 $\Gamma \models \phi$），那么存在一个证明，使得 $\Gamma \vdash \phi$。
