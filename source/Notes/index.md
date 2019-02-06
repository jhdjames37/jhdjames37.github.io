---
title: Notes
date: 2017-10-12 08:55:08
mathjax: true
---

这里将会写一些零碎的东西 ( 没有必要放到 post 里的 )

## 一些记录

2019.2.6：更新关于 category 和 tag 的说明，将所有文章进行更新。

2018.10.6: 修了关于 theme assets 的小锅。另外添加了多地部署所需要的通过更改修改时间更新文章列表顺序（~~似乎可以手动置顶了。。。~~）

2018.10.2: 关于多地部署：

由于直接使用 `npm install` 会出锅，将能够成功渲染的 `nodes_modules` 的文件夹备份：

> 链接: https://pan.baidu.com/s/1EwwpW_gvqsQXm468Fjzvwg 提取码: yhx7

2018.9.23-24: 增加了 gitment，添加友链入口，更新背景（依然来自 Pilotseye）

2018.6.3: 看到了一些[关于中文排版的问题的建议标准](https://mazhuang.org/wiki/chinese-copywriting-guidelines/)，要将所有的文章重新排版。

2018.4.15 添加标题样式说明。

**2018.4.12: 请注意，2 月，3 月，4 月的好题总结以及其它总结应该在二试之前补充完毕（周末，休息时间），最晚不超过 CTSC/APIO。**

2018.4.10: 更换主题至 tranquilpeak。

2018.1.13: 调整主题显示样式。

banner 来源： [pilotseye 背景](http://pilotseye.tv/en/download-wallpapers/)

1.24: 
删除私人性总结（不适合公开发布）。
添加文章管理插件 (hexo-admin)
`npm install hexo-admin`

## 关于文章标题

考虑到编码问题，将尽量避免使用中文，转而使用英文翻译。

对于题解来说，因为英文名不一定存在，可能会使用拼音（未定）。

尽量不在 URL 中使用 OJ 编号（未定）

在标题中应尽量提供多个 OJ 的题号，以供参考（暂时提供 UOJ/LOJ/luogu/BZOJ 题号 , 按 OJ 字典序排列 BZOJ/LOJ/luogu/UOJ（我不是故意的。。。））

效果不会太差（主题支持长标题）

Reference：https://ruanx.pw/bzojch/bzojno.html

## 关于 category & tag

Last UPD: 2019.02.06

category 的大致想法
- oi 系列（全部都不加 s 算了。。。）
  - review：以游记为主
  - algorithm：纯算法
  - solution：题解（包括联合题解、线上比赛总结）
- 其它之后再说.

tags
- oi 这边的 tags
  - 对于比赛 - 赛事类型
    - NOIP/NOI/WC/icpc（所有该赛制的比赛，把原来的 acm 改回来吧。。。）/...
    - CF/TC/ATC/...
  - 相关知识点 ...（关于加不加 s 。。。 难说。。。要不直接只有 general 和必须加 s 的加 s）
    - 对于联合总结，这一项要不就不填了。。。
- 其它之后再说.

---

## 关于 Mathjax

Mathjax 用法 : http://blog.csdn.net/zoe_su/article/details/52506219

Mathjax test: ( 加载速度较慢 , 但已经能够正确识别 .)

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

并在 `_config.yml` 后添加 :
``` yml
mathjax:
  cdn: https://cdn.bootcss.com/mathjax/2.7.2/MathJax.js?config=TeX-AMS-MML_HTMLorMML
```

修改 : ([参考](http://www.cnblogs.com/Ai-heng/p/7282110.html)

``` javascript /node_modules/kramed/lib/rules/inline.js
//escape: /^\\([\\`*{}\[\]()#$+\-.!_>])/,      第 11 行，将其修改为
escape: /^\\([`*\[\]()#$+\-.!_>])/,
//em: /^\b_((?:__|[\s\S])+?)_\b|^\*((?:\*\*|[\s\S])+?)\*(?!\*)/,    第 20 行，将其修改为
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

易错点及注意点 :
1. 划关键词 .
2. 注意表达式 : 等于还是不等于 , `if..else` 还是 `if`.
3. 输出格式 ( 逗号 !! 小于等于号 , 不等号的写法 )
4. 不要抄错变量名 , 注意数组是从 0 开始还是 1 开始 , 是闭区间还是左闭右开区间 .
5. 注意变量和常量 .
6. 注意 idx, rank 数组的作用
7. 注意指针和指针指向值 .


