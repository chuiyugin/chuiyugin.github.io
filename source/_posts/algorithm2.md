---
title: 算法笔记
tags: [数据结构]
categories: [数据结构]
date: 2023-11-5 20:00:00
excerpt: 算法笔记的学习与分享总结!
---
# 算法笔记

## C/C++快速入门

### 头文件

* 当我们忘记函数包含在哪个头文件下时或者头文件包含较多时，可以使用这个万能头文件来代替。但这个头文件也有缺点，最明显的是使用后**编译时间太长**。另外，由于 `include＜bits/stdc++.h＞`不是C++的标准头文件，所以会**有少部分编译器不支持**。因此建议使用**标准头文件**！

### 主函数

* 主函数是一个程序的入口位置，整个程序从主函数开始执行，而且一个程序最多只能有一个主函数。

### 基本数据类型

#### 变量的定义 

* 变量是在程序运行过程中**其值可以改变的量**，需要在**定义**之后才可以使用。

#### 变量的类型

##### 基本数据类型

* 基本数据类型分为**整型、浮点型、字符型和布尔型**。

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310102009603.png)

* 注意在计算机系统中不管正数与负数的表示和存储都是以**补码**的形式。
* **原码**的表示为：第一位表示符号（0为正，1为负），其余位表示数值。
* **反码**的表示方法分为正数和负数两种：
  - 正数的反码等于原码本身。
  - 负数的反码是在其原码的基础上，符号位不变（即首位不变），其余各位按位取反。
* **补码**的表示方法同样分为正数和负数两种：
  - 正数的补码是其原码本身。
  - 负数的补码是在其原码的基础上，符号位不变，其余各位按位取反后加1（即在反码的基础上加1）。

##### 整型(int)
* 对于整型`int`而言，一个整数占**32bit**，即**4个Byte**，一般绝对值在$$10^9$$范围以内的整数都可以定义为**int型**。

##### 长整型(long long)

+ 对于长整型`long long`而言，一个整数占**64bit**，即**8个Byte**，如果需要的整数取值范围超过**2147483647**(超过$$10^{10}$$)就需要使用**长整型**。

##### 浮点型

* `%f`是**单精度浮点型**(`float`)和**双精度浮点型**(`double`)的输出格式
* 对于浮点型而言，一般不需要使用`float`，碰到浮点型都应该使用`double`来进行存储。

##### 字符型

###### 字符变量和字符常量

```cpp
char c;
char c = 'e';
```

+ 从上面的程序中可以看出来，第一段的`c`被成为**字符变量**，对于带单引号的`‘e’`则被称为**字符常量**，而且必须是**单个字符**。
+ **小写字母**比**大写字母**的**ASCII码值**大**32**。
+ `%c`是`char`型的输出格式。

###### 转义字符

- **ASCII码**中有一部分是**控制字符**，是**不可显示**的。

+ 比较常用的转义字符：

> \n 表示换行
>
> \0 表示空字符NULL，其ASCII码为0，要注意 \0 不是空格

###### 字符串常量

字符串常量可以作为初值赋给字符串数组，并且使用`%s`的格式输出。

```cpp
#include <cstdio>
using namespace std;
int main(){
    char str[25] = "this is the char test";
    printf("%s",str);
    return 0;
}
```

输出结果：

```
this is the char test
```

##### 布尔型

布尔型变量只能是**true(真、非零)**和**false(假、零)**。

#### 强制类型转换

强制类型转换的格式如下：

> (新类型名)变量名

#### 符号常量和const常量

* 符号常量通俗而言就是替换，也称为“宏定义”。

```cpp
#define 标识符 常量
#define pi 3.14
```

* 另一种定义常量的办法是const常量。

```cpp
const 数据类型 变量名 = 常量;
const double pi = 3.14;
```

> 这两种写法都被称为常量，一旦确定其值后将无法改变。

#### 运算符

##### 算术运算符

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310122043030.png)

##### 关系运算符

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310122044294.png)

##### 逻辑运算符

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310122045903.png)

##### 条件运算符

```cpp
A : B ? C
```

+ 如果A为真，执行并返回B的结果；如果A为假，那么执行并返回C的结果。

##### 位运算符

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310122048285.png)

### 顺序结构

#### 使用scanf和printf输入/输出

##### scanf格式符

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310131437646.png)

+ 注意上表中最后一行，数组名称本身就代表了这个数组第一个元素的地址，所以不需要加取地址运算符。因此在`scanf`中，除了`char`数组整个输入的情况不加`&`之外，其他变量类型都需要加`&`。

+ 注意字符数组使用`%s`读入的时候以**空格**和**换行**为读入结束的标志。

##### printf格式符

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310131513505.png)

+ 对于`double`类型的变量，其在`printf`中的输出格式变成了`%f`，而在`scanf`中却是`%lf`。

##### 三种实用的输出格式

###### %md

+ `%md`可以使不足**m**位的`int`型变量以**m**位进行右对齐输出，其中高位用**空格**补齐，如果变量本身超过**m**位，则保持原样。

```cpp
#include <cstdio>
using namespace std;
int main(){
    int a = 123;
    int b = 12345678;
    printf("%5d\n",a);
    printf("%5d\n",b);
    return 0;
}
```

+ 输出：

```
  123
12345678
```

###### %0md

+ `%0md`只是在`%md`中间多加了**0**。和`%md`的唯一不同在于当变量不足**m**位时，将在前面补足够数量的**0**而不是空格。

```cpp
#include <cstdio>
using namespace std;
int main(){
    int a = 123;
    int b = 12345678;
    printf("%05d\n",a);
    printf("%05d\n",b);
    return 0;
}
```

+ 输出：

```
00123
12345678
```

###### %.mf

+ %.mf可以让浮点数保留m位小数输出，精度是“四舍六入五成双”，具体而言为：
  + 5前为奇数，舍5入1；
  + 5前为偶数，舍5不进（0是偶数）。

#### 使用getchar()和putchar()输入/输出字符

+ `getchar()`用来输入单个字符，`putchar()`用来输出单个字符。
+ `getchar()`可以识别并读入换行符。

#### typedef

+ `typedef`能够给复杂的数据类型起一个别名，这样在使用过程中就可以使用别名来替换原来的写法。

```cpp
#include <cstdio>
using namespace std;
typedef long long LL;
int main(){
    LL a = 123456789123454321;
    printf("%lld\n",a);
    return 0;
}
```

+ 输出：

```
123456789123454321
```

### 选择结构

#### if语句

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310171623893.png)

#### if语句的嵌套

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310171624875.png)

#### switch语句

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310171624551.png)

### 循环结构

#### while语句

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310171628441.png)

* 在while语句中，只要条件A成立就一直执行省略号里面的内容。

#### do...while语句

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310171630802.png)

* do...while语句会先执行省略号中的内容一次，然后才判断**条件A**是否**成立**，如果**条件A**成立，就继续反复执行省略号中的内容，直到某一次条件A**不再成立**，则退出循环。

#### for语句

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310171634133.png)

+ for语句的具体格式如下：

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310171634463.png)

#### break和continue语句

+ `break`语句不仅可以强制退出`switch`语句，而且break同样可以退出循环语句，即可以在需要的条件下直接退出循环。
+ `continue`语句的作用和`break`语句的作用有点相似，它可以在需要的地方临时结束循环的**当前轮回**，然后进入**下一轮回**。

### 数组

#### 一维数组

+ **数组**就是把**相同数据类型**的变量组合在一起而产生的**数据集合**，**数组**就是从某个地址开始**连续若干个位置**形成的元素集合。（*数组的地址是连续存放的*）
+ 一维数组的定义格式如下：

```
数据类型 数组名[数组大小]；
```

+ 数组大小必须是**整数常量**，不可以是变量。

#### 冒泡排序

+ 冒泡的本质是在于**交换**，即每次通过交换的方式把**当前剩余元素**的**最大值**移动到一端，而**当剩余元素**减少为**0**时，排序结束。

```cpp
#include <cstdio>
#include <math.h>
using namespace std;
int main(){
    int temp = 0;
    int a[7] = {3,6,10,9,4,8,7};//n=7
    for(int i=1;i<=6;i++)//整个过程执行n-1趟
    {
        //每一趟中将左边元素与右边相邻元素依次对比，若大的数在左边，则交换这两个数
        //当该趟结束的时候，该趟的最大数被移到了该趟剩余数的最右边
        for(int j=0;j<7-i;j++)
        {
            if(a[j]>a[j+1])
            {
                temp = a[j];
                a[j] = a[j+1];
                a[j+1] = temp;
            }
        }
    }
    for(int i=0;i<=6;i++)
    {
        printf("%d ",a[i]);
    }
    return 0;
}
```

#### 二维数组

+ 二维数组是一位数组的扩展：

```cpp
数据类型 数组名[第一维大小][第二维大小];
```

+ `int a[5][6]`数组的直观理解：

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310182107408.png)

+ **特别提醒：**如果数组的大小较大，大概在$$10^6$$的级别，则**需要定义在主函数外面**，否则会使得程序异常退出，原因是函数内部申请的局部变量来自**系统栈**，所允许申请的**空间较小**；而函数外部申请的全局变量来自**静态存储区**，允许申请的**空间较大**。

#### memset——对数组中每个元素赋相同的初值

+ **需要注意的是**：`memset`使用的是按**字节**赋值，即对**每个字节**赋相同的值，这样的话，在`int`型数组中每个数据的**四个字节**都会被分配为**相同的值**，因此为了避免出错，只建议对非`char`型的数组赋值为**0**和**-1**；
+ 使用`memset`对数组赋值时需要用`#include<string.h>`头文件；

+ `memset`函数的格式为：

```cpp
memset(数组名，赋的数值，sizeof(数组名));
```

#### 字符数组

##### 字符数组的初始化

+ 和普通数组一样，字符数组也可以采用循环的方法初始化；
+ 除此之外，字符数组也可以通过**直接赋值字符串**来进行初始化（**仅限于初始化**，程序的其他位置不允许这样直接赋值整个字符串）

```cpp
#include <cstdio>
using namespace std;
int main(){
    char str[10] = "YUGIN!";
    for(int i=0; i<6;i++)
    {
        printf("%c",str[i]);
    }
    return 0;
}
```

+ 输出：

```
YUGIN!
```

##### 字符数组的输入输出

###### scanf输入，printf输出

+ `scanf`和`printf`对字符类型有`%c`和`%s`两种格式，其中`%c`用来输入**单个字符**，`%s`用来输入**一个字符串**并存在**字符数组**中。
+ `%c`格式能够识别**空格**和**换行符**并将其输入，`%s`通过**空格**或**换行符**来识别**一个字符串的结束**。

+ `scanf`在使用`%s`时，后面对应的数组名是不需要加`&`**取地址运算符**的。

```cpp
#include <cstdio>
using namespace std;
int main(){
    char str[10];
    scanf("%s",str);
    printf("%s",str);
    return 0;
}
```

+ 输入输出：

