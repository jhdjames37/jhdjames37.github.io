---
title: Review of October
date: 2017-10-06 20:34:34
updated: 2017-10-10 17:38s:00
categories:
- oi
- reviews & plans
tags:
- review
---

## Oct 1st - T48

by zhu siji

A: 圆的并, 扫描线, ???

B: 代数式化简, 通过**组合数的意义**优化含阶乘的代数式. (std: 旋转坐标轴..)

C: 贪心(非负权值) 或 DP(权值可为负). 

## Oct 2nd - T49

A: 爆搜 + 剪枝 + 细节.

B: 类数位DP.

C: 树上贪心. 或 树上DP.

## Oct 6th - T50

by Yali.

A: 观察特殊性质, 染色问题.

B: 询问满足条件的数 => 对每个数求满足的询问. **数值相关 => 平面上的点, 区间覆盖 => 线段** 主席树.

C: 代数式恒等变化, 狄利克雷卷积的应用, 前缀和分块优化.

附: Proof of C: (id(x) = x, 1(x) = 1)

令G(i) = sigma(d | n) g(d);

设n = p1 ^ a1 \* p2 ^ a2 \* ...

则: G(i) = sigma(i = 0..a1) (-1)^i \* sigma(i = 0..a2) (-1)^i;

显然, 当ax 为奇数 第二个sigma为0, 反之为1.

故当且仅当所有ax均为偶数时原式为1, 反之为0

即G(i) = i == a ^ 2.

所以原式 = sigma f(i) = sigma g \* h = sigma g \* id \* 1 = sigma g \* 1 \* id 
= sigma (sigma (d | n) g(d) \* 1(n / d)) \* id = sigma (sigma(d | n) g(d) \* id) = sigma(G(d) \* id) 
= sigma(sigma [j == x ^ 2] \* (i / j) = sigma (i = 1..n) (sigma(j = 1..sqrt(x)) (i / j ^ 2))

## Oct 7th - T51

by Yali.  

(这套题是在搞笑吗??)

A: 平面图的面: (通俗解释:能用画图的填充工具填满的一块) 平面的一块，它用边做边界线，不能再分成更小的块。存在有限面 = 存在环. 最大生成树.

B: 用对称性解决博弈论. (算法与数据范围不符系列...)

C: ~~???(std看不懂系列)~~ 各类快速数论算法..

### Codeforces Round 439 (\#869)
 
A: 暴力, 或结论: xor的可逆性. B: 略

C: 乘法原理.

E: 差分, 使用`rand()` 来表示不同的差分内容. 二维树状数组的使用方法. 

## Oct 8th - T52

Big GG.

By wcz

General: 

1. 所有的优化(特别是会增加代码复杂度的优化) 必须以**对优化时间或空间**有贡献! 不要忘记**KISS**原则, **Keep It Simple & Stupid**!!
   如B题的离散化就对优化没有贡献, 反倒会增加转移时的代码复杂度, 或者引入bug.

2. 关于`#ifdef`: 除了会影响输出结果,时空复杂度的内容, 其余不应放入`#ifdef`, 所有加入`#ifdef`的程序应关闭编译选项重新编译.

A: 计算几何.

B: **状态设计的重要性** 选择更容易的状态.

C: gcd整点计数, 前缀和优化, 容斥.

## Oct 9th - T53

A: 规律, 递推式转通项.

B: 状压DP.

C: dijk + 求**关键路径** + 差分扫描线维护答案.

## Oct 10th - T54

模板题专场

A: 表达式运算 - 括号只在算优先级时有用, 之后就可以ignore了.

B: 关键路径, C: 贪心(std错误系列) D: 略 E: 爆搜 F: 树的重心 G: 凸包(极角序的细节问题, 或者用水平序).