---
title: 打包.exe应用程序
tags: [PYTHON,exe]
categories: [可执行文件]
date: 2022-9-6 13:30:00
excerpt: 打包.exe应用程序
---
# 打包.exe应用程序

## 用python打包exe应用程序-PyInstaller

### **1、PyInstaller简介**

PyInstaller是一个跨平台的Python应用打包工具，支持 Windows/Linux/MacOS三大主流平台，能够把 Python 脚本及其所在的 Python 解释器打包成可执行文件，从而允许最终用户在无需安装 Python 的情况下执行应用程序。
PyInstaller 制作出来的执行文件并不是跨平台的，如果需要为不同平台打包，就要在相应平台上运行PyInstaller进行打包。

### **2、PyInstaller安装**

```python
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple Pyinstaller
```

### 3.参数含义

**-F** 表示生成单个可执行文件

**-w** 表示去掉控制台窗口，这在GUI界面时非常有用。不过如果是命令行程序的话那就把这个选项删除吧！

**-p** 表示你自己自定义需要加载的类路径，一般情况下用不到

**-i** 表示可执行文件的图标

### 4.示例

在`.py`和`.ico`文件夹下打开终端

```
pyinstaller -F -i ./fac.ico tree.py
```

这个时候多了很多文件和文件夹，dist目录就是我们打包好的地方。使用-w只生成`.exe`文件

## PYTHON使得.exe文件运行完保留

```python
import os
os.system("pause")
```

## C++使得.exe文件运行完保留

```c++
#include <iostream>
system("Pause");//生成的exe运行完程序保留，点任意键结束
```

