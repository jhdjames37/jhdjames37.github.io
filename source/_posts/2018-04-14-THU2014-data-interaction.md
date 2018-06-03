---
title: UOJ268 - 【清华集训 2016 】数据交互
date: 2018-04-03
categories:
- oi
- solutions
tags:
- trees
- UOJ
- segment tree
- heavy-light decomposition
---

## 题意：
给出一棵树，有 $m$ 次操作，每次操作为标记一条路径并给它一个权值，或删除一个标记。每次操作后找出一条路径，使得其经过的标记过的路径的权值和最大 ( 一条路径经过另一条路径当且仅当这两条路径有公共点 )， 输出最大的权值和。 $n, m \le 10 ^ 5$.

<!--- more --->

## 题解：

首先考虑如何计算一条路径的答案（权值和）：

考虑这条路径的 LCA L 点（即端点的 LCA）， 则一条标记过的路径对这条路径有贡献有两种情况：
1. 标记过的路径经过 L 点
2. 标记过的路径的 LCA 在这条路径上。

那么我们设 $cov_i$ 为经过 i 点且 LCA 不为 i 点的标记路径权值和，$cnt_i$ 为 LCA 为 i 点的标记路径权值和。那么我们可以发现这个问题和树的直径有些类似： 设 $f_i = \max_{v \in son_i} f_v + cnt_i$, 则 LCA 为 i 点的路径的权值和的最大值为 $val_i = cov_i + cnt_i + \max_{j, k \in son_i j \neq k} f_j + f_k$ 则我们只需要维护 $\max val_i$ 即可。

考虑树链剖分：发现 $val_i$ 本质上就是一条 LCA 为 i 的路径上点的 $cnt_i$ 之和 $+cov_i$。考虑 LCA 所在的重链，则容易发现每一条路径都可以被拆分成 3 段：由轻边引出的一段 + 重链的一部分 $u, v$ + 由轻边引出的一段。分别设这三段 $cnt$ 之和为 $g_u$, $w_{u, v}$, $g_v$, 其中 $dfn_u \le dfn_v$, 即 u 为 LCA。则答案为 $\max g_u + cov_u + w_{u, v} + \max g_v$。但是当 $u = v$ 时， $g_v$ 要取第二大的。

最后考虑如何维护： 对于每一条重链分别建立线段树，用类似最大子段和的方式维护答案。同时对每一个结点维护一个堆（因为要支持删除，所以需要两个 `std::priority_queue`， 其中一个存放删除的内容。取最大值的时候如果两个堆顶元素相同，就同时 $pop$( 也许可以使用 `std::multiset`?)）， 维护轻边上的 $g_i$ 的最大值。每次修改的时候，先修改路径上的 cov 以及 LCA 上的 cnt 值。同时将路径上的以及 LCA 到根节点的 g 值更新。

## Code

