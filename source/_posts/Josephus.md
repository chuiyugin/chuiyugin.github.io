---
title: 利用循环队列求解约瑟夫环问题
tags: [数据结构,c语言]
categories: [数据结构]
date: 2021-11-20 23:30:00
excerpt: 循环队列、约瑟夫环
---

#### 循环队列求解约瑟夫环完整代码

```c
#include <stdio.h>
#include <stdlib.h>

#define ERROR 1
#define TRUE 1

typedef int Status;
typedef int ElemType;

typedef struct node {
    ElemType data;
    struct node *next;
}LNode, *Linklist;

typedef struct LinkQuene{
     struct node *front;
     struct node *rear;
}LinkQuene;
//初始化队列
Status init(LinkQuene q){
   q.front = q.rear = (Linklist*)malloc(sizeof(LNode));
   if(q.front!=q.rear){
       return ERROR;
   }
   q.front->next = NULL;
   return TRUE;
}
//插入约瑟夫环（人数为x，按顺序编号）
Status insert(LinkQuene *q,ElemType x){
    int i = 0;
    Linklist p;
    p->next = NULL;
    for(i = x;i>=1;i--){
        Linklist s;
        s = (Linklist)malloc(sizeof(LNode));
        if(!s){
            return ERROR;
        }
        s->data = i;
        if(i==1){
            q->front = s;
        }
        if(i==x){
            q->rear = s;
        }
        s->next = p->next;
        p->next = s;
        q->rear->next = q->front;
    }
}
//出列操作
Linklist *out(LinkQuene *q){
    Linklist s;
    s = q->front;
    q->front = s->next;
    q->rear->next = q->front;
    return s;
}
//入列操作
void in(LinkQuene *q,Linklist s){
    q->rear->next = s;
    s->next = q->front;
    q->rear = s;
}
//约瑟夫环操作函数
Status Josephus(LinkQuene q,Linklist p,int x,int i,int m){
    int j;
    if(i>x){
        return ERROR;
    }
    else for(j=1;j<i;j++){
            q.front = q.front->next;
            q.rear = q.rear->next;
        }
    while(q.front!=q.rear){
        for(j=1;j<m;j++){
            p=out(&q);
            in(&q,p);
        }
        p=out(&q);
        printf("the number of dead people is %d\n",p->data);
        free(p);
    }
    printf("the number of avoiding execution is %d",q.front->data);
}

int main(){
int x,i,m;
printf("how much people:\n");
scanf("%d",&x);
    printf("the starting point:\n");
    scanf("%d",&i);
    printf("how much people to skip:\n");
    scanf("%d",&m);
    LinkQuene q;
    Linklist *p;
    init(q);
    insert(&q,x);
    Josephus(q,p,x,i,m);
};
```

