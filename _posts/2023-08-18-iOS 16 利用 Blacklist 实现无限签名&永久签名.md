---
title: 'iOS 16 利用 Blacklist 实现无限签名&永久签名'
layout: post
---

▎**推送简介：**`Blacklist` 本身针对移除安装的应用打开闪退/不再可用的情况，但在网友的研究下也可以解决安装应用时的签名检测问题。

▎**支持系统：**

- 支持 iOS 14 – iOS 15.7.1 系统。
- 支持 iOS 16.0 – iOS 16.1.2 系统。

▎**准备工作：**先将 [Blacklist](https://www.machunjie.com/go/?url=https://appinstallerios.com/TrollStoreIPAs/Blacklist.ipa) 安装到你的 `iPhone`/`iPad` 设备上(可利用 [AltStore](https://www.machunjie.com/go/?url=https://altstore.io/)/[Sideloadly](https://www.machunjie.com/go/?url=https://sideloadly.io/)/[SideStore](https://www.machunjie.com/go/?url=https://sidestore.io/)/[爱思助手](https://www.machunjie.com/go/?url=https://m.i4.cn/article/38195.html)/[牛蛙助手](https://www.machunjie.com/go/?url=https://ios222.com/)/[轻松签](https://www.machunjie.com/go/?url=https://esign.yyyue.xyz/)/[Scarlet](https://www.machunjie.com/go/?url=https://usescarlet.com/)/等签名工具)

▎**操作教程：**

1. 按照[https://short.machunjie.com/DGjH4](https://short.machunjie.com/DGjH4)把IPA文件传上去
2. 准备按照上述指导在线安装
3. 当下载完成`3/4`的时候，也就是“`正在载入..`.”快要变成“`正在安装...`”时，开启`飞行模式`，等待安装完成。
4. 打开一下这个应用，会出现闪退
5. 打开 `Blacklist` 修复一下，再去设置里面信任一下对应的证书。

以下是网友分享：

省流：看倒数第二段

我这两天执着于`sidestore`突破`3个app`限制，结果发现本末倒置了。

首先，我用`mac`直接安装`mac`版的`sidestore`，啥都不用设置，直接点一下就安装到手机里了。

其次，用`wireguard`我们是可以实现脱离电脑自签的，也就是说只需要第一步用电脑安装`side`，之后，只需要在手机上打开`wire`点击一下，然后用`side`一键续签就行了。

最后，也是最最最最最重要的一点，我用一个过期的证书，安装了一个签名软件（具体操作是，某网站的蓝奏盘里有很久前证书已经过期了的轻松签，但是你点击下载，它就会提示你安装)，在“正在加载四个字变成“正在安装的时候（基本在进度的`3/4`处），我打开飞行模式，等安装完毕以后，我就得到了一个彩色图标的闪退软件。此时我用`blacklist`(修复证书的那个软件，这个是用`sidestore`签的)直接修复，然后去设置里面找到证书点验证，ok，这个用过期证书安装的软件可以使用了。我重启了很多次， 仍然可以正常打开，暂时不知道失效的机制，也没碰到过失效。所以利用这个机制，我们就已经可以无限签名了，还执着于突破3个限制干啥的~
