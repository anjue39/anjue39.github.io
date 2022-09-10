---
title: jekyll个人博客中添加音乐播放插件
layout: post
tags: []
---
文章首发[个人博客](https://yizibi.github.io/),转载参考注明来源[个人博客中添加音乐播放插件](https://yizibi.github.io/2018/10/15/jekyll%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2%E4%B8%AD%E6%B7%BB%E5%8A%A0%E9%9F%B3%E4%B9%90%E6%92%AD%E6%94%BE%E6%8F%92%E4%BB%B6/)

> 最近在打理自己的博客,突发奇想,想在博客里播放音乐;想着应该可以实现吧;感觉有时候,复习笔记,听着音乐,好有感觉的样子;

### 摸索过程[](https://yizibi.github.io/2018/10/15/jekyll%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2%E4%B8%AD%E6%B7%BB%E5%8A%A0%E9%9F%B3%E4%B9%90%E6%92%AD%E6%94%BE%E6%8F%92%E4%BB%B6/#%E6%91%B8%E7%B4%A2%E8%BF%87%E7%A8%8B)

#### iframe标签尝试[](https://yizibi.github.io/2018/10/15/jekyll%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2%E4%B8%AD%E6%B7%BB%E5%8A%A0%E9%9F%B3%E4%B9%90%E6%92%AD%E6%94%BE%E6%8F%92%E4%BB%B6/#iframe%E6%A0%87%E7%AD%BE%E5%B0%9D%E8%AF%95)

因为,平时都用`markdown`记录,就搜了一下,markdown支持播放音乐;

就搜到[这篇文章](https://www.sunyazhou.com/2017/12/27/20171227markdown-audio/),主要说的是,用`iframe`这个标签,来实现;因为`markdown`其实就是 一种`html`的转换语法,内部也同时支持直接写html标签;

然而,我尝试了一下,不行;网上大部分都是网易云音乐插件播放的;

特点就是 UI 好看;不妨,你也可以试试,反正我失败了;

#### jekyllcodex插件尝试[](https://yizibi.github.io/2018/10/15/jekyll%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2%E4%B8%AD%E6%B7%BB%E5%8A%A0%E9%9F%B3%E4%B9%90%E6%92%AD%E6%94%BE%E6%8F%92%E4%BB%B6/#jekyllcodex%E6%8F%92%E4%BB%B6%E5%B0%9D%E8%AF%95)

我又尝试了其他的办法,我在想,是不是不同的博客驱动,底层对`html`解析也不近相同,想到这里,我换了关键词搜索,然后就看到[这篇文章](https://leohope.com/%E8%A7%A3%E9%97%AE%E9%A2%98/2018/06/04/music-player/),我的技术好友[Hope](https://leohope.com/)写的不错,基本可以实现在博客中播放音乐,不过文章中的最后需要在 `_layout.html`文件中添加代码的,跟官网不一样,估计是 JS 文件调用充重复,作者没有写;我按照[官网](https://jekyllcodex.org/without-plugin/open-embed/)上的,可以正常显示;

### 环境要求[](https://yizibi.github.io/2018/10/15/jekyll%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2%E4%B8%AD%E6%B7%BB%E5%8A%A0%E9%9F%B3%E4%B9%90%E6%92%AD%E6%94%BE%E6%8F%92%E4%BB%B6/#%E7%8E%AF%E5%A2%83%E8%A6%81%E6%B1%82)

- jekyll
- 七牛

### 开始使用[](https://yizibi.github.io/2018/10/15/jekyll%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2%E4%B8%AD%E6%B7%BB%E5%8A%A0%E9%9F%B3%E4%B9%90%E6%92%AD%E6%94%BE%E6%8F%92%E4%BB%B6/#%E5%BC%80%E5%A7%8B%E4%BD%BF%E7%94%A8)

#### step1[](https://yizibi.github.io/2018/10/15/jekyll%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2%E4%B8%AD%E6%B7%BB%E5%8A%A0%E9%9F%B3%E4%B9%90%E6%92%AD%E6%94%BE%E6%8F%92%E4%BB%B6/#step1)

首先下载这个文件[open-embed.html](https://raw.githubusercontent.com/jhvanderschee/jekyllcodex/gh-pages/_includes/open-embed.html),右键,另存为`Html`;下面是源码,也可以复制保存下面的源码;

```Html
<style>
.videoWrapper {
	position: relative;
	padding-bottom: 56.333%;
	height: 0;
    background: black;
}
.videoWrapper iframe {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
    border: 0;
}    
</style>

<script>
function get_youtube_id(url) {
    var p = /^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/;
    return (url.match(p)) ? RegExp.$1 : false;
}
function vimeo_embed(url,el) {
    var id = false;
    $.ajax({
      url: 'https://vimeo.com/api/oembed.json?url='+url,
      async: true,
      success: function(response) {
        if(response.video_id) {
          id = response.video_id;
          if(url.indexOf('autoplay=1') !== -1) var autoplay=1; else var autoplay=0;
          if(url.indexOf('loop=1') !== -1) var loop=1; else var loop=0;
          var theInnerHTML = '<div class="videoWrapper"><iframe src="https://player.vimeo.com/video/'+id+'/?byline=0&title=0&portrait=0';
          if(autoplay==1) theInnerHTML += '&autoplay=1';
          if(loop==1) theInnerHTML += '&loop=1';
          theInnerHTML += '" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div>'; 
          el.innerHTML = theInnerHTML;
        }
      }
    });
}
function video_embed() {
    var p = document.getElementsByTagName('p');
    for(var i = 0; i < p.length; i++) {
        //check if this is an external url (that starts with https:// or http://
        if (p[i].innerHTML.indexOf("http://") == 0 ||
            p[i].innerHTML.indexOf("https://") == 0) {
            var youtube_id = get_youtube_id(p[i].innerHTML);
            if(youtube_id) {
                if(p[i].innerHTML.indexOf('autoplay=1') !== -1) var autoplay=1; else var autoplay=0;
                if(p[i].innerHTML.indexOf('loop=1') !== -1) var loop=1; else var loop=0;
                var theInnerHTML = '<div class="videoWrapper"><iframe width="720" height="420" src="https://www.youtube.com/embed/' + youtube_id + '?rel=0&showinfo=0';
                if(autoplay==1) theInnerHTML += '&autoplay=1';
                if(loop==1) theInnerHTML += '&loop=1&playlist='+youtube_id+'&version=3';
                theInnerHTML += '" frameborder="0" allowfullscreen></iframe></div>';
                p[i].innerHTML = theInnerHTML;
            }
            if(p[i].innerHTML.indexOf('vimeo.com') !== -1) {
                //ask vimeo for the id and place the embed
                vimeo_embed(p[i].innerHTML,p[i]);
            }
        }
    }
}
video_embed();

function mp3_embed() {
    var p = document.getElementsByTagName('p');
    for(var i = 0; i < p.length; i++) {
        if(p[i].innerHTML.indexOf('.mp3') !== -1) {
            var str = p[i].innerHTML.split('?');
            if(str.length == 1) str[1] = '';
            var str1 = str[1];
            str1 = str1.replace('&','').replace('&','');
            str1 = str1.replace('autoplay=1','').replace('autoplay=0','');
            str1 = str1.replace('loop=1','').replace('loop=0','');
            str1 = str1.replace('controls=0','').replace('controls=1','');

            if (str[0].lastIndexOf('.mp3', str[0].length - 4) === str[0].length - 4 && str1.length == 0) {
                if(str[1].indexOf('autoplay=1') !== -1) var autoplay=1; else var autoplay=0;
                if(str[1].indexOf('loop=1') !== -1) var loop=1; else var loop=0;
                if(str[1].indexOf('controls=0') !== -1) var controls=0; else var controls=1;
                var newInnerHTML = '<audio';
                if(autoplay==1) newInnerHTML += ' autoplay';
                if(loop==1) newInnerHTML += ' loop';
                if(controls==1) newInnerHTML += ' controls';
                newInnerHTML += '><source src="'+str[0]+'" type="audio/mpeg">Your browser does not support the audio element.</audio>';
                p[i].innerHTML = newInnerHTML;
            }
        }
    }
}
mp3_embed();
</script>
```

#### step2[](https://yizibi.github.io/2018/10/15/jekyll%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2%E4%B8%AD%E6%B7%BB%E5%8A%A0%E9%9F%B3%E4%B9%90%E6%92%AD%E6%94%BE%E6%8F%92%E4%BB%B6/#step2)

将上一步存储好的文件,保存到`_includes`目录下,就像下面这个样子

![](http://yizhibi.6chemical.com/blog_openembed.png?imageMogr2/thumbnail/!70p)

#### step3[](https://yizibi.github.io/2018/10/15/jekyll%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2%E4%B8%AD%E6%B7%BB%E5%8A%A0%E9%9F%B3%E4%B9%90%E6%92%AD%E6%94%BE%E6%8F%92%E4%BB%B6/#step3)

在`_layouts`目录下,`default.html`这个文件,打开,在最下面,找到对应的标签`</body>`,加入如下代码,注意:标签不要重复了

![](http://yizhibi.6chemical.com/blog_step3.png-shuiyin?imageMogr2/thumbnail/!70p)

### 使用语法[](https://yizibi.github.io/2018/10/15/jekyll%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2%E4%B8%AD%E6%B7%BB%E5%8A%A0%E9%9F%B3%E4%B9%90%E6%92%AD%E6%94%BE%E6%8F%92%E4%BB%B6/#%E4%BD%BF%E7%94%A8%E8%AF%AD%E6%B3%95)

借助七牛云之类的图床或云端存储，将需要的音乐文件上传至图床，并获得外链。

然后，在Markdown中直接使用

```Html
<p>音乐外链url</p>
```

### 示例[](https://yizibi.github.io/2018/10/15/jekyll%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2%E4%B8%AD%E6%B7%BB%E5%8A%A0%E9%9F%B3%E4%B9%90%E6%92%AD%E6%94%BE%E6%8F%92%E4%BB%B6/#%E7%A4%BA%E4%BE%8B)

按照上面的步骤走,即可获得如下效果的播放器（以下音乐为「西安人的歌」）

Your browser does not support the audio element.

结束了;
