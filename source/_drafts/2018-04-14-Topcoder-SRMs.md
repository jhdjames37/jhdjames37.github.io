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

## SRM 566

### Easy - XorTravelingSalesman

直接BFS一遍就可以了。

### Medium - LeftRightDigitsGame2

写了一个Div2 Hard的贪心。结果FST了。

实际上是数位DP，而且由于题目的性质，需要同时记录两侧的状态（长度以及大小比较）

### Hard - OldBridges

题目具有迷惑性。循环流显然无法解决同时在一座桥上双向行走，将限制扩大两倍跑单向流也无法阻止$a_1 \rightarrow b_2$的流。（怪不得当时无人A）

题解上的办法很鬼畜： 首先跑一边以$(a_1, b_1)$为源，$(a_2, b_2)$为汇的网络流，再跑一遍$(a_1, b_2)$为源，$(a_2, b_1)$为汇的网络流。两遍均合法才输出Yes。

**正确性：**

首先将两个流相加，那么原来不合法的$a_1 \rightarrow b_2$变成了$a_1 \rightarrow b_2 \rightarrow a_2$。其它的不合法情况也同理，画张图会发现所有流变成了$a_1 \rightarrow a_2$的流（的两倍）。

同样的，两个流相减可以得到$b_1 \rightarrow b_2$流。

然后将流量除以2。因为容量为偶数（或INF），则流量一定为偶数。

然后可以发现对于一条边，当前流量$|\frac{f_1 + f_2}{2}| + |\frac{f_1 - f_2}{2}| \le \max(f_1, f_2) \le \text{cap}$所以方案合法。

所以就能够判定了。
