---
layout: slide
title: Reveal.js与Jekyll结合演示(幻灯片)
theme: blood
# beige black blood league moon night serif simple sky solarized white
transition: zoom 
# none/fade/slide/convex/concave/zoom  #concave可能会使iOS的Safari崩溃
ruby_notation: true
diagram: true
mathjax: true
multiplex: client # master/client 
multiplex_id: 99702b17e6a745f9
multiplex_secret: 14830192734523284320
multiplex_url: https://reveal-js-multiplex-ccjbegmaii.now.sh
# DONE: 把rogue着色器在这里关掉，或者在全局全部用highlight.js来着色
# TODO: https://github.com/webpro/reveal-md
# HELP: <section markdown="1"> </section>为分隔
# HELP: <aside class="notes"> </aside> 为注记
---

<section markdown="1">

# Welcome.

<aside class="notes">
    Oh hey, these are some notes. They'll be hidden in your presentation, but you can see them if you open the speaker notes window (hit 's' on your keyboard).
</aside>

</section> <section markdown="1">

$$ \frac{1}{(\sqrt{\phi \sqrt{5}}-\phi) e^{\frac25 \pi}} =
     1+\frac{e^{-2\pi}} {1+\frac{e^{-4\pi}} {1+\frac{e^{-6\pi}}
           {1+\frac{e^{-8\pi}} {1+\ldots} } } } $$

</section> <section markdown="1">

## Maxwell Equations

$$
\begin{align}
  \nabla \times \vec{\mathbf{B}} -\, \frac1c\, \frac{\partial\vec{\mathbf{E}}}{\partial t} & = \frac{4\pi}{c}\vec{\mathbf{j}} \\
  \nabla \cdot \vec{\mathbf{E}} & = 4 \pi \rho \\
  \nabla \times \vec{\mathbf{E}}\, +\, \frac1c\, \frac{\partial\vec{\mathbf{B}}}{\partial t} & = \vec{\mathbf{0}} \\
  \nabla \cdot \vec{\mathbf{B}} & = 0
\end{align}
$$

</section> <section markdown="1">

## Seq
```seq
participant Device
participant Browser
participant Server
Browser->Server: username and password
Note over Server: verify password
Note over Server: generate challenge
Server->Browser:  challenge
Browser->Device: challenge
Note over Device: user touches button
Device-->Browser: response
Browser->Server: response
Note over Server: verify response
```

</section> <section markdown="1">
## Sequence
```sequence
participant Device
participant Browser
participant Server
Browser->Server: username and password
Note over Server: verify password
Note over Server: generate challenge
Server->Browser:  challenge
Browser->Device: challenge
Note over Device: user touches button
Device-->Browser: response
Browser->Server: response
Note over Server: verify response
```

</section> <section markdown="1">

## Flowchart
```flowchart
a=>operation: Atmel
ATECC508A 
密码学芯片:>http://www.atmel.com/Images/Atmel-8923S-CryptoAuth-ATECC508A-Datasheet-Summary.pdf
b=>operation: Silabs 
EFM8UB11F16G 
单片机 :>https://www.silabs.com/Support%20Documents/TechnicalDocs/EFM8UB1_DataSheet.pdf
c=>inputoutput: USB
d=>operation: 主机

a(right)->b(right)->c(right)->d
```

</section> <section markdown="1">
## Flowchart
```flowchart
st=>start: Start:>http://www.google.com[blank]
e=>end:>http://www.google.com
op1=>operation: My Operation
sub1=>subroutine: My Subroutine
cond=>condition: Yes
or No?:>http://www.google.com
io=>inputoutput: catch something...

st->op1->cond
cond(yes)->io->e
cond(no)->sub1(right)->op1
```

</section> <section markdown="1">