```
输入：test test test
输出：test
```

###### getchar输入，putchar输出

+ `getchar`和`putchar`分别用来输入和输出**单个字符**；
+ 输入和输出示例：

```cpp
#include <cstdio>
using namespace std;
int main(){
    char a;
    a=getchar();
    getchar();//可以用作吸收某些字符
    putchar(a);
    putchar('\n');
    return 0;
}
```

###### gets输入，puts输出

+ `gets`用来输入**一行字符串**（即**一个一维数组**，只有遇到`\n`时结束）
+ `puts`用来输出一行字符串（即一个一维数组，只有遇到`\n`时结束）

```cpp
#include <cstdio>
using namespace std;
int main(){
    char a[20];
    char b[4][10];
    gets(a);
    for(int i=0;i<2;i++)
    {
        gets(b[i]);
    }
    puts(a);
    for(int i=0;i<2;i++)
    {
        puts(b[i]);
    }
    return 0;
}
```

+ 输入输出示例：

```
输入：
this is 
yugin's
blog
输出：
this is 
yugin's
blog
```

##### 字符数组的存放方式

+ 由于**字符数组**是由若干个`char`类型的元素组成，因此**字符数组**的每一位都是一个`char`字符。
+ 在**一维数组**（或是**二维数组的第二维**）的末尾都有一个**空字符**`\0`，用于表示存放的**字符串的结尾**。

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310221521845.png)

+ 特别注意：**空字符**`\0`的**ASCII**码为**0**，即空字符`NULL`，会占用一个**字符位**，因此在初始化的时候**数组长度**至少比**字符串长度**多一个长度。
+ 如果不是使用`scanf`函数的`%s`格式或`gets`函数输入字符串（例如使用`getchar`），则需要手动在字符数组最后加入`\0`，否则输出字符串会因为无法识别字符串末尾而输出**乱码**。

#### string.h头文件

+ `string.h`头文件包含了许多用于字符数组的函数。

##### strlen()函数

+ `strlen()`函数可以得到字符数组中第一个`\0`前的字符的个数并返回，其格式如下：

```cpp
len = strlen(字符数组)；
```

##### strcmp()函数

+ strcmp函数返回两个字符串大小的比较结果，比较原则是字典序，其格式如下：

```cpp
cmp = strcmp(字符数组1，字符数组2);
```

+ 字典序的解释：

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310221535589.png)

##### strcpy()函数

+ `strcpy()`函数可以把一个字符串复制给另一个字符串，其格式如下：

```cpp
strcpy(字符数组1,字符数组2);
puts(字符数组1);
```

+ 注意：是把**字符数组2**复制给**字符数组1**，包括**结束符**`\0`；

##### strcat()函数

+ `strcat()`可以把一个字符串接到另一个字符串后面，其格式如下：

```cpp
strcpy(字符数组1,字符数组2);
puts(字符数组1);
```

+ 注意：是把**字符数组2**接到**字符数组1**后面；

##### sscanf()和sprintf()

+ `sscanf()`和`sprintf()`是处理字符串问题的利器！

+ `sscanf()`和`sprintf()`的使用格式如下：

```
sscanf(str,"%d",&n);
sprintf(str,"%d",n);
```

+ 上面`sscanf()`写法的作用是把字符数组`str`的中的内容以`"%d"`的格式写到`n`中（**从左到右**）。

```cpp
#include <cstdio>
#include <string.h>
using namespace std;
int main(){
    char a[20] = "123";
    int n=0;
    sscanf(a,"%d",&n);
    printf("%d",n);
    return 0;
}
```

+ 输出：

```
123
```

+ 上面`sprintf()`写法的作用是把`n`以`"%d"`的格式写到`str`字符数组中（**从右到左**）。

```cpp
#include <cstdio>
#include <string.h>
using namespace std;
int main(){
    char a[20];
    int n=123433;
    sprintf(a,"%d",n);
    printf("%s",a);
    return 0;
}
```

+ 输出：

```
123433
```

+ 上面的仅仅是简单的应用，实际上`sscanf()`和`sprintf()`可以进行更加复杂的字符串处理：

```cpp
#include <cstdio>
#include <string.h>
using namespace std;
int main(){
    char str[100];
    int n=520;
    double db=2002.080512121;
    char str2[20]="yugin!";
    char str3[20]="I";
    sprintf(str,"%s%d%s,%.4f",str3,n,str2,db);
    printf("%s",str);
    return 0;
}
```

+ 输出：

```
I520yugin!,2002.0805
```

+ 最后指出，`sscanf()`和`sprintf()`也可以支持正则表达式，则许多字符串问题将迎刃而解。

### 函数

+ 函数是一个实现一定功能的语句的集合，并在需要时可以反复调用而不必每次都重新写一遍。
+ 函数的基本语法格式：

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310221718986.png)

#### 全局变量

+ 全局变量是指在定义之后的所有程序段内都有效的变量（即定义在所有函数之前）

#### 局部变量

+ 与全局变量相对，局部变量定义在函数内部，且只在函数内部生效，函数结束时局部变量便销毁。

#### 再谈main()函数

+ 主函数对一个程序而言只有一个，且无论主函数写在哪个位置，整个程序一定是从主函数的第一个语句开始执行，然后在需要时再调用其他函数。
+ `main()`函数的结构：

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310221723044.png)

#### 以数组作为函数的参数

+ 函数的参数可以是数组，且数组作为参数时，参数中数组的第一维不需要填写长度（如果是二维数组，则**第二维需要填写长度**）
+ 数组作为参数时，在函数中对数组元素的修改就**等同于对原素组进行修改**（与普通的局部变量不同）

```cpp
#include <cstdio>
#include <string.h>
using namespace std;
//函数
void changStr(int a[],int b[][3])
{
    a[0]=1;
    a[1]=3;
    b[1][2]=5;
}
//主函数
int main(){
    int inter[5]={0};
    int in[2][3]={0};
    changStr(inter,in);
    printf("%d\n",inter[0]);
    printf("%d\n",inter[1]);
    printf("%d",in[1][2]);
    return 0;
}
```

+ 输出：

```
1
3
5
```

+ 注意：虽然数组可以作为参数，但是却不允许作为返回类型出现。

#### 函数的嵌套调用

+ 函数的嵌套调用是指在一个函数中调用另一个函数，调用方式和`main()`函数调用其他函数一样。

#### 函数递归调用

+ 函数递归调用是指一个函数调用该函数本身；

+ 类似下面计算n的阶乘的代码：

```cpp
#include <cstdio>
#include <string.h>
using namespace std;
//函数
int F(int n)
{
    if(n==0) return 1;
    else return F(n-1)*n;
}
//主函数
int main(){
    int a=3;
    printf("%d",F(a));
    return 0;
}
```

+ 输出：

```
6
```

### 指针

#### 什么是指针

+ 在C语言中，**指针**就是**内存地址**，**指针变量**是指用来**存放内存地址的变量**。
+ 在C/C++语言中，**指针**一般被认为是**指针变量**，指针变量的内容存储的是**其指向的对象的首地址**，指向的对象可以是**变量**（指针变量也是变量），**数组**，**函数**等**占据存储空间的实体**。
+ 只要在变量前面加上`&`，就表示变量的地址。
+ 指针是一个`unsigned`类型的函数。

#### 指针变量

+ 指针变量是用来存放指针（或者可以理解为地址）。
+ 在某种数据类型后加`*`来表示这是一个指针变量，定义如下：

```cpp
int *p;
double *p;
char *p;
```

+ 给指针变量赋值的方式一般是把变量的地址取出来，然后赋给对应类型的指针变量：

```cpp
int a;
int *p = &a;
```

+ 如果`p`是指针（即`p`保存的是某个数据类型的地址），则`*p`就是这个地址所存放的元素：

```cpp
#include <cstdio>
#include <string.h>
using namespace std;
//主函数
int main(){
    int a;
    int *p = &a;
    a=233;
    printf("%d",*p);
    return 0;
}
```

+ 输出：

```
233
```

+ 指针变量也可以进行加减法，其中**减法**的结果是两个地址偏移的距离。
+ 例如，对于`int*`类型的指针变量`p`而言，`p+1`是指`p`所指的int型变量的下一个`int`型变量地址，这个所谓的“下一个”是跨越了一整个`int`型（即**4Byte**）。
+ 指针变量也支持自增和自减的操作，示例如下：

```cpp
#include <cstdio>
#include <string.h>
using namespace std;
//主函数
int main(){
    int a;
    int *p = &a;
    a=233;
    printf("%d\n",p);
    printf("%d\n",p+1);
    p++;
    printf("%d",p);
    return 0;
}
```

+ 输出：

```
113245364
113245368
113245368
```

#### 指针与数组

+ **数组名称**作为**首地址**使用，因此`a == &a[0]`和`a+i == &a[i]`成立。

```cpp
#include <cstdio>
#include <string.h>
using namespace std;
//主函数
int main(){
    int a[10]={1,2,4,5,7};
    int *p = a;
    int *q;
    printf("%d\n",p);
    q=&a[5];
    printf("%d\n",q);
    printf("%d",q-p);
    return 0;
}
```

+ 输出：

```
1241512688
1241512708
5
```

+ `&a[0]`和`&a[5]`之间相差5个`int`（**4个Byte**），因此输出5。

#### 使用指针变量作为函数参数

+ 指针类型也可以作为**函数参数**的类型，这时视为把**变量的地址**传入函数。如果在函数中对这个地址中的元素进行改变，原先的数据就会确实地被改变。
+ 使用指针编写交换数据地函数：

```cpp
#include <cstdio>
#include <string.h>
using namespace std;
//交换函数
void my_swap(int *a,int *b)
{
    int temp;
    temp = *a;
    *a = *b;
    *b = temp;
}
//主函数
int main(){
    int a=1;
    int b=2;
    my_swap(&a,&b);
    printf("a=%d b=%d",a,b);
    return 0;
}
```

+ 输出：

```
a=2 b=1
```

#### 引用

##### 引用的含义

+ 引用是**C++**中一个强有力的语法，引用不产生**副本**，而是给原变量起了个**别名**。
+ 因此**对引用变量操作就是对原变量操作**。
+ 引用使用方法只需要在参数类型后面变量名前面加`&`就行，例子如下：

```cpp
#include <cstdio>
#include <string.h>
using namespace std;
//引用示例函数
void change(int &x)
{
    x=5;
}
//主函数
int main(){
    int b=88;
    change(b);
    printf("b=%d",b);
    return 0;
}
```

+ 输出：

```
b=5
```

+ 注意要把**引用**的`&`和取**地址运算符**`&`区分开来，引用并不是取地址的意思。

##### 指针的引用

+ 通过引用和函数来更改变量指针的地址：

```cpp
#include <cstdio>
#include <string.h>
using namespace std;
//交换函数
void my_swap(int* &p1,int* &p2)
{
    int* temp = p1;
    p1 = p2;
    p2 = temp;
}
//主函数
int main(){
    int a=1;
    int b=2;
    int* p_a = &a;
    int* p_b = &b;
    my_swap(p_a,p_b);//必须用指针变量传入，引用不可以使用常量。
    printf("a=%d b=%d",*p_a,*p_b);
    return 0;
}
```

