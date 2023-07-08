---
title: Codeforces 题目总结
date: 2018-04-14 20:18:12
categories:
- oi
- solution
tags:
- Codeforces
---

最近 Codeforces 的比赛打的有点少。( 其实有几场 Div2 在口胡算法。。。)

来回顾一下做过的为数不多的几道题目。（只讲重点思路，看完整解法请右转 "Tutorial" 板块，锻炼英语能力）

<!-- more -->

## CF Round 462

1C: 平面图欧拉定理，但有个拓展。

在平面图不连通的情况下，公式如下：

` 边数 + 面数 - 顶点数 = 连通分量数 + 1`

## CF Round 469

凉凉掉 Rating( 因为 Tarjan 有个地方变量名打错 FST，只能说 `std::vector` 存图 + `auto` 大法好 )

## CF Round 474

G: [Stirling 数](/2018/04/13/Stirling-Number/)

H: 树剖 + 线段树维护平方和。
题解上有个好玩的 idea：可以将 size 的平方转换成该子树的路径数量，从而点分。

## CF Edu 42

G: 很好的扫描线题目。
可以找到询问区间中整一条的竖条，在其中插入所有横向线段。那么每扫到一条线段就会 toggle 这些区间的覆盖情况。用 `std::set` 维护被覆盖的区间，同时用并查集维护它们是否连通。

另外，口胡几道题目的算法：

## CF Edu 40

H: 将 DP 式子变换，变成非卷积式。

I: FFT/bitset 判断字符串匹配

## CF R466

F: 带修莫队。(Mex 复杂度直接枚举不会太高。)
