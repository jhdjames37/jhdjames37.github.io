---
title: Review of October
date: 2017-10-06 20:34:34
updated: 2017-10-20 21:00:00
categories:
- oi
- reviews & plans
tags:
- review
---

Review of October

<!-- more -->

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

令$G(i) = \sum_{d | n} g(d)$

设$n = p_1^{a_1} \cdot p_2^{a_2} \cdot \ldots$

则:  $G(i) = \sum_{i=0}^{a_1}(-1)^i\cdot \sum_{i = 0}^{a_2} (-1)^i \cdot \ldots$

显然, 当$a_x$ 为奇数 第二个sigma为0, 反之为1.

故当且仅当所有$a_x$均为偶数时原式为1, 反之为0

即$G(i) = [i == a ^ 2]$

所以原式

$$
= \sum_{i \le n} f(i) \\
= \sum g \ast h  \\
= \sum g \ast id \ast 1 \\
= \sum g \ast 1 \ast id  \\
= \sum_{i \le n} (\sum_{d | i} g(d) \cdot 1(\frac {i} {d})) \ast id  \\
= \sum_{i \le n} \sum_{d | i} g(d) \ast id \\
= \sum_{i \le n} G \ast id \\
= \sum_{i \le n} \sum_{j | i} G(j) \cdot \frac i j \\
= \sum_{i ^ 2 \le n} \sum_{j = 1}^{\lfloor \frac {n} {i ^ 2} \rfloor} j
$$

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

## Oct 11th - T55

模板题专场 *2

A: **基数排序**

~~最简单方法: `std::sort()`~~ (雾)

正经的模板: (假设数据范围在int范围)

```cpp radix_sort
//BASE为基数
int a[MAXN], b[MAXN], cnt[BASE];
int tmp = 1;
for (int i = 1; i <= 2; i++) {
	memset(cnt, 0, sizeof cnt);
	for (int j = l; j <= r; j++) cnt[a[j] / tmp % BASE]++;
	for (int j = 1; j < BASE; j++) cnt[j] += cnt[j - 1];
	for (int j = r; j >= l; j--) b[cnt[a[j] / tmp % BASE]--] = a[j];
	for (int j = l; j <= r; j++) a[j] = b[j];
	tmp *= BASE; 
}
```

原理: 逐位排序, 本轮排序的结果将会用来确定下一轮中键值相同情况的排列顺序(按照前一轮的顺序排)

这玩意毕竟复杂度为O(n). 时间比较: (n = 1e7, 单位ms)
int 范围内:
	Array STL_sort: 13498
	Array quick_sort: 12856
	Array radix_sort: 11570

long long 范围内:
	Array STL_sort: 20783
	Array normal_sort: 19726
	Array radix_sort: 20909 (基数1e5)
(如果范围为1e18, 且基数设为1e6, 还可以优化一些常数)
	Array STL_sort: 20964
	Array normal_sort: 21252
	Array radix_sort: 20860

B: Huffman编码, C: 连通分量(DFS/并查集), **双向边** D: 大模拟

E: 最近点对:

法一: 暴力(及其优化) 
按x轴排序, 之后枚举每一个点对: 若第二层枚举时, x的距离超过ans时就可以剪枝.
对于随机数据, 效果良好.

如果想更稳定一些, 可以将所有点强制旋转一个随机角度, 这样hack数据也可以变成随机数据. (加上快读, HDU1007有人成功卡进100ms)

结论: **随机化数据**

法二: 扫描线 + 数据结构维护

法三: 分治

F: 模拟(DAG) G: MST.

(--以下应该为初赛总结--)
keywords: pascal, 数学题, Fortran & OOP, sortings, 王选, 手模游戏, 最小割, xy + langsike 猜中题目. 
(--以上应该为初赛总结--)

## Oct 16th - VJ Contest经典问题1

A - HDU1028: 分解整数DP， （另一种思路是用母函数， 但是复杂度不够）.

B - POJ2442: 归并, 优先队列 （见T56 C）.

C - HDU1010: DFS + 奇偶剪枝.

D - POJ1742: bitset乱搞? 多重背包转无限背包（记录物品数量）

E - POJ2411: 状压DP（逐行递推（预处理所有转移则可用矩阵快速幂优化）， 逐格递推（插头DP的思想， 转移较好写））

F - POJ2255: 二叉树遍历 

G - SGU199: $n \log n$ LIS, 输出方案.

