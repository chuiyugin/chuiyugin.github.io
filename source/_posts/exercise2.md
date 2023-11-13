---
title: JAVA程序设计实验练习二
tags: [JAVA,程序设计]
categories: [JAVA]
date: 2022-10-28 21:48:00
excerpt: JAVA、程序设计、GUI
---

# 实验题目

## 题目：

模拟实现以下商品管理业务系统，商品管理系统的整体功能有：

>注：商品数据存储在一个数据库中(用静态HashMap来模拟)，MySQL

1、用户可以通过输入商品信息来向库中添加商品，如：

 **idname,price,库存数量  p01,透明胶带,8.8,1000**

2、用户可以查看数据库中所有的商品

3、用户可以通过输入一个id来查看一个商品

4、用户可以通过输入一个name来查看一个商品

5、用户可以通过输入一个价格范围（比如： 100->200）来查看符合条件的商品

6、用户可以通过输入一个id来从数据库中删除一个商品

 额外添加的需求:

7、用户可以通过指定一个id来修改一个商品的名称

8、用户可以通过制定一个id来修改一个商品的价格

9、用户可以通过制定一个id来修改一个商品的库存数量

要求：

a、整个程序要分成：交互层、 业务逻辑（service）层、 数据访问（dao）层

b、交互层和service层之间要用“面向接口编程”的模式来写

c、业务逻辑层和dao层之间要用“面向接口编程”的模式来写

> 注：交互层打印菜单的过程很麻烦，可以不写交互层，只要完成service层的接口及实现类， dao层的接口及实现类即可。

### 准备工作

