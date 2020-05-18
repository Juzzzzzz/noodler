---
title: 'Mac 的初始配置问题'
date: 2020-05-13
authors:
    - noodler
categories:
    - 软件
    - 日志
    - Blog
tags:
    - Mac
---
## 有些破解软件安装后无法使用

安装后输入命令：

``` bash
sudo xattr -rd com.apple.quarantine /Applications/Final\ Cut\ Pro.app
```


## 隐藏文件夹

``` bash
chflags hidden ./Applications
```

## 安装 `Homebrew`

``` bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# 替换国内源

# 替换成阿里巴巴的 brew.git 仓库地址:
cd "$(brew --repo)"
git remote set-url origin https://mirrors.aliyun.com/homebrew/brew.git

# # 还原为官方提供的 brew.git 仓库地址
# cd "$(brew --repo)"
# git remote set-url origin https://github.com/Homebrew/brew.git
 
# 替换成阿里巴巴的 homebrew-core.git 仓库地址:
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.aliyun.com/homebrew/homebrew-core.git

# # 还原为官方提供的 homebrew-core.git 仓库地址
# cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
# git remote set-url origin https://github.com/Homebrew/homebrew-core.git

# 替换 homebrew-bottles 访问地址
echo '\n## Homebrew Bottles\nexport HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles' >> ~/.zshrc
```

## 配置 `oh-my-zsh`

``` bash
# 安装
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 自动补全插件
mkdir .oh-my-zsh/plugins/incr
cd ~/.oh-my-zsh/plugins/incr 
wget https://mimosa-pudica.net/src/incr-0.2.zsh
cd ..
sudo chmod -R 775 incr 
echo "\n## incr-0.2.zsh plugin\nsource ~/.oh-my-zsh/plugins/incr/incr-0.2.zsh" >> ~/.zshrc
```

如果出现权限问题

``` bash
chmod 755 /usr/local/share/zsh
chmod 755 /usr/local/share/zsh/site-functions
```

## 删除启动台无效的图标

``` bash
cd /private/var/folders/
sudo find ./ -name com.apple.dock.launchpad
# 进入刚刚找到的目录
cd .//dn/lp83fzsn3l79yzfr4syqcbdm0000gn/0/com.apple.dock.launchpad
cd db/
sqlite3 db "delete from apps where title='Hacknet';"&&killall Dock
```
