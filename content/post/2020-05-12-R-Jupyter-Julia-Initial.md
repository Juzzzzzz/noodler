---
title: '新电脑配置 R, Jupyter, Julia'
date: 2020-05-12
authors:
    - noodler
categories:
    - 软件
    - 日志
tags:
    - R
    - Jupyter
    - Julia
    - Mac
---

# `R`

## `.Renviron` 文件

这个文件保存R自身设置的一些环境变量，建立一个存放R包的文件夹环境变量 `R_LIBS_USER`:

``` r
# 新建一个存放R包的文件夹
dir.create("~/.R_PKG")
# 将环境变量写入文件
file.create("~/.Renviron")
write('R_LIBS_USER=\"~/.R_PKG\"', file = "~/.Renviron", append = TRUE)
```

## `Rtools` 环境

``` r
write('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', file = "~/.Renviron", append = TRUE)
```

## `.Rprofile` 文件

R的启动选项，暂时把镜像和 `HUGO` 设置上：

``` r
options(
    repos = c(CRAN = "https://mirrors.tuna.tsinghua.edu.cn/CRAN"),
    blogdown.hugo.dir = 'C:/Env/HUGO/0.70.0/'
)
```


# `Python`

## `Anaconda` 环境变量

``` zsh
## Anaconda3
export PATH="/Users/noodler/APP/anaconda3/bin:$PATH"
```

## `jupyter_notebook_config.py` 文件

``` bash
# 生成配置文件
jupyter notebook --generate-config
```

``` python
# 生成密码
from IPython.lib import passwd
passwd()
```

获得密码散列值：

`'sha1:0834563448:3900ac34634563464a377'`

修改 `jupyter_notebook_config.py` 文件：

``` python
c.NotebookApp.notebook_dir = 'Projects'
c.NotebookApp.ip = '*'
c.NotebookApp.password = 'sha1:0834563448:3900ac34634563464a377'
```

# `Julia`

## `Julia` 创建软链接

``` bash
sudo ln -s /Applications/Julia.app/Contents/Resources/julia/bin/julia /usr/local/bin/julia
```

## `startup.jl` 文件

创建文件：

``` bash
mkdir ~/.julia/config
touch ~/.julia/config/startup.jl
```


