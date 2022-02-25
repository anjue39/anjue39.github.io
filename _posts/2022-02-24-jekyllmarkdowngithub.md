---
title: "[前端]jekyll+markdown+github搭建个人博客"
layout: post
---

机器环境:Win7 64位

安装rubyinstaller.

到http://rubyinstaller.org/downloads/下载ruby安装文件，这里下载rubyinstaller-2.2.3-x64.exe，按照提示安装，勾选Add Ruby executables to your PATH.



Win7 64位默认安装位置：C:\Ruby22-x64.

验证ruby是否安装成功：cmd中ruby -v显示ruby版本号说明ruby安装成功.
安装rubygems.

官网下载安装包https://rubygems.org/pages/download
```
解压rubygems-2.4.8.zip到指定目录，为了方便管理解压后放到C:\Ruby22-x64\目录下.
cmd进入rubygems-2.4.8目录下(快捷键：打开C:\Ruby22-x64\rubygems-2.4.8目录，shift+鼠标右键，点击”在此处打开命令行窗口”),运行ruby setup.rb .cmd 中 gem -v 显示版本号则说明正常.
安装DevKit-mingw64
```

下载相应版本http://rubyinstaller.org/downloads/,在C:\Ruby22-x64\目录下新建DevKit文件夹，运行DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe后会提示解压目录，选择C:\Ruby22-x64\DevKit.
在C:\Ruby22-x64\DevKit中打开cmd，运行ruby dk.rb init，会提示配置config.yml.



打开C:\Ruby22-x64\DevKit目录下的config.yml，将ruby根目录加入到配置文件中，这里是C:/Ruby22-x64.如果有了就不需要再加.注意格式.



执行ruby dk.rb install.

替换rubyGem库地址（相当重要，因为国内访问外网有线路问题，不仅更新速度慢，而且还会导致更新失败）

gem sources –remove https://rubygems.org/
gem sources -a https://ruby.taobao.org/ (注意：一定是https，淘宝已暂停http的ruby服务)
gem sources -l验证一下.

安装rails

cmd运行gem install rails.
cmd运行rails -v显示rails版本号说明安装成功.
安装jekyll
cmd运行gem install jekyll
cmd运行jekyll -v验证，显示版本号说明安装成功.
环境配置完整之后，下面进入正题，如何新建博客:

运行命令:jekyll new 文件夹名，比如jekyll new blog，会在当前目录生成blog文件夹.



在生成的blog文件夹根目录下运行命令:jekyll serve –watch

浏览器中打开localhost:4000，命令运行过程中没有错误提示，浏览器中显示默认页面说明安装成功.



使用markdown发布博客

markdown是什么？ 参考淘宝UED关于markdown的介绍http://ued.taobao.org/blog/2012/07/getting-started-with-markdown/. 锤子手机发布会上罗永浩介绍了锤子科技出品的app**锤子便签**支持markdown功能，下载地址：http://bbs.smartisan.com/forum-92-1.html，非常好用，建议下载体验一番.

将markdown、html格式的文件以”YY-MM-DD-finename.filetype”命名放到_post文件夹下：如2015-09-10-firstpost.markdown.
![](http://)
发布到github

> 首先注册一个github账号.
> 新建repository,以username.github.io的形式命名.
> git提交本地代码到github.
```
git提交命令
git init
git add .
git commit -m “update”
git remote add origin https://github.com/cseryp/cseryp.github.io.git
git push -u origin master
```
参考文章

每个人都应该有一个Jekyll博客
git教程
`![jekyll 2.5.3 | Error: Permission denied - bind(2) for 127.0.0.1:4000](http://)` 出现这个错误说明端口被占有，打开_config.yml，加入一行：port:5001(没有被占用的端口均可)即可解决.
