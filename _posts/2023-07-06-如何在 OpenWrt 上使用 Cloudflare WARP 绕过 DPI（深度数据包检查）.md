---
title: '如何在 OpenWrt 上使用 Cloudflare WARP 绕过 DPI（深度数据包检查）'
layout: post
---
本教程主要是为印度尼西亚用户创建的，政府用 DPI 屏蔽了一些网站，因此简单地更改 DNS 不再起作用。这就是我所拥有的：

> 路由器：GL.iNet 6416  
> 固件：OpenWrt 18.06.2  
> 调制解调器：Huawei E3372 HiLink（IP：192.168.8.1）  
> ISP：Tri Indonesia  
> PC：Manjaro Linux（这与你拥有什么并不重要）

1. [在您的 PC 上，从 Github https://github.com/ViRb3/wgcf](https://github.com/ViRb3/wgcf)下载适当的 wgcf 二进制版本， 如果您使用的是 Linux，那么 linux-amd64 二进制文件是您的最佳选择。确保将 binary-release 替换为下载文件的实际文件名
2. 使用以下命令使二进制可执行文件： chmod +x binary-release
3. 运行 ./binary-release 寄存器
4. 接受条款和条件
5. 现在运行./binary-release生成
6. 您将获得**wgcf-profile.conf**文件，您需要使用该文件在 OpenWrt 路由器上设置wireguard。该文件应如下所示：

> \[接口\]  
> 私钥 = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  
> 地址 = 100.16.0.2/32  
> 地址 = fddd:5ca1:ab1e:8daf:209d:9414:d1e0:5d2c/128  
> DNS = 1.1.1.1  
> MTU = 1280  
> \[对等方\]  
> 公钥 = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  
> 允许的 IP = 0.0。 0.0/0  
> AllowedIPs = ::/0  
> 端点 =engage.cloudflareclient.com:2408

7. 现在在你的 OpenWrt 路由器上执行：**opkg update && opkg installwireguardwireguard-tools luci-proto-wireguard**
8. 编辑 /etc/config/network 并附加以下行，确保将 private\_keys_等_与您拥有的**wgcf-profile.conf文件相匹配：**

配置接口 'Cloudflare'  
 选项 proto 'wireguard'  
 选项 private\_key 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'  
 列表地址 '100.16.0.2/32'  
 列表地址 'fddd:5ca1:ab1e:8129:b248:d4f:3f37:7fbe/128'  
 选项 mtu '1280'  
 选项dns'1.1.1.1'  
  
配置wireguard\_Cloudflare  
 选项public\_key'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'  
 选项endpoint\_host'engage.cloudflareclient.com'  
 选项endpoint\_port'2408'  
 列表allowed\_ips'0.0.0.0/0'  
 列表allowed\_ips'::/0'  
 选项route\_allowed\_ips '1'  
  
配置路由 'route\_wireguard'  
 选项接口 'Cloudflare'  
 选项目标 '0.0.0.0/0'  
 option gateway '192.168.8.1' # 这是我的调制解调器上的 HiLink IP  
 option metric '1024'  
  
config Route 'route\_bimatri' # 此配置是可选的  
 option interface 'HiLink' # 将其与您的 hilink 接口的名称相匹配，我的是 ' HiLink'  
 option target '103.10.66.0/24' # 这是 bima.tri.co.id 的 IP  
 option option netmask '255.255.255.0' option gateway '192.168.8.1' # 这是我的调制解调器 选项指标  
 上的 HiLink IP  
‘1024’

9. 现在执行**/etc/init.d/network restart**
10. 登录 Luci WebUI。转到网络 > 接口并连接您的 Cloudflare 接口，如果连接成功，您的 Cloudflare 接口应如下所示：

[![在此输入图像描述](https://camo.githubusercontent.com/cd89ae129648b99f1259fad424a3878065699b021aa9737e3c81c75c77759f74/68747470733a2f2f692e6962622e636f2f433638355174482f323032322d30342d31302d3139323932352d393139783134332d7363726f742e706e67)](https://camo.githubusercontent.com/cd89ae129648b99f1259fad424a3878065699b021aa9737e3c81c75c77759f74/68747470733a2f2f692e6962622e636f2f433638355174482f323032322d30342d31302d3139323932352d393139783134332d7363726f742e706e67)

您的路由表应如下所示：

[![在此输入图像描述](https://camo.githubusercontent.com/3d9cb0dd001b48d70600f62e2adab4cd437a4640b703db765e9b794f17bee8e9/68747470733a2f2f692e6962622e636f2f797358744374672f323032322d30342d31332d3134343533392d353930783134302d7363726f742e706e67)](https://camo.githubusercontent.com/3d9cb0dd001b48d70600f62e2adab4cd437a4640b703db765e9b794f17bee8e9/68747470733a2f2f692e6962622e636f2f797358744374672f323032322d30342d31332d3134343533392d353930783134302d7363726f742e706e67)

现在您应该能够访问 Reddit 等被阻止的网站。

参考文献：  
[https://www.reddit.com/r/openwrt/comments/kgk5r1/comment/ggfqvhe/?utm\_source=share&utm\_medium=web2x&context=3](https://www.reddit.com/r/openwrt/comments/kgk5r1/comment/ggfqvhe/?utm_source=share&utm_medium=web2x&context=3)  
[https://openwrt.org/docs/guide-user/network/routing/路线配置](https://openwrt.org/docs/guide-user/network/routing/routes_configuration)