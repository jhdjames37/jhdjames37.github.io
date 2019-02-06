---
title: Stirling Number
date: 2018-04-13 22:05:18
categories:
- oi
- algorithm
tags:
- math
---

最近在 CF 上出现了一道斯特林数 (Stirling Number) 的题（[CF960G](http://codeforces.com/contest/960/problem/G)， [HDU 上](http://acm.hdu.edu.cn/showproblem.php?pid=4372) 有解法相同的一道题）,（在 ZJOI Day1 讲课的时候也提到了）。

所以先来总结一波公式。

<!--- more --->

## 文中所用记号

组合数 $\binom{n}{m}$ 不用讲了吧。

定义 $x$ 的 $n$ 阶下降幂 $x ^ {\underline{n}} = \prod_{i = 0}^{n - 1} (x - i)$，当 $x$ 为正整数时就等于 $A_{x} ^ {n}$，A 就是排列数。
$x$ 的 $n$ 阶上升幂 $x ^ {\overline{n}} = \prod_{i = 0} ^ {n - 1} (x + i)$。

定义 $[x ^ i]f(x)$ 为多项式 $f(x)$ 中 $x ^ i$ 项前的系数。

则易证 $[x ^ i]x ^ {\underline{n}} = (-1) ^ {n - i} [x ^ i]x ^ {\overline{n}}$

## 第一类 Stirling 数

### 定义
定义第一类 Stirling 数 $\left[ {n \atop m} \right]$ 或 $s(n, m)$ ($0 \le m \le n$)：
$$
\left[ {n \atop m} \right] = s(n, m) = \begin{cases}
\left[ {n - 1 \atop m - 1} \right] + \left[ {n - 1 \atop m} \right] \times (n - 1), & m < n \\
1, & m = n \\
0, & m = 0, n \ne 0
\end{cases} $$

组合意义：将 $n$ 个点组成 $m$ 个有向环的方案数（考虑第一个点独立成环，或插入到原有环的某个地方）。

### 一些性质
$$
\left[ {n \atop 0} \right] = 0, \\
\left[ {n \atop 1} \right] = (n - 1)!, \\
\sum_{i = 1}^{n} \left[ {n \atop i} \right] = n!
$$

最后一项可以由其组合意义得到。

将递推式后面一项展开，可以得到
$$\left[  {n \atop m} \right] 
= \sum_{i} \left[ {n - i \atop m - 1} \right] \binom{n - 1}{i - 1} (i - 1)! \\
= \sum_{i} \left[ {n - i \atop m - 1} \right] \frac {(n - 1)!} {(n - i)!} \\
= \sum_{i} \left[ {n - i \atop m - 1} \right] (n - 1)^{\underline{i - 1}}
$$

也说明了其组合意义。

### 计算

根据递推式计算是 $O(n ^ 2)$ 的 , 考虑如何优化。

观察 $x ^ {\overline{n}}$ 的各项系数：

首先可以发现 $x ^ \overline{n} = (x + n - 1) \times x ^ {\overline{n - 1}} = x \times x ^ {\overline{n - 1}} + (n - 1) \times x ^ {\overline{n - 1}} (n \ge 1)$.
则 $
[x ^ i]x ^ {\overline{n}}
=[x ^ {i - 1}]x ^ {\overline{n - 1}} + (n - 1) [x ^ i]x ^ {\overline{n - 1}}
$
显然有 $[x ^ 0]x ^ {\overline{n}} = 0, [x ^ n]x ^ {\overline{n}} = 1$

观察发现，它与第一类 Stirling 数的定义相同。即 $[x ^ i]x ^ {\overline{n}} = \left[ {n \atop i} \right]$.

而上升幂可以用两两合并 FFT 在 $O(n \log ^ 2 n)$ 内计算，那么我们就得到了 $O(n \log ^ 2 n)$ 的解法。

然而这玩意还能继续优化（虽然从常数意义来说不一定优）：

首先假设 $n$ 为偶数（如果是奇数最后手动乘一项）。

假设我们已经知道了 $x ^ {\overline{\frac{n}{2}}}$ 的各项系数，记 $f_i = [x ^ i]x ^ {\overline{\frac{n}{2}}}$。

则 $
x ^ {\overline{n}} = x ^ {\overline{\frac{n}{2}}} \times (x + \frac{n}{2}) ^ {\overline{\frac{n}{2}}}
$

所以我们只需要知道 $(x + \frac{n}{2}) ^ {\overline{\frac{n}{2}}}$ 即可。

令 $t = x + \frac{n}{2}$, 则 $
(x + \frac{n}{2}) ^ {\overline{\frac{n}{2}}} = t ^ {\overline{\frac{n}{2}}}
$

由二项式定理得 $t ^ i = (x + \frac{n}{2}) ^ i = 
\sum_{j = 0} ^ {i} \binom{i}{j} x ^ j \left( \frac{n}{2} \right) ^ {i - j}$

则
$$[x^i] (x + \frac{n}{2}) ^ {\overline{\frac{n}{2}}}
= [x^i] t ^ {\overline{\frac{n}{2}}} \\
= \sum_{j = i} ^ {\frac{n}{2}} [t^j]{t ^ {\overline{\frac{n}{2}}}} \times [x^i]t^j \\
= \sum_{j = i} ^ {\frac{n}{2}} f_j \binom{j}{i} \left( \frac{n}{2} \right) ^ {j - i}
$$
这又是一个卷积式，继续 FFT。总复杂度 $T(n) = T(\frac{n}{2}) + O(n \log n) = O(n \log n)$

## 第二类 Stirling 数

### 定义

定义第二类 Stirling 数 $\{ {n \atop m} \}$ 或 $S(n, m)$ ($0 \le m \le n$): 

$$
\left\{ {n \atop m} \right\} = \begin{cases}
\left\{ {n - 1 \atop m - 1} \right\} + m\left\{ {n - 1 \atop m} \right\}, & n < m\\
1, &n = m \\
0, &m = 0, n \ne 0
\end{cases}
$$

组合意义：将 n 个球分成 m 组的方案数（球有标号，分组没有标号，盒子非空）。（同样考虑第一个球的分组状况）

### 一些性质
$$
\left\{ {n \atop 0} \right\} = 0 \\
\left\{ {n \atop 1} \right\} = \left\{ {n \atop n} \right\} = 1
$$

根据其组合意义，还可以得到其它一些组合问题的解（可以参考《离散数学》）。

将 $n$ 个球放到 $m$ 个盒子中，球有标号 .
1. 盒子有标号，盒子非空：$m! \left\{ {n \atop m} \right\}$
2. 盒子没有标号，盒子可空：$\sum_{i = 1}^{m} \left\{ {n \atop m} \right\}$
3. 盒子有标号，盒子可空：$\sum_{i = 1}^{m} \left\{ {n \atop i} \right\} i! \binom{m}{i} = \sum_{i = 1}^{m} \left\{ {n \atop i} \right\} m ^ {\underline{i}} = m ^ n$
 
其中最后一点说明，可以将乘方用下降幂形式表示。

( 根据前面的公式，其实第一类 Stirling 数也可以将下降幂用乘方表示。)

这一点的好处在于从 $x ^ {\underline{n}}$ 变成 $(x + 1) ^ {\underline{n}}$ 比将 $x ^ n$ 变成 $(x + 1) ^ n$ 方便（前者 $O(1)$, 后者 $O(n)$）。

### 计算

考虑第三个问题的组合意义，我们可以得到一个容斥的式子（从所有方案中减去有空盒子的方案，最后去除标号）：
$$
\left\{ {n \atop m} \right\} = \frac{1}{m!} \sum_{k = 0} ^ m (-1) ^ k \binom{m}{k} (m - k) ^ n \\
= \sum_{k = 0}^m (-1) ^ k \frac{1}{k!} \frac{1}{(m - k)!} (m - k) ^ n
$$
也是一个卷积式，继续 FFT。

---

## Reference & Notes:

一些公式是从[这里](https://blog.csdn.net/liutian429073576/article/details/53727939) 找到的。（包括 Stirling 数 $O(n \log n)$ 的计算方法，其中也有一些关于 Stirling 数的例题。）

《离散数学》中介绍了 Stirling 数的一些性质。

关于如何输入 Stirling 数，参考了 Wikipedia 相关词条的原代码，这里也给出。

```
\left[ {n \atop m} \right] 
\left\{ {n \atop m} \right\}
```

~~（我说，我怎么都把这种东西写了出来）~~

<!---
题外话：
其实关于第二类 Stirling 数，在许多算法入门书的递归 / 递推章节都提到了（放在 Fibnacci 和 Catalan 后面）。
一些初赛题的复习资料（似乎）也有。

不知道有没有人和我一样，说有第二类 Stirling 数，那第一类 Stirling 数呢？（笑）
--->
