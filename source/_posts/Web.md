---
title: Web开发
tags: [Web,HTML]
categories: [Web]
date: 2022-12-22 17:00:00
excerpt: HTML、程序设计、Web
---
# Web开发

## Flask

Flask框架为了方便书写标签，用户把返回给浏览器的字符串写入到文件里，再由flask框架读取文件。

## HTML

### 头部信息

#### 浏览器标签页的标题

```html
 <title>文档标题</title>
```

#### 返回字符串的编码方式

```html
 <meta charset="UTF-8">
```

### body信息

#### 标题

一级标题，随着数字变化标题级数变化

```html
 <h1>first</h1>
```

### div和span

```html
<div>
内容
</div>

<span>
内容
</span>
```

* div中的内容占用一整行，块级标签
* span，自己多大占多少，内联标签

### 超链接

跳转到我的博客，target="_blank"加入是新生成一个标签页

a标签无法直接添加宽度和高度

```html
<a href="https://chuiyugin.github.io/" target="_blank">我的博客</a>
```

### 图片

```html
<img src="图片地址" style="width: 10% ; height: 20%" />
```

### 嵌套

```HTML
<a href="https://chuiyugin.github.io/" target="_blank">
  <img style="width: 50%" src="https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/fast_conv_1.png" />
</a>
```

### 列表标签

无序号列表

```html
<ul>
  <li>列表1</li>
  <li>列表2</li>
  <li>列表3</li>
</ul>
```

带序号列表

```html
<ol>
  <li>列表1</li>
  <li>列表2</li>
  <li>列表3</li>
</ol>
```

### 表格

```html
<table> 
  <thead>
     <tr>  
         <th> ID </th>    
         <th> 姓名 </th>     
         <th> 年龄 </th>    
      </tr>
  </thead>
    
  <tbody>
     <tr>  
         <td>10</td>   
         <td>fcs</td>     
         <td>21</td>       
     </tr>
     <tr>  
         <td>10</td>   
         <td>xyj</td>     
         <td>21</td>       
      </tr>
      <tr>  
         <td>10</td>   
         <td>shy</td>    
         <td>21</td>       
      </tr>
  </tbody>
    
</table>
```

### Input系列

文本输入

```html
<input type="text">
```

密码输入

```html
<input type="password">
```

选择文件

```html
<input type="file">
```

单选框

```html
<input type="radio" name="n1">男
<input type="radio" name="n1">女
```

复选框

```html
<input type="checkbox">
```

按钮

```html
<input type="buton" value="提交">  --->普通按钮
<input type="submit" value="提交"> --->提交表单
```

下拉框

```html
<select>
    <option>北京</option>
    <option>上海</option>
    <option>深圳</option>
    <option>广州</option>
</select>
```

多行文本

```html
<textarea rows="3"> </textarea>
```

## 请求

### GET请求

现象：跳转，向后台传入数据会拼接在URL上。

* GET请求的数据会在URL上体现。

```python
@app.route("/do/reg",methods=['GET'])
def do_register():
    #1.接收到的数据
    print(request.args)
    #给用户返回结果
    return "注册成功"
```

### POST请求

现象：提交数据不在URL中，体现在请求体中。

```python
@app.route("/post/reg",methods=['POST'])
def post_register():
    #1.接收到的数据
    print(request.form)
    user = request.form.get("user")
    psw = request.form.get("psw")
    print(user)
    print(psw)
    #给用户返回结果
    return "注册成功"
```



### 提交数据

form标签包裹要提交的数据标签

* 提交方式：method="get"或者method="post"
* 提交的地址：action="/xx/xx/xxx"
* 在form标签里必须要有submit标签
* Input系列标签必须要加name，提交时能够解析对应的名字，而且只有Input的内容才会提交

```html
<h1>注册界面</h1>
        <form method="post" action="/post/reg">
              <div>
                 用户名：<input type="text" name="user"/>
              </div>
              <div>
                 密码： <input type="password" name="psw"/>
              </div>
            
              <div>
                 <input type="submit" />
              </div>
            
        </form>
```

## CSS样式

### Demo

```css
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>用户注册</title>
        <link rel="stylesheet" href="/static/commons.css">
        <style>
            .c1{
                color:green;
            }

            .c2{
                height:50px;
            }

        </style>

    </head>
    <body>

    <h1 class="bl">注册界面</h1>
        <form method="post" action="/post/reg">
              <div class="c2">
                 用户名：<input type="text" name="user"/>
              </div>

              <div class="c2">
                 密码： <input type="password" name="psw"/>
              </div>
     <div>
        <input type="submit" />
      </div>
        </form>
    </body>
    </html>
```

* 放在head部位用css样式。

### 选择器

* ID选择器

```css
#标识名{
        属性:属性值;
        属性:属性值;
        }
```

* 类选择器（用的最多）

  ```css
  .类名{
          属性:属性值;
          属性:属性值;
          }
  ```

* 标签选择器

```css
标签名{
   color:red;
}
```

* 属性选择器

```css
input[type='text']{
  border: 1px solid red;
}

.v1[xx="123"]{
    color:gold;
}
```

* 后代选择器

先找到包含yy这个类的部分，再将yy内部含有li标签的都变为这个样式。（子子孙孙）

```css
.yy li{
   color:red;
}
```

只找子代

```css
.yy>li{
   color:red;
}
```

### 样式

#### 高度和宽度

```css
.c1{
   height:300px
   width:500px
}
```

* 宽度支持百分比，高度不支持。
* 行内标签：默认无效
* 块级标签：默认有效

#### 块级和行内标签

* display: inline-block;
* 具有行内和块级特性

```css
.c3{
                display: inline-block;
                height:100px;
                width:300px;
                border: 1px solid red;
            }
```

**注意：**

display: inline;强制行内

display: block;强制块级

#### 字体和颜色

```css
.bl{
    color:deepskyblue;
    font-size: 59px;
    font-weight: 400;
    font-family:  Microsoft Yahei;
}
```

#### 文字对齐方式

```css
.test{
         height:100px;
         width:300px;
         border: 1px solid red;

         text-align: center;/*水平方向居中*/
         line-height: 100px;/*垂直方向居中 和高度像素值相同*/
}
```

### 浮动

将span内容移动到右边显示

```css
<div>
        <span>测试1</span>
        <span style="float:right">测试2</span>
    </div>
```

浮动之后，块级标签不会占用一整行，但是浮动之后无法破坏了文档流，**需要在最后加入**

```css
<div style="clear: both;"></div>
```

### 内边距

边框内部设置内边距,不加左右就是全部

```css
padding-top:20px;
padding-left:20px;
padding-right:20px;
padding-bottom:20px;
padding:20px;
```

###  外边距

margin-top、margin-left、margin-right、margin-bottom

```css
<div style="height:200px;background-color:dodgerblue;"></div>
<div style="height:200px;background-color:red;margin-top:20px;"></div>
```

### 去除外部间距

```css
<style>
     body{
           margin:0 ;
         }
</style>    
```

### 居中

* 内容居中：text-align: center;

```css
<div style="width:200px;text-align: center;"></div>
```

* 区域居中：自己要有宽度加

```css
margin-left:auto;
margin-right:auto;
```

### 鼠标放上去变色

主要： ：hover

