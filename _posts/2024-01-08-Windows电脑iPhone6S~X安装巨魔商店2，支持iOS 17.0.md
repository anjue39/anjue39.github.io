---
title: 在 Docker 容器中安装和配置 Gitea
layout: post
---
# ![](https://dkxuanye.cn/wp-content/uploads/2023/11/09ece245df43ddc52c8779b16704bce.png)Windows 使用教程

**不支持AMD处理器Windows，成功率太低**

**不支持太古董的电脑赛扬、奔腾**

**不支持win7，快放弃你的古董系统**

**电脑CPU是E1230系列、X志强处理器，可能要多次尝试**

## 支持的型号

#### **iPhone 6s/6sp、 iPhone SE1、 iPhone7/7P 、 iPhone8/8P 、 iPhoneX**

#### **iPadAir2 、iPad mini4、 iPad10.2  、iPad5/6/7、 iPad Pro1/2**

## 支持的iOS版本

### iOS 14.0 ~ 16.6.1、 17.0

#### 不支持 iOS16.7、16.7.1、16.7.2 🈲

#### **注意：**14.0 ~ 14.8.1不能使用本工具越狱，只能用[checkra1n越狱](https://dkxuanye.cn/?p=2817)

**_如果不想动手，联系站长远程协助安装巨魔，有偿服务_**

### **下载链接**：

### [DK\_Helper 巨魔安装助手 v1.5](https://wwiq.lanzouv.com/iLS8t1ji8zuh) 解压密码:dkxuanye.cn

**更新日志：2023.12.31 更新到1.5版本：1，优化越狱逻辑。本工具完全免费！**

#### **A11处理器设备8/8P/X，必须取消锁屏密码。**

### 请务必结合视频教程观看！

1，解压DK\_Helper工具到任意位置。

2，先安装这个依赖环境[.**NET 8.0 Desktop Runtime**](https://wwiq.lanzoub.com/itK131hdvikb)(_点左边文字下载_),然后安装它。

或者手动到这个微软官方网站下载：[**NET 8.0 Desktop Runtime**](https://dotnet.microsoft.com/en-us/download/dotnet/8.0)![](https://dkxuanye.cn/wp-content/uploads/2023/11/截屏2023-12-10-10.46.40.png)

**3，连接iOS设备到电脑，如果是8/8P/X取消锁屏密码。打开Dk\_Helper，点击检测设备连接![](https://dkxuanye.cn/wp-content/uploads/2023/11/09ece245df43ddc52c8779b16704bce.png)**

4，点击**进入恢复模式**，引导设备进入恢复模式状态，为下一步做准备。

5，点击**引导至DFU**，根据提示操作，先点 开始按钮，然后按键。

**苹果6S/6SP/SE**，**返回键+电源键**一起按住4秒，然后松开**电源键**，继续**按住返回键10秒**

**苹果7~~X**，**音量减键+电源键**一起按住4秒，然后松开**电源键**，继续**按住音量减键10秒**

![](https://dkxuanye.cn/wp-content/uploads/2023/11/ea6032372f0013c64a26abf601fc6a9.png)

6，如果进入DFU模式成功，继续下一步。如果没有进去，重新从第4步开始。

7，打开电脑上的设备管理器，以便于后面的操作。

8，由于玄烨写代码能力水平一般，我并没有实现驱动自动化安装，只能你自己手动了。点击工具界面右下角按钮 libusbK驱动，开始安装这个第三方驱动。在弹窗界面中，直接点下一步，安装完成。

iOS设备显示在libusbK驱动下方是正确的。

![](https://dkxuanye.cn/wp-content/uploads/2023/11/e90b8af0d8e9cb8c6947058d0f79434.png)

9，点击**越狱iOS设备**，弹窗提示切换到libusbK驱动，点击确定。继续之后，苹果设备会亮起白苹果logo，还会看见下面这个弹窗页面，**现在 先不要点击它、先不要点击它、先不要点击它。![](https://dkxuanye.cn/wp-content/uploads/2023/11/3c0e97e7b2878621dcea2767f2620f9.png)**

10，系统自动调用pwndfu漏洞，引导设备。

11，再次点击工具界面的 **libusbK驱动 按钮，然后点下一页，下一页，继续更新驱动。更新完成后。![](https://dkxuanye.cn/wp-content/uploads/2023/12/1b7fbe9e23d95635457c75052bef6b71.jpg)**

如果你遇到上面这种更新驱动安装失败，请安装这个完成版的驱动：[**libusbK-3.0.7.0**](https://wwiq.lanzouv.com/iabem1it04jc)

12，**新的情况**，这时你会看到iOS设备屏幕跑动代码，**logo图标上是彩色国际象棋棋子**。**如果你没能到这一步，那么重启手机，重新进DFU模式开始。**![](https://dkxuanye.cn/wp-content/uploads/2023/11/9b3cb0bcb4843637aa1aeee8af7a975-768x1024.jpg)

13，在设备管理器看到**PongoOS USB Device**，右键**更新驱动程序**，浏览我的电脑，让我从计算机上的可用，找到**libusbK Usb Device**，下一步，下一步，确定。![](https://dkxuanye.cn/wp-content/uploads/2023/11/6b22db178f88f70c92fecd81a29f7be.png)![](https://dkxuanye.cn/wp-content/uploads/2023/11/e90b8af0d8e9cb8c6947058d0f79434.png)

14，现在可以点击第三次弹窗的这个窗口了。点击确定。![](https://dkxuanye.cn/wp-content/uploads/2023/11/3c0e97e7b2878621dcea2767f2620f9.png)

15，屏幕跑动代码，引导设备到越狱环境。

**从第8步 ~ 15步，看似操作复杂，其实就是三次更换驱动的过程，虽然手动操作确实麻烦，但是保证了成功率。基本上一次成功，不像WinRa1n之类工具，很麻烦卡驱动。**

16，点击**巨魔商店安装**，会检测设备越狱情况，然后开始安装。如果提示：设备没有越狱成功，端口被占用的话，**解决办法是**：**打开爱思助手，工具箱，打开SSH通道**。然后再次打开工具，点击**巨魔商店安装**

![](https://dkxuanye.cn/wp-content/uploads/2023/11/b7e05f15c7334ca4af7f3b1d10aceb4.png)

12，回到手机端，打开iOS桌面的提示应用程序，点击**install TrollStore**。**（最好全程有魔法上网）![](https://dkxuanye.cn/wp-content/uploads/2023/11/2023_11_30_22_07_IMG_0002.png)**

13，安装完自动注销桌面，点击桌面的蓝色巨魔，进去会自动安装ldid，lidi是必须安装的。如果你因为网络不好没有安装上，**底部点击Setting**，点击**install ldid**可以重新安装它。**（最好全程有魔法上网）**

14，享受巨魔商店。

**使用巨魔注意：必须开启开发者模式，否则巨魔安装的应用软件闪退！找到设置-隐私与安全-开发者模式-收到打开模式，手机重启，重启好再次确认开启！**