+ 输出：

```
a=2 b=1
```

+ 需要强调的是，**引用**是产生**变量的别名**，因此**常量不可使用引用**，上述代码不可写成`my_swap(&a,&b);`，必须用**指针变量**进行传入。

### 结构体(struct)的使用

#### 结构体的定义

+ 定义一个结构体的基本格式如下：

```cpp
struct Name{
  //一些基本的数据结构或者自定义的数据类型
};
```

+ 结构体可以这样定义：

```cpp
struct studentInfo{
	int id;
	char gender;//'F'or'M'
	char name[20];
	char major[20];
}Alice,Bob,stu[1000];
```

+ 其中`studentInfo`是这个结构体的名字，内部定义了相关的数据。**大括号外**定义了**结构体变量**和**结构体数组**。

+ 结构体同样能够像基本数据类型那样定义：

```cpp
studentInfo Alice;
studentInfo stu[1000];
```

+ 值得注意的是，结构体里面能够定义除了自己本身之外的任何数据类型。

```cpp
struct node{
	node n;//不能定义node型变量，因为和本身一致
	node* next;//可以定义node*型指针变量
};
```

+ 虽然不能定义自己本身，但是可以定义自身类型的指针变量。

#### 访问结构体内的元素

+ 访问结构体内的元素有两种方法：`"."`和`"->"`操作。
+ 如果把`studentInfo`定义成如下：

```cpp
struct studentInfo{
	int id;
	char gender;//'F'or'M'
	studentInfo* next;
}stu,*p;
```

+ 这样`studentInfo`中多了一个指针`next`用来指向下一个学生的地址，且结构体变量中定义了**普通变量**`stu`和**指针变量**`p`。

+ 因此访问`stu`中的变量的写法如下：

```cpp
stu.id
stu.gender
stu.next
```

+ 访问指针变量`p`中的元素的写法如下：

```cpp
(*p).id
(*p).gender
(*p).next
```

+ 还有一种访问结构体指针变量内元素更加简洁的写法：

```cpp
p->id
p->gender
p->next
```

#### 结构体的初始化

+ 结构体的初始化推荐使用**构造函数**的方法。
+ 构造函数的特点是**函数名与结构体名一致**而且**不需要写返回函数**。
+ 其中自己定义构造函数的格式如下：

```cpp
struct studentInfo{
	int id;
	char gender;//'F'or'M'
	//以下构造函数的参数用于对结构体内部变量进行赋值
	studentInfo(int _id,char _gender)
	{
		id = _id;
		gender = _gender;
	}
};
```

+ 根据上述代码，即可直接对结构体的变量进行赋值：

```cpp
studentInfo stu = studentInfo(20020805,'M');
```

+ 需要注意，如果**自己重新定义了构造函数**，则不能不经初始化就定义结构体变量，如下定义能够适应更多不同的场合：

```cpp
struct studentInfo{
	int id;
	char gender;//'F'or'M'
	//原始构造函数，用以不初始化就定义结构体变量
	studentInfo(){}
	//只初始化gender的构造函数
	studentInfo(char _gender)
	{
		gender = _gender;
	}
	//以下构造函数的参数用于对结构体内部两个变量进行赋值
	studentInfo(int _id,char _gender)
	{
		id = _id;
		gender = _gender;
	}
};
```

### 补充

#### cin和cout

+ cin和cout是C++的输入输出函数，需要添加头文件`#include <iostream>`和`using namespace std;`才能使用。

##### cin

+ `cin`采用输入运算符`">>"`来进行输入，例如

```cpp
cin >> n >> db >> c >> str;
```

+ 如果想读入一整行，则需要`getline`函数：

```cpp
char str[100];
cin.getline(str,100);
```

+ 如果是`string`容器，则需要使用以下方式输入：

```cpp
char str[100];
getline(cin,str);
```

##### cout

+ `cout`采用输出运算符`"<<"`来进行输出，例如

```cpp
cout << n << db << c << '\n' << str << endl;
```

+ `endl`和`'\n'`都是表示换行的意思。
+ 由于`cin`和`cout`在输入和输出大量数据时表现糟糕，因此不建议使用。

#### 浮点数的比较

+ 由于计算机中采用有限二进制编码，存储并不总是准确，因此需要需要引入极小数`eps`来对这种误差进行纠正。
+ 圆周率`pi`的表达式可以使用`acos(-1.0)`来进行表示。

```cpp
const double esp = 1e-8;
const double pi = acos(-1.0);

#define Equ(a,b) (fabs(a-b)<eps)
```

### 黑盒测试

#### 单点测试

+ 对于单点测试而言，单点测试只需要按照正常逻辑执行一遍程序即可，是“一次性”的写法，即程序只需要一组数据能够完整执行即可。

#### 多点测试

+ 对于多点测试，要求程序能够一次运行所有数据，并要求所有输出的结果都必须正确。

##### while...EOF型

+ 当题目没有说明有多少数据读入时，就可以利用`scanf`返回值是否为`EOF`来判断输入是否结束。

```cpp
while(scanf("%d",&n) != EOF){
	...
}
```

+ 如果读入的是字符串，其对应写法如下：

```cpp
while(scanf("%s",str) != EOF){
	...
}
while(gets(str) != NULL){
	...
}
```

## 入门模拟

### 再谈字符串输入输出

+ 在比较早的`C/C++`版本中，经常可以看到推荐使用`gets`函数来进行整行字符串的输入，就像下面这样的简单写法即可输入一整行：

```cpp
gets(str);
```

+ 但是当输入的字符串长度超过数组长度上限`MAX_LEN`时，`gets`函数会把超出的部分也一并读进来，并且会覆盖数组之外的内存空间，这就导致了一定的安全风险，因此`C++11`标准将`gets`函数废弃了，然后在`C++14`时将该函数移除，如果现在想要整行输入的话，推荐使用`cin.getline`函数（见下文）。

```cpp
cin.getline(str, MAX_LEN);
```

+ 例如下面一道例题：

```cpp
//题目：输入一行字符串，然后直接输出这行字符串本身。
//输入描述：一行由大小写字母或空格组成的字符串，至少一个字符，不超过50个字符。
//输出描述：原样输出输入的字符串。
//**************************样例**************************
//输入：Huo Zhe Bu Jiu Shi Cang Cu Na Li You De Liao Ni Wo
//输出：Huo Zhe Bu Jiu Shi Cang Cu Na Li You De Liao Ni Wo
//**************************代码**************************
#include <cstdio>
#include <iostream>
using namespace std;
const int MAX_LEN = 1000000;
//主函数
int main(){
    char str[MAX_LEN];
    cin.getline(str,MAX_LEN);//由gets(str);函数换成了cin.getline(str,MAX_LEN);
    puts(str);
    return 0;
}
```

### 再谈sscanf()和sprintf()

#### 关于sscanf()

+ `sscanf`是C语言标准库中的一个函数，用于从字符串中读取格式化输入。在C++中也可以使用`sscanf`函数，但更常用的是使用C++标准库中的`stringstream`类来进行字符串解析。

+ `sscanf`函数的原型如下：

```cpp
int sscanf(const char* str, const char* format, ...);
```

+ 其中，`str`是要解析的字符串，`format`是格式化字符串，用于指定解析的规则，`...`是可变参数列表，用于接收解析出来的数据。

+ 与之相似的函数还有`scanf`和`fscanf`。其中，`scanf`从标准输入（通常是键盘）读取数据，而`fscanf`从文件中读取数据。

在使用`sscanf`函数时，需要注意以下几点：

- `format`字符串中可以包含格式说明符，如 `%d`, `%f`, `%s`, `%c`, `%x`, `%o`, `%u`, `%e`, `%g`, `%p`, `%n`, 等等。
- `format`字符串中可以包含空格、制表符、换行符等空白字符，用于跳过输入字符串中的空白字符。
- `format`字符串中可以包含方括号 `[]`，用于指定一个字符集合。例如，`%[a-z]` 表示匹配小写字母。
- `format`字符串中可以包含星号 `*`，表示跳过该项输入。
- `sscanf()` 函数**返回成功匹配并赋值的个数**。如果返回值小于参数个数，则表示解析失败。

基于最后一条性质可以实现下述例题：

+ 题目描述：

```
给定一个字符串，它可能是以下三种格式中的一种：

A is greater than B
A is equal to B plus C
No Information
其中前两种情况中的A、B、C均为正整数，而第三种情况中没有数字。请确认字符串代表的信息是否从算术上成立，如果成立，那么输出Yes；否则输出No；如果是第三种情况，那么输出三个问号（即???）。

注：

1、请将字符串整行读入后使用sscanf函数进行处理
```

+ 输入描述：

```
一行满足题意的字符串，其中A、B、C为不超过100的正整数。
```

+ 输出描述：

```
根据题意输出Yes、No或???。
```

+ 样例：

```
*******************样例1*****************
输入:
10 is greater than 5
输出:
Yes
*******************样例2*****************
输入:
6 is equal to 1 plus 3
输出:
No
*******************样例3*****************
输入:
No Information
输出:
???
```

+ 实现代码：

```cpp
#include <cstdio>
#include <iostream>
#include <string.h>
using namespace std;
const int MAX_LEN = 1000;
//主函数
int main(){
    int A = 0,B = 0,C = 0;
    char str[MAX_LEN];
    cin.getline(str,MAX_LEN);
    if(sscanf(str,"%d is greater than %d",&A,&B) == 2)//利用sscanf() 函数返回成功匹配并赋值的个数。
    {
       if(A>B)
       {
           printf("Yes");
       }
       else
       {
           printf("No");
       }
    }
    else if(sscanf(str,"%d is equal to %d plus %d",&A,&B,&C) == 3)//利用sscanf() 函数返回成功匹配并赋值的个数。
    {
        if(A==B+C)
        {
            printf("Yes");
        }
        else
        {
            printf("No");
        }
    }
    else
    {
        printf("???");
    }
    return 0;
}
```

+ 总结：利用`sscanf()` 函数返回成功匹配并赋值的个数，从而能够很好地解决问题。

#### 关于sprintf()

+ `sprintf`是C语言标准库中的一个函数，用于将格式化的数据写入字符串中。在C++中也可以使用`sprintf`函数，但更常用的是使用C++标准库中的`ostringstream`类来进行字符串解析。

+ `sprintf`函数的原型如下：

```c
int sprintf(char *str, const char *format, ...);
```

+ 其中，`str`是要写入的字符串，`format`是格式化字符串，用于指定写入的规则，`...`是可变参数列表，用于接收要写入的数据。

+ 与之相似的函数还有`printf`和`fprintf`。其中，`printf`将输出写入标准输出（通常是屏幕），而`fprintf`将输出写入文件。

在使用`sprintf`函数时，需要注意以下几点：