```css
.sub-header .menu_list a:hover{
    color: #ff6700;
}
```

### position定位

#### fixed

固定在窗口的某个位置

```css
.back{
    position: fixed;
    width: 60px;
    height:60px;
    border: 1px solid red;
    right:0;
    top:500px;
}
```

#### relative和absolute

加入absolute的相对relative的位置变化。

## BootStrap

### 导航

 [组件 · Bootstrap v3 中文文档 | Bootstrap 中文网 (bootcss.com)](https://v3.bootcss.com/components/#nav) 

### 栅格

 [全局 CSS 样式 · Bootstrap v3 中文文档 | Bootstrap 中文网 (bootcss.com)](https://v3.bootcss.com/css/#grid) 

* 把整体分为12格

* 分类

  * 响应式

    ```css
    .col-sm-  750px
    .col-md-  970px
    .col-lg-  1170px
    ```

  * 非响应式

     .col-xs- 

    ```css
     <div class="col-xs-6" style="background-color: #2aabd2">  1</div>
      <div class="col-xs-10" style="background-color: #5cb85c"> 2 </div>
    ```

* 列偏移

col-xs-offset-2

```css
<div class="col-xs-offset-2 col-xs-6" style="background-color: #2aabd2">  1</div>
```

### container

```css
<div class="container">
<div class="col-sm-9">左边</div>
<div class="col-sm-3">右边</div>
</div>
```

```css
<div class="container-fluid">
<div class="col-sm-9">左边</div>
<div class="col-sm-3">右边</div>
</div>
```

### 图标

1.bootsrap

2.font awesome

```css
<script src="https://kit.fontawesome.com/5efd8aed42.js" crossorigin="anonymous"></script>
```

## JavaScript

是一门编程语言，浏览器是JavaScript语言的解释器。

```css
<script src="static/js/jquery-3.6.1.min.js"></script>
<script src="static/plugins/bootstrap-3.4.1/js/bootstrap.min.js"></script>
```

### DOM和BOM

相当于语言的内置模块

#### DOM

DOM，就是一个模块，模块可以对HTML页面中的标签进行操作

```javascript
//创建标签<div></div>
var tag = document.createElementById("div");

//在标签中添加内容
 tag.innerText = "123";
```

```javascript
//根据ID获取标签
var tag = document.getElementById("xx");

//在标签中添加内容
 tag.innerText = "123";
```

```html
<ul id="city">
    <!--    <li>北京</li> -->
    <!--    <li>上海</li> -->
    <!--    <li>深圳</li> -->
</ul>

<script type="text/javascript">
var cityList = ["北京", "上海", "深圳", "广州"];
    for (var idx in cityList) {
        var text = cityList[idx];

        //创建li标签
        var tag = document.createElement("li");
        //在标签中添加内容
        tag.innerText = text;
        //添加到id=city的标签中(DOM)
        var parent = document.getElementById("city");
        parent.append(tag);
    }
</script>
```



### jQuery

相当于第三方模块

### 变量

```javascript
var name = "小明";//变量
console.log(name);//打印
```

### 字符串类型

```javascript
var name = "小明";//变量
var name = String("小明");//变量
```

```javascript
//常见功能
var name = "中国联通";

var v1 = name.length;//获取长度
var v2 = name[0];//获得第一个"中”
var v3 = name.trim();//去除空白
var v4 = name.substring(0,2);//前取后不取，获得"中国"
```

### 数组

定义

```javascript
var v1 = [11,22,33,44];
var v2 = Array([11,22,33,44]);
```

操作

```javascript
var v1 = [11,22,33,44];
//获取值
var v2 = v1[0];
//修改值
v1[0] = "小明";
//在尾部添加值
v1.push("联通");
//在前面插入值
v1.unshift("移动");
//指定位置插入值
//格式：v1.splice(索引位置,0,元素);
v1.splice(1,0,"元素");//[11,"中国",22,33,44]

//删除
v1.pop()//尾部删除
v1.shift()//头部删除
v1.splice(索引位置,1);//删除索引位置的元素
v1.splice(2,1);//删除索引位置2的元素 [11,33,44]
```

### 循环

```javascript
var v1 = [11,22,33,44];

for(var idx in v1){
    
   //idx=0/1/2/3    data=v1[idx] 
}
```

```javascript
var v1 = [11,22,33,44];

for(var i=0;i<v1.length;i++){
    
   //i=0/1/2/3    data=v1[idx] 
}
```

### 动态标签

```javascript
var cityList=["北京","上海","深圳","广州"];
    for(var idx in cityList){
        var text = cityList[idx];

        //创建li标签
        var tag = document.createElement("li");
        //在标签中添加内容
        tag.innerText = text;
        //添加到id=city的标签中(DOM)
        var parent = document.getElementById("city");
        parent.append(tag);
    }
```

### 对象（字典）

```javascript
info = {
    name:"小明"
    age:18
}
```

#### 对对象进行操作

```javascript
info.age  //获取内容
info.name="小红";  //修改内容
delete info["name"];  //删除内容
```

#### 对对象进行循环

```javascript
for(var key in info){
   //key=name/age     data=info[key]
}
```

### 动态表格

```javascript
var dataList = [
        {id: 1, name: "小明", age: 19},
        {id: 2, name: "小白", age: 19},
        {id: 3, name: "小红", age: 19},
        {id: 4, name: "小军", age: 19},
        {id: 5, name: "小李", age: 19}
    ];

    for (idx in dataList) {
        var info = dataList[idx];
        var tr = document.createElement("tr");
        for (var key in info) {
            var my_text = info[key];
            var td = document.createElement("td")
            td.innerText = my_text;
            tr.appendChild(td);
        }

        var body_tag = document.getElementById("body");
        body_tag.append(tr);
    }
```

### 条件语句

```javascript
if( 条件 ) {

}else if{

}else{
    
}
```

### 函数

```javascript
function func(){
   ...
}

//执行函数
   func();
```

### 事件绑定

```html
<input type="text" placeholder="请输入内容" id="my_txt">
<input type="button" value="点击添加"  onclick="addCityInfo()">
<ul id="my_city">

</ul>


<script type="text/javascript">
function addCityInfo() {
        //找到标签
        var txtTag = document.getElementById("my_txt");
        //获取用户输入的内容
        var new_string = txtTag.value;
        //判断用户输入是否为空
        if (new_string.length > 0) {
            //创建新的标签
            var newTag = document.createElement("li");
            newTag.innerText = new_string;
            //标签添加到ul中
            var parentTag = document.getElementById("my_city");
            parentTag.appendChild(newTag);
            //将输入框内容清空
            txtTag.value = "";
        }else{
            alert("输入不能为空！");
        }
    }
</script>
```

## JQuery

### 初识JQuery

```html
<h1 id="JQ_test"> JQuery测试 </h1>

<!--JS代码块位置-->
<script src="static/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
  
    //利用JQuery实现某些功能
    //找到id=""的标签并修改
    $("#JQ_test").text("JQ修改");
    
</script>
```

### 直接寻找标签

* ID选择器

```html
<h1 id="JQ_test"> JQuery测试 </h1>
```

```javascript
 $("#JQ_test")
```

* 样式选择器

```html
<h1 class="c1">中国联通</h1>
```

```javascript
$(".c1")
```

* 标签选择器

```html
<h1>中国联通</h1>
```

```javascript
$(".c1")
```

* 层级选择器

```html
<div class="c1">
    <span class="c2">
        <a href="#"></a>
    </span>
</div>
```

```javascript
$(".c1.c2 a")
```

* 多选择器

选择多个标签同时操作  

```html
<div class="c1">
    <span class="c2"></span>
    <a href="#"></a>
</div>
<ul id="u1">
    <li></li>
</ul>
<p class="p1"></p>
```

```javascript
$(".c1,#u1,p")
```

* 属性选择器

```html
<input type="text" name="n1">
<input type="text" name="n2">
```

```javascript
$("input[name='n1']")
```

### 间接寻找标签

* 找到上一个兄弟

```html
<div>
    <div>北京</div>
    <div id="c1">上海</div>
    <div>广州</div>
    <div>深圳</div>
</div>
```

```javascript
$("#c1").prev()	//上一个
$("#c1")
$("#c1").next()	//下一个
$("#c1").next().next()	//下下一个
$("#c1").siblings()	//所有同级标签（兄弟）
```

* 找父子

```html
<div>
    <div>
        <div id="c1">上海</div>
    </div>
</div>

<div id="c2">
    <div>老大</div>
    <div class="d2">老二</div>
</div>
```

```javascript
$("#c1").parent()	//父亲
$("#c1").parent().parent()	//祖父
$("#c2").children()	//所有孩子
$("#c2").children(".d2")	//所有的孩子中寻找class=d2的孩子
$("#c2").find(".d2")	//去寻找class=d2的所有子孙
$("#c2").find("div")	//去寻找div标签的所有子孙
```

### 案例：菜单切换

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>菜单</title>

    <style>
        .menu {
            width: 200px;
            height: 800px;
            border: 1px solid #2aabd2;
        }

        .menu .header {
            cursor: pointer; /* 鼠标放上去变成手 */
            padding: 10px 5px;
            border-bottom: 1px dotted #ddd;
            background: linear-gradient(#37ff00, #16a5d3);
        }

        .item a {
            display: block;
            text-decoration: none;
            padding: 5px 5px;
            border-bottom: 1px dotted #ddd;
        }

        .hide {
            display: none;
        }
    </style>

</head>
<body>

<div class="menu">
    <div class="item">
        <div class="header" onclick="clickme(this)">北京</div>
        <div class="content hide">
            <a href="">海淀区</a>
            <a href="">朝阳区</a>
            <a href="">大兴区</a>
            <a href="">昌平区</a>
        </div>
    </div>
    <div class="item">
        <div class="header" onclick="clickme(this)">上海</div>
        <div class="content hide">
            <a href="">宝山区</a>
            <a href="">普陀区</a>
            <a href="">浦东新区</a>
            <a href="">青浦区</a>
        </div>
    </div>
    <div class="item">
        <div class="header" onclick="clickme(this)">北京2</div>
        <div class="content hide">
            <a href="">海淀区</a>
            <a href="">朝阳区</a>
            <a href="">大兴区</a>
            <a href="">昌平区</a>
        </div>
    </div>
    <div class="item">
        <div class="header" onclick="clickme(this)">上海2</div>
        <div class="content hide">
            <a href="">宝山区</a>
            <a href="">普陀区</a>
            <a href="">浦东新区</a>
            <a href="">青浦区</a>
        </div>
    </div>
</div>


<!--JS代码块位置-->
<script src="static/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">


    //方法一：大家都可以展示
    // let i = 0;
    // function clickme(self) {
    //     if (i++ % 2 === 0) {
    //         $(self).next().removeClass("hide");
    //     } else {
    //         $(self).next().addClass("hide");
    //     }
    // }
    //方法二：大家都可以展示
    // function clickme(self) {
    //     var hasHide = $(self).next().hasClass("hide")
    //     if (hasHide) {
    //         $(self).next().removeClass("hide");
    //     } else {
    //         $(self).next().addClass("hide");
    //     }
    // }

    //只展示自己，隐藏别人
    function clickme(self) {
        //把自己的内容展示出来
        $(self).next().removeClass("hide");
        $(self).parent().siblings().find(".content").addClass("hide");
    }

</script>
</body>
</html>
```

### 操作样式

* addClass

* removeClass

* hasClass

  
### 值的操作

```html
<div id="c1">内容</div>
```

```javascript
$("#c1").text() //获取内容
$("#c1").text("测试") //设置内容
```

```html
<input type="text" id="c2">
```

```javascript
$("c2").val()   //获取用户输入值
$("c2").val("txt")   //设置用户输入值
```

### 案例：动态创建数据

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>动态创建数据</title>
</head>
<body>
<input type="text" id="txtUser" placeholder="用户名">
<input type="text" id="txtEmail" placeholder="邮箱">
<input type="button" value="提交" onclick="getinfo()">
<ul id="view">

</ul>

<!--JS代码块位置-->
<script src="static/js/jquery-3.6.1.min.js"></script>
<script>
    function getinfo() {
        let username = $("#txtUser").val();   //设置用户输入值
        let email = $("#txtEmail").val();
        const datastr = username + '-' + email;
        //创建li标签
        let lusr = $("<li>").text(datastr);
        //把新创建的li标签添加到ul里面
        $("#view").append(lusr);

    }
</script>

</body>
</html>
```

### 事件

 绑定事件直接用 `$("")` 获取到标签直接定义事件即可 。

```javascript
$(".item").children().click(function () {
        $(this).text("hello python")
        $(this).remove()
    })
```

###  案例：设置和删除标签

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>设置和删除标签</title>
    <style>
        .item a {
            display: block;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="item">
    <p href="">1</p>
    <p href="">2</p>
    <p href="">3</p>
</div>


<!--JS代码块位置-->
<script src="static/js/jquery-3.6.1.min.js"></script>
<script>
    let a = $(".item").children();
    $(a).click(function () {
        $(this).text("hello python");//设置标签
        $(this).remove();//删除标签
    })
</script>
</body>
</html>
```

* 当页面框架加载完成之后执行代码(封装在$function之内):

```html
<script>
    $(function () {
            $(".item").children().click(function () {
            $(this).text("hello python");
        })
    })
</script>
```

### 案例：表格操作

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>姓名</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>1</td>
        <td>Alleyf</td>
        <td>
            <input type="button" value="删除" class="delete">
        </td>
    </tr>
    <tr>
        <td>2</td>
        <td>CHUIYUGIN</td>
        <td>
            <input type="button" value="删除" class="delete">
        </td>
    </tr>
    <tr>
        <td>3</td>
        <td>小明</td>
        <td>
            <input type="button" value="删除" class="delete">
        </td>
    </tr>
    </tbody>
</table>

<!--JS代码块位置-->
<script src="static/js/jquery-3.6.1.min.js"></script>
<script>
    $(function () {
        // 找到所有class为delete的标签
        $(".delete").click(function () {
            // 删除当前行
            $(this).parent().parent().remove();
        })
    })
</script>
</body>
</html>
```

## 前端整合

* HTNL
* CSS
* JavaScript
* Bootstrap(动态效果依赖jQuery)

### 案例：添加数据页面

>人员信息录入功能，需要提供用户信息：
>
>用户名、年龄、薪资、部门、入职时间（*）
>
>*  时间的选择：不能输入；选择：（插件）datetimepicker 
>
>- 下载插件
>- 应用插件

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加数据页面</title>
    <!--生产版本-->
    <link rel="stylesheet" href="static/plugins/bootstrap-3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/plugins/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">
</head>
<body>
<div class="container" style="margin-top: 20px">
    <form class="form-horizontal">
        <div class="row clearfix">
            <div class="col-xs-6">
                <div class="form-group">
                    <label class="col-sm-2 control-label">姓名</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" placeholder="姓名">
                    </div>
                </div>
            </div>
            <div class="col-xs-6">
                <div class="form-group">
                    <label class="col-sm-2 control-label">年龄</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" placeholder="年龄">
                    </div>
                </div>
            </div>
        </div>

        <div class="row clearfix">
            <div class="col-xs-6">
                <div class="form-group">
                    <label class="col-sm-2 control-label">薪资</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" placeholder="薪资">
                    </div>
                </div>
            </div>
            <div class="col-xs-6">

                <div class="form-group">
                    <label class="col-sm-2 control-label">部门</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="brabch" id="inputbranch">
                            <option value="">IT部门</option>
                            <option value="">销售部门</option>
                            <option value="">人事资源管理部门</option>
                            <option value="">售后部门</option>
                            <option value="">运营部门</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>

        <div class="row clearfix">
            <div class="col-xs-6">
                <div class="form-group">
                    <label class="col-sm-2 control-label">入职日期</label>
                    <div class="col-sm-10">
                        <input id="dt" type="email" class="form-control" placeholder="入职日期">
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-6 col-sm-10">
                <button type="submit" class="btn btn-primary">提 交</button>
            </div>
        </div>
    </form>
</div>


<!--JS代码块位置-->
<script src="https://kit.fontawesome.com/5efd8aed42.js" crossorigin="anonymous"></script>
<script src="static/js/jquery-3.6.1.min.js"></script>
<script src="static/plugins/bootstrap-3.4.1/js/bootstrap.js"></script>
<script src="static/plugins/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
<script src="static/plugins/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">

    $(function(){
        $('#dt').datetimepicker({
            fomat: 'yyyy-mm-dd',
            startDate: '0',
            language: 'zh-CN',
            autoclose: true
        });
    });

</script>
</body>
</html>
```

## MySQL

### 进入MySQL：cmd进入终端

```sql
mysql -u root -p1234
```

### 查看

```sql
show databases;
```

### 退出

```sql
exit;
```

### 基本数据类型

| 类型         | 用途                                                         |
| :----------- | ------------------------------------------------------------ |
| tinyint      | 短整形()，相当于java的short，有符号(默认)，取值范围：-128~127；无符号(用关键词unsigned指定)，取值范围：0~255 |
| **int**      | 整形，相当于java的int                                        |
| bigint       | 长整形，相当于java的long                                     |
| float        | 单精度浮点型                                                 |
| **double**   | 双精度浮点型                                                 |
| decimal      | 准确的小数值，eg：wage decimal(m,n) –总共m位数(负号不算)，其中小数点后有n位，m~~max~~=65，n~~max~~=30. |
| **datatime** | 日期类型，YYYY-MM-DD HH:MM:SS(2022-12-09 21:03:00)，dt转为字符串类型显示**（dt.strftime(“%Y-%m-%d %H:%M:%S”)）** |
| data         | 日期类型（无时分秒）YYYY-MM-DD                               |
| timestamp    | 日期类型（可存储时间戳）                                     |
| **char**     | 定长字符，固定字符长度，最大255个字符，速度快，常存储：手机号，邮箱，加密后的密码等 |
| **varchar**  | 不定长字符，有多少存多少，最大65535个字节，节省空间，长度是动态变化的。 |
| text         | 大文字，用于存储很长的字符内容，可存储65535个字符，例如：文章，新闻等。 |
| mediumtext   | 中等文本，最多存储16777215（2^24^-1)个字符                   |
| longtext     | 长文本，最多存储4294967295（4GB）（2^32^-1)个字符            |
| blob         | 字节数据类型，存储图片、音频等文件                           |

### 数据库管理(文件夹)

*  查看当前已有数据库 

```sql
show databases;
```

*  创建数据库 (文件夹)

```sql
create database 数据库名；
create database 数据库名 DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
```

* 删除数据库

```sql
drop database 数据库名；
```

* 进入数据库

```sql
use 数据库名；
```

*  查看当前数据库下的所有数据表 

```sql
show tables；
```

### 数据表管理

* 创建表

```sql
create table 表名(
	字段名 类型，
    字段名 类型，
    ···
    字段名 类型
)default charset=utf8；
```

```sql
create table 表名(
	字段名 类型 not null auto_increment primary key，	--主键（不允许为空，不允许重复）自增特性
    字段名 类型 not null，--不允许为空
    字段名 类型 default 3，--插入数据时，默认值为3，当不插入值时默认为3
    ···
    字段名 类型 null 	--允许为空（默认）
)default charset=utf8；
```

> ==主键一般用于表示当前行的编号==（类似于身份证）。 

* 示例

```sql
create table medocsys(
	id int not null auto_increment primary key,
	name varchar(20) not null,
    pwd varchar(15) not null
) default charset=utf8;
```

* 查看创建表的信息

```sql
desc 表名
```

* 插入数据

```sql
单条插入
insert into 表名(字段名1，字段名2，···，字段名) values(数据1，数据2，···，数据);
批量插入
insert into 表名(字段名1，字段名2，···，字段名) values(数据1，数据2，···，数据),(数据1，数据2，···，数据),···(数据1，数据2，···，数据);
```

### 数据行操作

#### 新增数据

```sql
单条插入
insert into 表名(字段名1，字段名2，···，字段名) values(数据1，数据2，···，数据);
批量插入
insert into 表名(字段名1，字段名2，···，字段名) values(数据1，数据2，···，数据),(数据1，数据2，···，数据),···(数据1，数据2，···，数据);
```

#### 删除数据

```sql
delete from 表名；--删除所有数据
delete from 表名 where 条件；--删除满足条件的数据
```

>  delete from tb1 where id>=10 or name=”yugin”; 

#### 修改数据

```sql
update 表名 set 字段名=值；
update 表名 set 字段名1=值，字段名2=值；
update 表名 set 字段名=值 where 条件；
eg：update tb1 set name="yugin", pwd=pwd+"10";
```

#### 查询数据

```sql
查询表所有数据
select * from 表名；
查询对应字段的数据
select 字段名1，字段名2 from 表名；
条件查询数据
select * from 表名 where id > 3；
```

### 小结

一般开发：

- 创建数据库
- 创建数据表

>  ==提前用工具创建好== 

* 创建数据库

```sql
create database unicom DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
```

* 创建表

```sql
create table admin(
	id int not null auto_increment primary key,
    username varchar(16) not null,
    password varchar(64) not null,
    mobile char(11) not null 	
)default charset=utf8;
```

### Python操作MySQL

* 创建数据

> 在进行增删改的时候需要执行`commit`，不然数据库没有数据 

```python
import pymysql

#1.连接上本地mysql
conn = pymysql.connect(host="127.0.0.1",port=3306,user="root",password="1234",charset="utf8",db="unicom")
cursor = conn.cursor(cursor=pymysql.cursors.DictCursor)

#发送指令
sql="insert into admin(username,password,mobile) values(%(name)s,%(psw)s,%(mobile)s)"
cursor.execute(sql,{"name":'alleyf2',"psw":'alleyf1234',"mobile":'18127896898'})
conn.commit()

#关闭
cursor.close()
conn.close()
```

* 查询数据

> 在进行查询的时候不需要执行`commit`，但是要执行`fetchall/fetchone`获取到返回的数据 
>
> 返回列表的形式，列表里面包含字典。

```python
import pymysql


#1.连接上本地mysql
conn = pymysql.connect(host="127.0.0.1",port=3306,user="root",password="1234",charset="utf8",db="unicom")
cursor = conn.cursor(cursor=pymysql.cursors.DictCursor)

#发送指令
sql="select * from admin"

# 获取返回的所有数据（包含字典成员的列表）
cursor.execute(sql)
data_list = cursor.fetchall()

# 获取返回的第一条数据
cursor.execute(sql)
my_first = cursor.fetchone()

for row_dict in data_list:
 print(row_dict)

print(my_first)

#关闭
cursor.close()
conn.close()
```

## Django

### 默认文件介绍

```stylus
│  manage.py	【项目的管理，启动项目，创建app，数据管理】【不能动】【常常用】
│
├─.idea
│  │  .gitignore
│  │  misc.xml
│  │  modules.xml
│  │  mysite.iml
│  │  workspace.xml
│  │
│  └─inspectionProfiles
│          profiles_settings.xml
│
├─mysite
│  │  settings.py	【项目配置文件】【常修改】
│  │  urls.py	【URL和函数的对应关系】【常修改】
│  │  asgi.py	【接收网络请求】【不能动】
│  │  wsgi.py	【接收网络请求】【不能动】
│  │  __init__.py
│  │
│  └─__pycache__
│          settings.cpython-310.pyc
│          __init__.cpython-310.pyc
│
└─__pycache__
        manage.cpython-310.pyc
```

### APP

#### 创建APP

```python
python manage.py startapp [名字]
```

```css
-项目
	-app，用户管理【表结构、函数、HTML模板、CSS等独立】
	-app，订单管理【表结构、函数、HTML模板、CSS等独立】
	-app，后台管理【表结构、函数、HTML模板、CSS等独立】
   	-app，网站管理【表结构、函数、HTML模板、CSS等独立】
   	-app，API    【表结构、函数、HTML模板、CSS等独立】
   	···
```

```visual basic
├─app1
│  │  admin.py	【固定，不用动】django默认提供了admin后台管理
│  │  apps.py	【固定，不用动】app启动类
│  │  models.py	【重要，模型层】对数据库操作
│  │  tests.py	【固定，不用动】单元测试
│  │  views.py	【重要，视图层】前后端交互处理请求返回结果的函数
│  │  __init__.py
│  │
│  └─migrations	【固定，不用动】数据库变更记录
│          __init__.py
```

### 快速上手

*  **确保app已注册【setting.py】** 

```python
INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "app01.apps.App01Config"          #注册app01
```

*  **编写URL和视图函数对应关系【urls.py】** 

```python
from django.contrib import admin
from django.urls import path
from app01 import views

urlpatterns = [
    # path("admin/", admin.site.urls),
    path("index/", views.index),
]
```

*  **编写视图函数【view.py】** 

```python
from django.shortcuts import render, HttpResponse


# Create your views here.
def index(request):
    return HttpResponse("欢迎访问YUGIN Blog")
```

*  **启动Django项目** 

```python
1.命令行启动
python manage.py runserver
2.pycharm启动
直接点击pycharm里的启动按钮
```

### 编写页面

#### 引入HTML

```python
def user_list(request):
    # 根据app注册顺序,去每个app目录下的templates中寻找对应的html
    return render(request, "user_list.html")
```

#### 静态文件

一般开发过程中：

- 图片
- CSS
- Js

都会当做静态文件处理！

* 一般在app目录下放置static文件夹

* 注意Django一般引入静态文件：

```html
{% load static %}

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <link rel="stylesheet" href="{% static 'plugins/bootstrap-3.4.1/css/bootstrap.css' %}">
</head>
<body>

<h1>用户列表</h1>


<script src="{% static 'js/jquery-3.6.1.min.js' %}"></script>
<script src="{% static 'plugins/bootstrap-3.4.1/js/bootstrap.min.js' %}"></script>
</body>
</html>
```

### 模板语法

*  本质上：在html中写一些占位符，由数据对这些占位符进行替换和处理。 

*  注意：取单独值的时候用`.`进行索引 

**views.py**

```python
def tpl(request):
    name = "小明"
    roles = ["管理员", "CEO", "保安"]
    user_info = {"name": "郭志", "salary": "101000", "role": "CTO"}

    data_list = [
        {"name": "郭志", "salary": "101000", "role": "CTO"},
        {"name": "赵健", "salary": "1010", "role": "保安"},
        {"name": "芦荟", "salary": "201000", "role": "CEO"}
    ]

    return render(request, "tpl.html", {"n1": name, "n2": roles, "n3": user_info,"n4":data_list})
```

**HTML**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>模板语法的学习</title>
</head>
<body>

<h1>模板语法的学习</h1>

{#字符串#}
<div>{{ n1 }}</div>

{#列表#}
<div>{{ n2.0 }}</div>
<div>{{ n2.1 }}</div>
<div>{{ n2.2 }}</div>

{#循环列表#}
<div>
    {% for item in n2 %}
     <span>{{ item }}</span>

    {% endfor %}
</div>

{#字典#}
<span>{{ n3.name }}</span>
<span>{{ n3.salary }}</span>
<span>{{ n3.role }}</span>

{#循环字典#}
<ul>
    {% for key,valuse in n3.items %}
     <li>{{ key }} = {{ valuse }}</li>

    {% endfor %}
</ul>

{#列表套字典#}
<ul>
    <li>{{ n4.1 }}</li>
    <li>{{ n4.1.name }}</li>
</ul>

{#列表套字典加循环#}
<ul>
    {% for item in n4 %}
     <li>{{ item.name }} = {{item.salary }}</li>
    {% endfor %}
</ul>

{#条件语句#}
{% if n1 == "小明"%}
    <h1>是小明</h1>
{% else %}
    <h1>不是小明</h1>
{% endif %}

</body>
</html>
```

#### 案例：热搜展示

**views.py**

```python
def news(request):
    url = "http://api.54dh.cn/API/search/rs/?type=weibo"
    dic = {'user-agent': 'Mozilla/5.0'}
    r = requests.post(url, headers=dic)
    r.raise_for_status()
    r.encoding = r.apparent_encoding
    info = {'info': r.json()}
    return render(request, "news.html", info)
```

**HTML**

```html
{% load static %}

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>热搜展示</title>
    <link rel="stylesheet" href="{% static 'plugins/bootstrap-3.4.1/css/bootstrap.css' %}">

    <style>
        * {
            padding: 0;
            margin: 0;
            font-family: 微软雅黑, serif;
            letter-spacing: .05em;
        }

        .container {
            margin: 5px auto;
            background-image: linear-gradient(to right, #a997a4, #b3e8ee);
        }

    </style>

</head>
<body>

<div class="row container">
    <h1 class="col-xs-12 text-center">热搜展示---{{ info.time }}</h1>


    <div class=" text-center">
        {% for item in info.data %}
            <a href="{{ item.link }}">{{ item.title }}--{{ item.heat }}</a>
            <br>
        {% endfor %}


    </div>
</div>

<script src="{% static 'js/jquery-3.6.1.min.js' %}"></script>
<script src="{% static 'plugins/bootstrap-3.4.1/js/bootstrap.min.js' %}"></script>
</body>
</html>
```

### 请求和响应

*  **通过此方式可以获取到get请求中的参数和post请求中的数据** 

```python
def something(request):
    if request.method == "GET":
        # 获取get请求中携带的参数
        parameters = request.GET
        # 获取post请求中提交的数据
        data = request.POST
        print(parameters)
        print(data)
        return HttpResponse(parameters['name'])
```

*  **重定向：返回重定向的网址给浏览器，浏览器去请求该网址** 

```python
return redirect("https://www.baidu.com")
```

#### 案例：用户登录

**views.py**

```python
from django.shortcuts import render, HttpResponse,redirect
import requests

def login(request):
    if request.method == "GET":
       return render(request, "login.html")
    #POST请求
    else:
        username=request.POST.get("user")
        pwd = request.POST.get("pwd")
        #print(request.POST)
        if username == 'root' and pwd == '1234':
             return redirect("http://chuiyugin.github.io")
        else:
             return render(request, "login.html",{"error_msg":"用户名或密码错误"})
```

**HTML**

* 注意： 在html表单（form）中加上`{% csrf_token %}` 

```html
{% load static %}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <link rel="stylesheet" href="{% static 'plugins/bootstrap-3.4.1/css/bootstrap.css' %}">
</head>
<body>

<form method="post" action="/login/">
    {#提交表单一定要添加#}
    {% csrf_token %}

    <input type="text" name="user" placeholder="用户名">
    <input type="password" name="pwd" placeholder="密码">
    <input type="submit" value="提交">
    <div class="row container">
       <h2 class="col-xs-12 " style="color:darkred;">{{ error_msg }}</h2>
    </div>
</form>


<script src="{% static 'js/jquery-3.6.1.min.js' %}"></script>
<script src="{% static 'plugins/bootstrap-3.4.1/js/bootstrap.min.js' %}"></script>
</body>
</html>
```

### 数据库操作

> Django使用ORM框架实现对数据库的操作，安装`mysqlclient`第三方库辅助操作 

```powershell
pip install mysqlclient
```

#### ORM

> ORM可以帮助我们完成两件事：
>
> 1. 创建、修改、删除数据库中的表（不用写SQL语句）【无法创建数据库】
> 2. 操作表中的数据

####  配置setting.py文件

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql', #连接MYSQL数据库
        'NAME': 'day15',  # 数据库名
        'USER': 'root',  # 数据库用户名
        'PASSWORD': '1234',  # 数据库密码
        'HOST': '127.0.0.1',  # 数据库主机地址
        'PORT': 3306,  # 数据库连接端口号
    }
}
```

#### Django操作表

##### 创建表

* 在models.py中创建表类 

```python
from django.db import models

# Create your models here.
class Userinfo(models.Model):
    name = models.CharField(max_length=32)
    password = models.CharField(max_length=64)
    mobile = models.CharField(max_length=11)
    email = models.CharField(max_length=32)
    age = models.IntegerField()
```

* 在终端执行命令创建该表

注意：**1.终端路径在项目名目录下。2.app需要已经注册。3.表名是app的名称加上类名**

```shell
python manage.py makemigrations
python manage.py migrate
```

##### 删除表

 直接将`models.py`里面的类注释掉即可 

```python
class Userinfo(models.Model):
#     name = models.CharField(max_length=32)
#     password = models.CharField(max_length=64)
#     mobile = models.CharField(max_length=11)
#     email = models.CharField(max_length=32)
#     age = models.IntegerField()
#     docpath = models.CharField(max_length=64, default="")
#     imgpath = models.CharField(max_length=64, null=True, blank=True)
```

##### 修改表

* 删除字段（直接注释掉） 

```python
#删除imgpath字段
class Userinfo(models.Model):
    name = models.CharField(max_length=32)
    password = models.CharField(max_length=64)
    mobile = models.CharField(max_length=11)
    email = models.CharField(max_length=32)
    age = models.IntegerField()
    docpath = models.CharField(max_length=64, default="")
    #imgpath = models.CharField(max_length=64, null=True, blank=True)
```

*  修改字段 

```python
#修改max_length属性
docpath = models.CharField(max_length=128, default="")#将max_length直接改为128
```

*  添加字段 

>在表中新建字段（列）时，由于已存在的字段可能已有数据，所以新增列必须要指定新增列对应的数据：
>
>1. 手动输入一个值（全部行都为输入的值）
>2. 设置默认值(default后面的值)

```python
docpath = models.CharField(default="")
docpath = models.CharField(default=2)
```

3.  允许为空 

```python
imgpath = models.CharField(null=True, blank=True)
```

##### 操作表中的数据

1. 添加数据( models.py )

```python
# ***************添加数据***************
# 本质：insert into app1_userinfo(name,password,mobile,email) values("yugin","123456","18127896898","1726123207@qq.com")
Userinfo.objects.create(name="yugin", password="123456", mobile="18127896898", email="1726123207@qq.com")
```

在views.py中引入models.py中的类即可进行添加数据：

* models.py

```python
class Department(models.Model):
    title = models.CharField(max_length=16)
```

* views.py

```python
from app01.models import Department,Userinfo
def orm(request):

    #测试orm操作表中的数据
    Department.objects.create(title="销售部门")
    Department.objects.create(title="IT部门")
    Department.objects.create(title="运营部门")

    return HttpResponse("成功")
```

2. 更新数据

```python
# 条件更新
Userinfo.objects.filter(id=2).update(password='a123456')
# 全更新
Userinfo.objects.all().update(mobile='13125018525')
```

3. 删除数据

```python
# 条件删除
Userinfo.objects.filter(id=2).delete()
# 删除表中全部数据
Userinfo.objects.all().delete()
```

4. 查询数据

```python
#条件查询
	#查询结果不唯一时，返回包含对象的queryset(列表)：
    	userinfo = Userinfo.objects.filter(id=1) 	
	#已知查询结果唯一时利用first()获取第一条数据，返回对象：
    	userobj = Userinfo.objects.filter(id=1).first()
#全查询
	#返回包含对象的列表：
		userinfo = Userinfo.objects.all()
```

```python
def user_list(request):
    userlist = []
    userinfo = Userinfo.objects.all()
    for info in userinfo:
        datadic = {'id': info.id, 'name': info.name, 'password': info.password, 'mobile': info.mobile, 'email': info.email}
        userlist.append(datadic)
    print(userlist)
    return render(request, "user_list.html", {'userlist': userlist})
```

#### 案例：用户管理

要求：

1. 展示用户列表
   - url路由
   - view函数
     1. 获取用户信息
     2. HTML渲染
2. 添加用户
   - post请求
   - 添加用户
   - HTML渲染
3. 删除用户
   - a标签传递用户id参数get请求
   - 筛选删除指定用户

* 展示数据

```html
{% load static %}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户管理系统</title>
    <link rel="stylesheet" href="{% static 'plugins/bootstrap-3.4.1/css/bootstrap.css' %}">
</head>
<body>

<h1>INFO列表</h1>

<a href="/info/add/">点此添加数据</a>

<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>姓名</th>
        <th>密码</th>
        <th>年龄</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    {% for obj in data_list %}
        <tr>
            <td>{{ obj.id }}</td>
            <td>{{ obj.name }}</td>
            <td>{{ obj.password }}</td>
            <td>{{ obj.age }}</td>
            <td>
                <a href="/info/delete/?nid={{ obj.id }}">删除</a>
            </td>
        </tr>
    {% endfor %}
    </tbody>

</table>


<script src="{% static 'js/jquery-3.6.1.min.js' %}"></script>
<script src="{% static 'plugins/bootstrap-3.4.1/js/bootstrap.min.js' %}"></script>
</body>
</html>
```

* 添加数据

```html
{% load static %}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户管理系统</title>
    <link rel="stylesheet" href="{% static 'plugins/bootstrap-3.4.1/css/bootstrap.css' %}">
</head>
<body>

<h1>添加用户</h1>
<form method="post" action="/info/add/">

    {% csrf_token %}

    <input type="text" name="user" placeholder="用户名">
    <input type="text" name="pwd" placeholder="密码">
    <input type="text" name="age" placeholder="年龄">
    <input type="submit"  value="提 交">

</form>



<script src="{% static 'js/jquery-3.6.1.min.js' %}"></script>
<script src="{% static 'plugins/bootstrap-3.4.1/js/bootstrap.min.js' %}"></script>
</body>
</html>
```

* views.py

```python
from django.shortcuts import render, HttpResponse,redirect
import requests
from app01.models import Department,Userinfo
def orm(request):

    #测试orm操作表中的数据
    Department.objects.create(title="销售部门")
    Department.objects.create(title="IT部门")
    Department.objects.create(title="运营部门")

    return HttpResponse("成功")

from app01.models import Department,Userinfo
def info_list(request):

    #获取数据库中所有的用户信息
    #[对象,对象]
    data_list = Userinfo.objects.all()

    #渲染，返回给用户
    return render(request, "info_list.html",{"data_list":data_list})

def info_add(request):

    if request.method == "GET":
       return render(request, "info_add.html")

    #获取到用户提交的数据
    user = request.POST.get("user")
    pwd = request.POST.get("pwd")
    age = request.POST.get("age")



    #添加到数据库
    Userinfo.objects.create(name=user,password=pwd,age=age)

    return redirect("/info/list/")


def info_delete(request):
    nid = request.GET.get("nid")
    Userinfo.objects.filter(id=nid).delete()

    return redirect("/info/list/")
```

## Django开发

### 设置表结构

```python
from django.db import models


# Create your models here.
class Department(models.Model):
    """部门表"""
    title = models.CharField(verbose_name="标题", max_length=32)

#关联部门表
class UserInfo(models.Model):
    """员工表"""
    name = models.CharField(verbose_name="姓名", max_length=16)
    password = models.CharField(verbose_name="密码", max_length=16)
    age = models.IntegerField(verbose_name="年龄")
    account = models.DecimalField(verbose_name="账户余额", max_digits=10, decimal_places=2, default=0)
    create_time = models.DateTimeField(verbose_name="入职时间")
    # Dejango中对字段值域的约束
    gender_choices = (
        (1, '男'),
        (2, '女'),
    )
    gender = models.SmallIntegerField(verbose_name='性别', choices=gender_choices)
    # 无约束
    # depart_id = models.BigIntegerField(verbose_name='部门ID')
    # 有约束
    #    -to:与之关联的表
    #    -to.field：与之关联的字段
    # 1.Django自动
    #     -将关联字段名添加到被关联的字段的后面(depart_id)
    # 2.外键表(部门表)的关联字段被删除
    # -2.1级联删除
    depart = models.ForeignKey(to='Department', to_field='id', on_delete=models.CASCADE)
    # -2.1置空
    # depart = models.ForeignKey(to='Department',to_field='id',null=True,blank=True,on_delete=models.SET_NULL)
```

### 部门管理

#### 部门列表

>  重要知识点 : ==url中传递动态参数== 

```python
#urls.py
path("depart/<int:nid>/edit/", views.depart_edit),
```

```python
# Create your views here.
def depart_list(request):
    """部门列表"""

    # 去数据库中获取所有的部门信息
    queryset = models.Department.objects.all()

    return render(request, "depart_list.html", {"queryset": queryset})
```

#### 新建部门

```python
def depart_add(request):
    """添加部门"""
    if request.method == "GET":
        return render(request, "depart_add.html")
    # 获取用户POST提交过来的数据
    title = request.POST.get("title")
    #保存到数据库
    models.Department.objects.create(title=title)
    #重定向回到部门列表
    return redirect("/depart/list/")
```

#### 删除部门

```python
def depart_delete(request):
    """删除部门"""
    nid = request.GET.get("nid")
    models.Department.objects.filter(id=nid).delete()
    return redirect("/depart/list/")
```

#### 修改部门

>  重要知识点 : ==url中传递动态参数== 

```python
#urls.py
path("depart/<int:nid>/edit/", views.depart_edit),
```

```python
def depart_edit(request,nid):
    """修改部门"""
    if request.method == "GET":
        row_object = models.Department.objects.filter(id=nid).first()
        return render(request, "depart_edit.html",{"row_object":row_object})
    if request.method == "POST":
        title = request.POST.get("title")
        models.Department.objects.filter(id=nid).update(title=title)
        # 重定向回到部门列表
        return redirect("/depart/list/")
```

### HTML模板继承

> 模板继承可以使父模板的内容复用，子模版直接继承父模板的全部内容并可以覆盖父模板中相应的块。 

**语法—父模板中：**

 1.定义父模板中的块block标签

 2.标识出哪些在子模版中是允许被修改的

 3.block标签：在父模板中定义，可以在子模版中覆盖

```html
{% block block_name %}
	父模板可以被覆盖的内容
{% endblock blocl_name%}  (**切记一定要写endblock**)
```

**语法—子模版中：**

 1.继承模板extends标签（**写在模板文件的第一行**）

```html
{% entends 'layout.html' %}
```

  2.子模版 重写父模板中的内容块

```html
{% block block_name %}
	子模版用来覆盖父模板中 block_name 块的内容
{% endblock blocl_name%}  (**切记一定要写endblock**)
```

#### 实例

* 父模板

```html
{% extends "layout.html" %}

{% block  content %}
    <div class="container">
        <div>
            <a href="/depart/add/" class="btn btn-primary">新建部门</a>
        </div>

        <div class="panel panel-default" style="margin-top: 20px">
            <!-- Default panel contents -->
            <div class="panel-heading">
                <span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
                部门列表
            </div>

            <!-- Table -->
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>部门名称</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                {% for obj in queryset %}
                    <tr>
                        <td>{{ obj.id }}</td>
                        <td>{{ obj.title }}</td>
                        <td>
                            <a class="btn btn-success btn-xs" href="/depart/{{ obj.id }}/edit/">编辑</a>
                            <a class="btn btn-danger btn-xs" href="/depart/delete/?nid={{ obj.id }}">删除</a>
                        </td>
                    </tr>
                {% endfor %}
                </tbody>
            </table>
        </div>
    </div>
{% endblock %}
```

* 继承模板

```html
{% extends "layout.html" %}

{% block  content %}
    <div class="container">
        <div>
            <a href="/depart/add/" class="btn btn-primary">新建部门</a>
        </div>

        <div class="panel panel-default" style="margin-top: 20px">
            <!-- Default panel contents -->
            <div class="panel-heading">
                <span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
                部门列表
            </div>

            <!-- Table -->
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>部门名称</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                {% for obj in queryset %}
                    <tr>
                        <td>{{ obj.id }}</td>
                        <td>{{ obj.title }}</td>
                        <td>
                            <a class="btn btn-success btn-xs" href="/depart/{{ obj.id }}/edit/">编辑</a>
                            <a class="btn btn-danger btn-xs" href="/depart/delete/?nid={{ obj.id }}">删除</a>
                        </td>
                    </tr>
                {% endfor %}
                </tbody>
            </table>
        </div>
    </div>
{% endblock %}
```

### 主题一：用户管理

* 向数据库插入数据

```sql
insert into app01_userinfo(name,password,age,account,create_time,gender,depart_id_id) values("刘冬","1234","23","100.87","2010-1-11","1","1");

insert into app01_userinfo(name,password,age,account,create_time,gender,depart_id_id) values("Alleyf","1234","20","9000.87","2012-1-11","1","2");


+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| id           | bigint        | NO   | PRI | NULL    | auto_increment |
| name         | varchar(16)   | NO   |     | NULL    |                |
| password     | varchar(64)   | NO   |     | NULL    |                |
| age          | int           | NO   |     | NULL    |                |
| account      | decimal(10,2) | NO   |     | NULL    |                |
| create_time  | datetime(6)   | NO   |     | NULL    |                |
| gender       | smallint      | NO   |     | NULL    |                |
| depart_id_id | bigint        | NO   | MUL | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
```

### ModelForm和Form

- 原始方式：不会采用（本质）【麻烦】

  - 没有数据校验
  - 错误，应该有提示

  - 页面上，每个字段都需要我们重新写一遍，数据冗余

  - 关联的数据，需要手动获取并循环展示在页面中

- Django组件

  1. Form组件（较简便）
  2. ModelForm组件（最简便）

#### ModelForm示例

* models.py

```python
class UserInfo(models.Model):
    """ 员工表 """
    name = models.CharField(verbose_name='姓名', max_length=16)
    password = models.CharField(verbose_name="密码", max_length=64)
    age = models.IntegerField(verbose_name="年龄")
    account = models.DecimalField(verbose_name="账户余额", max_digits=10, decimal_places=2, default=0)
    create_time = models.DateTimeField(verbose_name="入职时间")

    depart_id = models.ForeignKey(to="Department", to_field="id", on_delete=models.CASCADE,verbose_name="部门")
    # Dejango中对字段值域的约束
    gender_choices = (
        (1, '男'),
        (2, '女'),
    )
    gender = models.SmallIntegerField(verbose_name='性别', choices=gender_choices)
```

* views.py

```python
# 用户管理
def user_list(request):
    # 获取所有的用户列表
    queryset = models.UserInfo.objects.all()

    return render(request, "user_list.html", {"queryset": queryset})


# ModelForm
from django import forms


class userInfoForm(forms.ModelForm):
    class Meta:
        model = models.UserInfo
        fields = ["name", "password", "age", "create_time", "gender", "depart_id"]
        widgets = {
            # "name": forms.TextInput(attrs={"class": "form-control input"}),
            # "password": forms.PasswordInput(attrs={"class": "form-control input"}),
            # "age": forms.TextInput(attrs={"class": "form-control input"}),
            # "account": forms.TextInput(attrs={"class": "form-control input"}),
            "create_time": forms.DateTimeInput(attrs={"class": " form-control input", "type": "datetime-local"}),
            # "gender": forms.Select(attrs={"class": "form-control input"}),
            # "depart": forms.Select(attrs={"class": "form-control input"}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # 循环找到所有的字段,给其添加样式
        for name, field in self.fields.items():
            # 想让某一个不加
            if name == "create_time":
                continue
            field.widget.attrs = {"class": "input form-control", "placeholder": field.label}


def user_add(request):
    # 添加用户
    if request.method == "GET":
        form = userInfoForm()
        return render(request, "user_add.html", {"form": form})
    # 用户POST提交数据，数据校验
    form = userInfoForm(data=request.POST)
    if form.is_valid():
      # 如果合法保存到数据库
      form.save()
      return redirect("/user/list")
    else:
        return render(request, "user_add.html",{"form": form})
```
* user_list.html(未用ModelForm)

```html
{% extends "layout.html" %}

{% block  content %}
    <div class="container">
        <div>
            <a href="/user/add/" class="btn btn-primary">新建用户</a>
        </div>

        <div class="panel panel-default" style="margin-top: 20px">
            <!-- Default panel contents -->
            <div class="panel-heading">
                <span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
                用户列表
            </div>

            <!-- Table -->
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>姓名</th>
                    <th>密码</th>
                    <th>年龄</th>
                    <th>余额</th>
                    <th>入职时间</th>
                    <th>性别</th>
                    <th>所属部门</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                {% for obj in queryset %}
                    <tr>
                        <td>{{ obj.id }}</td>
                        <td>{{ obj.name }}</td>
                        <td>{{ obj.password }}</td>
                        <td>{{ obj.age }}</td>
                        <td>{{ obj.account }}</td>
                        <td>{{ obj.create_time|date:"Y-m-d" }}</td>
                        <td>{{ obj.get_gender_display }}</td>
                        <td>{{ obj.depart_id.title }}</td>
                        <td>
                            <a class="btn btn-success btn-xs" href="/depart/{{ obj.id }}/edit/">编辑</a>
                            <a class="btn btn-danger btn-xs" href="/depart/delete/?nid={{ obj.id }}">删除</a>
                        </td>
                    </tr>
                {% endfor %}
                </tbody>
            </table>
        </div>
    </div>
{% endblock %}
```
* user_add.html(使用ModelForm)

```html
{% extends "layout.html" %}

{% block  content %}
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">新建用户</h3>
            </div>
            <div class="panel-body">
                <form method="post" novalidate>
                    {% csrf_token %}
                    {% for field in form %}
                        <div class="form-group">
                            <label>{{ field.label }}</label>
                            {{ field }}
                         <span style="color: #2aabd2">{{ field.errors.0 }}</span>
                        </div>
                    {% endfor %}
                    <button type="submit" class="btn btn-primary">提 交</button>
                </form>
            </div>
        </div>
    </div>
{% endblock %}
```

* 在配置文件`settings.py`中可以设置语言种类 

```python
# LANGUAGE_CODE = "en-us" 英文
LANGUAGE_CODE = "zh-hans" 中文
```

### 主题二：靓号管理

靓号管理
