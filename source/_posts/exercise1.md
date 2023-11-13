---
title: JAVA程序设计实验练习一
tags: [JAVA,程序设计]
categories: [JAVA]
date: 2022-9-29 14:00:00
excerpt: JAVA、程序设计
---

# 实验题目

## 题目一

### 题目：

定义一个数组类，编写成员函数实现以下功能：

1. 随机生成函数RandomArray（int n, int max）:随机生成一个一维整数数组，数组长度为n，元素值不超过max；

2. 判断函数CheckOrder（）：判断数组中元素是否按升序排练，若是返回1，否返回0；

3. 数组和函数Sum（）：计算数组和。

4. 判断某个元素函数CheckKey（int key）：找到数组中的某个值（key），若有返回1，无返回0；

5. 编写main函数，调用测试以上功能；

### 运行结果：

![ ](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/java1.png)

### 源代码：

* 定义数组类

```java
package com.company;
import java.util.Random;

public class Array {

    private int n;
    private int max;
    private int[] arr;

    public Array(){
    }

    public Array(int n,int max){
        this.n=n;
        this.max=max;
        //arr = new int[n];
    }

    //生成随机数
    private static int getRandomNumberInRange(int min, int max) {
        if (min >= max) {
            throw new IllegalArgumentException("max must be greater than min");
        }
        Random r = new Random();
        return r.nextInt((max - min) + 1) + min;
    }

    //随机数组
    public void RandomArray(int n,int max){
        arr = new int[n];
        for(int i=0;i<arr.length;i++)
        {
            //public int[] arr = new int[n];
            arr[i]=getRandomNumberInRange(0,max);
        }
        System.out.println("元素值不超过 "+max);
        System.out.println("数组长度是 "+arr.length);
    }

    //判断升序
    public int CheckOrder(){
        int right1 = 1;
        for(int i=0;i<arr.length-1;i++)
        {
            if(arr[i]>arr[i+1])
            {
              right1=0;
            }
            else right1=1;
        }
        return right1;
    }

    //计算和
    public int sum(){
        int sum1=0;
        for(int i=0;i<arr.length;i++)
        {
            sum1+=arr[i];
        }
        return sum1;
    }

    //判断函数
    public int CheckKey(int key){
        int right1=0;
        for(int i=0;i<arr.length;i++)
        {
            if(arr[i]==key)
            {
                right1=1;
            }
            else right1=0;
        }
        return right1;
    }

}
```

* 主函数

```java
package com.company;

public class Main {

    public static void main(String[] args) {
	// write your code here
        Array array = new Array(10,10);
        array.RandomArray(5,50);
        System.out.println("判断数组是否有值 "+array.CheckKey(1));
        System.out.println("判断数组是否升序 "+array.CheckOrder());
        System.out.println("数组元素的和 "+array.sum());
    }
}
```

## 题目二

### 题目：

编写程序，求圆柱体的体积CylinderVolume:

1. 设计一个计算圆面积的接口area，包含计算面积的方法bottomArea；

2. 设计一个圆柱体类Cylinder实现接口area，包含

* 包含成员变量：高度，半径；

* 实现构造方法，对成员变量进行赋值；

* 实现圆柱体底面积成员方法area；

* 实现计算圆柱体体积的成员方法volume；

3. 编写测试类计算圆柱体体积。

### 运行结果：

![ ](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/java2.png)

### 源代码：

* 计算圆面积的接口area  

```java
package com.company;

public interface area {
    public double bottomArea();
}
```

* 圆柱体类Cylinder

```java
package com.company;

public class Cylinder implements area{

    //成员属性
    private int h;//高度
    private int r;//半径

    //构造函数
    public Cylinder(){
    }
    //构造函数
    public Cylinder(int h,int r){
        this.r=r;
        this.h=h;
    }

    public double area()
    {
        return Math.PI*r*r;
    }

    public double volume()
    {
        return Math.PI*r*r*h;
    }

    @Override
    public double bottomArea() {
        return Math.PI*r*r;
    }
}
```

* 主函数

```java
package com.company;

public class Main {
    public static void main(String[] args) {
	// write your code here
        int h=2;
        int r=2;
        Cylinder cylinder = new Cylinder(2,2);
        System.out.println("高度"+h+" 半径"+r);//接口方法
        System.out.println("接口方法面积"+cylinder.bottomArea());//接口方法
        System.out.println("成员方法面积"+cylinder.area());//成员方法
        System.out.println("成员方法体积"+cylinder.volume());//成员方法
    }
}
```

## 题目三

### 题目：

1. 定义一个父类Animal类

属性：kind(种类)

方法：创建带参（kind为参数）构造方法

创建cry():void方法

2. 编写三个具体的子类Cat类、Dog类、Sheep类

分别重写父类中的 cry() 方法，输出信息分别为

Cat类：小猫的叫声：喵喵喵~~~

Dog类：小狗的叫声：汪汪汪~~~

Sheep类：小羊的叫声：咩咩咩~~~

3. 编写测试类，首先生成长度为5的父类对象数组，然后通过循环依次向数组中存入数据，现设定存储规则为：

a) 每次随机产生一个0~2的正整数

b) 若数值为 0，则生成一个 Cat 类的对象，存入数组

c) 若数值为 1，则生成一个 Dog 类的对象，存入数组

d) 若数值为 2，则生成一个 Sheep 类的对象，存入数组

最后循环输出数组成员，并分别调用 cry() 方法。

### 运行结果:

![ ](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/java3.png)

### 源代码：

* 父类（动物）

```java
package com.company;

public class Animal {

    protected String kind;

    public Animal(){

    }
    
    public Animal(String kind){
          this.kind=kind;
    }

    public void cry(){

    }

}
```

* 子类（猫）

```java
package com.company;

public class Cat extends Animal{
   public Cat(String kind){
       super(kind);
   }

    public void cry(){
       System.out.println(this.kind+"的叫声：喵喵喵~~~");
    }
}
```

* 子类（狗）

```java
package com.company;

public class Dog extends Animal{
    public Dog(String kind){
        super(kind);
    }

    public void cry(){
        System.out.println(this.kind+"的叫声：汪汪汪~~~");
    }
}
```

* 子类（羊）

```java
package com.company;

public class Sheep extends Animal{
    public Sheep(String kind){
        super(kind);
    }

    public void cry(){
        System.out.println(this.kind+"的叫声：咩咩咩~~~");
    }
}
```

* 主函数

```java
package com.company;
import java.util.Random;

public class Main {

    public static void main(String[] args) {
	// write your code here
         Animal[] animal = new Animal[5];//生成5个数组
        //System.out.println(animal.length);
       for(int i=0;i<animal.length;i++)
       {
           int num = new Random().nextInt(3);
           if(num==0)
           {
             animal[i] = new Cat("cat"+i);
           }
           else if(num==1)
           {
               animal[i] =new Dog("dog"+i);
           }
           else if(num==2)
           {
               animal[i] =new Sheep("sheep"+i);
           }
       }
        for(Animal j:animal)
        {
            j.cry();
        }
    }
}
```