- `format`字符串中可以包含格式说明符，如 `%d`, `%f`, `%s`, `%c`, `%x`, `%o`, `%u`, `%e`, `%g`, `%p`, `%n`, 等等。
- `format`字符串中可以包含空格、制表符、换行符等空白字符，用于控制输出格式。
- `format`字符串中可以包含方括号 `[]`，用于指定一个字符集合。例如，`%[a-z]` 表示匹配小写字母。
- `sprintf()` **函数返回成功写入的字符数。**如果返回值小于0，则表示写入失败。

例题：[sprintf函数](https://sunnywhy.com/sfbj/2/5/37)

+ 代码：

```cpp
#include <cstdio>
#include <iostream>
#include <string.h>
using namespace std;
const int MAX_LEN = 1000;
//主函数
int main(){
    char str[MAX_LEN];
    int year,month,day,hour,minute,second;
    scanf("%d %d %d %d %d %d",&year,&month,&day,&hour,&minute,&second);
    sprintf(str,"%04d-%02d-%02d %02d:%02d:%02d",year,month,day,hour,minute,second);//注意此处的ssprintf()函数注释将需要的字符串写入到字符串数组中
    printf("%s",str);//注意此处字符串数组需要采用printf()函数进行输出
    return 0;
}
```

+ 总结：

+ 注意代码中的`ssprintf()`函数注释**将需要的字符串写入到字符串数组**中；
+ 注意代码最后的输出字符串数组需要采用`printf()`函数进行输出。

### 再谈结构体与函数数组传参

+ 例题：[结构体与构造函数II](https://sunnywhy.com/sfbj/2/8/43)
+ 代码：

```cpp
#include <cstdio>
#include <string.h>
//结构体
struct Student {
    int id;
    char name[15];
    //构造函数
    Student(){}
    Student(int _id,char _name[]){//函数中的数组传参
        id = _id;
        strcpy(name,_name);//复制字符串数组
    }
};
//主函数
int main() {
    Student student;
    char name[15];
    int id;
    scanf("%d",&id);
    getchar();
    scanf("%s",name);//读入字符串。
    student = Student(id,name);
    printf("%d\n%s",student.id,student.name);
    return 0;
}
```

+ 总结：注意上述代码中的函数数组传参，以及字符串数组赋值；
+ 注意如何利用`scanf()`函数读入字符串。

### 再谈cin和cout

+ 例题：[cin与cout](https://sunnywhy.com/sfbj/2/9/45)
+ 代码：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <iomanip>//数据格式控制函数的头文件
const int MAX_LEN  = 200;
using namespace std;
//主函数
int main(){
    int a;
    double b;
    char str[MAX_LEN];
    cin >> a >> b;
    getchar();
    cin.getline(str,MAX_LEN);
    //fixed()函数与setprecision(int n)并用，可以控制小数点后面有n位。注意：setprecision()函数是控制有效数字的位数，而fixed()函数与setprecision(int n )函数结合使用是保留小数点后的位数，小数点的保留采用四舍五入！
    cout << a << endl << fixed << setprecision(2) << b << endl << str;
    return 0;
}
```

+ 总结：
+ `#include <iomanip>`是数据格式控制函数的头文件；
+ 在使用`cout`函数输出的时候`fixed()`函数与`setprecision(int n)`并用，可以控制小数点后面有**n位**。注意：`setprecision()`函数是控制有效数字的位数，而`fixed()`函数与`setprecision(int n )`函数结合使用是保留小数点后的位数，小数点的保留采用四舍五入！
+ 如果只使用`setprecision(int n)` 函数效果如下：

```cpp
cout << setprecision(3) << 0.12345 << endl;
cout << setprecision(3) << 1.23456 << endl;

输出：
0.123
1.23
```

+ 当要保留对应位数的小数(**四舍五入**)的时候，就需要采用`fixed()`函数，效果如下：

```cpp
cout << fixed << setprecision(3) << 0.12345 << endl;
cout << fixed << setprecision(3) << 1.23456 << endl;

输出：
0.123
1.235
```

### 再谈浮点精度比较

+ 例题：[浮点精度比较](https://sunnywhy.com/sfbj/2/9/46)
+ 代码：

```cpp
#include <cstdio>
#include <string.h>
#include <cmath>
using namespace std;
const double eps = 1e-8;
//主函数
int main(){
    int a,b,c,d;
    scanf("%d%d%d%d",&a,&b,&c,&d);
    double res1 = a* asin(sqrt(b) / 2);
    double res2 = c* asin(sqrt(d) / 2);
    if(res1 - res2 > eps)//公式1>公式2
    {
        printf("1");
    }
    else if(res2 - res1 > eps)//公式2>公式1
    {
        printf("2");
    }
    else
    {
        printf("0");
    }
    return 0;
}
```

+ 总结：一般为了避免计算机精度误差造成浮点数大小比较不准，采用浮点数常量大小为`const double eps = 1e-8;`的数据来进行区分。

### 再谈if语句

+ `if(a==b==0)`和i`f(a==0&&b==0)`的区别：
+ 这两个表达式的区别在于它们的运算顺序不同。
  + `if(a==b==0)`的运算顺序是先比较a和b是否相等(`a==b`)，然后再将**结果**与0比较。如果a和b都为0，但是`true`不等于0，所以表达式`a==b==0`为`false`。而当a和b**不相等**时，表达式`a==b==0`为`true`。
  + `if(a==0&&b==0)`的运算顺序是先判断a是否等于0，然后再判断b是否等于0。只有当a和b都等于0时，这个表达式的结果才为`true`；否则，结果为`false`。
  + 因此，这两个表达式的含义是不同的。需要特别注意！

### 简单模拟

+ 简单模拟的题目不涉及算法，一般完全根据题目描述来进行代码编写，考察的是**代码能力**！

例题：[2的幂](https://sunnywhy.com/sfbj/3/1/61)

+ 代码：

```cpp
#include <cstdio>
#include <string.h>
#include <cmath>
using namespace std;
const int m = 1007;
//主函数
int main(){
    int num;
    scanf("%d",&num);
    int res=1;
    for(int i=1;i<=num;i++)
    {
        res = ((res%m)*(2%m))%m;
    }
    printf("%d",res);
    return 0;
}
```

+ 总结：该题的**数据大小**远大于**C++**中的`long long`类型，因此不能直接进行计算，需要根据题目提示的公式**进行简化**，从而正确计算得到结果！

例题：[B1032 挖掘机技术哪家强](https://pintia.cn/problem-sets/994805260223102976/exam/problems/994805289432236032?type=7&page=0)

+ 代码：

```cpp
#include <cstdio>
#include <string.h>
using namespace std;
//主函数
int list_chengji[100010]={0};
int main(){
    int num;
    int max_chengji=-1;//注意此处最大成绩设置为-1，否则无法通过最大成绩就是为0的测试点。
    int xuhao,chengji,res_xuhao;
    scanf("%d",&num);
    for(int i=0;i<num;i++){
        scanf("%d %d",&xuhao,&chengji);
        list_chengji[xuhao]+=chengji;
    }
    for(int k=1;k<100010;k++)
    {
        if(list_chengji[k]>max_chengji)
        {
            max_chengji = list_chengji[k];
            res_xuhao = k;
        }
    }
    printf("%d %d\n",res_xuhao,max_chengji);
    return 0;
}
```

+ 总结：这道题目要**细心**，注意在代码中计算最大成绩的时候**初始值**要设置为`-1`，否则无法通过最大成绩就是为**0**的测试点。

### 查找元素

+ 查找元素类题目：给定一些元素，然后查找某个满足某条件的元素。
+ 一般而言，如果需要在一个比较小范围的数据集中查找，那么直接遍历每一个数据即可。
+ 如果需要查找的范围比较大，可以采用**二分查找**等算法来进行更快速的查找。

例题：[寻找元素对](https://sunnywhy.com/sfbj/3/2/64)

+ 代码：

```cpp
#include <cstdio>
#include <string.h>
using namespace std;
//主函数
int main(){
    int n;
    scanf("%d",&n);
    int list[1010];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&list[i]);
    }
    int x,flag=0;
    scanf("%d",&x);
    for(int k=0;k<n-1;k++)
    {
        for(int j=k+1;j<n;j++)
        {
            if(x==list[k]+list[j])
            {
                flag++;
            }
        }
    }
    printf("%d",flag);
    return 0;
}
```

### 图形输出

+ 所谓图形，其实是由若干字符组成，因此只需要弄清楚规则就能编写代码，有以下两种方法：
  + 通过规律直接进行输出；
  + 定义一个二维字符数组，通过规律填充字符数组，最后再输出整个二维数组。

例题：[画X](https://sunnywhy.com/sfbj/3/3/67)

+ 代码：

```cpp
#include <cstdio>
#include <string.h>
using namespace std;
//主函数
int main(){
    int n;
    char list[101][101];
    memset(list,' ',sizeof(list));//初始化数组
    scanf("%d",&n);
    for(int i=0;i<n;i++)
    {
        for(int k=0;k<n;k++)
        {
            if(i<n/2||i>n/2)
            {
                if(k==i||k==n-1-i)
                {
                    list[i][k]='*';
                }
            }
            else if(i==n/2)
            {
                if(k==i)
                {
                    list[i][k]='*';
                }
            }
        }
    }
    for(int i=0;i<n;i++)
    {
        if(i<=n/2)
        {
            for(int k=0;k<n-i;k++)
            {
                printf("%c",list[i][k]);
            }
        }
        else
        {
            for(int k=0;k<=i;k++)
            {
                printf("%c",list[i][k]);
            }
        }
        printf("\n");
    }
    return 0;
}
```

+ 总结：这类型题目主要在于找到图案的规律，若图案比较复杂可以放在二维字符数组中进行输出，注意一下二维字符数组的初始化可以采用`memset(list,' ',sizeof(list));`函数！

### 日期处理

+ 日期处理问题主要考虑平年和闰年的关系(由此产生的二月天数之间的差别)、大月和小月的问题，细节比较繁杂！

例题：[周几](https://sunnywhy.com/sfbj/3/4/73)

+ 代码：

```cpp
#include <cstdio>
#include <string.h>
using namespace std;
//初始化平年闰年的数组
//0是平年，1是闰年
int year_list[2][13]={
        {0,31,28,31,30,31,30,31,31,30,31,30,31},
        {0,31,29,31,30,31,30,31,31,30,31,30,31}
};
//是否闰年判断函数
bool leap_year(int year)
{
    if(year%400==0||(year%4==0&&year%100!=0))
    {
        return true;
    }
    else
    {
        return false;
    }
}
//判断日期前后,如果day在day1之前就是true，否则为false
bool before_afer(int year,int month,int day,int year1,int month1,int day1)
{
    if(year1-year>0)
    {
        return true;
    }
    else if(year1-year<0)
    {
        return false;
    }
    else if(year1-year==0)
    {
        if(month1-month>0)
        {
            return true;
        }
        else if(month1-month<0)
        {
            return false;
        }
        else if(month1==month)
        {
            if(day1-day>0)
            {
                return true;
            }
            else if(day1-day<=0)
            {
                return false;
            }
        }
    }
}
//计算两个日期之间的天数差值,day在day1之前，采用日期减法
int count_days(int year,int month,int day,int year1,int month1,int day1)
{
    int num=0;
    if(year1==year&&month1==month&&day1==day)
    {
        return 0;
    }
    else
    {
        while(true)
        {
            day1--;
            if(day1<1)
            {
                month1--;
                if(month1<1)
                {
                    year1--;
                    month1=12;
                }
                day1=year_list[leap_year(year1)][month1];
            }
            num++;
            if(year1==year&&month1==month&&day1==day)
            {
                break;
            }
        }
        return num;
    }
}
//主函数
int main(){
    int year,month,day;
    scanf("%d-%d-%d",&year,&month,&day);
    int num=0,shengyu=0;
    //2021-05-02是周日，用0表示（用这个日期作为基准）
    bool b_a = before_afer(2021,5,2,year,month,day);
    if(b_a)
    {
        num=count_days(2021,5,2,year,month,day);
        shengyu=num%7;
        printf("%d",shengyu);
    }
    else
    {
        num=count_days(year,month,day,2021,5,2);
        shengyu=num%7;
        if(shengyu==0)
        {
            printf("%d",0);
        }
        else
        {
            printf("%d",7-shengyu);
        }
    }
    return 0;
}
```

+ 总结：虽然本题我采用了日期减法作为函数进行运算，但是和日期减法的想法相似，主要思想如下：

  + 直接给日期加上指定的天数并不是很容易的事情，所以我们可以换个思路，**每次只加1天**，**一直加到指定的天数为止**。这样我们就把问题转换为计算加1天之后的新日期，而这个问题就相对简单许多。
  + 假设当前日期的年、月、日分别是year、month、day，那么加一天之后 day 就变成了 day+1，之后我们需要判断这个新的day是否超过了当前月份month 所拥有的总天数，如果没超过，那么相安无事，算法结束；如果超过了，那么就需要令月份month 加 1、同时让day重置为 1（即把日期变为下一个月的 1 号）。接下来，如果加了 1 之后的月份 month 变为了 13 月，那么就需要令年份year加 1、同时置月份 month重置为 1（即把日期变为下一年的 1 月）。
  + 这个过程需要知道每个月有多少天，为了方便直接取出每个月的天数，不妨设置一个二维数组`int year_list[2][13]`，用来存放每个月的天数，其中第一维为 0 时表示平年，为 1 时表示闰年。至于平年和闰年的判断方式也很简单：年份是 400 的倍数时是闰年，年份是 4 的倍数但不是 100 的倍数时也是闰年，其他情况都是平年。
  + 代码如下：

  ```cpp
  #include <cstdio>
  #include <string.h>
  using namespace std;
  //初始化平年闰年的数组
  //0是平年，1是闰年
  int year_list[2][13]={
          {0,31,28,31,30,31,30,31,31,30,31,30,31},
          {0,31,29,31,30,31,30,31,31,30,31,30,31}
  };
  //是否闰年判断函数
  bool leap_year(int year)
  {
      if(year%400==0||(year%4==0&&year%100!=0))
      {
          return true;
      }
      else
      {
          return false;
      }
  }
  //主函数
  int main(){
      int year,month,day;
      scanf("%d-%d-%d",&year,&month,&day);
      int n;
      scanf("%d",&n);
      for(int i=1;i<=n;i++)
      {
          day++;
          if(day>year_list[leap_year(year)][month])
          {
              month++;
              day=1;
              if(month>12)
              {
                  year++;
                  month=1;
              }
          }
      }
      printf("%04d-%02d-%02d", year, month, day);   // 按格式输出年月日
      return 0;
  }
  ```

  + 最后，这道例题的思考方式如下：**首先确认一个基准日期**->**(2021-05-02是周日，用0表示)**->**计算输入的日期在基准日期之前或者之后**->**计算相差多少天**->**最后计算输入的日期是周几**！
  + 通过上述步骤，该题迎刃而解！

### 进制转换

对于一个p进制数需要转换为q进制数，一般需要分为以下两步：

+ p进制数x转十进制数y：
  ![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310311125587.png)

  + 实现代码：

 ```cpp
    //p进制数x转10进制数y的函数
    int p_ten(int x,int p)
    {
        int y=0,product=1;
        while(x!=0)
        {
            y=y+(x%10)*product;
            x=x/10;
            product=product*p;
        }
        return y;
    }
 ```

+ 十进制数y转q进制数z的函数(除基取余法)：

    + 采用"除基取余法"，意思是每次将带转换的数除q，将得到的余数作为低位存储，而商继续除q并进行上面的操作，最后当商为0时，将所有位从高到低输出就可以得到z！
      
    + 例如十进制数**11**转换为**二进制**：
      
      ![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202310311132044.png)
      
    + 实现代码：

    + 代码中采用`do...while`而不是`while`的原因是如果十进制恰好是**0**会造成直接跳出循环导致结果出错，因此采用`do...while`语句。

```cpp
//十进制数y转q进制数z的函数(除基取余法)
int ten_q(int y,int q,int z_list[])
{
    int num=0,z=0;
    do {
        z_list[num]=y%q;
        num++;
        y=y/q;
    }while(y!=0);
    return num;
}
```

例题：[K进制转十进制](https://sunnywhy.com/sfbj/3/5/77)

+ 代码：

```cpp
#include <cstdio>
#include <string.h>
#include <cmath>
using namespace std;
//p进制数x转10进制数y的函数
int p_ten(int x,int p)
{
    int y=0,product=1;
    while(x!=0)
    {
        y=y+(x%10)*product;
        x=x/10;
        product=product*p;
    }
    return y;
}
//十进制数y转q进制数z的函数(除基取余法)
int ten_q(int y,int q,int z_list[])
{
    int num=0,z=0;
    do {
        z_list[num]=y%q;
        num++;
        y=y/q;
    }while(y!=0);
    return num;
}
//主函数
int main(){
    char str[10];//用于存储k进制串
    int k,str_len;
    int sum=0;
    scanf("%s %d",str,&k);
    str_len = strlen(str);
    for(int i=0;i<str_len;i++)
    {
        if(str[i]>='A'&&str[i]<='F')
        {
            sum+=(str[i]-'A'+10)*pow(k,str_len-1-i);
        }
        else
        {
            sum+=(str[i]-'0')*pow(k,str_len-1-i);
        }
    }
    printf("%d",sum);
    return 0;
}
```

+ 总结：这道例题无法直接使用上述两个函数，因此需要根据题意重新构造，但是难度不大，需要处理十进制以上的数据。

### 字符串处理

+ 字符串处理类题目可能实现逻辑比较麻烦，而且需要考虑许多细节和边界情况，因此是一种很好体现代码能力的题型。

例题：[单词倒序](https://sunnywhy.com/sfbj/3/6/79)

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
using namespace std;
const int MAXN = 1010;
//主函数   
int main(){
    char str[MAXN],str2[MAXN];
    cin.getline(str,MAXN);
    int str_len = strlen(str);
    int flag=0,m=0;
    for(int i=str_len-1;i>=0;i--)
    {
        flag++;
        if(str[i]==' ')
        {
            for(int j=i+1;j<=i+flag-1;j++)
            {
                str2[m]=str[j];
                m++;
            }
            str2[m]=' ';
            m++;
            flag=0;
        }
        else if(i==0)
        {
            for(int j=i;j<=i+flag-1;j++)
            {
                str2[m]=str[j];
                m++;
            }
            str2[m]=' ';
            m++;
            flag=0;
        }
    }
    str2[str_len]='\0';
    for(int k=0;k<str_len;k++)
    {
        printf("%c",str2[k]);
    }
    return 0;
}
```

+ 总结：细心分析，按照逻辑编写代码，问题即可迎刃而解。

例题：[公共前缀](https://sunnywhy.com/sfbj/3/6/83)

+ 代码：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
using namespace std;
const int MAXN = 55;
//主函数
int main(){
    char str[MAXN][MAXN];
    int n;
    int min_strlen=100,num=0,flag=0;
    scanf("%d",&n);
    getchar();//吸收换行符
    for(int i=0;i<n;i++)
    {
        cin.getline(str[i],MAXN);
        if(min_strlen>(int)strlen(str[i]))
        {
            min_strlen=(int)strlen(str[i]);
        }
    }
    for(int i=0;i<min_strlen;i++)
    {
        for(int k=0;k<n-1;k++)
        {
            if(str[k][i]!=str[k+1][i])
            {
                flag++;
            }
        }
        if(flag)
        {
            num=i-1;
            break;
        }
        num=i;
    }
    //printf("%d",min_strlen);
    for(int i=0;i<=num;i++)
    {
        printf("%c",str[0][i]);
    }
    return 0;
}
```

+ 总结：注意一下本题中在需要使用循环输入的时候要采用`getchar();`函数吸收一下换行符，否则换行符会输入至字符数组中！

## C++标准模板库(STL)介绍

### vector的常见用法详解

+ `"vector"`->变长数组，即"长度根据需要而自动改变的数组";
+ 要使用`vector`，需要添加`vector`头文件，即`#include <vector>`;

## 算法初步

### 排序

+ 本章先介绍**两种**基础的排序算法：**选择排序**与**插入排序**。

#### 选择排序

+ **简单选择排序**：对于一个序列`A`中的元素`A[1]-A[n]`，令`i`从`1`到`n`枚举，进行`n`趟操作，每趟从待排序部分`[i,n]`中选择最小元素，令其与待排序部分的第一个元素`A[i]`进行交换，这样元素`A[i]`就会与当前有序区间`[1,i-1]`形成新的有序区间`[1,i]`。

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202311011059055.png)

+ 总共需要进行n趟操作(1<=i<=n)，每趟操作选出待排序部分[i,n]中的最小元素，令其与A[i]交换。总复杂度为$$O(n^2)$$

+ 实现代码：

```cpp
//选择排序函数
void select_sort(int list[],int num)
{
    int min_num,k,temp;
    for(int i=0;i<num;i++)
    {
        min_num=list[i];
        k=i;
        for(int j=i;j<num;j++)
        {
            if(list[j]<min_num)
            {
                min_num = list[j];
                k=j;
            }
        }
        temp=list[i];
        list[i]=min_num;
        list[k]=temp;
    }
}
```

#### 插入排序

+ **直接插入排序**：对于一个序列`A`中的元素`A[1]-A[n]`，令`i`从`1`到`n-1`枚举，进行`n-1`趟操作。假设某一趟时，序列`A`的前`i-1`个元素`A[1]-A[i-1]`已经有序，而范围`[i,n]`还未有序，那么该趟从范围`[1,i-1]`中寻找某个位置`j`，使得将`A[i]`插入位置`j`后(此时`A[j]-A[i-1]`会后移一位至`A[j+1]-A[i]`)，范围`[1,i]`有序。
+ 思想如下图所示：

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202311011319809.png)

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202311011319528.png)

+ 实现代码：

```cpp
//插入排序函数
void insert_sort(int list[],int num)
{
    int temp,j;
    for(int i=1;i<num;i++)//进行n-1趟
    {
        temp=list[i];
        j=i;
        while(j>0&&temp<list[j-1])//只要temp小于前一个元素list[j-1]
        {
            list[j]=list[j-1];//把list[j-1]移到list[j]
            j--;
        }
        list[j]=temp;//插入位置为j
    }
}
```

#### 排序题与sort函数的应用

+ 由于排序题中大部分只需要得到排序的最终结果，而不需要去写完整的排序过程，因此推荐采用`C++`中的`sort()`函数进行处理。

##### 如何使用sort()函数排序

+ `sort()`函数的使用必须加上头文件`\#include <algorithm>`和`using namespace std;`，其使用方式如下：

```cpp
sort(首元素地址(必填),尾元素地址的下一个地址(必填),比较函数(非必填));
```

##### 如何实现比较函数cmp

###### 基本数据类型数组的排序

+ 若比较函数不填，则默认按照从小到大的顺序排序。
+ 例如：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
using namespace std;
//主函数
int main(){
    int a[5]={1,2,3,4,5};
    sort(a,a+5);
    for(int i=0;i<5;i++)
    {
        printf("%d ",a[i]);
    }
    return 0;
}
```

+ 输出：

```
1 2 3 4 5 
```

+ 如果想要实现从大到小来排序，则需要编写cmp(比较函数)：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
using namespace std;
bool cmp(int a,int b)
{
    return a>b;//可以理解为当a>b时，把a放在b前面
}
//主函数
int main(){
    int a[5]={1,2,3,4,5};
    sort(a,a+5,cmp);
    for(int i=0;i<5;i++)
    {
        printf("%d ",a[i]);
    }
    return 0;
}
```

+ 输出：

```
5 4 3 2 1 
```

+ **记忆方法**：
  + 数据“从小到大”就用`“<”`，因为`a<b`是**左小右大**
  + 数据“从大到小”就用`“>”`，因为`a>b`是**左大右小**

###### 结构体数组排序

+ 一级排序

```cpp
bool cmp(node a,node b)
{
	return a.x>b.x;
}
```

+ 二级排序

```cpp
bool cmp(node a,node b)
{
	if(a.x!=b.x)
	{
		return a.x>b.x;
	}
	else
	{
		return a.y<b.y;
	}
}
```

例题：[考场排名](https://sunnywhy.com/sfbj/4/1/97)

+ 代码：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
using namespace std;
const int MAXN = 1100;
//结构体
struct stu{
    char name[20];
    int score;
    int kaochang;
    int paiming;
};

//比较函数
bool cmp1(stu a,stu b)
{
    return a.score>b.score;
}

bool cmp2(stu a,stu b)
{
        return strcmp(a.name,b.name)<0;

}

//主函数
int main(){
    int n,num_kaochang,sum=0,num[15];
    scanf("%d",&n);
    stu stu[MAXN];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&num_kaochang);
        for(int k=sum;k<num_kaochang+sum;k++)
        {
            scanf("%s",stu[k].name);
            scanf("%d",&stu[k].score);
            stu[k].kaochang=i;
        }
        num[i]=num_kaochang;
        sort(stu+sum,stu+sum+num_kaochang, cmp1);
        stu[sum].paiming=1;
        for(int m=sum;m<sum+num_kaochang;m++)
        {
            if(stu[m].score==stu[m-1].score)
            {
                stu[m].paiming=stu[m-1].paiming;
            }
            else
            {
                stu[m].paiming=m+1-sum;//局部排名数值要减去sum
            }
        }
        sum+=num_kaochang;
    }
    sort(stu,stu+sum, cmp2);
    for(int i=0;i<sum;i++)
    {
        printf("%s %d %d\n",stu[i].name,stu[i].score,stu[i].paiming);
    }
    return 0;
}
```

+ 总结：注意一下**字符串数组的比较函数**的写法，以及这道题目局部（考场）排名的大小需要减去`sum`值。

例题：[A1025 PAT Ranking](https://pintia.cn/problem-sets/994805342720868352/exam/problems/994805474338127872?type=7&page=0)

+ 代码：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
using namespace std;
const int MAXN = 51000;
//结构体
struct stu{
    char name[20];
    int score;
    int kaochang;
    int paiming;
    int final_rank;
};

//比较函数
bool cmp1(stu a,stu b)
{
    return a.score>b.score;
}

bool cmp2(stu a,stu b)
{
    if(a.final_rank==b.final_rank)
    {
        return strcmp(a.name,b.name)<0;
    }
    else
    {
        return a.final_rank<b.final_rank;
    }

}
//主函数
int main(){
    int n,num_kaochang,sum=0;
    scanf("%d",&n);
    stu stu[MAXN];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&num_kaochang);
        for(int k=sum;k<num_kaochang+sum;k++)
        {
            scanf("%s",stu[k].name);
            scanf("%d",&stu[k].score);
            stu[k].kaochang=i+1;
        }
        //排local_rank
        sort(stu+sum,stu+sum+num_kaochang, cmp1);
        stu[sum].paiming=1;
        for(int m=sum;m<sum+num_kaochang;m++)
        {
            if(stu[m].score==stu[m-1].score)
            {
                stu[m].paiming=stu[m-1].paiming;
            }
            else
            {
                stu[m].paiming=m+1-sum;//局部排名数值要减去sum
            }
        }
        sum+=num_kaochang;
    }
    //按照成绩重新进行排名，不区分考场
    sort(stu,stu+sum, cmp1);
    stu[0].final_rank=1;
    for(int m=1;m<sum;m++)
    {
        if(stu[m].score==stu[m-1].score)
        {
            stu[m].final_rank=stu[m-1].final_rank;
        }
        else
        {
            stu[m].final_rank=m+1;
        }
    }
    //按照字典序排输出
    sort(stu,stu+sum, cmp2);
    //输出
    printf("%d\n",sum);
    for(int i=0;i<sum;i++)
    {
        printf("%s %d %d %d\n",stu[i].name,stu[i].final_rank,stu[i].kaochang,stu[i].paiming);
    }
    system("pause");// 防止运行后自动退出，需头文件stdlib.h
    return 0;
}
```

+ 总结：可以在**结构体数组**中把对应要输出的内容提前定义，这样在运算赋值之后就可以直接输出。

### 散列

#### 散列的定义和整数散列

+ 散列(Hash)，简单而言，就是将**元素**通过一个**函数**转换为**整数**，使得该整数可以尽量**唯一地**代表这个元素。
+ 其中把这个转换函数称为**散列函数H**，也就是说，如果元素在转换前为`Key`，那么转换后为一个整数`H(Key)`。

+ 常用的散列函数：**直接定址法**、**平方取中法**、**除留余数法**等......
+ 如果两个不同的元素`Key1`和`Key2`，它们的Hash值`H(Key1)`和`H(Key2)`是相同的话，就称为**冲突**。
+ 解决冲突的主要办法有：**线性探查法**、**平方探查法**、**链地址法(拉链法)**
+ 其中第一种和第二种都计算了新的**Hash值**，称为**开放定址法**
+ 散列表的特点是能够使用空间来换取时间

#### 字符串Hash初步

+ **字符串Hash**是指将一个字符串`Str`映射成一个整数，使得该整数可以尽可能唯一地代表字符串`Str`。
+ 为了讨论问题方便，先假设字符串均有大写字母`'A'-'Z'`组成，在此基础上，不妨把大写字母`'A'-'Z'`看成`0-25`。
+ 由此便可以将字符串映射为整数(注意：转换成整数最大为$$26^{1en}-1$$其中`len`为字符串长度)
+ 代码如下：

```cpp
int HashFunc(char Str[],int len)//Hash函数，将字符串Str转换为整数
{
	int id=0;
	for(int i=0;i<len;i++)
	{
		id=id*26+(Str[i]-'A');//转换为整数
	}
	return id;
}
```

+ 如果字符串中出现了小写字母，那么可以把大写字母`'A'-'Z'`看成`0-25`，把小写字母`'a'-'z'`看成`26-51`，其余相同。

+ 代码：

```cpp
int HashFunc(char Str[],int len)//Hash函数，将字符串Str转换为整数
{
	int id=0;
	for(int i=0;i<len;i++)
	{
		if(Str[i]>='A'&&Str[i]<='Z')
		{
			id=id*52+(Str[i]-'A');//转换为整数
		}
		else if(Str[i]>='a'&&Str[i]<='z')
		{
			id=id*52+(Str[i]-'a')+26;//转换为整数
		}
	}
	return id;
}
```

+ 再增加不同的字符代码编写方式**同理**；

例题：[字符串出现次数](https://sunnywhy.com/sfbj/4/2/105)

+ 代码：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
using namespace std;
const int MAXN = 1010;
char str[MAXN][5];
int hashTable[26*26*26+10]={0};
//字符串转Hash函数
int HashFunc(char s[],int len)
{
    int id=0;
    for(int i=0;i<len;i++)
    {
        id=id*26+(s[i]-'A');
    }
    return id;
}

//主函数
int main(){
    int n,m;
    scanf("%d",&n);
    for(int i=0;i<n;i++)
    {
        scanf("%s",str[i]);
        hashTable[HashFunc(str[i],3)]++;
    }
    scanf("%d",&m);
    for(int i=0;i<m;i++)
    {
        scanf("%s",str[i]);
        printf("%d",hashTable[HashFunc(str[i],3)]);
        if(i!=m-1)
        {
            printf(" ");
        }
    }
    return 0;
}
```

+ 总结：该题直接给出字符串散列的处理方法！重点掌握字符串转整数函数的编写和应用。

例题：[2-SUM-hash](https://sunnywhy.com/sfbj/4/2/104)

+ 代码：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
using namespace std;
const int MAXN = 1000001;
int num[MAXN]={0},hashTable[MAXN]={0};
//主函数
int main(){
    int n,k;
    scanf("%d %d",&n,&k);
    for(int i=0;i<n;i++)
    {
        scanf("%d",&num[i]);
        hashTable[num[i]]++;
    }
    int ans=0;
    for(int i=0;i<n;i++)
    {
        if(k-num[i]>=0&&hashTable[k-num[i]])
        {
            ans++;
        }
    }
    printf("%d",ans/2);
    return 0;
}
```

+ 总结：这道题目的巧妙之处在于通过用求和值`k`减去`a`后的值`b`是否还在**哈希表**中来判断是否满足条件。这样巧妙利用了**空间换时间**的思想，只用一次循环即可完成！最后注意最终结果需要再`÷2`！

### 递归

分治

+ 分治->"分而治之"
+ 分治法将原问题划分成若干个**规模较小**而**结构**与原问题**相同**或者**相似**的子问题，然后分别解决这些子问题，最后**合并**子问题的解，即可得到原问题的解。
  + 分解：将原问题划分成若干个**规模较小**而**结构**与原问题**相同**或者**相似**的子问题；
  + 解决：递归求解所有子问题。如果存在子问题的规模足够小就可以直接解决；
  + 合并：将子问题的解合并为原问题的解。
+ 分治法分解成的子问题应该是相互独立的、没有交叉的。
+ 分治法作为一种算法思想，既可以使用**递归**的手段去实现，也可以通过**非递归**的手段去实现。

递归

+ 递归在于**反复调用自身函数**，但是每次把**问题范围缩小**，直到范围缩小到可以直接得到边界数据的结果，然后再在返回的路上求出对应的解。
+ 递归很适合用来实现分治思想；
+ 递归的逻辑中一般有两个重要概念：
  + 递归边界
  + 递归式（或称递归调用）
+ 递归式是将原问题分解为若干个子问题的手段；
+ 递归边界是分解的尽头。
+ 例题->递归求解n的阶乘：

```cpp
#include <cstdio>
#include <string.h>
using namespace std;
//函数
int F(int n)
{
    if(n==0) return 1;//递归边界
    else return F(n-1)*n;//递归式
}
//主函数
int main(){
    int a=3;
    printf("%d",F(a));
    return 0;
}
```

+ 输出：

```
6
```

+ 其实现过程如下：

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202311041745796.png)

+ 例题->递归求解斐波那契数列的第n项：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
using namespace std;
//斐波那契数列递归函数（输出第n项的值）
int F(int n)
{
    if(n==0||n==1)
        return 1;//递归边界
    else return F(n-1)+F(n-2);//递归式
}
//主函数
int main(){
    int n=4;
    printf("%d",F(n));
    return 0;
}
```

+ 输出：

```
5
```

+ 其实现过程如下：

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202311041755805.png)

+ 例题->**全排列问题**：

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202311041758963.png)

+ **思路**：
+ 从递归的角度考虑，把问题描述成："输出**1 - n**这**n**个整数的全排列"，那么它就可以分解成若干个子问题：
  + 输出以1开头的全排列：`(1,2,3)`、`(1,3,2)`;
  + 输出以2开头的全排列：`(2,1,3)`、`(2,3,1)`;
  + 输出以3开头的全排列：`(3,1,2)`、`(3,2,1)`;
  + 以此类推......直到第n个。
+ 由此，不妨设定一个数组`p[MAXN]`用于存放当前的排列;
+ 再设定一个散列数组`bool HashTable[MAXN]={false};`用于指示当前元素k是否在数组`p`中，
  + 如果已经存在于`p`中时`HashTable[k]=true;`
  + 如果不存在于`p`中时`HashTable[k]=false;`
+ 因为要按照**字典序**对全排列进行输出，我们需要按顺序往数组`p`中第1位到n位中填入数字。
+ 不妨假设我们当前已经填好了`p[1]-p[index]`部分的数字，下一步需要填`P[index+1]`这个位置的数字。
+ 显然需要从1-n中枚举有哪些数字还没有在`p[1]-p[index]`部分，即满足`HashTable[k]==false`这个条件，那么就将该数字填入`p[index]`中。
+ 然后将`HashTable[k]=true`，表示`k`这个数据已经填入了数组`p`中。
+ 然后可以像上述步骤一样处理`index+2`的数据，即`p[1]-p[index+1]`已经填好，即进行递归->重复执行`Full_permutation(index+1);`直到后续**递归完成**。
+ 当递归完成后，需要再将`HashTable[k]=false`，以便后续能够继续使用这个数据。
+ 最后**递归边界**显然是当`index`到达`n+1`时，说明数组`p`中的第**1 - n**位都已经填好了，只需要按顺序进行输出即可。
+ 下面是当`n=3`时候的代码：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
using namespace std;
//全排列递归函数变量定义
const  int MAXN = 20;
int n;//输出index-n的全排列
int p[MAXN];
bool HashTable[MAXN]={false};
//全排列递归函数
void Full_permutation(int index)
{
    //递归边界
    if(index==n+1)
    {
        for(int i=1;i<=n;i++)
        {
            printf("%d",p[i]);
        }
        printf("\n");
        return ;
    }
    //递归式
    for(int k=1;k<=n;k++)
    {
        if(!HashTable[k])//HashTable[k]==false->说明该元素还没有被用上
        {
            p[index]=k;//处理这一种情况
            HashTable[k] = true;//到这里说明假设1到index已经排好
            //递归进入函数再排index+1之后的部分
            Full_permutation(index+1);
            //递归返回结束后循环还没有结束，继续处理下一循环的问题
            HashTable[k] = false;//已经处理完p[index]=k;这一种情况，还原状态
        }
    }
}

//主函数
int main(){
    n=3;
    Full_permutation(1);//index从1开始
    return 0;
}
```

+ 输出：

```
123
132
213
231
312
321
```

+ 例题->**n皇后问题**：

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202311051551338.png)

+ 思路：

+ 根据题意很容易想到**每行**和**每列**只能放置一个皇后，只需要将**n列**或者**n行**皇后的位置写出即可代表一种情况。
+ 例如将皇后的行号写出，图4-4a的序号为`24135`，图4-4b的序号为`35142`。
+ 按照这个思路只需要枚举**1 - n**的所有排列，并且查看每个排列对应的放置方案是否合法，统计合法的方案即可，总共只有`n!`个排列。
+ 可以参考全排列的方法，生成一段排列序号后，在递归边界判断序号是否合法，代码如下：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;

//n皇后函数变量定义
const  int MAXN = 20;
int n;//输出index-n的全排列
int p[MAXN];
bool HashTable[MAXN]={false};
int my_count = 0;//记录合法的皇后排列个数

//n皇后问题递归函数
void n_queens(int index)
{
    //递归边界
    if(index==n+1)
    {
        bool flag = true;
        for(int i=1;i<n;i++)
        {
            for(int j=i+1;j<=n;j++)
            {
                if(abs(i-j)==abs(p[i]-p[j]))
                {
                    flag = false;
                    break;
                }
            }
        }
        if(flag)
        {
            my_count++;
        }
        return ;
    }
    //递归式
    for(int k=1;k<=n;k++)
    {
        if(!HashTable[k])//HashTable[k]==false->说明该元素还没有被用上
        {
            p[index]=k;//处理这一种情况
            HashTable[k] = true;//到这里说明假设1到index已经排好
            //递归进入函数再排index+1之后的部分
            n_queens(index+1);
            //递归返回结束后循环还没有结束，继续处理下一循环的问题
            HashTable[k] = false;//已经处理完p[index]=k;这一种情况，还原状态
        }
    }
}

//主函数
int main(){
    n=8;
    n_queens(1);//index从1开始
    printf("%d",my_count);
    return 0;
}
```

+ 输出：

```
92
```

+ 总结：
+ 上述方法在序列完成时再判断该序列是否合法，未使用任何优化方法，称为**暴力法**。
+ 事实上，可以发现当已经放置了一部分皇后以后（对应生成了排列的一部分），如果后续皇后无论怎么放置都冲突的话，即可中止递归了。
+ 一般而言，如果在到达**递归边界**前的某层，由于一些事实导致已经不需要再往任何一个子问题递归了，就可以直接返回上一层，一般这种做法称为**回溯法**。
+ 代码如下：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;
//n皇后函数变量定义
const  int MAXN = 20;
int n;//输出index-n的全排列
int p[MAXN];
bool HashTable[MAXN]={false};
int my_count = 0;//记录合法的皇后排列个数

//n皇后问题递归函数
void n_queens(int index)
{
    //递归边界,到达递归边界都是合法序列
    if(index==n+1)
    {
        my_count++;
        return ;
    }
    //递归式
    for(int k=1;k<=n;k++)
    {
        if(!HashTable[k])//HashTable[k]==false->说明该元素还没有被用上
        {
            p[index]=k;//处理这一种情况
            HashTable[k] = true;//到这里说明假设1到index已经排好
            bool flag = true;
            for(int pre=1;pre<index;pre++)
            {
                if(abs(index-pre)==abs(p[index]-p[pre]))
                {
                    flag = false;
                    break;
                }
            }
            if(flag)
            {
                //递归进入函数再排index+1之后的部分
                n_queens(index+1);
            }
            //递归返回结束后循环还没有结束，继续处理下一循环的问题
            HashTable[k] = false;//已经处理完p[index]=k;这一种情况，还原状态
        }
    }
}

//主函数
int main(){
    n=8;
    n_queens(1);//index从1开始
    printf("%d",my_count);
    return 0;
}
```

+ 输出：

```
92
```

例题：[反转字符串](https://sunnywhy.com/sfbj/4/3/113)

+ 方法一：

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202311051954513.png)

+ 方法一代码：

```cpp
//递归求字符串逆函数1
void rev_1(char* str)
{
    char temp;
    int len;
    temp = *str;
    len = strlen(str);
    *str = *(str+len-1);
    *(str+len-1)='\0';
    if(strlen(str+1)>=2)
    {
        rev_1(str+1);
    }
    *(str+len-1)=temp;
}
```

+ 方法二：

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202311051958349.png)

+ 方法二代码：

```cpp
//递归求字符串逆函数2
void rev_2(char* str,int left,int right)
{
    char temp;
    temp = str[left];
    str[left] = str[right];
    str[right] = temp;
    if(left+1<right-1)
    {
        rev_2(str,left+1,right-1);
    }
}
```

+ 总代码：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;
const int MAXN = 110;
char str[MAXN],rev_str[MAXN];
int n;
//递归求字符串逆函数1
void rev_1(char* str)
{
    char temp;
    int len;
    temp = *str;
    len = strlen(str);
    *str = *(str+len-1);
    *(str+len-1)='\0';
    if(strlen(str+1)>=2)
    {
        rev_1(str+1);
    }
    *(str+len-1)=temp;
}

//递归求字符串逆函数2
void rev_2(char* str,int left,int right)
{
    char temp;
    temp = str[left];
    str[left] = str[right];
    str[right] = temp;
    if(left+1<right-1)
    {
        rev_2(str,left+1,right-1);
    }
}

//主函数
int main(){
    scanf("%s",str);
    //rev_1(str);
    rev_2(str,0,strlen(str)-1);
    printf("%s", str);
    return 0;
}
```

+ 总结：上述介绍的两种方法可以多深入体会。

例题：[上楼](https://sunnywhy.com/sfbj/4/3/118)

+ 代码：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;

//递归判断上楼梯方式数
int F(int n)
{
    if(n<=1)
        return 1;
    else
        return F(n-1)+F(n-2);//最后只有加一级或者两级，方案是固定的，所以只需要求出还需要一级到达的总方式数和还需要两级到达的总方式数即可
}

//主函数
int main(){
    int n;
    scanf("%d",&n);
    printf("%d",F(n));
    system("pause");// 防止运行后自动退出，需头文件stdlib.h
    return 0;
}
```

+ 总结：最后要到达最高级只有加**一级**或者**两级**，方案是固定的，所以只需要求出还需要一级到达的总方式数和还需要两级到达的总方式数即可。

例题：[汉诺塔](https://sunnywhy.com/sfbj/4/3/119)

+ 代码：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;
int my_count=0;
//汉诺塔问题
void hanoi(int n,char from,char to,char mid)
{
    if(n==1)
    {
        printf("%c->%c\n",from,to);
    }
    else
    {
        hanoi(n-1,from,mid,to);//要想移动n级汉诺塔需要先移动n-1级汉诺塔到另一边
        printf("%c->%c\n",from,to);//把最后最大的一块移动到目的位置
        hanoi(n-1,mid,to,from);//最后把剩下n-1级的汉诺塔移动到目标位置
    }
}

//主函数
int main(){
    int n;
    scanf("%d",&n);
    printf("%d\n",(int)pow(2,n)-1);
    hanoi(n,'A','C','B');
    return 0;
}
```

+ 总结：要想移动`n`级汉诺塔需要先移动`n-1`级汉诺塔到另一边，然后把最后最大的一块移动到目的位置，最后把剩下`n-1`级的汉诺塔移动到目标位置，从而形成递归。

例题：[棋盘覆盖问题](https://sunnywhy.com/sfbj/4/3/120)

+ 说明：这道题目是一道典型的二维**分治问题**。
+ 思路：要想采用**分治**的方法并且使用**递归**来进行求解，就需要划分成相同方案的子问题，划分的思路如下：

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202311071535777.png)

+ 以此类推，在划分到只剩下2×2大小的方块后就很容易地采用骨牌进行填充。
+ 代码如下：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;
const int MAXN = 256*256;
int my_index = 0;

//建立坐标结构体
struct point
{
    int x , y;
    //原始构造函数，不需要初始化变量
    point(){}
    //传参构造函数
    point(int _x,int _y)
    {
        x=_x;
        y=_y;
    }
};
//定义存储的点数组
point arr[MAXN];

//递归获取棋盘覆盖函数
/*
x,y是左下角方格坐标，代表原点
cx,cy是黑点坐标
size是传入此函数时整体方格的大小
*/
void chees_cover(int x,int y,int cx,int cy,int size)
{
    int h;
    if(size == 1)
        return;
    h = size/2;
    //黑色方格在左上角
    if(cy>=y+h&&cx<x+h)//假如黑色方块在左上角
    {
        arr[my_index++]=point(x+h,y+h-1);//从黑色方块在左上角
        //确认骨牌的原点在右下角
        //以下的三个if语句同理
        chees_cover(x,y+h,cx,cy,h);
    }
    else
    {
        chees_cover(x,y+h, x+h-1,y+h,h);//
    }
    //黑色方格在右上角
    if(cy>=y+h&&cx>=x+h)
    {
        arr[my_index++]=point(x+h-1,y+h-1);
        chees_cover(x+h,y+h,cx,cy,h);
    }
    else
    {
        chees_cover(x+h,y+h,x+h,y+h,h);
    }
    //黑色方格在左下角
    if(cy<y+h&&cx<x+h)
    {
        arr[my_index++]=point(x+h,y+h);
        chees_cover(x,y,cx,cy,h);
    }
    else
    {
        chees_cover(x,y,x+h-1,y+h-1,h);
    }
    //黑色方格在右下角
    if(cy<y+h&&cx>=x+h)
    {
        arr[my_index++]=point(x+h-1,y+h);
        chees_cover(x+h,y,cx,cy,h);
    }
    else
    {
        chees_cover(x+h,y,x+h,y+h-1,h);
    }
}

//定义排序比较函数
int cmd(point px,point py)
{
    if(px.x==py.x)
    {
        return px.y < py.y;
    }
    else
    {
        return px.x < py.x;
    }
}

//主函数
int main(){
    int k,cx,cy,size;
    scanf("%d%d%d",&k,&cx,&cy);
    size = (int)pow(2,k);
    chees_cover(1,1,cx,cy,size);
    sort(arr,arr+my_index,cmd);
    for(int i=0;i<my_index;i++)
    {
        printf("%d %d\n",arr[i].x,arr[i].y);
    }
    system("pause");// 防止运行后自动退出，需头文件stdlib.h
    return 0;
}
```

例题：[谢尔宾斯基地毯](https://sunnywhy.com/sfbj/4/3/123)

+ 代码：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;
const int MAXN = 3*3*3*3*3*3*3;
char arr[MAXN][MAXN];

//定义谢尔宾斯基地毯递归函数
void cover(int n,int x,int y)
{
    int unit = (int)pow(3.0,n-2);
    if(n==1)
    {
        arr[x][y]=' ';
    }
    else
    {
        cover(n-1,x,y);
        cover(n-1,x,y+unit);
        cover(n-1,x,y+2*unit);
        cover(n-1,x+unit,y);
        for(int i=x+unit;i<x+2*unit;i++)
        {
            for(int j=y+unit;j<y+2*unit;j++)
            {
                arr[i][j]='X';
            }
        }
        cover(n-1,x+unit,y+2*unit);
        cover(n-1,x+2*unit,y);
        cover(n-1,x+2*unit,y+unit);
        cover(n-1,x+2*unit,y+2*unit);
    }
}

//主函数
int main(){
    int n,my_unit;
    scanf("%d",&n);
    my_unit = pow(3.0,n-1);
    for(int i=0;i<my_unit+2;i++)
    {
        for(int j=0;j<my_unit+2;j++)
        {
            if(i==0||i==my_unit+1||j==0||j==my_unit+1)
            {
                arr[i][j]='+';
            }
            else
                arr[i][j]=' ';
        }
    }
    cover(n,1,1);
    //printf("%d %d",n,my_unit);
    for(int i=0;i<my_unit+2;i++)
    {
        for(int j=0;j<my_unit+2;j++)
        {
            printf("%c",arr[i][j]);
        }
        printf("\n");
    }
    system("pause");// 防止运行后自动退出，需头文件stdlib.h
    return 0;
}
```

+ 总结：这种题目主要找准递归的**起始位置**，根据**起始位置**即可输出完整图形。

#### 一种递归式的非零自然数全分解方法

+ 在开始讲之前，首先介绍一下这个方法针对的问题背景：一个非零自然数(1,2,3,……)既不重复也不遗漏地任意分解为非零自然数(如：3=1+1+1=1+2)，在本篇暂且称为非零自然数的全分解。
+ 在非零自然数的全分解中，总共有多少种分解方法，并列出所有分解方法，在本篇暂且称为非零自然数的全分解问题。

##### 基本概念

1. **分解末项**
   + 一个分解中的最后一项称为分解末项。如“3=1+2”中分解末项为“2”，再如“3=1+1+1”中分解末项为“1”。
2. **分解基数B**
  + 分解基数，在数值上定义为分解末项的前一项，举个例子：“5=1+4”称为分解基数B=1的一个分解，“5=1+2+2”称为分解基数B=2的一个分解。
  + 我们也可以把“5=1+4”到“5=1+2+2”的过程理解为一个将分解末项“4”按分解基数B=2的分解。实际上这种理解更为重要，因为在本方法中，我们本质上也是针对分解末项的分解。

##### 分解规则

1. 关于分解基数
     + **分解基数单调不减**。如：“7=2+5=2+1+4”为一个错误的分解过程，因为第一级分解基数为2，第二级分解基数为1，违反分解基数单调不减原则。所以，“7=2+5=2+2+3”才是一个正确的分解过程。
2. 关于分解末项
     + **分解末项应不小于分解基数**。如：“5=1+1+3”为一个正确的分解，“5=1+3+1”为一个错误的分解。

![](https://yugin-blog-1313489805.cos.ap-guangzhou.myqcloud.com/202311102020016.jpeg)

+ 根据前述的两条分解规则，对7的全分解过程如上图所示，可以看到总共有14种分解方法。实际上，7的全分解就是这14种分解方法。

例题：[自然数分解之方案数](https://sunnywhy.com/sfbj/4/3/125)

+ 代码：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;

//递归求解自然数分解方案数量函数
int func(int pre,int now)
{
    int temp=0;
    for(int i=1;2*i<=now;i++)
    {
        if(i>=pre)
        {
            temp+=func(i,now-i);
            temp++;
        }
    }
    return temp;
}

//主函数
int main(){
    int n,num;
    scanf("%d",&n);
    num = func(0,n);
    printf("%d",num);
    return 0;
}
```

+ 总结：
  + **递归边界**是：当我们需要拆分的数为1时，表示无法拆分，因此返回0。
  + 总而言之，`func(pre,now)`所返回的整数表示该组合后续能够拆分的总数。

例题：[自然数分解之最大积](https://sunnywhy.com/sfbj/4/3/124)

+ 代码：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;

//递归求解自然数分解之最大积
int func(int pre,int now)
{
    int my_max=-1;
    for(int i=1;2*i<=now;i++)
    {
        if(i>=pre)
        {
            my_max=max(my_max,max(i*(now-i),func(i,now-i)));
        }
    }
    return max(my_max,pre*my_max);
}

//主函数
int main(){
    int n,num;
    scanf("%d",&n);
    num = func(0,n);
    printf("%d",num);
    return 0;
}
```

+ 总结：这题与**自然数分解之方案数**较为相似，只需要把递归函数`temp`的计数改为计算乘积最大值即可。

#### 动态规划

例题：[数塔](https://sunnywhy.com/sfbj/4/3/116)

+ 思路：数塔问题是经典的动态规划问题，通过归纳可以得到一个信息：

  + 如果要求出`dp[i][j]`,那么一定要求出其两个子问题：
  + 从位置`(i+1,j)`到达最底层的最大和`dp[i+1][j]`;
  + 从位置`(i+1,j+1)`到达最底层的最大和`dp[i+1][j+1]`;
  + 即进行了一次决策，走位置`(i,j)`的左下还是右下：
  + 式子如下：

  ```cpp
  dp[i][j]=max(dp(i+1,j),dp(i+1,j+1))+f[i][j];
  ```

  + 把`dp[i][j]`称为问题的**状态**，而把上面的式子称为**状态转移方程**。

+ 例题代码：

```cpp
#include <cstdio>
#include <string.h>
#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;
const int MAXN = 25;
int f[MAXN][MAXN],dp[MAXN][MAXN];
int n;
//数塔递归函数（动态规划）
int getMax(int i,int j)
{
    if(i==n)
    {
        return f[n][j];
    }
    else
    {
        dp[i][j]=max(getMax(i+1,j),getMax(i+1,j+1))+f[i][j];
        return dp[i][j];
    }
}
//主函数
int main(){
    scanf("%d",&n);
    for(int k=1;k<=n;k++)
    {
        for(int m=1;m<=k;m++)
        {
            scanf("%d",&f[k][m]);
        }
    }
    dp[1][1]= getMax(1,1);
    printf("%d",dp[1][1]);
    return 0;
}
```

### 贪心

#### 简单贪心
