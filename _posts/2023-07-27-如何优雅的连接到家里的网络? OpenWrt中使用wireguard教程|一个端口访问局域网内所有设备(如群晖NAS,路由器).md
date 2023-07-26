---
title: '如何优雅的连接到家里的网络? OpenWrt中使用wireguard教程|一个端口访问局域网内所有设备(如群晖NAS,路由器)'
layout: post
tags: []
category: 
---
![https://www.126126.xyz/images/011/0.jpg](https://www.126126.xyz/images/011/0.jpg)

## 视频连接

- [YouTube](https://www.youtube.com/watch?v=F8z74oE71Gg&t)
- [B站](https://www.bilibili.com/video/BV1464y1Q7uE/)

这期节目向大家介绍一下如何使用OpenWrt上的wireguard服务。wireguard服务搭建成功后(通过简单的路由设置)，我们可以在外网通过客户端连接到家庭网络，达到任意访问家里局域网中的设备的目的。 这种方法同样也适用于公司网络以及任何你想在外网连入的网络。相比一些商业服务(比如花生壳,zerotier)此方案更简洁高效(基于Linux内核模块)，代码完全开源，安全有保障，配置也不算复杂。 如果有公网IP，可以通过DDNS直连，如果没有公网IP可以通过FRP端口转发。本期节目少量代码，适合小白入门。

## 相关资源

### 动态域名(DDNS)使用教程

以下资料来源于互联网  
[cloudflare动态域名](https://keesenz.com/2020/1067.html)  
[阿里云动态域名](https://blog.csdn.net/pzhier/article/details/111570930)

### eSir精品小包固件下载地址(感谢esir的辛勤付出)

[eSir精品小包固件](https://drive.google.com/drive/folders/1eyIxVfyzO4nyzaT1sSr6xWf50_5YJN7g)

### OpenWrt安装WireGuard命令(eSir精品小包已集成WireGuard,无需安装)

<table class="lntable"><tbody><tr><td class="lntd"><pre class="chroma"><code><span class="lnt">1
</span><span class="lnt">2
</span><span class="lnt">3
</span></code></pre></td><td class="lntd"><pre class="chroma"><code class="language-fallback" data-lang="fallback">opkg update
opkg install luci-proto-wireguard luci-app-wireguard wireguard kmod-wireguard wireguard-tools
reboot
</code></pre></td></tr></tbody></table>

### WireGuard密钥生成

1.设置文件权限

`umask 077`

2.生成服务端Privatekey和Pubkey

`wg genkey | tee sprivatekey | wg pubkey > spublickey`

3.生成客户端端Privatekey和Pubkey

`wg genkey | tee cprivatekey | wg pubkey > cpublickey`

4.生成预共享密钥PresharedKey

`wg genpsk > sharekey`

### 客户端模板文件test.conf

<table class="lntable"><tbody><tr><td class="lntd"><pre class="chroma"><code><span class="lnt"> 1
</span><span class="lnt"> 2
</span><span class="lnt"> 3
</span><span class="lnt"> 4
</span><span class="lnt"> 5
</span><span class="lnt"> 6
</span><span class="lnt"> 7
</span><span class="lnt"> 8
</span><span class="lnt"> 9
</span><span class="lnt">10
</span><span class="lnt">11
</span></code></pre></td><td class="lntd"><pre class="chroma"><code class="language-fallback" data-lang="fallback">[Interface]
Address = 192.168.100.2
PrivateKey = cprivatekey文件内容 
DNS = 路由器IP
[Peer]
PublicKey = spublickey文件内容  
AllowedIPs = 0.0.0.0/0
# 如果启用下面这行代码,表示只有192.168.2.0/24, 192.168.100.0/24这两个子网的IP走WireGuard
# AllowedIPs = 192.168.2.0/24, 192.168.100.0/24
Endpoint = 公网IP:端口号
PersistentKeepalive = 25
</code></pre></td></tr></tbody></table>

### 真实的test.conf的例子

<table class="lntable"><tbody><tr><td class="lntd"><pre class="chroma"><code><span class="lnt"> 1
</span><span class="lnt"> 2
</span><span class="lnt"> 3
</span><span class="lnt"> 4
</span><span class="lnt"> 5
</span><span class="lnt"> 6
</span><span class="lnt"> 7
</span><span class="lnt"> 8
</span><span class="lnt"> 9
</span><span class="lnt">10
</span></code></pre></td><td class="lntd"><pre class="chroma"><code class="language-fallback" data-lang="fallback">[Interface]
Address = 192.168.100.2
PrivateKey = qB5rRYDTF7b7iEQSZ91ixQ7XAvuiY2aXJtg3aasz01Y=
DNS = 192.168.2.1
[Peer]
PublicKey = SfBTCxkXG2P5QMin1CScP5eyaOD7RG9v2OSWlJrcWxY=
AllowedIPs = 0.0.0.0/0
PresharedKey = ENLutSSKXVdHBokmrFu+gOq/JCATLbX+a7SmeXNpvTQ=
Endpoint = yourhome.demo.com:23456
PersistentKeepalive = 25
</code></pre></td></tr></tbody></table>

### WireGuard客户端安装地址

[https://www.wireguard.com/install/](https://www.wireguard.com/install/)  
[https://wws.lanzoui.com/iCRwqqy0neh](https://wws.lanzoui.com/iCRwqqy0neh) 解压密码:www.126126.xyz
