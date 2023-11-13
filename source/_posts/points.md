---
title: Points
tags: [数据结构,分治法]
categories: [数据结构]
date: 2021-12-12 21:40:00
excerpt: 分治法、算法
---

### 题目描述

 ![ ](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/7.png)  

### 示例输入

```
//第一个输入为有几个点，其下输入为点的坐标
3

1 1

3 4

2 1
```

### 实现原理

​        本次示例程序使用10000个点来测试分治法的效率，利用分治法求10000个点中的最小点对，首先将一万个点按照x的大小从小到大排序，若x相同，则按照y的大小排序，得到有序排列的一万个点，再取数组中间值的元素将一万个点分为s1和s2两部分，先分别求出s1和s2两部分的最小点对取其最小值，再与跨越s1和s2的点对距离进行对比，这里有筛选条件为当奋力在s1和s2两边的点如果x轴或者y轴到中间点的距离必须小于或等于s1与s2两部分点的最小值，即形成一个矩形内取点，通过不断递归得到最小点对。设置全局变量记录最小点对的坐标即可，经测试可以在1s内得到最小点对。  

### 示例结果
![ ](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/6.png)

### 完整代码实现

```c
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include <sys/time.h>

#define INF 99999
#define N 10000

int m,t;
int temp[N];//储存宽度为d的点

struct node {
    double x;
    double y;
}point[N];

int compar(const void* a, const void* b)//用来比较两个元素的函数，即函数指针（回调函数）
{
    struct node A = *(struct node*)a;
    struct node B = *(struct node*)b;
    if (A.x != B.x)
        return A.x - B.x;//按照x从小到大的顺序排序
    else return A.y - B.y;//当x相等的时候，按照y的从大到小的顺序排序
}

double Min_distance(double left, double right)//返回距离的大小关系
{
    return left < right ? left : right;
}

double distance(int left, int right)//计算两点距离的函数
{
    return sqrt((point[left].x - point[right].x) * (point[left].x - point[right].x) + ((point[left].y - point[right].y) * (point[left].y - point[right].y)));
}

double Closest_Pair(int left, int right)
{
    double End_dis = INF;//距离的初始值,无穷大
    int i = 0, j = 0, k = 0;

    if (left == right)//只有一个点的时候，返回无穷大
        return End_dis;

    if (right - left == 1)// 刚好两个点的时候，返回两点的距离
        return distance(left, right);

    int mid = (left + right) / 2;//大于或等于三个点的时候

    double distance_left = Closest_Pair(left, mid);//左边递归
    double distancer_ight = Closest_Pair(mid + 1, right);//右边递归

    End_dis = Min_distance(distance_left, distancer_ight);//比较左右两边点对距离，找出其中的最小值


    for (i = left; i <= right; i++)//找出符合要求的距离mid横坐标小于等于d的点
    {
        if (fabs(point[mid].x - point[i].x) <= End_dis)
            temp[k++] = i;//temp用于储存符合要求的点的序号
    }
    for (i = 0; i <= k - 1; i++)//通过纵坐标寻找最短距离
        for (j = i + 1; j <= k - 1 && j < i + 7; j++)
            if (fabs(point[temp[j]].y - point[temp[i]].y) < End_dis)
            {
                if(End_dis>=distance(temp[i], temp[j]))
                {
                    m=temp[i];
                    t=temp[j];
                }
                else m = left,t = right;
                End_dis = Min_distance(End_dis, distance(temp[i], temp[j]));
            }
    return End_dis;
}

int main()
{
    struct timeval start, end;
    int n;
    scanf("%d",&n);
    double a;
    for (int i = 0; i < n; i++)
            scanf("%lf %lf", &point[i].x, &point[i].y);
        gettimeofday(&start, NULL);
        qsort(point, n, sizeof(point[0]), compar);
        a = Closest_Pair(0, n - 1);
        gettimeofday(&end, NULL);
        printf("the shortest distance is:%.10lf\n", a);
        printf("the co-ordinates of the pair of points is:\n%.10lf %.10lf\n",point[m].x,point[m].y);
        printf("%.10lf %.10lf\n",point[t].x,point[t].y);
        long elapsed = (end.tv_sec - start.tv_sec)*1000000.0 + end.tv_usec - start.tv_usec;
        printf("%.ld ms elapsed\n", elapsed);
    return 0;
}

```

