---
title: github密钥配置和git管理代码
layout: post
tags:
  - Git
category: 
---
## [github](https://so.csdn.net/so/search?q=github&spm=1001.2101.3001.7020)配置密钥

> 1. 本地安装好git；
> 2. 桌面右键 Git Bash Here 打开git命令行；
> 3. ssh-keygen -t rsa -C “自己GitHub上的邮箱” （全部按enter）；
> 4. cd ~/.ssh （如果没有执行第三步，则不会有这个文件夹）；
> 5. cat id\_rsa.pub 在命令行打开这个文件，会直接输出密钥；
> 6. 复制，打开github，点自己头像 >> settings >> SSH and GPG keys >>New SSH key
> 7. titile：自己定义，key：粘贴第六步的内容；
> 8. 加载配置信息：git config --global user.name “你的名字”；git config --global user.email “你的邮箱”

## git管理代码

```bash
//创建分支
git branch wangjun03	   “wangjun03为分支名字”
//切换到当前分支
git checkout wangjun03		“wangjun03为分支名字”
//做一次提交，指定提交的远程分支
git push origin omby
//查看本地分支
git branch　
//查看远程分支　　
git branch -a  
//删除本地分支
git branch -D　分支名　　
//删除远程分支         　
git push origin --delete 分支名　
//重命名本地分支
git branch -m 本地旧分支名 本地新分支名　
//重命名远程分支
//删除远程分支
git push --delete origin 远程分支名 
//重命名本地分支     
git branch -m 本地旧分支名 本地新分支名  
//重命名远程分支   
git push origin 本地新分支名              
```

```bash
//将云上的项目加载到本地
git clone https://gitee.com/wang_jun_159/immoc-product.git
```

```bash
//将本地项目加载到云上
//打开git Bash，进入项目目录下
cd immoc-product
//查看当前目录下的文件是否加载到缓存（红色表示没有加载，绿色表示加载成功）
git status
//将当前项目目录下的文件加载到缓存
git add .
//将当前项目加载到本地，并赋予日志
git commit -m "电商系统基本搭建成功，未优化"
//将当前项目提交到云上
git push --set-upstream origin master
```

```bash
//转到主分支
git checkout master
//更新主分支
git pull
//切换到自己的分支
git checkout 自己的分支名字
//将主分支中和自己分支对应的分支最新版和自己本地分支合并
git merge master
```