* 需要完成这个项目，不仅需要有一定的Java基础知识，还需要掌握一定的数据库的操作和Java GUI的设计，对于这方面内容，推荐读者阅读《MySql必知必会》这本书入门数据库的基本操作。在构建项目的时候还需要勤查百度和相关文档。为了让没有相关基础的读者快速掌握关于该项目中的一些简单操作，在此推荐B站中的三个视频供大家参考：
* Java图像界面编程：[Java图形界面编程](https://www.bilibili.com/video/BV1wh411d7it/?p=51)
* MySQL数据库SQL语言入门：[MySQL数据库SQL语言入门](https://www.bilibili.com/video/BV1YY411s7Nk/?vd_source=ef77f99dbf6da2761d373027f1ca87d7)
* Java语言连接操作MySQL数据库，JDBC技术：[Java语言连接操作MySQL数据库，JDBC技术](https://www.bilibili.com/video/BV13F411z7Ls/?vd_source=ef77f99dbf6da2761d373027f1ca87d7)
* 当然，视频的作用只是辅助快速入门，关键还是需要多查询文档和百度。

### 程序设计

* 首先建立与数据库的连接并获取数据

```java
package service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class getData {
    /*
        通过id和name搜索
    */
    public static  List<Object> search(String My_id) {

        //创建列表
        List<Object> list = new ArrayList<Object>();

        Connection connection = null;
        Statement statement = null;
        ResultSet resultset = null;
        PreparedStatement ps = null;

        //System.out.println("输入要搜索商品的id或者name：");
        //Scanner sc1 = new Scanner(System.in);
        //String search = sc1.nextLine();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try {

                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/goods","root","1234");

                statement = connection.createStatement();
                String sql = "select * from goods where id =? or name = ?";
                ps=connection.prepareStatement(sql);//添加数据预处理
                ps.setString(1, My_id);
                ps.setString(2, My_id);
                resultset = ps.executeQuery();

                int i = 0;
                while(resultset.next()){
                    String id = resultset.getString("id");
                    list.add(i,id);
                    i++;
                    String name = resultset.getString("name");
                    list.add(i,name);
                    i++;
                    int price = resultset.getInt("price");
                    list.add(i,price);
                    i++;
                    int num = resultset.getInt("num");
                    list.add(i,num);
                    i++;
                    //System.out.println("id:"+id+"   "+"name:"+name+"   "+"price:"+price+"   "+"num:"+num);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }finally{
            close(connection);
            close(statement);
            close(resultset);
        }
        return list;
    }

    /*
            关闭连接
            */
    public static void close(AutoCloseable autoCloseable){
        if(autoCloseable != null){
            try
            {
                autoCloseable.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
```

* 向数据库中添加数据


```java
package service;

import java.sql.*;


public class addData {

    /*
    添加数据
     */
    public static void addData(String id,String name,int price,int num) {

        Connection connection = null;
        Statement statement = null;
        ResultSet resultset = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try {

                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/goods","root","1234");

//                if(connection != null){
//                    System.out.println("连接成功"+connection);
//                    connection.close();
//                }
                statement = connection.createStatement();
                resultset =  statement.executeQuery("select * from goods");
                String sql;
                sql="INSERT INTO goods VALUES(?,?,?,?)";//向goods表里添加数据
                ps=connection.prepareStatement(sql);//添加数据预处理
                ps.setString(1, id);
                ps.setString(2, name);
                ps.setInt(3, price);
                ps.setInt(4, num);
                ps.executeUpdate();//执行添加数据
                System.out.println("添加"+id+"数据成功！");
                // 完成后关闭
                ps.close();
                statement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }finally{
            close(connection);
            close(statement);
            close(resultset);
        }
    }

    /*
            关闭连接
            */
    public static void close(AutoCloseable autoCloseable){
        if(autoCloseable != null){
            try
            {
                autoCloseable.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
```

* 更改数据

```java
package gui.service;

import java.sql.*;
import java.util.Objects;
import java.util.Scanner;

public class changeData {
    /*
            修改
        */
    public static void change(String My_id,String My_name ,int My_price,int My_num) {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultset = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try {

                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/goods","root","1234");

//                if(connection != null){
//                    System.out.println("连接成功"+connection);
//                    connection.close();
//                }
                statement = connection.createStatement();

                //拼接字符串，直接使用？会自动加上单引号。
                String sql1 = "UPDATE goods SET ";
                String sql2 = "name = ? ";
                String sql3 = ",price = ? ,";
                String sql4 = "num = ?";
                String sql5 = " WHERE id=?";
                String sql6 = sql1+sql2+sql3+sql4+sql5;

                ps=connection.prepareStatement(sql6);//添加数据预处理
                ps.setString(1, My_name);
                    ps.setInt(2, My_price);
                    ps.setInt(3, My_num);
                    ps.setString(4, My_id);
                    ps.executeUpdate();//执行修改数据

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }finally{
            close(connection);
            close(statement);
            close(resultset);
            close(ps);
        }
    }

    /*
               关闭连接
               */
    public static void close(AutoCloseable autoCloseable){
        if(autoCloseable != null){
            try
            {
                autoCloseable.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
```

* 删除数据

```java
package gui.service;

import java.sql.*;

public class delData {

    /*
      删除数据
       */
    public static void del_data(String My_id) {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultset = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try {

                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/goods","root","1234");

//                if(connection != null){
//                    System.out.println("连接成功"+connection);
//                    connection.close();
//                }
                statement = connection.createStatement();
                resultset =  statement.executeQuery("select * from goods");
                String sql;
                sql="DELETE FROM goods WHERE id=?";//向goods表里删除数据
                ps=connection.prepareStatement(sql);//添加数据预处理
                ps.setString(1,My_id);//第1个问号的值
                ps.executeUpdate();//执行添加数据
                System.out.println("删除"+My_id+"数据成功！");
                // 完成后关闭
                ps.close();
                statement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }finally{
            close(connection);
            close(statement);
            close(resultset);
        }
    }

    /*
     关闭连接
     */
    public static void close(AutoCloseable autoCloseable){
        if(autoCloseable != null){
            try
            {
                autoCloseable.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
```

* 筛选数据

```java
package gui.service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class chooseData {
    /*
        通过id和name搜索
    */
    public static List<Object> search(String My_data) {

        //创建列表
        List<Object> list = new ArrayList<Object>();

        Connection connection = null;
        Statement statement = null;
        ResultSet resultset = null;
        PreparedStatement ps = null;


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try {

                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/goods","root","1234");

//                if(connection != null){
//                    System.out.println("连接成功"+connection);
//                    connection.close();
//                }
                statement = connection.createStatement();
                String sql = "select * from goods where id =? or name = ?";
                ps=connection.prepareStatement(sql);//添加数据预处理
                ps.setString(1, My_data);
                ps.setString(2, My_data);
                resultset = ps.executeQuery();

                int i = 0;
                while(resultset.next()){
                    String id = resultset.getString("id");
                    list.add(i,id);
                    i++;
                    String name = resultset.getString("name");
                    list.add(i,name);
                    i++;
                    int price = resultset.getInt("price");
                    list.add(i,price);
                    i++;
                    int num = resultset.getInt("num");
                    list.add(i,num);
                    i++;
                    //System.out.println("id:"+id+"   "+"name:"+name+"   "+"price:"+price+"   "+"num:"+num);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }finally{
            close(connection);
            close(statement);
            close(resultset);
        }
        return list;
    }

    /*
               关闭连接
               */
    public static void close(AutoCloseable autoCloseable){
        if(autoCloseable != null){
            try
            {
                autoCloseable.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
```

### Swing组件GUI设计

* 该层主要采用**Swing类**的各种组件和方法实现图形用户界面,并且下载了相应的主题优化了组件的外观，使其达到精美的效果！

* 使用**JFrame**作为面板组件的载体。
* 使用**JPanel**组件作为基础组件的载体，并且设置面板的大小，位置以及布局方式。
* 使用**JBox**打包对应组件为一个完整的整体，并确定竖直和横向的排布。
* 使用**JLabel、JTextField、JButton、JPassword、JSplit**等基本组件并且设置其**格式**，包括**颜色**、**大小**、**位置**等。
* 因为需要为交互的组件添加**监视器**来实现**动态响应**，最终组合**JFrame**的内容为总体系统。

### 项目展示

* 登录界面                   用户名:root                    密码:1234

![ ](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/gui1.png)

* 数据管理界面，基本功能模块和数据表格显示

![ ](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/gui2.png)

* 添加数据功能

![ ](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/gui3.png)

* 修改数据功能

![ ](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/gui4.png)

* 数据筛选功能

![ ](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/gui5.png)

* 页眉部分拓展功能

![ ](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/gui.png)

* 关于作者界面

![ ](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/gui6.png)

### 项目下载

* 由于本项目代码量巨大，详细工程就不展示在本博客中，同时为了促进大家相互学习和共同进步，在此提供公开版项目供大家使用，一起进步！

* 公开版项目是精简了一些冗余的外观，尽量保留原汁原味JavaGUI，更加关注后台数据处理和交互的过程！读者可以根据初始GUI进行深度定制，随时随地制作出合你心意的作品。鉴于本人水平有限，本项目依然有很多不足之处，欢迎大家在下方评论区留言指正！

* 本公开版项目能够直接运行Main.java即可，若连接数据库，读者需要首先自行在本机安装MySql并将相关内容在service文件夹即业务逻辑层修改部分代码才可完美运行。

* 本项目所有功能已经测试通过，如仍然有Bug欢迎指正！

* 下载连接：[公开版项目点此下载](https://vkceyugu.cdn.bspapp.com/VKCEYUGU-bc82cde5-9df0-4e04-8d4f-a0e9e1bd241b/9220f08e-f2ed-484f-b9b1-60f13b8ea3ba.zip)

  

  