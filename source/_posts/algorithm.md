---
title: 算法题目分享总结
tags: [数据结构]
categories: [数据结构]
date: 2023-6-17 20:00:00
excerpt: 算法题目分享总结!
---
# 王道机试指南

## 例题2.2 反序数

 [题目链接](http://t.cn/E9WBrut)

采用Reverse函数用于求反序数，通过对x不断进行除运算，然后对revx不断进行乘运算。

```cpp
#include <bits/stdc++.h>
using namespace std;

int Reverse(int x) {
    int revx = 0;
    while (x != 0) {
        revx *= 10;
        revx += x % 10;
        x /= 10;
    }
    return revx;
}

int main() {
    for (int i = 1000; i < 10000; i++) {
        if (i * 9 == Reverse(i)) {
            printf("%d\n", i);
        }
    }
    return 0;
}
```

## 例题2.4 输出梯形

题目描述：输入一个高度h，输出一个高度为h、上底边长度为h的梯形。

```cpp
#include <bits/stdc++.h>
using namespace std;
int main()
{
    int h=0;//梯形的高度
    while(scanf("%d",&h)!=EOF){
        int all = h+2*(h-1);
        int space=0,star=0;
        for(int i=0;i<h;i++){
            space=all-(h+2*i);
            star=all-space;
            for(int k=0;k<space;k++){
                printf(" ");
            }
            for(int k=0;k<star;k++){
                printf("*");
            }
            printf("\n");
        }
    }
    return 0;
}
```

P.S:可以采用上述while循环的语句能够保证对多组测试数据进行处理，又使程序输入结束后能够正常退出。scanf函数的返回值是成功赋值的个数。

```cpp
while(scanf("%d",&h)!=EOF)
```

## 例题2.5 叠筐
[题目链接](http://acm.hdu.edu.cn/showproblem.php?pid=2074)

求解排版题的新思路：当输出的图形具有的规律不能或者很难直接应用到输出时，应该首先用一个缓存数组来保存将要输出的字符阵列，然后在该数组上完成排版，最后按照排版输出整个图形。

```cpp
#include <bits/stdc++.h>
using namespace std;
int main()
{
    int num=0;//输入的奇数
    int count = 0;//记录输出了多少次
    char center,outside;
    char rect[100][100];
    while(scanf("%d %c %c",&num,&center,&outside)!=EOF){
        if(num%2==0){
            printf("error");
        }
        else{
            char insert=NULL;
            //中心赋值
            int center_index=num/2;
            rect[center_index][center_index]=center;
            //循环插入外边框
            for(int i=1;i<=num/2;i++){
                if(i%2==1){
                    insert = outside;
                }
                else{
                    insert = center;
                }
                //插入横向
                for(int k=center_index-i;k<=center_index+i;k++){
                    rect[center_index-i][k]=insert;
                    rect[center_index+i][k]=insert;
                }
                //插入纵向
                for(int k=center_index-i+1;k<=center_index+i-1;k++){
                    rect[k][center_index-i]=insert;
                    rect[k][center_index+i]=insert;
                }
                //去除四角
                rect[0][0]=' ';
                rect[0][num-1]=' ';
                rect[num-1][0]=' ';
                rect[num-1][num-1]=' ';
            }
            //输出图案
            if(count==0){
                for(int i=0;i<num;i++){
                    for(int j=0;j<num;j++){
                        printf("%c",rect[i][j]);
                    }
                    printf("\n");
                    count=1;
                }
            }
            else{
                printf("\n");
                for(int i=0;i<num;i++){
                    for(int j=0;j<num;j++){
                        printf("%c",rect[i][j]);
                    }
                    count=1;
                }
            }
        }
    }
    return 0;
}
```

## 例题2.6 今天的第几天？
[题目链接](http://t.cn/E9jXK5A)

P.S:注意CPP中的二维数组创建方法

```cpp
//二维数组的定义
int day_list[2][13]={{0,31,28,31,30,31,30,31,31,30,31,30,31},
                     {0,31,29,31,30,31,30,31,31,30,31,30,31}};
```
完整的程序如下：
```cpp
#include <bits/stdc++.h>
using namespace std;

bool is_leap_year(int year){
    if(year%400==0||(year%4==0&&year%100!=0)){
        return true;
    }
    else{
        return false;
    }
}

//二维数组的定义
int day_list[2][13]={{0,31,28,31,30,31,30,31,31,30,31,30,31},
                     {0,31,29,31,30,31,30,31,31,30,31,30,31}};

int main()
{
    bool leap_year;
    int year,month,day;
    int total_days=0;
    while(scanf("%d %d %d",&year,&month,&day)!=EOF)
    {
        leap_year=is_leap_year(year);
        if(leap_year==false){
            for(int i=0;i<month;i++){
                total_days+=day_list[0][i];
            }
            total_days+=day;
            printf("%d\n",total_days);
            total_days=0;
        }
        else{
            for(int i=0;i<month;i++){
                total_days+=day_list[1][i];
            }
            total_days+=day;
            printf("%d\n",total_days);
            total_days=0;
        }
    }
    return 0;
}
```

## 例题2.9 剩下的树
[题目链接](http://t.cn/E9ufYo5)

P.S:采用指针偏移初始化的方法能够提高一直循环的效率。

```cpp
//使用指针移动方式初始化数组，提高效率
    bool remove_list[10001];
    bool* p = remove_list;  // 指向数组首元素的指针
    for (int i = 0; i < 10001; i++)
    {
        *p = true;
        p++;
    }
```

完整的程序如下：

```cpp
#include <bits/stdc++.h>
using namespace std;
int main()
{
    int total,num;
    int total_remove=0;
    int index_1,index_2;
    //使用指针移动方式初始化数组，提高效率
    bool remove_list[10001];
    bool* p = remove_list;  // 指向数组首元素的指针
    for (int i = 0; i < 10001; i++)
    {
        *p = true;
        p++;
    }

    scanf("%d %d",&total,&num);

    for(int i=0;i<num;i++)
    {
        scanf("%d %d",&index_1,&index_2);
        for(int j=index_1;j<=index_2;j++)
        {
            remove_list[j]=false;
        }
    }
    for(int i=0;i<=total;i++)
    {
        if(remove_list[i])
        {
            total_remove++;
        }
    }
    printf("%d",total_remove);
    return 0;
}
```

## 例题2.10 手机键盘
[题目链接](http://t.cn/E9ulcIc)

* 可以先将按键次数记录在一个数组中，每当遇到一个字母，直接访问数组便可得到该字母的按键次数。

```cpp
string arr[8]={"abc","def","ghi","jkl","mno","pqrs","tuv","wxyz"};
int keytab[26]={1,2,3,1,2,3,1,2,3,1,2,3,1,2,
                3,1,2,3,4,1,2,3,1,2,3,4};
```

* 判断两个字母是否属于同一个按键：如果两个字母同属一个按键，那么字母本身的间距就等于他们按键次数的差。反之，如果不相等，则这两个字母必定属于不同的按键。

```cpp
//判断在一个按键之内
            if(i!=0&&str[i]-str[i-1]==keytab[str[i]-'a']-keytab[str[i-1]-'a'])
            {
                time+=2;
            }
```

* 应当了解和掌握C++中关于`string`类型的用法。

完整的程序如下：

```cpp
#include <bits/stdc++.h>
using namespace std;
string arr[8]={"abc","def","ghi","jkl","mno","pqrs","tuv","wxyz"};
int keytab[26]={1,2,3,1,2,3,1,2,3,1,2,3,1,2,
                3,1,2,3,4,1,2,3,1,2,3,4};
int main()
{
    string str;
    while(cin>>str)
    {
        int time=0;
        for(int i=0;i<str.size();i++)
        {
            time+=keytab[str[i]-'a'];
            //判断在一个按键之内
            if(i!=0&&str[i]-str[i-1]==keytab[str[i]-'a']-keytab[str[i-1]-'a'])
            {
                time+=2;
            }
        }
        printf("%d\n",time);
    }
    return 0;
}
```

## 例题3.2 成绩排序
[题目链接](http://t.cn/E9d3ysv)

* 遇到一组基本类型数据时，可以将其封装为一个结构体或类进行处理。

```cpp
//定义一个结构体
struct student{
    int number;
    int score;
};
```

* 对于新的排序规则，具有以下准则，当比较函数的返回值为true时，表示第一个参数将会排在第二个参数的前面。`sort`不填写默认为**升序方式**。

```cpp
bool cmp(student x,student y){
    if(x.score==y.score)
    {
        return x.number<y.number;
    }
    else
    {
        return x.score<y.score;
    }
}
```

完整的程序如下：

```cpp
#include <iostream>
#include <cstdio>
#include <algorithm>
using namespace std;

//定义一个结构体
struct student{
    int number;
    int score;
};

student arr[101];

bool cmp(student x,student y){
    if(x.score==y.score)
    {
        return x.number<y.number;
    }
    else
    {
        return x.score<y.score;
    }
}

int main()
{
    int num;
    while(scanf("%d",&num)!=EOF)
    {
        //赋值
        for(int i=0;i<num;i++)
        {
            scanf("%d %d",&arr[i].number,&arr[i].score);
        }
        sort(arr,arr+num,cmp);
        //输出结果
        for(int i=0;i<num;i++)
        {
            printf("%d %d\n",arr[i].number,arr[i].score);
        }
    }
    return 0;
}
```

## 例题3.5 查找
[题目链接](http://t.cn/E9g8aaR)

* 二分查找法必须熟练掌握（采用升序）

```cpp
//二分查找法(升序)
bool BinaySearch(int n,int target)
{
    int left=0,right=n-1;
    int middle;
    while(left<=right){
        middle=left+(right-left)/2;
        if(target<arr[middle])
        {
            right=middle-1;
        }
        else if(target>arr[middle])
        {
            left=middle+1;
        }
        else{
            return true;//找到了
        }
    }
    return false;//没有找到
}
```

完整的程序如下：

```cpp
#include <bits/stdc++.h>
using namespace std;
int arr[101];

//二分查找法(升序)
bool BinaySearch(int n,int target)
{
    int left=0,right=n-1;
    int middle;
    while(left<=right){
        middle=left+(right-left)/2;
        if(target<arr[middle])
        {
            right=middle-1;
        }
        else if(target>arr[middle])
        {
            left=middle+1;
        }
        else{
            return true;//找到了
        }
    }
    return false;//没有找到
}

int main()
{
    int n;
    int num,target;
    while(scanf("%d",&n)!=EOF)
    {
        for(int i=0;i<n;i++)
        {
            scanf("%d",&arr[i]);
        }
        sort(arr,arr+n);
        scanf("%d",&num);
        for(int j=0;j<num;j++)
        {
            scanf("%d",&target);
            if(BinaySearch(n,target))
            {
                printf("YES\n");
            }
            else
            {
                printf("NO\n");
            }
        }
    }
    return 0;
}
```

## 第四章 字符串处理

### string中的元素操作

string中的常用元素操作包括：

* 在任意位置插入元素的insert()

```cpp
#include <bits/stdc++.h>
using namespace std;
int main()
{
    string str="hello world";
    str.insert(str.size()," and you!");
    cout<<str<<endl;
    return 0;
}
```

输出：

```cpp
hello world and you!
```

* 在任意位置删除元素的erase()

括号内第一个数字是起始下标，第二个数字是偏移。不加第二个数字则为从起始一直擦除到最后。

```cpp
#include <bits/stdc++.h>
using namespace std;
int main()
{
    string str="hello world and you!";
    str.erase(0,12);
    cout<<str<<endl;
    string str2="hello world and you!";
    str2.erase(7);
    cout<<str2<<endl;
    return 0;
}
```

输出：

```cpp
and you!
hello w
```

* 将字符串中所有的内容直接清空的clear()

### string中的运算符

* string类型的字符串可以通过"+"和"+="来将两个或者多个字符串拼接成一个更长的字符串
* string类型按照字典序进行比较

在数学中，字典或词典顺序（也称为词汇顺序，字典顺序，字母顺序或词典顺序）是基于字母顺序排列的单词按字母顺序排列的方法,如abcdefg........也称为字典序。字典序最最小：指的是顺序最小和字符串的长度无关。如d和abcd比较，d>a, 然后直接结束比较。abcd为最小字典序。在ab 和 abc 比较，前两个字符一样，然后abc字符串长。ab为最小字典序。

### string中的常用函数

* c++中find() 函数与string::npos参数

```cpp
//统计ACSII码值在(0-127)中不同字符的个数 
#include <bits/stdc++.h>
using namespace std;
int main()
{
	string str;
	int num = 0;
	getline(cin, str);
	//int m;
	//m = str.size();
	for (int i = 0; i < 128; i++)
	{
		if (str.find(i) != string::npos)
			num++;
	}
	cout << num;
	return 0;
}
```

* c++中返回字符串子串函数substr()

```cpp
#include <bits/stdc++.h>
using namespace std;
int main()
{
    string str="hello world and you!";
    string str2=str.substr(6,5);
    cout<<str2<<endl;
    return 0;
}
```

