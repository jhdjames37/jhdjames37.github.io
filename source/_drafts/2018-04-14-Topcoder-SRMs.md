---
title: Topcoder SRMs
date: 2018-04-14 14:31:02
categories:
- oi
- solutions
tags:
- TopCoder
toc: true
---

首先提供官方题解：

[2016之前](https://apps.topcoder.com/wiki/display/tc/Algorithm+Problem+Set+Analys)
[较新的题解](https://www.topcoder.com/blog/tag/srm/)

<!--- more --->


## SRM 555

### Easy - CuttingBitString

按照题意DP即可（居然数组开小FST了一发，看来不要小看$n \le 50$）

### Medium - XorBoard

既然是xor，只需要考虑奇偶性。枚举行列奇数次操作数量，判断1的数量是否合法。然后组合数计算一下即可。

### Hard - MapGuessing

有许多性质没有发现。。。

首先枚举起始位置，暴力模拟判断是否合法以及哪些格子被覆盖了（这里要注意判断每一步结束后是否合法，并更新答案）。

那么只有这些格子能够修改（修改的意义是目标状态与初始状态不同），方案为$2 ^ {|S|}$。

因为有多个这样的集合，它们之间有交集，所以需要跑容斥。

但是这样的集合最多有字符串长度个，$n \le 36$。所以常规容斥不能做。

但是考虑这些集合是由同一套操作产生的，它们的影响范围（指针移动范围）是相同的，假设为$L$。

那么如果两个集合的起始点距离$> L$, 显然没有贡献，对答案的贡献为$2 ^ {|\varnothing|} = 1$（不考虑容斥正负号）。

所以每次只需要考虑相距不超过$L$的集合。

又因为合法集合个数为（至多）$n - L$

所以每次需要考虑的集合个数为$\min(L, n - L) \le 18$, 在可接受范围。

那么就可以跑容斥了。

