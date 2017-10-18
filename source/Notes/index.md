---
title: Notes
date: 2017-10-12 08:55:08
mathjax: true
---

这里将会写一些零碎的东西(没有必要放到post里的)

## 关于category & tag

category 的大致想法
- oi系列
  - reviews & plans
  - algorithms & data structures
  - solutions
- 其它之后再说.

tags
- oi这边的tags
  - review
  - plan
  - 相关知识点...
- 其它之后再说.

---

## 关于Mathjax

Mathjax 用法: http://blog.csdn.net/zoe_su/article/details/52506219

Mathjax test: (加载速度较慢, 但已经能够正确识别.)

123 $\sigma$ 344

$G(i) = \sum_{i=0}^{a_1}(-1)^i\cdot \sum_{i = 0}^{a_2} (-1)^i \cdot \ldots$

$$
\sigma 
\frac{\partial u}{\partial t} = h^2 \left( \frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} + \frac{\partial^2 u}{\partial z^2}\right)
\sum_{i = 1}^{n} a_i
$$

233
``` bash
npm uninstall hexo-renderer-marked
npm install hexo-renderer-kramed
npm install hexo-renderer-mathjax2
```

并在`_config.yml`后添加:
``` yml
mathjax:
  cdn: https://cdn.bootcss.com/mathjax/2.7.2/MathJax.js?config=TeX-AMS-MML_HTMLorMML
```

修改: ([参考](http://www.cnblogs.com/Ai-heng/p/7282110.html)

``` javascript /node_modules/kramed/lib/rules/inline.js
//escape: /^\\([\\`*{}\[\]()#$+\-.!_>])/,      第11行，将其修改为
escape: /^\\([`*\[\]()#$+\-.!_>])/,
//em: /^\b_((?:__|[\s\S])+?)_\b|^\*((?:\*\*|[\s\S])+?)\*(?!\*)/,    第20行，将其修改为
em: /^\*((?:\*\*|[\s\S])+?)\*(?!\*)/,
```
---
## About Modifying Theme

Reference: [Fonts](http://www.jianshu.com/p/ffcdc4fec6ec) [Others](http://www.jianshu.com/p/b96fd206571a) [Details of Theme](http://blog.csdn.net/shi0090/article/details/48087353)

---

git deployment
``` bash
npm install hexo-deployer-git --save
```
---

## 关于初赛

易错点及注意点:
1. 划关键词.
2. 注意表达式: 等于还是不等于, `if..else` 还是`if`.
3. 输出格式(逗号!! 小于等于号, 不等号的写法)
4. 不要抄错变量名, 注意数组是从0开始还是1开始, 是闭区间还是左闭右开区间.
5. 注意变量和常量.
6. 注意idx, rank数组的作用
7. 注意指针和指针指向值.


