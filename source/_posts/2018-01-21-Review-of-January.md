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

D: 概率DP， 注意实现细节（无穷级数处理及特殊情况。）

E: XOR, AND, OR互推。Bell数（将n个元素分成若干份的方案，转移时考虑首元素如何分）

F: 贪心。注意边界

G: 对原数进行数位DP，将第k大转化成有最多k个数比它大。

## CF - Hello 2018 (#913)

E: 将字符串作为DP的值。

F: 将步骤分解（题面要求分成多个SCC，DP时可以一个一个分解）

## CF - Edu. R36 (#915)

G: 莫比乌斯函数容斥，**整除符号：**$\lfloor \frac{x}{y} \rfloor$ **当y不变x增加时，仅当y|x时答案改变。当x不变时，原式取值仅**$O(\sqrt{n})$**种， 可分块求解**

## CF - R172 (#280)

D: k段最大和的DP解法及线段树优化，网络流解法及线段树优化。（详见题解）

## CF - R174 (#283)

D: 将相邻两数性质拓展成区间性质。

E: 三元环： 三元环(a->b, b->c, c->a)个数：
	${n \choose 3} - \sum_{i=1}^n{deg_i \choose 2}$
	即总三元组个数-非三元环个数(a->b, a->c, b->c, 则必有一点入度为2)。扫描线，线段树维护区间反转。

## CF - Gym (#100959)
**Title: 2015-2016 Petrozavodsk Winter Training Camp, Makoto rng_58 Soejima Contest 4**

A: 按质因数个数扩展。

B: 曼哈顿距离和切比雪夫距离，用公共点减少连边。

C: 代数式变换。数轴上BFS（只需要搜到取值范围的3～4倍）

F: 转化成整除式$\lfloor \frac {a_i} {m} \rfloor$的关系，分块(数论函数式)求解。

J: 树的编码： Prufer编码。

L: 注意考虑特例。

## AGC20

D: 求值可以解方程不等式，**也可以二分**（有些时候更方便）。

## CF - Codecraft-18 and Codeforces Round #458 (Div. 1 + Div. 2, combined) (#914)

C: 类数位DP， 注意k=0时的细节。

E: 树分治（类模板）， 解决路径问题。

G: 集合卷积（**TODO**: 写总结， vfk论文）

## CF - Mashup 1

Div1C训练

+ A: 297C
+ B: 303C
+ C: 314C
	注意题意（原串的不下降子序列）， 用pre[]数组维护重复计算的信息以便减去
+ D: 319C
	斜率优化DP思想。单调栈维护转移，当一条直线**不在凸包**上时（比较交点）弹出，如果改用单调队列可优化二分寻找最优转移的log
+ E: 321C
	树分治思想，则只需分治中心比其子树任意点权值大即可。（分治时也可采取取直径中点为中心，最小化深度）