---
title: 数字滤波器性能指标分析
tags: [数字信号处理,算法]
categories: [数字信号处理]
math: true
date: 2022-12-21 18:30:00
excerpt: 数字信号处理、算法
---
# 数字滤波器设计

## 要求

​         为了完成对子作业1中音频信号的滤波，对子作业1中的音频信号进行频谱分析，并获取滤波器设计所需要的性能指标。 

## 音频加噪处理

​         由于在子作业1中的音频较为纯净，没有过多噪声。为了方便数字滤波器性能指标的分析和数字滤波器的设计，需要对原有的音频进行加噪处理。本项目通过在音频的8.5kHz至10kHz中增加带限噪声，并在绘制出其时域波形和频域波形。

![](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/噪声.png)

## 加噪程序设计

```matlab
clear ;

%声音信号的采样
[x,Fs] = audioread('puppy love.mp3');
x=x(:,1);%由于x是双声道，所以取它的左声道
x=x.';%转置
n=length(x);%获取x的采样点数
dt=1/Fs;%求采样间隔
time=(0:n-1)*dt;%采样时间点
subplot(221);
plot(time,x);
title('原始声音信号时域波形')
xlabel('时间/s');

%原始信号fft变换
f_true=time*Fs/length(time);
k=fft(x,length(time));
k(:,ceil(length(k)/2):end) = [];%去掉快速傅里叶变换对称的一半
l=f_true*Fs/1e3;
l(:,ceil(length(l)/2):end) = [];%去掉快速傅里叶变换对称的一半
subplot(222);
plot(l,abs(k));title('原始声音信号傅里叶变换');xlabel('kHz');

%加入带限噪声
noise=0;
for f=8500:20:10000
noise=noise+0.01*sin(2*pi*f*time);
end
xa=x+noise;
subplot(223);
plot(time,xa);
title('加噪声音信号时域波形')
xlabel('时间/s');

%加噪信号傅里叶变换
f_true=time*Fs/length(time);
k=fft(xa,length(time));
k(:,ceil(length(k)/2):end) = [];%去掉快速傅里叶变换对称的一半
l=f_true*Fs/1e3;
l(:,ceil(length(l)/2):end) = [];%去掉快速傅里叶变换对称的一半
subplot(224);
plot(l,abs(k));title('加噪后声音信号傅里叶变换');xlabel('kHz');
```

## 数字滤波器性能指标分析

假设数字滤波器的频率响应表示为：
$$
H(e^{j \omega})=|H(e^{j \omega})|e^{j \beta(j \omega)}
$$
根据下图中理想低通滤波器逼近的误差容限可以看出，频率响应有通带、过渡带、阻带三个范围。


![](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/滤波器.png)

下图为不同滤波器的技术指标：

![](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/滤波器2.png)

​        因此我们对加噪后的音频频谱进行分析，可以看出音频在5kHz之后的幅值已经非常小，所以可以确定出**通带截止频率**为8kHz，**阻带截止频率**为8.5kHz。**通带最大允许衰减**为1dB,**阻带最小允许衰减**为80dB。

## 项目开源

点击🔗即可下载完整可运行项目： [项目下载](https://vkceyugu.cdn.bspapp.com/VKCEYUGU-bc82cde5-9df0-4e04-8d4f-a0e9e1bd241b/dbd83ec7-d54c-48be-9672-43e5c875bbe4.zip)



