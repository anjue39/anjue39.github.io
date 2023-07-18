---
title: 'cloudflare worker 搭建 vless'
layout: post
---
> 这是一个名为 edgetunnel 的 github 项目，可以通过 Cloudflare Workers 部署一个 vless协议的 V2ray代理。

提醒各位，本项目仅限技术交流使用，请勿滥用，由此引起的账号封禁等风险后果自负。

## 

[](https://nb.adone.eu.org/article/edgetunnel#c155f78aac684b3a88ff573eca6e17fb "项目地址")项目地址

[https://github.com/zizifn/edgetunnel](https://github.com/zizifn/edgetunnel)

## 

[](https://nb.adone.eu.org/article/edgetunnel#b0644d3c6280409a9900c22cede6ecae "部署教程")部署教程

#### 

[](https://nb.adone.eu.org/article/edgetunnel#f1a65ce9a8a54762a009d2fc1f12f17f "1、访问 https://dash.cloudflare.com/login 注册并登录账号，点击 Workers 和 Pages ，点击 创建应用程序 ")1、访问 [https://dash.cloudflare.com/login](https://dash.cloudflare.com/login) 注册并登录账号，点击 Workers 和 Pages ，点击 创建应用程序

![notion image](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F8294cb25-8590-4b97-a709-3c8a4e1b5f8e%2FSnipaste_2023-06-24_08-31-43.jpg?table=block&id=8cc1a18e-f719-4311-86d5-ee6ed2ae607f)

![notion image](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F66579ae9-0fd9-4c72-af23-8bc98f5c0e9a%2FSnipaste_2023-06-24_08-37-45.jpg?table=block&id=ef559ac9-c1b2-45ed-89a8-765c46594824)

![notion image](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fdecce684-297a-441d-9e74-70fbf78e14fb%2FSnipaste_2023-06-24_08-38-57.jpg?table=block&id=627e8c1f-cc61-4536-9824-d84b8b247aeb)

#### 

[](https://nb.adone.eu.org/article/edgetunnel#409d47943b6b4929a8eb90cb17de9d90 "2、打开项目的.js文件 https://github.com/zizifn/edgetunnel/blob/main/src/worker-vless.js 全选复制里面的代码")2、打开项目的.js文件 [https://github.com/zizifn/edgetunnel/blob/main/src/worker-vless.js](https://github.com/zizifn/edgetunnel/blob/main/src/worker-vless.js) 全选复制里面的代码

![notion image](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4b32f868-0773-4854-bc83-d434707376af%2FSnipaste_2023-06-24_08-45-01.jpg?table=block&id=379a6c55-e0c7-4d1f-adf1-4a5d5a6616b4)

#### 

[](https://nb.adone.eu.org/article/edgetunnel#8a4b075ca35543c99601103000028aca "3、Ctrl+V 粘贴到 Workers 编辑器")3、Ctrl+V 粘贴到 Workers 编辑器

![notion image](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fa82cbab3-4876-4491-a895-50b30ccccf09%2FSnipaste_2023-06-24_09-04-11.jpg?table=block&id=a28d8113-f0a8-4df5-bf41-e89ed0afd093)

#### 

[](https://nb.adone.eu.org/article/edgetunnel#41bd7ad765d64add84024debe7b7ba42 "4、修改 UUID 和 proxyIP，UUID 可选择在线生成 https://1024tools.com/uuid 复制粘贴，这里提供一个IP let proxyIP = ‘103.200.112.108’; 同样复制粘贴，最后点击保存并部署 ")4、修改 UUID 和 proxyIP，UUID 可选择在线生成 [https://1024tools.com/uuid](https://1024tools.com/uuid) 复制粘贴，这里提供一个IP `let proxyIP = ‘103.200.112.108’;` 同样复制粘贴，最后点击保存并部署

![notion image](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F37bfcf9e-e831-43eb-8a46-8f3217e1de0f%2FSnipaste_2023-06-24_09-17-31.jpg?table=block&id=387a9f37-9429-457c-9082-f6ba0fb94019)

#### 

[](https://nb.adone.eu.org/article/edgetunnel#e4028ee15f454c27b7d409353839beb4 "5、添加自定义域名，访问（你绑定的自定义域名+/你的UUID)生成 V2ray 配置链接 ")5、添加自定义域名，访问（你绑定的自定义域名+/你的UUID)生成 V2ray 配置链接

![notion image](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe3703464-be38-4866-a3bb-3e8a39d01809%2FSnipaste_2023-06-24_10-38-04.jpg?table=block&id=293c59d2-b213-4252-b43b-5ee8222e7a2f)

![notion image](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7397ce87-408c-4873-9d30-f4580fb590f7%2FSnipaste_2023-06-24_10-13-22.jpg?table=block&id=7f9576a8-3edf-40ad-a8e7-22eeaef8aaab)

#### 

[](https://nb.adone.eu.org/article/edgetunnel#a3d02631230e4b88b8b55935b0c49526 "6、将复制的V2ray 配置链接粘贴到 V2rayN 客户端，地址填入优选IP ，即可成功科学上网。优选IP 可通过 https://stock.hostmonit.com/CloudFlareYes 获取，或者加入TG群 https://t.me/CF_NAT")6、将复制的V2ray 配置链接粘贴到 V2rayN 客户端，地址填入优选IP ，即可成功科学上网。优选IP 可通过 [https://stock.hostmonit.com/CloudFlareYes](https://stock.hostmonit.com/CloudFlareYes) 获取，或者加入TG群 [https://t.me/CF\_NAT](https://t.me/CF_NAT)

![notion image](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F18f62739-dcdd-43cb-bda9-453268d4e545%2FSnipaste_2023-06-24_10-18-20.jpg?table=block&id=467d65a7-6b44-467c-adaf-c8c806d00efc)

## 

[](https://nb.adone.eu.org/article/edgetunnel#bda17cbaae714e948237ce7f5a9f794e "提醒各位")提醒各位

本项目仅限技术交流使用，请勿滥用，由此引起的账号封禁等风险自负。

---

有些小伙伴可能没有域名，其实不用自定义域名也是可以的，客户端里去掉tls加密，端口改为80或者2052即可。

教程第4步完成部署之后，可以

![notion image](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F18f09042-4d1c-44bf-8b3b-bd878bc3aebc%2FSnipaste_2023-06-24_13-56-24.jpg?table=block&id=16ad3522-f8c7-4a19-a4b2-231a9f159610)

配置示例：

![notion image](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F3936ca22-5b6b-48b1-a6e2-b5085c55225c%2FSnipaste_2023-06-24_13-50-41.jpg?table=block&id=b77b0f3d-3940-41cc-8e04-35fd9acebc16)

`vless://d342d11e-d424-4583-b36e-524ab1f0afa4@icook.hk:80?encryption=none&security=none&sni=hello-world-tight-shadow-6768.idong-5c5.workers.dev&fp=randomized&type=ws&host=hello-world-tight-shadow-6768.idong-5c5.workers.dev&path=%2F%3Fed%3D2048#hello-world-tight-shadow-6768.idong-5c5.workers.dev`

JavaScript

Copy

微信扫码分享

- **作者:**[adone](https://nb.adone.eu.org/about)
- **链接:**[https://nb.adone.eu.org/article/edgetunnel](https://nb.adone.eu.org/article/edgetunnel)
- **声明:**本文采用 CC BY-NC-SA 4.0 许可协议，转载请注明出处。
