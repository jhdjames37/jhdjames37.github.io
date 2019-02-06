title: 集合卷积
author: jhdjames37
categories:
  - oi
  - algorithm
tags:
  - math
  - FWT
date: 2018-01-24 21:43:00
---
集合卷积。

（前置知识 : 准备一份 2015 年国家集训队论文，翻到最后一篇文章。）

<!--- more --->

例题： [CF914G](http://codeforces.com/contest/914/problem/G)

显然令 $f_1(S)=fib_{S}\sum_{A \in 2^U}\sum_{B \in 2^U} [A \cap B = \varnothing][A \cup B = S] cnt_A cnt_B, \\
f_2(S)=fib_{S} cnt_S, \\
f_3(S)=fib_{S}\sum_{A \in 2^U}\sum_{B \in 2^U} [A \oplus B = S] cnt_A cnt_B, \\
f(S)=\sum_{A \in 2^U}\sum_{B \in 2^U}\sum_{C \in 2^U} [A \cap B \cap C = S] f_1(A) f_2(B) f_3(C)$
其中 $A, B, C, S$ 均为用二进制表示的集合。$fib_i, cnt_i$ 分别表示第 i 项 fibnacci 数和读入中 i 的个数 , $2^U$ 表示所有二进制集合的集合。
则答案 =$\sum_{i=0}^{16} f(2^i)$

这时，暴力转移是 $O(4^n)$ 的 ($f_1$ 利用子集枚举法可以优化到 $O(n^3)$).

我们来分别考虑一下每一个函数的优化。
( 注意：部分公式的表示形式和表述方式与论文中不同，请注意区分 )

## 集合并卷积

(OR Convolution, 参考论文 P273)

首先考虑 $h_S = \sum_{A \in 2^U}\sum_{B \in 2^U}[A \cup B = S] f_A g_B$, 记做 $h = f | g$
定义 $\hat{f_S} = \sum_{T \subseteq S} f_T$（Mobius 变换）
则 $\hat{h_S} = \sum_{A \in 2^U} \sum_{B \in 2^U} [A \cup B \subseteq S] f_A g_B \\
= \sum_{A \subseteq S} \sum_{B \subseteq S} f_A g_B \\
= (\sum_{A \subseteq S} f_A) (\sum_{B \subseteq S} g_B) \\
= \hat{f_S} \hat{g_S}$

此时计算复杂度变为为 $O(2^n)$.

考虑 $f_S$ 与 $\hat{f_S}$ 的转化（快速 Mobius 变换， FMT）：

考虑 $g_{S, i} = \sum_{T \subseteq S, S - T \subseteq \{1, 2, \ldots i\}} f(T)$, 即 $\forall x \in S 且 x \in [i + 1, n], x \in T$. 则由定义得 $g_{S, 0} = f_S, g_{S, n} = \hat{f_S}$, 那么我们考虑如何转移。若 $i \in S$, 对于所有满足条件的 $T$, 若 $i \in T$, 则会在 $g_{S, i - 1}$ 被计算到， 反之会在 $g_{S - \{i\}, i - 1}$ 被计算，所以 $g_{S, i} = g_{S, i - 1} + g_{S - \{i\}, i - 1}$, 若 $i \notin S$, 则只有 $g_{S, i} = g_{S, i - 1}$

同样，也可以利用上面的递推式从 $\hat{f_S}$ 反推出 $f_S$。复杂度均为 $O(n2^n)$

另外，根据容斥原理，$f_S=\sum_{T \subseteq S} (-1)^{|S|-|T|} \hat{f_T}$。 ( 这个式子在算法中并不需要 )

这样我们就可以用 $O(n2^n)$ 的时间求解这个问题。

接下来我们来看例题中第一个子问题。

## 不相交集合并卷积

(Subset Convolution, 论文 P281)

形式同 $f_1$: $h_S=\sum_{A \in 2^U}\sum_{B \in 2^U} [A \cap B = \varnothing][A \cup B = S] f_A g_B$,

可以发现原式的限制可以转化为 $|A| + |B| = |S|, A \cup B = S$.

后半部分为集合并卷积。则我们只需要再加一维状态记录集合大小。

即设 $F_{i, S} = \begin{cases} f_S, &|S|=i \\ 0, &\text{otherwise} \end{cases}$


那么原式可以写做 $H_i = \sum_{j + k = i}F_j | G_k$

则 $h_S = H_{|S|, S}$

其中枚举 $i,j,k$ 是 $O(n^2)$ 的，右侧集合并卷积为 $O(2^n)$（当然要先预处理每一个 $F_i$ 的莫比乌斯变化），所以总复杂度 $O(n^2 2^n)$

## 集合交卷积

(AND Convolution)

$
h_S=\sum_{L \in 2^U} \sum_{R \in 2^U} [L \cap R = S]f_L g_R
$, 记做 $h = f \& g$

( 对应原式就是计算 $f = f_1 \& f_2 \& f_3$)

这一部分论文中没有，因为其不满足论文中所限定的 $S \text{ opt } \varnothing = S$（见 P273）（集合交仅满足 $S \text{ opt } U = S$， U 为全集）

但是实际上其推导过程与集合并卷积相类似：

设 $\hat{f_S}=\sum_{T \supseteq S} f_T$
则 $f_S=\sum_{T \supseteq S} (-1)^{|T| - |S|}\hat{f_T}$

则 $\hat{h_S}=\sum_{L \in 2^U} \sum_{R \in 2^U} [S \subseteq L \cap R]f_Lg_R \\
=(\sum_{L \supseteq S}f_L)(\sum_{R \supseteq  S} g_R) \\
= \hat{f_L} \hat{g_R}$

计算 $\hat{f_S}$:
( 设 $g_{S,i}= \sum_{T \supseteq S, T - S \subseteq \{1, 2, \ldots, i\}} f_T, g_{S,n}= {\hat{f_S}}, g_{S, 0}=f_S$)
$$g_{S,i} = \begin{cases} g_{S, i-1} , &i \in S \\ g_{S, i-1} + g_{S \cup \{i\}, i-1 }, &i \notin S \end{cases}$$

复杂度同样为 $O(n2^n)$

## 集合对称差卷积

（XOR Convolution, 论文 P277）

计算 $f_3$:$h_S= \sum_{A \in 2^U}\sum_{B \in 2^U} [A \oplus B = S] f_A g_B$, 也就是 A，B 的（二进制表示的）异或和等于 S.

首先我们有 $\sum_{T \in 2^U}(-1)^{|S \cap T|} = [s = \varnothing] 2^n$ ( 证明参见论文 )

另外，$(-1) ^ {|S \cap (A \oplus B)|} = (-1) ^ {|S \cap A| + |S \cap B|}$, 即二者奇偶性相同，可以通过画图简单验证。

定义 Walsh 变换 $\hat{f_S} = \sum_{T \in 2^U} f_T (-1)^{|S \cap T|}$ 及其逆变换 $f_S = \frac{1}{2^n} \sum_{T \in 2^U} \hat{f_T} (-1)^{|S \cap T|}$。
可将 Walsh 变换回代并利用上面的公式来证明逆变换正确性。

然后我们就能得到：

$\hat{h_S} = \sum_{T \in 2^U} h_T (-1)^{|S \cap T|} \\
= \sum_{T \in 2^U} (-1) ^ {|S \cap T|} \sum_{A \in 2^U} \sum_{B \in 2^U} [A \oplus B = T] f_A g_B \\
= \sum_{A \in 2^U} \sum_{B \in 2^U} f_A g_B (-1)^{|S \cap (A \oplus B)|}  \\
= \sum_{A \in 2^U} \sum_{B \in 2^U} f_A g_B (-1)^{|S \cap A| + |S \cap B|} \\
= (\sum_{A \in 2^U} f_A (-1)^{|S \cap A|})(\sum_{B \in 2^U} g_B (-1)^{|S \cap B|}) \\
= \hat{f_S} \hat{g_S}$

然后考虑如何进行 Walsh 变换（逆变换只需要除以 $2^n$ 或乘上其逆元）

和前面同样的思路，设 $g_{S,i}= \sum_{T \in 2 ^ U, T \oplus S \subseteq \{1, 2, \ldots, i\}} f_T(-1)^{|S \cap T|}, g_{S,n}= {\hat{f_S}}, g_{S, 0}=f_S$)

