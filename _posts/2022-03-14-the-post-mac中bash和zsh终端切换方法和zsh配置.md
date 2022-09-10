---
title: mac中bash和zsh终端切换方法和zsh配置
layout: post
tags: []
---
bash命令行工具是mac自带的，在网上查找自行安装zsh，然后运行命令的时候报错了

```bash
zsh: command not found: npm
```

npm命令没有找到，在之前bash中是因为在 .bash\_profile 中配置了环境变量，所以可以自由自在地使用npm各种命令，在使用zsh shell时，.zshrc 没有配置环境变量所以就报错了。

## .zshrc配置环境变量

**把 bash 中.bash\_profile 全部环境变量加入**

```css
open .zshrc
```

找到#User configuration，然后添加配置

 `source ~/.bash_profile`

最后在 zsh 终端执行命令就可以使用了

```bash
source .zshrc
```

接下来就可以使用npm的各种命令了，yep!

## bash和zsh切换

切换到bash

```undefined
chsh -s /bin/bash
```

```undefined
chsh -s /bin/zsh
```
