---
title: POJ Problems
date: 2017-10-13 20:21:20
categories: 
- oi
- solutions
tags:
- POJ
---

POJ刷题记录, 参照[某题单](http://blog.csdn.net/a1dark/article/details/11714009).

<!-- more -->

## 初期:

### 一.基本算法:

1. 枚举. 
	- POJ 1753
	- POJ 2965

2. 贪心
	- POJ 1328
	- POJ 2109
	- POJ 2586

3. 递归和分治法.

4. 递推.

5. 构造法.
	- POJ 3295

6. 模拟法.
	- POJ 1068
	- POJ 2632
	- POJ 1573
	- POJ 2993
	- POJ 2996

### 二.图算法:

1. 图的深度优先遍历和广度优先遍历.

2. 最短路径算法(dijkstra,bellman-ford,floyd,heap+dijkstra) 
	- POJ 1860
	- POJ 3259
	- POJ 1062
	- POJ 2253
	- POJ 1125
	- POJ 2240

3. 最小生成树算法(prim,kruskal) 
	- POJ 1789
	- POJ 2485
	- POJ 1258
	- POJ 3026

4. 拓扑排序 
	- POJ 1094

5. 二分图的最大匹配 (匈牙利算法) 
	- POJ 3041
	- POJ 3020
	
6. 最大流的增广路算法(KM算法). 
	- POJ 1459
	- POJ 3436

### 三.数据结构.

1. 串 
	- POJ 1035
	- POJ 3080
	- POJ 1936

2. 排序(快排、归并排(与逆序数有关)、堆排) 
	- POJ 2388
	- POJ 2299

3. 简单并查集的应用.

4. 哈希表和二分查找等高效查找法(数的Hash,串的Hash) 
	- POJ 3349
	- POJ 3274
	- POJ 2151
	- POJ 1840
	- POJ 2002
	- POJ 2503
	
5. 哈夫曼树
	- POJ 3253
	
6. 堆
7. trie树(静态建树、动态建树) 
	- POJ 2513

### 四.简单搜索

1. 深度优先搜索 
	- POJ 2488
	- POJ 3083
	- POJ 3009
	- POJ 1321
	- POJ 2251

2. 广度优先搜索
	- POJ 3278
	- POJ 1426 
	- POJ 3126
	- POJ 3087
	- POJ 3414

3. 简单搜索技巧和剪枝
	- POJ 2531
	- POJ 1416
	- POJ 2676
	- POJ 1129

### 五.动态规划

1. 背包问题. 
	- POJ 1837
	- POJ 1276

2. 型如下表的简单DP(可参考lrj的书 page149):
	- E[j]=opt{D+w(i,j)} (POJ 3267,POJ 1836,POJ 1260,POJ 2533)
	- E[i,j]=opt{D[i-1,j]+xi,D[i,j-1]+yj,D[i-1][j-1]+zij} (最长公共子序列) (POJ 3176,POJ 1080,POJ 1159)
	- C[i,j]=w[i,j]+opt{C[i,k-1]+C[k,j]}.(最优二分检索树问题)

### 六.数学

1. 组合数学:
	- 加法原理和乘法原理.
	- 排列组合.
	- 递推关系.

	- POJ 3252
	- POJ 1850
	- POJ 1019
	- POJ 1942
2. 数论.
	- 素数与整除问题
	- 进制位.
	- 同余模运算.
	
	- POJ 2635
	- POJ 3292
	- POJ 1845
	- POJ 2115

3. 计算方法.
	- 二分法求解单调函数相关知识.
	
	- POJ 3273
	- POJ 3258
	- POJ 1905
	- POJ 3122

### 七.计算几何学.

1. 几何公式.

2. 叉积和点积的运用(如线段相交的判定,点到线段的距离等). 
	- POJ 2031
	- POJ 1039
	
3. 多边型的简单算法(求面积)和相关判定(点在多边型内,多边型是否相交) 
	- POJ 1408
	- POJ 1584

4. 凸包. 
	- POJ 2187
	- POJ 1113

## 中级:

### 一.基本算法: 
1. C++的标准模版库的应用. (poj3096,poj3007) 
2. 较为复杂的模拟题的训练(poj3393,poj1472,poj3371,poj1027,poj2706) 

### 二.图算法: 
1. 差分约束系统的建立和求解. (poj1201,poj2983) 
2. 最小费用最大流(poj2516,poj2195) 
3. 双连通分量(poj2942) 
4. 强连通分支及其缩点.(poj2186) 
5. 图的割边和割点(poj3352) 
6. 最小割模型、网络流规约(poj3308, ) 

### 三.数据结构. 
1. 线段树. (poj2528,poj2828,poj2777,poj2886,poj2750) 
2. 静态二叉检索树. (poj2482,poj2352) 
3. 树状树组(poj1195,poj3321) 
4. RMQ. (poj3264,poj3368) 
5. 并查集的高级应用. (poj1703,2492) 
6. KMP算法. (poj1961,poj2406) 

### 四.搜索 
1. 最优化剪枝和可行性剪枝 
2. 搜索的技巧和优化 (poj3411,poj1724) 
3. 记忆化搜索(poj3373,poj1691) 

### 五.动态规划 
1. 较为复杂的动态规划(如动态规划解特别的施行商问题等) 
         (poj1191,poj1054,poj3280,poj2029,poj2948,poj1925,poj3034) 
2. 记录状态的动态规划. (POJ3254,poj2411,poj1185) 
3. 树型动态规划(poj2057,poj1947,poj2486,poj3140) 

### 六.数学 
1. 组合数学: 
        1.容斥原理. 
        2.抽屉原理. 
        3.置换群与Polya定理(poj1286,poj2409,poj3270,poj1026). 
        4.递推关系和母函数.        
2. 数学. 
        1.高斯消元法(poj2947,poj1487, poj2065,poj1166,poj1222) 
        2.概率问题. (poj3071,poj3440) 
        3.GCD、扩展的欧几里德(中国剩余定理) (poj3101) 
3. 计算方法. 
        1.0/1分数规划. (poj2976) 
        2.三分法求解单峰(单谷)的极值. 
        3.矩阵法(poj3150,poj3422,poj3070) 
        4.迭代逼近(poj3301) 
4. 随机化算法(poj3318,poj2454) 
5. 杂题. 
         (poj1870,poj3296,poj3286,poj1095) 

### 七.计算几何学. 
1. 坐标离散化. 
2. 扫描线算法(例如求矩形的面积和周长并,常和线段树或堆一起使用). 
            (poj1765,poj1177,poj1151,poj3277,poj2280,poj3004) 
3. 多边形的内核(半平面交)(poj3130,poj3335) 
4. 几何工具的综合应用.(poj1819,poj1066,poj2043,poj3227,poj2165,poj3429

## 高级: 

### 一.基本算法要求:   
1. 代码快速写成,精简但不失风格   
          (poj2525,poj1684,poj1421,poj1048,poj2050,poj3306) 
2. 保证正确性和高效性. poj3434 

### 二.图算法: 
1. 度限制最小生成树和第K最短路. (poj1639) 
2. 最短路,最小生成树,二分图,最大流问题的相关理论(主要是模型建立和求解)

         (poj3155, poj2112,poj1966,poj3281,poj1087,poj2289,poj3216,poj2446 
3. 最优比率生成树. (poj2728) 
4. 最小树形图(poj3164) 
5. 次小生成树. 
6. 无向图、有向图的最小环    

### 三.数据结构.   
1. trie图的建立和应用. (poj2778) 
2. LCA和RMQ问题(LCA(最近公共祖先问题) 有离线算法(并查集+dfs) 和 在线算法
          (RMQ+dfs)).(poj1330) 
3. 双端队列和它的应用(维护一个单调的队列,常常在动态规划中起到优化状态转移
的 
          目的). (poj2823) 
4. 左偏树(可合并堆).   
5. 后缀树(非常有用的数据结构,也是赛区考题的热点). 
         (poj3415,poj3294) 
		 
### 四.搜索   
1. 较麻烦的搜索题目训练(poj1069,poj3322,poj1475,poj1924,poj2049,poj3426)

2. 广搜的状态优化:利用M进制数存储状态、转化为串用hash表判重、按位压缩存储
状态、双向广搜、A*算法. (poj1768,poj1184,poj1872,poj1324,poj2046,poj1482) 
3. 深搜的优化:尽量用位运算、一定要加剪枝、函数参数尽可能少、层数不易过大
、可以考虑双向搜索或者是轮换搜索、IDA*算法. (poj3131,poj2870,poj2286) 

### 五.动态规划   
1. 需要用数据结构优化的动态规划. 
         (poj2754,poj3378,poj3017) 
2. 四边形不等式理论. 
3. 较难的状态DP(poj3133) 

### 六.数学   
1. 组合数学. 
        1.MoBius反演(poj2888,poj2154) 
        2.偏序关系理论. 
2. 博奕论. 
        1.极大极小过程(poj3317,poj1085) 
        2.Nim问题. 
		
### 七.计算几何学.   
1. 半平面求交(poj3384,poj2540) 
2. 可视图的建立(poj2966) 
3. 点集最小圆覆盖. 
4. 对踵点(poj2079) 

### 八.综合题. 
   poj3109,poj1478,poj1462,poj2729,poj2048,poj3336,poj3315,poj2148,poj1263)