则当 $i \notin S$ 时， $g_{S, i} = g_{S \cap \{i\}, i - 1} (i \in T) + g_{S, i - 1} (i \notin T)$; 
当 $i \in S$ 时， $g_{S, i} = g_{S - \{i\}, i - 1}(i \notin T) - g_{S, i - 1}(i \in T)$.

如果不理解负号原因（至少我一开始是如此）, 可以参考[Wikipedia 上](https://en.wikipedia.org/wiki/Fast_Walsh%E2%80%93Hadamard_transform) 的[这张图片](https://en.wikipedia.org/wiki/Fast_Walsh%E2%80%93Hadamard_transform#/media/File:Fast_walsh_hadamard_transform_8.svg)。下面给出我的理解。

考虑到最终状态，$\sum_{T \in 2^U} f_T (-1)^{|S \cap T|}$, 则我们分解 $(-1)^{|S \cap T|}$, 就会发现相当于是当 $i \in S 且 i \in T$ 时将答案 ×(-1)。

而从另一个角度来看，我们考虑如果根据 $g_{S, i}$ 的定义 ,$g_{S, 0}$ 应该为 $f_S (-1)^{|S|}$, 而实际上的初始值为 $f_S$, 则此时就会对答案造成影响。而 Walsh 变换就可以通过这一正负号弥补这一影响。

另外，可以将 $f_S$ 看作 n 维数组 $f_{a_1, a_2, \cdots, a_n}, a_i \in \{0, 1\}$, 根据卷积定理（可以参考 WC2018 营员交流），则可以对每一维分别进行一次变换。我们采用 DFT 作为变换，则也可以推出上述式子。

那么我们也能在 $O(n2^n)$ 时间内解决这个问题。

---

那么现在我们已经解决这道题目了， 总复杂度 $O(n^22^n)$。

在具体代码实现上，可以（也普遍）采用滚动数组，而且这些转移都是独立的，所以在转移时并不需要刻意改变枚举顺序。

--THE END--

<!-- change log
2018.2.18 根据 zrf 课件内容做出修订。
-->
