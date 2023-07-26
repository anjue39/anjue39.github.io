---
title: '保姆教程 OpenWrt 配置 Cloudflare DDNS'
layout: post
---
自从dnspod封禁了我的域名，之后注册的域名都由Cloudflare解析了，所以OpenWrt DDNS也首选Cloudflare了，当然前提是自己已经拿到了公网IP。

1、**获取Cloudflare ddns的OpenWrt软件包**

检查自己的动态DNS中DDNS的服务商中是否有Cloudflare.com-v4

![https://keesenz.com/wp-content/uploads/2020/09/Cloudflare-openwrt-700x443.png](https://keesenz.com/wp-content/uploads/2020/09/Cloudflare-openwrt-700x443.png)

如果有直接进入下一步，如果没有，在软件包中搜索Cloudflare.com-v4可添加，如果搜索结果为空，添加软件源：

src-git lienol https://github.com/Lienol/openwrt-package

2、**配置Cloudflare**

增加一个A记录

![https://keesenz.com/wp-content/uploads/2020/09/Cloudflare-dns-700x169.png](https://keesenz.com/wp-content/uploads/2020/09/Cloudflare-dns-700x169.png)

获取**Cloudflare** API Key (复制备用)

![https://keesenz.com/wp-content/uploads/2020/09/Cloudflare-api-key-700x191.png](https://keesenz.com/wp-content/uploads/2020/09/Cloudflare-api-key-700x191.png)

3、**配置OpenWrt 动态DNS**

![https://keesenz.com/wp-content/uploads/2020/09/Cloudflare-ddns-700x833.png](https://keesenz.com/wp-content/uploads/2020/09/Cloudflare-ddns-700x833.png)

保存并启动即可，等几秒钟回到Cloudflare检查IP是否变成了自己公网IP。
