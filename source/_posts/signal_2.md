---
title: 信号的时域处理
tags: [数字信号处理,算法]
categories: [数字信号处理]
math: true
date: 2022-10-13 22:55:00
excerpt: 数字信号处理、算法
---
#   **信号的时域处理** 

## 第一问

## 要求

 ① 选择子作业１中的音频信号，自行给定滤波器的**系统函数**，采用**差分方程方法**对音频信号进行滤波处理，**比较滤波前后信号的波形**和回放的效果。

## 实验原理

* 对于直接I型的**IIR滤波器**(**无限长单位冲激响应滤波器**)的系统函数为：

$$
H(z)=\frac{Y(z)}{X(z)}=\frac{\sum _{k=0}^{M}b_{k}z^{-k}}{1-\sum _{k=1}^{N}a_{k}z^{-k}}
$$

* 其对应的**差分方程**为：

$$
y(n)=\sum _{k=1}^{N}a_{k}y(n-k)+\sum _{k=0}^{M}b_{k}x(n-k)
$$

* 由此，我们只需要求出对应的**差分方程系数**就能够确定一个IIR滤波器。

### 巴特沃斯滤波器的设计

![ ](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/butterworth.png)

* 比较经典的**IIR滤波器**有**巴特沃斯滤波器**，我们可以根据我们所需要设计的需求来确定**通带截止频率**和**阻带截止频率**以及**通带最大衰减分贝**和**阻带最小衰减分贝**，运用**Matlab**完善的函数运算功能就能够确定出巴特沃斯滤波器的对应的**差分方程系数**。

## 程序设计

```matlab
clear;

%声音信号的采样
[x,Fs] = audioread('Carmen_overture_noisy_8k_9.5k.wav');
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

%巴特沃斯滤波器设计
wp=2*7760/Fs;%通带截止频率（数字滤波器作归一化变换）
ws=2*8000/Fs;%阻带截止频率（数字滤波器作归一化变换）
Rp=2;%通带最大衰减2dB
As=30;%阻带最小衰减30dB
[N,wc]=buttord(wp,ws,Rp,As);%求滤波器的阶数N与3dB截止频率wc
[b,a]=butter(N,wc);%得到差分方程系数
y=filter(b,a,x);%滤波
subplot(223);
plot(time,y);
title('直接法滤波后声音信号时域波形')
xlabel('时间/s');

%滤波后信号fft变换
f_true=time*Fs/length(time);
k=fft(y,length(time));
k(:,ceil(length(k)/2):end) = [];%去掉快速傅里叶变换对称的一半
l=f_true*Fs/1e3;
l(:,ceil(length(l)/2):end) = [];%去掉快速傅里叶变换对称的一半
subplot(224);
plot(l,abs(k));title('直接法滤波后声音信号傅里叶变换');xlabel('kHz');

%绘制归一化滤波器参数
figure(2);
freqz(b,a);

%写入和试听音频
audiowrite('direct.wav',y,Fs);
```

## 实验结果

* **巴特沃斯滤波器**归一化频率**幅频响应**和**相频响应**

![ ](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/IIR幅频响应.png)

* **巴特沃斯滤波器**滤波效果

![](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/IIR对比图.png)

## 分析总结

* 首先对原始音频信号进行**快速傅里叶变换**观察其频谱，发现在**8kHz-9.5kHz**有**高频噪声信号**。因此，滤波器理论截止频率应该在8kHz。查阅资料，对于**差分方程法**，我们选择**IIR型**中的**巴特沃斯滤波器**。经过多次测试，发现设置**通带截止频率**为7.76kHz，**阻带截止频率**为8kHz，**通带最大衰减**2dB，**阻带最小衰减**30dB。通过运算后得到滤波器系统函数的**分子、分母多项式系数**向量b和向量a，即为**差分方程的系数**。根据系统函数直接运算得到滤波效果如上图所示，试听生成的音频发现高频噪声已经滤去。

## 第二问

## 要求

  ②  选择子作业１中的音频信号，自行给定滤波器的**系统函数**，采用**时域线性卷积**对音频信号进行滤波处理，**比较滤波前后信号的波形**和回放的效果。

## 实验原理

* 对于FIR数字滤波器（有限长单位冲激响应滤波器），由于

$$
H(z)=\sum _{k=0}^{M}b_{k}z^{-k}=\sum _{k=0}^{M}h\left[ k \right] z^{-k}
$$

* 因此设计FIR数字滤波器时，我们只需要求出 $h[k]$，即滤波器的单位冲激响应，与音频信号进行卷积后得到滤除高频噪声的音频信号。



## 程序设计

```matlab
clear;

%声音信号的采样
[x,Fs] = audioread('Carmen_overture_noisy_8k_9.5k.wav');
x=x.';
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
l(:,ceil(length(l)/2):end) = [];%去掉快速傅里叶变换对称的一半;
subplot(222);
plot(l,abs(k));title('原始声音信号傅里叶变换');xlabel('kHz');

%fir（默认汉宁窗）滤波器设计
h=fir1(3000,7.99e3*2/22.05e3);
y = conv(x,h);%卷积运算
y(:,length(x)+1:length(y)) = [];%将卷积后信号的长度变换为原信号长度
subplot(223);
plot(time,y);
title('卷积法滤波后声音信号时域波形')
xlabel('时间/s');

%滤波后信号fft变换
f_true=time*Fs/length(time);
k=fft(y,length(time));
k(:,ceil(length(k)/2):end) = [];%去掉快速傅里叶变换对称的一半
l=f_true*Fs/1e3;
l(:,ceil(length(l)/2):end) = [];%去掉快速傅里叶变换对称的一半
subplot(224);
plot(l,abs(k));title('卷积法滤波后声音信号傅里叶变换');xlabel('kHz');

%试听和写入信号
 audiowrite('fir_conv.wav',y,Fs);
 
figure(2);
stem(h,'.');
title('FIR单位冲激响应')
axis([1460 1540 -0.3 0.8]);
```

## 实验结果

* **Hamming窗函数**(单位冲激响应)

![](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/FIR单位冲激响应.png)

* **Hamming窗函数**滤波效果

![](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/FIR对比图.png)

## 分析总结

* 首先对原始音频信号进行**快速傅里叶变换**观察其频谱，发现在**8kHz-9.5kHz**有**高频噪声信号**。因此，滤波器理论截止频率应该在8kHz。查阅资料，对于**时域卷积法**，我们选择**FIR型**中的**Hamming窗**。经过多次测试，发现设置**3000阶**的**幅值3dB衰减对应频率在7.99kHz**时效果较好。通过运算后得到滤波器的部分单位冲激响应如上图所示。根据**单位冲激响应**直接和**时域波形**进行**卷积运算**得到滤波效果如上图所示，试听生成的音频发现高频噪声已经滤去。

