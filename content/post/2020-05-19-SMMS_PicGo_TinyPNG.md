---
title: 使用 SM.MS 图床
date: 2020-05-19
authors:
    - noodler
categories:
    - 日志
    - 软件
tags:
    - 图床
    - SM.MS
    - PicGo
    - TinyPNG
---

> 我做了一张思维导图在上一篇文章，原图下来14M，试了一下截图保存也有将近6M，直接放到 Netlify 上基本打不开，所以当下最迫切的需求就是找一个图片压缩工具和图床。

## TinyPNG

`.png` 格式的图片能保留截图周围的阴影效果，实在太爱了，所以很自然就找到了[`TinyPNG`](https://tinypng.com)。

[kyleduo](https://github.com/kyleduo) 大神做了一个调取 [`TinyPNG API`](https://tinypng.com/dashboard/api) 的应用。

### 安装

```zsh
brew cask install tinypng4mac
```

### 使用

只需要设置好 [`Token`](https://tinypng.com/dashboard/api) 和下载路径直接拖拽就可以了，贼简单！

![](https://i.loli.net/2020/05/19/pkmWOTBq1o3uhsV.png)

## SM.MS

图床之前一直用的 `七牛云`，后来它开始要备案域名，因为户口等等原因网警一直没给我通过。后来用了腾讯 `COS`，然后就开始收费了。

于是找了一下介绍，决定用 [`SM.MS`](https://sm.ms/)。

## PicGo

图床工具使用 [`PicGo`](https://github.com/Molunerfinn/PicGo)。

### 安装

```zsh
brew cask install picgo
```

搜索 [`smms-user`](https://github.com/xlzy520/picgo-plugin-smms-user) 插件并安装。

### 使用

拿到 `SM.MS` 的 [`Token`](https://sm.ms/home/apitoken)，简单配置一下就可以轻松使用了。

![](https://i.loli.net/2020/05/19/YrViZpIkjbXwnM1.png)
