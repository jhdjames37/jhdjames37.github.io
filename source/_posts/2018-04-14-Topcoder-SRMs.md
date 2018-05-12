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

[2016之前](https://apps.topcoder.com/wiki/display/tc/Algorithm+Problem+Set+Analysis)
[较新的题解](https://www.topcoder.com/blog/tag/srm/)

另外，TopCoder的插件中，moj做得不错，[repo](https://github.com/lovrop/topcoder-moj) （最新版浮点数spj在c++11下不会CE了， Emacs选手可能需要手动调整缩进，当然有java编译器的可以自己动手改～）

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

## SRM 556

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

## SRM 557

### Easy - FoxAndMountainEasy

根据题意将给定的操作的$\Delta h$求出来。注意$h_0 + \Delta h <0$的情况以及操作次数奇偶性的判定。（后者样例中居然没有！）

### Medium - Incubator

需要一些前置知识：

**反链**： 一个元素的集合（是全集的子集），两两之间不能确定大小关系。（用图论的语言来描述就是在有向图上的点集，使得两两之间不存在有向路径）

**Dilworth's Theorem**： 给定一个集合，以及集合中一些元素的大小关系（可能存在环），则其反链的最大大小等于其最小链精确点覆盖（用链覆盖点恰好一次）。

然后就可以变成二分图匹配经典问题了。

但是有两点注意：这个定理需要先求出传递闭包。其次对于非DAG，我们也可以直接建出二分图跑匹配。

### Hard - XorAndSum

首先需要了解线性基(非常抱歉，没有链接)。

首先我们先构建出一个线性基。

然后我们只需要最大化线性基元素和。线性基外的就直接取最大值。根据线性基的性质，这是符合题意的。

那么我们在构出线性基之后，首先用较低位基的值去消去较高位基的值二进制下对应位上的1。那么对于每一个基都得到了其最小值，异或上最大值之后，就得到了其最大值。<!---（这是Selina口胡的）--->

## SRM 558

（各种细节写挂，各种FST）

### Easy - Stamp

枚举长度之后直接dp。（注意更换颜色与不更换颜色的转移的区别！）

### Medium - Ear

可以枚举大三角形的底边A，D， 那么对于每个小三角形的P点对应的合法的底边数量是确定的。

然后可以发现合法的P, Q, 构成了关于A，D的极角的二维偏序。BIT处理。注意处理共线的情况。

### Hard - SurroundingGame

某道校内训练题的原题。最小割。

## SRM 559

（感觉Medium和Easy顺序反了。。。）

### Easy - HyperKnight

不会找规律的表示，写一发容斥。

结果容斥写了好久（好像就多了一个组合数$\binom{n}{k}$）。。。（最后写成了直接DP+组合数，其实也就是容斥的原始形式）

### Medium - HatRack

题目很长，其实就是给出一棵树，求它有几种编号的映射方案使得其成为一棵完全二叉树,且$x$的左右儿子（若存在）为$2x, 2x + 1$。

直接$O(n^3)$dp即可。发现有许多状态本质相同，可以优化到$O(n ^ 2)$.

### Hard - CircusTents

二分答案不难想到。

在一开始想的时候，发现有些圆的路径可能会绕过某些圆，但是仔细观察会发现，这样的圆一定不会是最小值所在的圆，而且忽略非0号圆的弧线不会影响答案。

然后就可以二分出每个圆所对应的合法区间然后求交来判定。

## SRM 560

### Easy - TomekPhone

经典贪心。

### Medium - DrawingPointsDivOne

容易发现通过坐标变换，可以将一次（逆向）操作变成$(x, y) \rightarrow (x, y), (x + 1, y), (x , y + 1), (x + 1, y + 1)$也可以发现$x$次操作后，它形成了一个边长为$x+1$的正方形。

（然后我就直接根据这个来判定，然后样例都过不去。。。）

可以发现我们忘记了判新加的点（不一定是通过上述过程构造的）。如果我们反向考虑这个过程，就会发现，每一个$x$的正方形，对应在$x - 1$步前出现的点（有可能是新加的，也可能是构造的），那么我们可以据此来判定$k$步时是否合法（检查每一个正方形大小是否合法）。

发现正方形大小可以DP计算，而且答案具有可二分性，总复杂度$O(n^2\log n)$

### Hard - BoundedOptimization

（可能涉及微积分）

有一个StraightForward的做法，枚举每个点是否为LowerBound，UpperBound还是中间的某个值。然后暴力对每个中间值求导，高消。直接求$O(3^n n^3)$。发现每一个中间值集合相同的方程列出来相似，可以只做$2^n$次高消$O(3^n n^2+2^n n^3)$。

首先发现在最优解中，取中间值的形成了团（可用反证法），设集合为$S$

枚举其余点为最大还是最小值。设$S$的和$\sum_{i \in S} x_i =M$。

那么就会发现$i$号点（$i \in S$）对答案贡献为$x_i \cdot (\sum_{j \notin S, (i, j) \in E} x_j + \frac{1}{2}(M - x_i) )$

设$A_i = \sum_{j \notin S, (i, j) \in E} x_j + \frac{1}{2}M$.

则这一部分的答案为$\sum x_i(A_i - \frac{1}{2} x_i), \sum x_i = M$，其极值为$x_i = A_i + \frac{M - \sum A_i} {|S|}$。

**证明**：考虑每一维的偏导为$A_i - x_i$, 容易发现当每一维偏导相等时取极值（反证，考虑向偏导大的那一维移动$\epsilon$），所以可以解出上式。

最后只需要判断取值范围即可。

## SRM 561

### Easy - ICPCBalloon

$2 ^ n$枚举气球大小，后面直接贪心。

### Medium - CirclesGame

根据包含关系建树。然后暴力计算每棵子树的SG。

### Hard - Orienteering

考虑已知$k$个点的情况下求答案：首先构造回路，长度为$2 \times \text{生成树大小}$，然后变成路径，最多减去生成树直径。

考虑两部分分开计算期望：

生成树大小：考虑每一条边，它在生成树中出现当且仅当它两边两个子树均有点被选，为$\binom{n}{k} - \binom{size}{k} - \binom{n-size}{k}$种方案（所有方案减去只在一边的方案,$n$表示关键点数，$size$表示一侧子树大小）

直径：枚举直径端点$A, B$。考虑2-BFS求直径方法，我们规定有多个dis最大值，选取编号最大的作为端点，那么我们就会发现一个点$C$能够出现在以$AB$为直径的树上当且仅当下面两者均满足（反之$C$将成为端点）：
- $dis_{AC} < dis_{AB}$ 或$dis_{AC}=dis_{AB}$且$C < B$
- $dis_{BC} < dis_{BA}$ 或$dis_{BC}=dis_{BA}$且$C < A$.
那么可以统计出合法点数，乘上组合数即可得到方案数。复杂度$O(n ^ 3)$

在程序实现的时候，看起来组合数会存不下，但因为最后还需要除以$\binom{n}{k}$，所以可以在预处理组合数时除掉，或者直接用`double`存。因为`double`有16位精度，所以最后再将两个大数相除，前几位也是准确的，而且期望值显然在$O(\text{棋盘大小})$级别，精度不会爆炸。