H - POJ2413: 高精度`+`, `<=`.

## Oct 17th 

### T56

A: 必胜策略应该随时通用， **结论应该有暴力作为支撑**

B: DP, **含sigma符号的限制条件会对时间复杂度有帮助**, 优化DP可以从**通过限制转移方式并缩减状态**着手。

C: 思路类似于`POJ2442`， 对数值分类， 然后利用**优先队列将同一类型的逐个加入**, ST表求RMQ。

## 经典问题2

A - HDU 1043: 八数码： 用k进制压缩状态， 反向搜索， Hash（或`map`）

B - LightOJ 1094: 树的直径

C - LightOJ 1038: 概率期望： 列出等式， 移项， 得到递推式（相当于解一元一次方程）. 如果存在两个变量相互依赖， 则需要用解多元方程的思想， 甚至高斯消元

D - HDU 1052: 田忌赛马
1. 纯贪心： 当目前双方最差马的实力不同时， 按原问题策略进行出战。若双方实力相同， 则应该与目前打不过的最强马交战
2. 贪心+DP： 显然出战的马要么是最强的， 要么是最弱的。 假设齐王按从强到弱出马， 设`f[i][j]`为第i轮田忌已经出了j匹好马的最优解。则当双方最强马实力不同时， 按原问题策略转移， 否则就从两个方向同时转移，取最大值。

E - HDU 2489: 暴力枚举所有点的选择， 跑MST。

## Oct 18th - T57

A B: `prim`和`kruskal`.

C D E: 关于`floyd`, `dijkstra`, `spfa`的输出路径：
1. `floyd` 输出路径（字典序最小）：枚举时顺便维护i..j最短路中i的下一个结点。
2. `dijkstra`和`spfa`的输出路径：记录每一个结点是从哪一个结点转移过来的。但是求字典序最小的时直接在这上面找最小的前趋是错误的。解决方法：1.跑正反两遍，找到所有的最短路径，取其中字典序最小的；2.在反图上跑最短路，并找最小的前趋，然后正向输出。 

## Oct 19th - T58

A: 计算每一种长度算式的数量（对于算式`a×b=c`维护b和c每一个长度的区间） 高精度+卡常。

B: 
高斯消元

``` cpp gauss
//matrix[n][n+1]为系数矩阵
for (int i = 1; i <= n; i++) {
	if (sgn(matrix[i][i]) == 0) { //选取非0系数
		for (int j = i + 1; j <= n; j++) {
			if (sgn(matrix[j][i]) != 0) { //如果想精度高，可以选取系数绝对值最大的
				for (int k = i; k <= n + 1; k++) {
			  		swap(matrix[i][k], matrix[j][k]);
				}
				break;
	      		}
    		}
	}
	for (int j = i + 1; j <= n; j++) {
		if (sgn(matrix[j][i]) == 0) continue;
		double tmp = matrix[i][i] / matrix[j][i];
		for (int k = i; k <= n + 1; k++) {
			matrix[j][k] *= tmp;
			matrix[j][k] = matrix[i][k] - matrix[j][k];
		}
	}
}
for (int i = n; i >= 1; i--) {
	double tmp = matrix[i][n + 1];
	for (int j = i + 1; j <= n; j++) {
		tmp -= matrix[i][j] * ans[j];
	}
	ans[i] = tmp / matrix[i][i];
}
```
这道题的解的范围确定，且系数较大，精度会不够。可以考虑在**模意义下解方程**，这里有两种选择， 单模（需要使用`__int128`), 双模（如选1e9+7和1e9+9之后可以通过解同余方程得到解）

C: ?

## Oct 20th - T59

A: 对前缀和求前缀和。双维前缀和。

B: 奇怪的DP。 将所有的串看成01串。先假设有n长度的偶串未匹配（设为x）。接着考虑要求的串，将奇数位与该串匹配，偶数位插入该串。然后统计最后的每个串的结果。

则要求的串奇数位中， 无法与自己中的某一位匹配的会与x串的某一位匹配。则未匹配个数=`n - 最终串中为原来x串的字符数（未操作字符数）`， 考虑到未操作字符中0和1为等效的，则我们规定未操作字符中均为1, 即x串中的`0`必须全部消去。

那么我们可以设`f[i][j][k]`为匹配2i位时，原串中有j个0, k表示x串中的0是否消光的情况。那么转移时只需要讨论那2位填的数即可。

C: 将代数式分解变换，对用优先队列对变化量进行比较。

