title: BZOJ3925/LOJ2136/luogu3343 - 【 ZJOI2015 】 地震后的幻想乡
categories:
  - oi
  - solutions
tags:
  - possibility & expectations
  - calculus
  - DP
  - bitmask
date: 2018-04-19 20:33:00
---

## 题意

给出一张图，边权在 $[0, 1]$ 等概率随机。求其最小生成树最大边边权的期望。

$n \le 8, m \le \frac{n(n - 1)}{2}$

<!--- more --->

## 题解

( 以下内容涉及一些微积分内容以及极限的思想~~，请谨慎阅读~~)

设 $p(x) = \text{possibility of max_edge} \le x$

则可以发现答案为 $\int_0^1 p(x) \text{d}x$ 

证明： $p'(x) = \text{possibility of max_edge} = x$, 则
$$ans = \int_0^1 p'(x) x \text{d} x \\
= \int_0^1 p'(x) \int_0^x 1 \text{d}t \text{d} x \\
= \int_0^1 \int_t^1 p'(x) \text{d} x \text{d}t \\
= \int_0^1 p(t) \text{d} t = \int_0^1 p(x) \text{d} x$$

其中第三行可以类比 $\Sigma$ 求和符号的交换求和顺序。

接着考虑如何计算 $p(x)$:

首先发现 $p(x)$ 相当于只考虑边权 $< x$ 的边的时候图不联通的概率。

考虑状压 DP：

设 $f_S(x)$ 表示考虑 $S$ 集合中边权 $< x$ 的边时，图不联通的概率。

可以得到转移（$Edge(S, T)$ 表示集合 $S, T$ 间连边数）：

$$f_S(x) = \sum_{1 \in T \subset S} (1 - f_T(x)) (1-x) ^ {Edge(T, S - T)}$$

即枚举 $1$ 号点所在的极大连通分量，则它不能够和剩下的点有连边。

将左右同时积分得：

$$\int_0^1 f_S(x) \text{d} x = \int_0^1 \sum_{1 \in T \subset S} (1 - f_T(x)) (1-x) ^ {Edge(T, S - T)} \text{d} x \\
= \sum_{1 \in T \subset S} \int_0^1 (1 - f_T(x)) (1 - x) ^ {Edge(T, S - T)} \text{d} x \\
= \sum_{1 \in T \subset S} \int_0^1 (1 - x) ^ {Edge(T, S - T)} \text{d} x - \int_0^1 f_T(x) (1 - x) ^ {Edge(T, S - T)} \text{d} x \\
= \sum_{1 \in T \subset S} \frac{1}{Edge(T, S - T) + 1} - \int_0^1 f_T(x) (1 - x) ^ {Edge(T, S - T)} \text{d} x
$$

最后一步的依据是积分表上的公式 $\int (ax + b) ^ {\mu} \text{d} x= \frac{1}{a(\mu + 1)}(ax + b) ^ {\mu + 1} + C (\mu \ne -1)$

设 $g_{S, k}(x) = f_S(x) (1 - x) ^ k = \sum_{1 \in T \subset S} (1 - f_T(x)) (1 - x) ^ {Edge(T, S - T) + k}$

积分得：
$$G_{S, k} = \int_0 ^ 1 g_{S, k}(x) \text{d} x \\
= \sum_{1 \in T \subset S} \frac{1}{Edge(T, S - T) + k - 1} - \int_0^1 f_T(x) (1 - x) ^ {Edge(T, S - T) + k} \text{d} x \\
= \sum_{1 \in T \subset S} \frac{1}{Edge(T, S - T) + k - 1} - \int_0^1 g_{T, k + Edge(T, S - T)} \text{d} x \\
= \sum_{1 \in T \subset S} \frac{1}{Edge(T, S - T) + k - 1} - G_{T, k + Edge(T, S - t)}$$

这样就可以递推了。

实现时根据 Edge 函数计算方式不同，复杂度为 $O(2^nm)$ 或 $O(2^nnm)$

## Code

```cpp
int n, m;
int mp[MAXN];
namespace solver1 {
  double f[1 << MAXN | 1][MAXN * MAXN];
  int bitcount(int x) {
    int ans = 0;
    while(x) {
      ans += x & 1;
      x >>= 1;
    }
    return ans;
  }
  int edges(int mask1, int mask2) {
    int ans = 0;
    for (int i = 0; i < n; i++) {
      if (mask1 & (1 << i)) {
        ans += bitcount(mp[i] & mask2);
      }
    }
    return ans;
  }
  void main() {
    for (int s = 3; s < (1 << n); s += 2) {
      int ss = s - 1;
      for (int k = 0; k <= m; k++) {
        for (int tt = (ss - 1) & ss; ; tt = (tt - 1) & ss) {
          int t = tt | 1;
          int e = edges(t, s - t);
          f[s][k] += 1.0 / (1 + e + k) - f[t][k + e];
          if (tt == 0) break;
        }
      }
    }
    printf("%.6lf\n", f[(1 << n) - 1][0]);
  }
}
int main() {
  scanf("%d%d", &n, &m);
  for (int i = 1; i <= m; i++) {
    int u, v;
    scanf("%d%d", &u, &v);
    u--, v--;
    mp[u] |= 1 << v;
    mp[v] |= 1 << u;
  }
  solver1::main();
}
```

## Reference

主要思路来自 https://www.luogu.org/blog/user7868/solution-p3343


<!--- notes 
这道题，luogu 题解板块内容值得一看。
个人认为这篇仅作为回顾，不宜发布。
一是 blog 的多行公式排版很乱，二是本身原题解讲的很好，没有做太多补充。
（感觉很多地方讲得太草率，不是高质量的题解所需要的。）
--->
