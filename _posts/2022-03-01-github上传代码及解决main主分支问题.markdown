---
layout: "post"
title: "Github上传代码及解决main主分支问题"
date: "2022-03-01 02:02"
---

**github已经更新将main作为主分支，用以前上传master分支的方式就总是要切换分支很麻烦，所以记录一下解决方法**

## 上传方法

1.右键要上传的文件点击[git](https://so.csdn.net/so/search?q=git&spm=1001.2101.3001.7020) bash here  
2\. 输入git [init](https://so.csdn.net/so/search?q=init&spm=1001.2101.3001.7020)初始化在文件夹中出现.git文件  
3\. 输入git [add](https://so.csdn.net/so/search?q=add&spm=1001.2101.3001.7020) . //将所有添加文件放入仓库  
4\. 输入git commit -m “描述信息”  
5\. git branch -M main //选择main分支，可以改名上传其它分支  
6\. git [remote](https://so.csdn.net/so/search?q=remote&spm=1001.2101.3001.7020) add origin 仓库地址 //连接仓库  
7\. git tag -a 1.0.1 -m “1.0.1” //添加版本号  
8\. git push -u [origin](https://so.csdn.net/so/search?q=origin&spm=1001.2101.3001.7020) main上传文件到仓库  
9\. 若仓库事先存在readme文件无法上传，输入git pull origin main --allow-unrelated-histories之后再重复提交操作

**若要解决main分支问题，在做完前面的1,2,3,4,5,6后做运行下面的脚本**

```powershell
git checkout -b main            //创建main分支，已有可以不用建立
```

```powershell
git branch -D master               //删除本地的master分支
```

```powershell
3.	git push origin --delete master               //删除github仓库里的master分支
```

若事先在该仓库里创建了readme文件的话，就需要先将其拉回来再上传

```powershell
git pull origin main --allow-unrelated-histories                //将远程分支上的文件拉回来
```

```powershell
git push origin main                  //上传文件
```

如果上面的文件不重要的话，可以强制上传，丢掉之前的文件：

```powershell
git push -u origin main -f                   //强制上传文件
```

# 更新代码

1. git pull origin main --allow-unrelated-histories将仓库文件都拉回来
2. git push -u origin main上传更新后的代码

[参考文章](https://www.bilibili.com/read/cv8633117/)