[U2F]{Universal 2 Factor} 标准是由[Yubico公司](https://www.yubico.com/)和[Google](https://www.baidu.com/s?wd=谷歌)发起的[FIDO](https://fidoalliance.org/)(Fast IDentity Online)联盟推出的标准, 旨在提供一个方便的免驱动、通用型的密码认证令牌, 期望能在让用户在有U2F认证的情况下, 即使用短密码, 也能实现高强度的认证. 
而且这种认证是不依赖中心服务器的, 完全基于公私钥/PKI体系. 

U2F的物理层可以是USB-HID, 也可以是NFC(目前Yubikey Neo支持), 也可以是BTLE(在国外开会的时候遇到Yubico的Sales, 他们说这两年就会有支持BTLE的Yubikey, 这样iPhone就能用上了). 

</section> <section markdown="1">

[U2F-Zero](https://u2fzero.com/)是一个以BSD协议开源的U2F令牌. 代码在github上的[conorpp/u2f-zero](https://github.com/conorpp/u2f-zero). 文档见其[Wiki](https://github.com/conorpp/u2f-zero/wiki). 

U2F-Zero在[Amazon上](https://www.amazon.com/U2F-Zero/dp/B01L9DUPK6)可以购买, 售价8刀. 作者还放出了一个视频, 是他找了一部2小时的电影, [一边看一边手工烧录](https://conorpp.com/2016/09/23/designing-and-producing-2fa-tokens-to-sell-on-amazon/)....

</section> <section markdown="1">

下面打算先讲使用, 再讲U2F的原理, 最后再讲一讲U2F-Zero的硬件及制造流程. 

![图:U2F-Zero](https://camo.githubusercontent.com/8f7abb7f684061138bd2a0aefa631a6fddad0d35/68747470733a2f2f692e696d6775722e636f6d2f4865725a6857512e6a7067)

</section> <section markdown="1">

## U2F-Zero的使用

U2F-Zero上有15个Slot, 可以存15组公私钥对. ([后面](#yubikey-u2f-u2f-zero15)会提到, Yubikey是如何实现无限多组U2F的)

</section> <section markdown="1">

### 浏览器: 网页认证

直接注册使用就可以了. Chrome浏览器原生支持, Firefox需要[装一个插件](https://addons.mozilla.org/en-US/firefox/addon/u2f-support-add-on/). Firefox的原生支持正在[积极推进中](https://bugzilla.mozilla.org/show_bug.cgi?id=1065729). Opera 也已经支持了(2016年9月起). IE Edge [预计](https://www.yubico.com/2016/07/over-a-dozen-services-supporting-fido-u2f/)在2017年上半年推出U2F支持.

U2F目前支持的在线服务:

 - Dropbox
 - Gmail
 - Github
 - [Gitlab](https://www.yubico.com/why-yubico/for-businesses/developer-platforms/gitlab/)
 - Bitbucket
 - Dashlane
 - wordpress: (Plugin: Two-Factor 或 [Yubico/wordpress-u2f](https://github.com/Yubico/wordpress-u2f))
 - Linux/macOS: pam.d
 - Fastmail

也可以参考[这个清单](http://www.dongleauth.info/). 另外, 可以去 <https://demo.yubico.com/u2f> 上进行调试. 

</section> <section markdown="1">

### Linux: 以pam.d/sudo举例

以Debian系为例:

```bash
echo 'KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="8acf", TAG+="uaccess"' >> /etc/udev/rules.d/70-u2f.rules
sudo udevadm trigger

sudo apt-get install libpam-u2f pamu2fcfg
# 如果源里没有, 可以先添加ppa:
# sudo add-apt-repository ppa:yubico/stable
# sudo apt-get update
man pamu2fcfg

pamu2fcfg >> /etc/u2f_mappings

sudo chmod 644 /etc/u2f_mappings
sudo chown root:root /etc/u2f_mappings

#以下是必须有密码和U2F同时通过, 才放行
echo "auth required pam_u2f.so authfile=/etc/u2f_mappings cue" >> /etc/pam.d/sudo 

# 如果想password或U2F二者其一即可认证的话, 把以下
# auth sufficient pam_u2f.so authfile=/etc/u2f_mappings cue
# 加到 /etc/pam.d/sudo 的开头

# 如果在Ubuntu里，想要登录的时候也能用
# 可以加到 /etc/pam.d/common-auth
echo "auth sufficient pam_u2f.so authfile=/etc/u2f_mappings cue" >> /etc/pam.d/common-auth
```
</section>
<section markdown="1">


如果有多个U2F Key, 不能直接在u2f_mappings里放两行, 同一个用户名只能放一行, 按以下格式, 以`:`分隔:

```html
<username1>:<KeyHandle1>,<UserKey1>:<KeyHandle2>,<UserKey2>:...
<username2>:<KeyHandle1>,<UserKey1>:<KeyHandle2>,<UserKey2>:...
```

如:

```
scateu:BJkQhw,04efe995ba9361b9530e2d3572662f01da08e6f28e77cfdac8981000128c0597ee5d706b7eaee9ea3a79f572654c482daa0ef9193407a3a2b379e284c08bb95a59:axh4xfEr6o_i6z8BAXcW24Q_2AWGgfx2HiW7FURLV-Wz-hCPIh_UWS1ANASSUDsxNDklsZsf2tqQ_ECy4KdRmA,04c113c247a2233665f58c1f949f25c91f9408b7dc769e69c844e147fabc6cba73be629f2dc4a8c559aeab72ca24fcd5bce221b29ea5cd0a52131f2426625376d7
```

</section>