---
title: Vue学习笔记
tags: [Vue]
categories: [Vue]
date: 2023-4-25 00:15:00
excerpt: Vue学习笔记!
---
# Vue学习笔记

## Vue数据管理：使用data函数提供数据

* index.js

```js
const app = Vue.createApp({
    data(){//data函数返回数据，可以是任何类型
        return{
            name:"vue",
            address:{
                name:"my_vue",
            }
        } 
    }
});
app.mount("#app");//使得app成为模板，可以使用模板语法
```

* HTML使用模板语法展示返回的数据

```html
<div id="app">
        <h1>hello!{{address.name}}</h1>
        <h2>{{name}}</h2>
    </div>
```

## Vue数据管理：在HTML访问data属性

* 指令：是vue提供的一组可以直接在html模板中使用的特殊属性，例如：`v-bind`、`v-for`、`v-if`，用于实现数据绑定、循环、条件判断等。
* index.js

```js
const app = Vue.createApp({
    data(){//data函数返回数据，可以是任何类型
        return{
            name:"vue",
            link:"https://chuiyugin.github.io/",
        } 
    }
});
app.mount("#app");//使得app成为模板，可以使用模板语法
```

* 在HTML访问data属性(`v-bind`可以简写为`:`)

```html
<div id="app">
        <a v-bind:href="link">链接</a>
    </div>
```

## Vue数据管理：展示列表数据

* 使用v-for语句生成列表
* index.js

```js
const app = Vue.createApp({
    data(){//data函数返回数据，可以是任何类型
        return{
            name:"vue",
            todos:["学习Vue","热爱生活","平安喜乐"],
        } 
    }
});
app.mount("#app");//使得app成为模板，可以使用模板语法
```

* 在HTML中生成列表(不带序号)

```html
<div id="app">
        <ul>
            <li v-for=" todo in todos ">{{todo}}</li>
        </ul>
    </div>
```

* 在HTML中生成列表(带序号)

```html
<div id="app">
        <ul>
            <li v-for=" (todo,index) in todos ">{{index+1}} {{todo}}</li>
        </ul>
    </div>
```

### 复选框的使用

* index.js

```js
const app = Vue.createApp({
    data(){//data函数返回数据，可以是任何类型
        return{
            name:"vue",
            //todos:["学习Vue","热爱生活","平安喜乐"],
            todos: [
                {
                  content: "把项目做完",
                  complete: true,
                },
                {
                  content: "去超市购物",
                  complete: false,
                },
                {
                  content: "看10分钟的书",
                  complete: false,
                },
              ],
        } 
    }
});
app.mount("#app");//使得app成为模板，可以使用模板语法
```

* 在HTML中展示复选框

```html
<div id="app">
        <ul>
            <li v-for=" (todo,index) in todos ">
                <input type="checkbox" :checked="todo.complete"> todo.content
            </li>
        </ul>
    </div>
```

