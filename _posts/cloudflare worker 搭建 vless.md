---
title: 'cloudflare worker 搭建 vless'
layout: post
---
无需域名，无需 vps，白嫖梯子

## [](https://blog.piig.top/posts/10934/#%E9%A1%B9%E7%9B%AE%E5%9C%B0%E5%9D%80 "项目地址")项目地址

**Edgetunnel**：[https://github.com/zizifn/edgetunnel](https://github.com/zizifn/edgetunnel)

## [](https://blog.piig.top/posts/10934/#%E6%90%AD%E5%BB%BA%E6%95%99%E7%A8%8B "搭建教程")搭建教程

### [](https://blog.piig.top/posts/10934/#%E6%B3%A8%E5%86%8Ccloudflare "注册cloudflare")注册 cloudflare

1. 访问 [https://dash.cloudflare.com/login](https://dash.cloudflare.com/login) 注册
    
2. 点击 workers 和 pages
    
3. 创建 worker  
    [![image.png](https://img.piig.top/2023/07/bee1b066ca2c5155880a7e41e1a59676.png)](https://img.piig.top/2023/07/bee1b066ca2c5155880a7e41e1a59676.png)
    
4. 修改名称（随意）点击部署，再编辑代码  
    [![image.png](https://img.piig.top/2023/07/0883da7b98695ac24f86d5c5d89b5eb7.png)](https://img.piig.top/2023/07/0883da7b98695ac24f86d5c5d89b5eb7.png)[![image.png](https://img.piig.top/2023/07/a368220ef1006b84c4e066d737014405.png)](https://img.piig.top/2023/07/a368220ef1006b84c4e066d737014405.png)
    
5. 打开项目的.js 文件 [https://github.com/zizifn/edgetunnel/blob/main/src/worker-vless.js](https://github.com/zizifn/edgetunnel/blob/main/src/worker-vless.js) 全选复制里面的代码，粘贴到 workers 中  
    [![image.png](https://img.piig.top/2023/07/79d694825bdffdc0a7cbefdf0f69d7de.png)](https://img.piig.top/2023/07/79d694825bdffdc0a7cbefdf0f69d7de.png)
    
6. 修改 UUID 和 proxyIP，UUID 可选择在线生成 [https://1024tools.com/uuid](https://1024tools.com/uuid) 复制粘贴，这里提供一个 IP `let proxyIP = ‘103.200.112.108’;` 同样复制粘贴，最后点击保存并部署  
    一些神奇的 ip，可以无条件的转发所有 cf 流量  
    可以参考这个 issues 进行 proxyip 查找  
    issues：[https://github.com/zizifn/edgetunnel/issues/162](https://github.com/zizifn/edgetunnel/issues/162)  
    [![image.png](https://img.piig.top/2023/07/8056f6512a18707155ee97b47fe8c3d0.png)](https://img.piig.top/2023/07/8056f6512a18707155ee97b47fe8c3d0.png)
    

## [](https://blog.piig.top/posts/10934/#%E6%9C%89%E5%9F%9F%E5%90%8D%EF%BC%88%E5%8F%AF%E9%80%89%EF%BC%89 "有域名（可选）")有域名（可选）

### [](https://blog.piig.top/posts/10934/#%E6%B7%BB%E5%8A%A0%E5%9F%9F%E5%90%8D "添加域名")添加域名

[![image.png](https://img.piig.top/2023/07/c719fd988448a6a1dc59b51b8e5bb4d9.png)](https://img.piig.top/2023/07/c719fd988448a6a1dc59b51b8e5bb4d9.png)  
添加完成之后，可能要等几分钟等待域名生效

### [](https://blog.piig.top/posts/10934/#%E6%9F%A5%E7%9C%8Bvless%E5%B9%B6%E5%AF%BC%E5%85%A5%E9%93%BE%E6%8E%A5 "查看vless并导入链接")查看 vless 并导入链接

输入你的域名 + uuid（例如：test.pornhug.top/d342d11e-d424-4583-b36e-524ab1f0afa4）  
[![image.png](https://img.piig.top/2023/07/688e3708ccc6204b271d33e8d491629a.png)](https://img.piig.top/2023/07/688e3708ccc6204b271d33e8d491629a.png)  
导入通用格式就行了

### [](https://blog.piig.top/posts/10934/#%E4%BC%98%E9%80%89ip "优选ip")优选 ip

因为 cloudflare 在国内访问速度很慢，所以需要优选 ip  
将服务器地址换成优选 ip 即可  
[https://stock.hostmonit.com/CloudFlareYes](https://stock.hostmonit.com/CloudFlareYes)  
获取，或者加入 TG 群 [https://t.me/CF\_NAT](https://t.me/CF_NAT)

### [](https://blog.piig.top/posts/10934/#%E5%AE%A2%E6%88%B7%E7%AB%AF%E5%AF%BC%E5%85%A5 "客户端导入")客户端导入

小火箭的例子：  
[![image.png](https://img.piig.top/2023/07/36a26279a5e620c6d84350ce20f89a39.png)](https://img.piig.top/2023/07/36a26279a5e620c6d84350ce20f89a39.png)

### [](https://blog.piig.top/posts/10934/#%E6%B2%A1%E6%9C%89%E5%9F%9F%E5%90%8D%EF%BC%88%E6%8E%A8%E8%8D%90%EF%BC%89 "没有域名（推荐）")没有域名（推荐）

有些小伙伴可能没有域名，其实不用自定义域名也是可以的，客户端里去掉 tls 加密，端口改为 80 或者 2052 即可  
[![image.png](https://img.piig.top/2023/07/ef2d6c93a3f53ed7d186966922c103b4.png)](https://img.piig.top/2023/07/ef2d6c93a3f53ed7d186966922c103b4.png)  
导入之后，记得关闭 tls，修改端口，有需要就修改优选 ip  
小火箭的例子：  
[![image.png](https://img.piig.top/2023/07/5783f8a13583b025a945aac8f94b414d.png)](https://img.piig.top/2023/07/5783f8a13583b025a945aac8f94b414d.png)

### [](https://blog.piig.top/posts/10934/#clashmeta%E5%92%8Cv2rayN%E4%BE%8B%E5%AD%90 "clashmeta和v2rayN例子")clashmeta 和 v2rayN 例子

#### [](https://blog.piig.top/posts/10934/#v2rayN "v2rayN")v2rayN

v2rayN 会在视频中演示

#### [](https://blog.piig.top/posts/10934/#clashmeta "clashmeta")clashmeta

格式已经给出，修改方法和小火箭的修改方法一致  
没有域名的例子：  
[![image.png](https://img.piig.top/2023/07/67c6ac21758e54439cbe0045dc94d178.png)](https://img.piig.top/2023/07/67c6ac21758e54439cbe0045dc94d178.png)

有域名的例子：  
只需要替换优选 ip，然后 sni 和 host 检查时自己的域名哦


[原创](http://blog.piig.top/posts/10934/ "该文章为原创文章，注意版权协议") cloudflare worker 搭建 vless

文章作者: [Masheep](http://blog.piig.top/)

文章链接: [http://blog.piig.top/posts/10934/](http://blog.piig.top/posts/10934/)
