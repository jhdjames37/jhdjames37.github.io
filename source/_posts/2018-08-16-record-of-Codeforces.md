---
title: Codeforces FST 记录
date: 2018-08-16 10:09:19
categories:
- oi
- reviews & plans
tags:
- Codeforces
- review
---

暑假里 VP 了 $O(1)$ 场 CF。现记录如下（大致就是 2014 年底到 2015 年初的）

目前只是 Overview，应该要加上一些细节和经验。

<!--- more --->

## Codeforces Round #282

A, B 略

### C

首先将区间转树，然后 DP。

第二维状态应该是 (现在的最大值 - 初始的最大值)

### D

直接从下到上，从上到下分别 DP 出二次和，然后将链和子树合并。

（细节咕咕咕）

### E 

根据题解上的证明（比较复杂，先咕着），每个格子 $(i, j)$ 的 SG 值为 $\min(\text{lowbit}(i), \text{lowbit}(j), \text{highbit}(k))$ （$\text{highbit}$ 的定义类似 $\text{lowbit}$）。所以总的 SG 值为所有 1 的格子的 SG 值的异或。

考虑有几个格子的 SG 值 $\geq x$ （显然$x \le \text{highbit}(k)$）最后差分一下。

那么可以转化成二维区间覆盖 + 数点，用扫描线 + 线段树。

在线段树实现上，用类似标记持久化的思想，不下传标记，根据是否有标记决定是否 `update`。

另外，因为只需要知道数量的奇偶性，所以可以压位放在一个线段树上搞。

## Codeforces Round #283

A 略，B 题复杂度分析（O(调和级数)）

### C

将区间包含转为二维数点之后贪心。

### D

计算几何。利用相对运动来简化判定的形式（不仅要固定一个点，而且要让一个点不转）。

### E

用数位 DP 的思想，逐位递推。

## Codeforces Round #284

(著名的 Dreamoon & sorry_dreamoon 场)

A 略， B 概率 DP 卡常题

### C 

按质因数拆点跑二分图匹配。

### D

暴力建线段树，维护 $T \bmod 60$ 下的 DP 值

### E

状压 DP + 矩阵优化。

## Goodbye 2014

A, B, C, D略

（居然 A FST 了一发）

E 数据结构优化模拟。（细节 WA 了很多，最后写了 2 个 $\log$ 的）

F O(调和级数) + 关键点 / 扫描线 + 双栈队列

G 数论 + 树论神题（详细讲一下最后几步细节的推导）

## Codeforces Round #285

A, B略

C 大分讨

D 线性基裸题，高精度

E 轻重链剖分 + SA / 整体二分 + hash + 卡常

## Codeforces Round #286

A 缩减状态数

B 缩点 + 分析

C 贪心 + 推式子 / 逆向思维

D 复杂度分析 + 减少不必要枚举

E 自动机 DP 上套矩阵（好像可以推式子）

---

再来看最近的一场

## Codeforces Round #503

两（3？）题手速场

A，B 略（话说前两天我还看到了 B 的连续版本）

C 增量构造（但增量不为 1 ）

D 极角扫描

E 边分 + 凸包 （写点分容易变成 3 个 $\log$ 或者在 $m$ 上多一个 $\log$）
