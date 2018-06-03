title: Review of January
categories:
  - oi
  - solutions
tags:
  - review
  - Codeforces
  - Atcoder
date: 2018-01-21 14:40:00
---
Review of January.

懒癌晚期，开始狂补总结。

<!-- more -->

# Trainings On CF, ATC and Others.

## CF - GoodBye 2017 (#908)

D: 概率 DP， 注意实现细节（无穷级数处理及特殊情况。）

E: XOR, AND, OR 互推。Bell 数（将 n 个元素分成若干份的方案，转移时考虑首元素如何分）

F: 贪心。注意边界

G: 对原数进行数位 DP，将第 k 大转化成有最多 k 个数比它大。

## CF - Hello 2018 (#913)

E: 将字符串作为 DP 的值。

F: 将步骤分解（题面要求分成多个 SCC，DP 时可以一个一个分解）

## CF - Edu. R36 (#915)

G: 莫比乌斯函数容斥，**整除符号：**$\lfloor \frac{x}{y} \rfloor$ **当 y 不变 x 增加时，仅当 y|x 时答案改变。当 x 不变时，原式取值仅**$O(\sqrt{n})$**种， 可分块求解**

## CF - R172 (#280)

D: k 段最大和的 DP 解法及线段树优化，网络流解法及线段树优化。（详见题解）

## CF - R174 (#283)

D: 将相邻两数性质拓展成区间性质。

E: 三元环： 三元环 (a->b, b->c, c->a) 个数：
	${n \choose 3} - \sum_{i=1}^n{deg_i \choose 2}$
	即总三元组个数 - 非三元环个数 (a->b, a->c, b->c, 则必有一点入度为 2)。扫描线，线段树维护区间反转。

## CF - Gym (#100959)
**Title: 2015-2016 Petrozavodsk Winter Training Camp, Makoto rng_58 Soejima Contest 4**

A: 按质因数个数扩展。

B: 曼哈顿距离和切比雪夫距离，用公共点减少连边。

C: 代数式变换。数轴上 BFS（只需要搜到取值范围的 3 ～ 4 倍）

F: 转化成整除式 $\lfloor \frac {a_i} {m} \rfloor$ 的关系，分块 ( 数论函数式 ) 求解。

J: 树的编码： Prufer 编码。

L: 注意考虑特例。

## AGC20

D: 求值可以解方程不等式，**也可以二分**（有些时候更方便）。

## CF - Codecraft-18 and Codeforces Round #458 (Div. 1 + Div. 2, combined) (#914)

C: 类数位 DP， 注意 k=0 时的细节。

E: 树分治（类模板）， 解决路径问题。

G: [集合卷积](/2018/01/24/ 集合卷积 /)

## CF - Mashup 1

Div1C 训练

+ A: 297C
+ B: 303C
+ C: 314C
	注意题意（原串的不下降子序列）， 用 pre[]数组维护重复计算的信息以便减去
+ D: 319C
	斜率优化 DP 思想。单调栈维护转移，当一条直线**不在凸包**上时（比较交点）弹出，如果改用单调队列可优化二分寻找最优转移的 log
+ E: 321C
	树分治思想，则只需分治中心比其子树任意点权值大即可。（分治时也可采取取直径中点为中心，最小化深度）