```cpp
int n, m;
struct Edge {
  int v, next;
}edge[MAXN << 1];
int head[MAXN], tail;
void insert(int u, int v) {
  edge[++tail] = (Edge) {v, head[u]}; head[u] = tail;
}
namespace solver1 {
  namespace heavy_light {
    struct Heap {
      std::priority_queue <LL> p, q;
      void push(LL x) {
        p.push(x);
      }
      void pop(LL x) {
        q.push(x);
      }
      LL top() {
        while(q.size() && p.top() == q.top()) p.pop(), q.pop();
        return p.top();
      }
      std::pair<LL, LL> top2() {
        LL x = top(), y = 0;
        p.pop();
        while(q.size() && p.size() && p.top() == q.top()) p.pop(), q.pop();
        if (p.size()) y = p.top();
        p.push(x);
        return std::make_pair(x, y);
      }
    }h[MAXN], ans;
    LL last[MAXN];
    int dfn[MAXN], clk;
    int fa[MAXN], son[MAXN], top[MAXN], sz[MAXN], dep[MAXN];
    int len[MAXN];
    namespace seg_tree {
      const int SIZE = MAXN << 1;
      struct Node {
        int ls, rs;
        LL ans, maxl, maxr, maxsub, tot;
        LL tag;
      }tree[SIZE];
      int root[MAXN], cnt;
      int rangel[MAXN], ranger[MAXN];
      void build(int& node, int l, int r) {
        node = ++cnt;
        if (l == r) return;
        int mid = (l + r) >> 1;
        build(tree[node].ls, l, mid);
        build(tree[node].rs, mid + 1, r);
      }
      void init() {
        for (int i = 1; i <= n; i++) {
          if (top[i] == i) {
            build(root[i], rangel[i] = dfn[i], ranger[i] = dfn[i] + len[i] - 1);
          }
        }
      }

      void addtag(int node, LL val) {
        tree[node].tag += val;
        tree[node].maxr += val;
        tree[node].maxsub += val;
        tree[node].ans += val;
      }
      void pushdown(int node) {
        Node &u = tree[node];
        if (u.tag) {
          addtag(u.ls, u.tag);
          addtag(u.rs, u.tag);
          u.tag = 0;
        }
      }
      void update(int node) {
        Node &u = tree[node];
        u.maxl = std::max(tree[u.ls].maxl, tree[u.ls].tot + tree[u.rs].maxl);
        u.maxr = std::max(tree[u.rs].maxr, tree[u.rs].tot + tree[u.ls].maxr);
        u.tot = tree[u.ls].tot + tree[u.rs].tot;
        u.maxsub = std::max(tree[u.ls].maxsub, tree[u.rs].maxsub);
        u.ans = std::max(std::max(tree[u.ls].ans, tree[u.rs].ans), std::max(tree[u.ls].maxr + tree[u.rs].maxl, u.maxsub));
      }
      int ql, qr, p, val;
      std::pair <LL, LL> val2;
      void _modify1(int node, int l, int r) {
        if (ql <= l && r <= qr) {
          addtag(node, val);
          return;
        }
        pushdown(node);
        int mid = (l + r) >> 1;
        if (ql <= mid) _modify1(tree[node].ls, l, mid);
        if (qr > mid) _modify1(tree[node].rs, mid + 1, r);
        update(node);
      }
      void modify1(int rt, int l, int r, int w) {
        if (top[rt] != rt) throw;
        if (fa[rt]) h[fa[rt]].pop(tree[root[rt]].maxl);
        ans.pop(tree[root[rt]].ans);
        
        ql = l, qr = r, val = w;
        _modify1(root[rt], rangel[rt], ranger[rt]);
        
        if (fa[rt]) h[fa[rt]].push(tree[root[rt]].maxl);
        ans.push(tree[root[rt]].ans);
      }

      void _modify2(int node, int l, int r) {
        if (l == r) {
          tree[node].tot += val;
          tree[node].maxl += val;
          tree[node].maxr += val;
          tree[node].ans += val;
          tree[node].maxsub += val;
          return;
        }
        pushdown(node);
        int mid = (l + r) >> 1;
        if (p <= mid) _modify2(tree[node].ls, l, mid);
        else _modify2(tree[node].rs, mid + 1, r);
        update(node);
      }
      void modify2(int rt, int pos, int w) {
        if (top[rt] != rt) throw;
        if (fa[rt]) h[fa[rt]].pop(tree[root[rt]].maxl);
        ans.pop(tree[root[rt]].ans);

        p = pos, val = w;
        _modify2(root[rt], rangel[rt], ranger[rt]);
        
        if (fa[rt]) h[fa[rt]].push(tree[root[rt]].maxl);
        ans.push(tree[root[rt]].ans);
      }

      void _modify3(int node, int l, int r) {
        if (l == r) {
          tree[node].maxsub = val2.first + val2.second + tree[node].tot + tree[node].tag;
          tree[node].maxl = tree[node].tot + val2.first;
          tree[node].maxr = tree[node].tot + tree[node].tag + val2.first;
          tree[node].ans = tree[node].maxsub;
          return;
        }
        pushdown(node);
        int mid = (l + r) >> 1;
        if (p <= mid) _modify3(tree[node].ls, l, mid);
        else _modify3(tree[node].rs, mid + 1, r);
        update(node);
      }
      void modify3(int rt, int pos, std::pair<LL, LL> w) {
        if (top[rt] != rt) throw;
        if (fa[rt]) h[fa[rt]].pop(tree[root[rt]].maxl);
        ans.pop(tree[root[rt]].ans);

        p = pos, val2 = w;
        _modify3(root[rt], rangel[rt], ranger[rt]);
        
        if (fa[rt]) h[fa[rt]].push(tree[root[rt]].maxl);
        ans.push(tree[root[rt]].ans);
      }
      
    }
    
    void dfs1(int u, int f) {
      fa[u] = f;
      sz[u] = 1;
      dep[u] = dep[f] + 1;
      int max_son = 0;
      for (int i = head[u]; i; i = edge[i].next) {
        int v = edge[i].v;
        if (v == f) continue;
        dfs1(v, u);
        sz[u] += sz[v];
        if (max_son < sz[v]) {
          son[u] = v;
          max_son = sz[v];
        }
      }
    }
    void dfs2(int u, int t) {
      dfn[u] = ++clk;
      top[u] = t;
      len[t]++;
      if (u == t) ans.push(0);
      if (son[u]) {
        dfs2(son[u], t);        
      }
      for (int i = head[u]; i; i = edge[i].next) {
        int v = edge[i].v;
        if (v == fa[u] || v == son[u]) continue;
        dfs2(v, v);
        h[u].push(0);
      }
    }
    void init() {
      dfs1(1, 0);
      dfs2(1, 1);
      seg_tree::init();
    }
    void modify(int u, int v, int w) {
      while(top[u] != top[v]) {
        if (dep[top[u]] < dep[top[v]]) std::swap(u, v);
        seg_tree::modify1(top[u], dfn[top[u]], dfn[u], w);
        u = fa[top[u]];
        seg_tree::modify3(top[u], dfn[u], h[u].top2());
      }
      if (dep[u] > dep[v]) std::swap(u, v);
      if (u != v) seg_tree::modify1(top[u], dfn[u] + 1, dfn[v], w);
      seg_tree::modify2(top[u], dfn[u], w);
      for (u = top[u]; fa[u]; u = top[fa[u]]) {
        seg_tree::modify3(top[fa[u]], dfn[fa[u]], h[fa[u]].top2());
      }
    }
    LL query() {
      return ans.top();
    }
  }
  int a[MAXN], b[MAXN], c[MAXN];
  void main() {
    heavy_light::init();
    for (int i = 1; i <= m; i++) {
      char buff[10];
      scanf("%s", buff);
      if (buff[0] == '+') {
        scanf("%d%d%d", a + i, b + i, c + i);
        heavy_light::modify(a[i], b[i], c[i]);
      } else {
        int t;
        scanf("%d", &t);
        heavy_light::modify(a[t], b[t], -c[t]);
      }
      printf("%lld\n", heavy_light::query());
    }
  }
}
```
