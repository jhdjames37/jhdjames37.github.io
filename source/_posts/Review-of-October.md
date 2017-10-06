---
title: Review of October
date: 2017-10-06 20:34:34
updated: 2017-10-06 20:34:34
categories:
- oi
- review & plans
tags:
- review
---

## Oct 1st - T48

by zhu siji

A: 圆的并, 扫描线, ???(std? 不存在的)

B: 代数式化简, 通过**组合数的意义**优化含阶乘的代数式. (std: 旋转坐标轴..)

C: 贪心(非负权值) 或 DP(权值可为负). 

## Oct 2nd - T49

A: 爆搜 + 剪枝 + 细节.

B: 类数位DP.

C: 树上贪心. 或 树上DP.

## Ocr 6th - T50

by Yali.

A: 观察特殊性质, 染色问题.

B: 询问满足条件的数 => 对每个数求满足的询问. **数值相关 => 平面上的点, 区间覆盖 => 线段** 主席树.

C: 代数式恒等变化, 狄利克雷卷积的应用, 前缀和分块优化.

附: Proof of C: (id(x) = x, 1(x) = 1)

` 令G(i) = sigma(d | n) g(d);

设n = p1 ^ a1 * p2 ^ a2 * ...

则: G(i) = sigma(i = 0..a1) (-1)^i * sigma(i = 0..a2) (-1)^i;

显然, 当ax 为奇数 第二个sigma为0, 反之为1.

故当且仅当所有ax均为偶数时原式为1, 反之为0

即G(i) = i == a ^ 2.

所以原式 = sigma f(i) = sigma g * h = sigma g * id * 1 = sigma g * 1 * id = sigma (sigma (d | n) g(d) * 1(n / d)) * id = sigma (sigma(d | n) g(d) * id) = sigma(G(d) * id) = sigma(sigma [j == x ^ 2] * (i / j) = sigma (i = 1..n) (sigma(j = 1..sqrt(x)) (i / j ^ 2))`