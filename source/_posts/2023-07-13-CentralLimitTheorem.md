---
title: 中心极限定理
date: 2023-07-13 12:00:10
tags:
- math
---

（博客重启之后的第一篇正式文章）

最近 [3B1B](https://space.bilibili.com/88461692/) 在研究卷积、中心极限定理这些方面的问题。趁着他还没更完，写一个按照现有思路证明的 CLT。

<!-- more -->

## 回顾

### 概率论中的定理

后面 $P_X$ 表示随机变量 $X$ 的概率密度函数，$\mu_X$ 为期望，$\sigma_X^2$ 为方差。

$P_{X+Y} = P_X * P_Y$ （卷积定理，要求变量独立）

$\mu_{X+Y} = \mu_X + \mu_Y$（期望的线性性，不要求变量独立）

$\sigma_{X+Y}^2 = \sigma_{X}^2 + \sigma_{Y}^2$（要求变量独立，不独立的情况需要加上协方差）

不过后面的讨论均是基于独立同分布的变量。

中心极限定理（不严格的叙述）：$n$ 个独立同分布(iid)变量求和，当 $n \rightarrow \infty$ 时，其概率分布趋近于与其相同 $\mu, \sigma^2$ 的正态分布。

概率密度的归一化：使期望归一化是平凡的。设 $p(x)$ 期望为 $0$, 方差为 $\sigma^2$。则将其方差归一化为 $1$ 则相应的概率密度函数为 $\sigma p(\sigma x)$（证明只需计算 积分为 1，方差为 1 即可）。

### 卷积相关（信号处理原理限定）

Fourier Transform: $\mathcal{F}[f(t)] = \int_{-\infty}^{+\infty} f(t) e^{-i\omega t} \,\mathrm{d}t$

FT 的卷积定理：$\mathcal{F}[f * g] = \mathcal{F}[f] \cdot \mathcal{F}[g]$。

FT 具有线性性。

FT 的压缩特性：若 $\mathcal{F}[f] = F$，则 $\mathcal{F}[f(at)] = \frac{1}{|a|}F(\frac{\omega}{a})$。

## 证明

不妨假设我们研究的随机变量 $\mu = 0, \sigma^2 = 1$，概率密度函数为 $p(x)$，$\mathcal{F}(p) = P$。

而 $P(\omega) = \int_{-\infty}^{+\infty}p(x) e^{-i \omega x} \,\mathrm{d} x$，Taylor 展开得到 $P(\omega) = \int_{-\infty}^{+\infty} \sum_{k=0}^{+\infty} p(x) \frac{(-i \omega x)^k}{k!} \,\mathrm{d} x = \sum_{k=0}^{+\infty} \frac{(-i \omega)^k}{k!}  \int_{-\infty}^{+\infty} p(x) x^k \,\mathrm{d} x$。

注意到 $\int_{-\infty}^{+\infty} p(x) \,\mathrm{d}x = 1$，$\int_{-\infty}^{+\infty}p(x) x \,\mathrm{d} x = \mu = 0$, $\int_{-\infty}^{+\infty}p(x) x^2 \,\mathrm{d} x = \sigma^2 = 1$，则 $P(\omega) = 1 - \frac{\omega^2}{2} + \sum_{k=3}^{+\infty}\frac{(-i\omega)^k}{k!} \int_{-\infty}^{+\infty} p(x) x^k \,\mathrm{d} x$


则根据之前的定理，我们有对于 $n$ 个随机变量的和，$\mu = 0, \sigma = \sqrt{n}$。

同时，概率密度函数为 $p^{*n}(x)$ （进行了 $n$ 次卷积）。因此我们可以将其归一化为 $p_n(x) := \sqrt{n} p^{*n}(\sqrt{n} x)$。

对其进行 Fourier 变换，利用上面提到的运算性质，计算得到 $\mathcal{F}(p_n) = P(\omega/\sqrt{n})^n = \left( 1-\frac{\omega^2}{2n} + o(\frac{1}{n}) \right)^n$（固定 $\omega$），自然当 $n \rightarrow +\infty$ 时 $\mathcal{F}(p_n)(\omega) \rightarrow e^{-\omega^2/2} = \mathcal{F}(\frac{1}{\sqrt{2 \pi}} e^{-x^2/2})$。

---

3B1B 这一系列视频是从 FT 的卷积定理开始讲起，并提到了中心极限定理。所以说严谨的证明可能会长这个样（我尽可能保持了严谨性，可能会有一些漏洞，比如说积分的收敛性）。不过期待能否整出一些更加有趣的可视化理解。

