---
title: Graph Counts
tags: [数据结构,图]
categories: [数据结构]
date: 2021-12-12 21:40:00
excerpt: 图、算法
---

### 题目描述

 ![ ](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/4.png)  

![ ](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/5.png)

### Hints

•Each edge has weight of 1.

•Find shortest path for every two nodes using **Floyd** algorithm. Use length[][] to know shortest path length.

### 示例邻接表

0;1;2;4
1;0
2;0;4
3;4;6
4;0;2;3;5
5;4;6
6;3;5

### 实现原理        

​     导入邻接表放入一个二维数组中，根据该邻接表建立邻接矩阵，然后根据Floyd算法（从i号顶点到j号顶点只经过前k号点的最短路程）得到最短路径矩阵，最后根据DFS寻找连通子图。  

### 输出结果展示
![ ](https://cdn.jsdelivr.net/gh/chuiyugin/imgbed/3.png)  

### 完整代码实现

```c
/*
 ============================================================================
 Name        : GraphMatrix.c
 Author      : YUGIN CHUI（Xu yujian）
 Version     :
 Copyright   :
 Description : read a graph from file, which descibe the formation of the
 	 	 	   graph by vertices at the beginning of each line, followed
 	 	 	   by connected vertices.
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#define MAX 999

int sub_graphs = 0;

//打印矩阵函数
void PrintMatrix(int **m, int size) {
    int i, j;
    for (i = 0; i < size; i++) {
        for (j = 0; j < size; j++)
            m[i][j] == MAX ? printf("%3c ", 'x') : printf("%3d ", m[i][j]);
        printf("\n");
    }

}

//Flyod函数
void Floyd(int **A, int size) {
//TO-DO: implement Floyd algorithm
int i,j,k;
for(k=0;k<size;k++){
    for(i=0;i<size;i++){
        for(j=0;j<size;j++) {
         if(A[i][k] + A[k][j] < A[i][j]){
             A[i][j] =  A[i][k] + A[k][j];
         }
        }
    }
}
}

//DFS函数
void DFS(int **A,int i,int *visit,int num_nodes){
    visit[i] = 1;
    for(int j = 0;j<num_nodes;j++){
        if(A[i][j] == 1 && visit[j] == 0)
            DFS( A, j, visit, num_nodes);
    }
}

//DFSTravel函数
void DFSTravel(int **A,int *visit,int num_nodes,int e){
    DFS(A, e, visit, num_nodes);
    sub_graphs++;
}

//主函数
int  main() {
    int i, j, k, num_nodes;
    int **word;
    int **M;
    int *count;

    word = malloc(sizeof(int *) * 255);
    for (i = 0; i < 255; i++) {
        word[i] = (int *) malloc(sizeof(int) * 255);
        for (j = 0; j < 255; j++)
            word[i][j] = -1;
    }

    //read graph from file.txt, store data in word[][]
    FILE *fp;
    fp = fopen("file.txt", "r");
    if (fp == NULL) {
        printf("can not open data file\n");
        exit(0);
    };

    if (fp != NULL) {
        i = 0;
        while (!feof(fp)) {
            char *buff = malloc(255);
            char *c = malloc(sizeof(char));
            j = 0;
            int x = 0;
            fscanf(fp, "%s", buff);

            //the while loop get rid of symbols like , . -
            while (buff[x] != NULL) {
                if (isdigit(buff[x])) {
                    c[0] = buff[x];
                    word[i][j] = atoi(c);
                    j++;
                }
                x++;
            }
            i++;
        }
        num_nodes = i;
        printf("Number of nodes: %d\n", num_nodes);
    }

//	PrintMatrix(word, num_nodes);

// initialize M[][] with all MAX values, TYPICAL code example for initialing 2D matrix.
    M = malloc(sizeof(int *) * num_nodes);
    int node;
    for (i = 0; i < num_nodes; i++) {
        M[i] = (int *) malloc(sizeof(int) * num_nodes);
        for (j = 0; j < num_nodes; j++) {
            M[i][j] = MAX;
        }
    }
//build M[][] with the value read from file.txt
    for (i = 0; i < num_nodes; i++) {
        for (j = 0; j < num_nodes; j++) {
            if (word[i][j] != -1 && j > 0) {
                //TO-DO: assign value=1 to correct index of M[][]
                M[i][word[i][j]] = 1;
            }
        }
    }
    printf("matrix: \n");
    PrintMatrix(M, num_nodes);

    //利用DFS寻找连通子图代码段
    int visit[num_nodes];
    for(i=0;i<num_nodes;i++){
        visit[i] = 0;
    }
        DFSTravel(M,visit,num_nodes,0);
        for(int j = 0;j<num_nodes;j++) {
            if (visit[j] == 0)
                DFSTravel(M, visit, num_nodes, j);
        }

    //Flyod求解
    for (k = 0; k < (num_nodes - 3); k++)
        Floyd(M, num_nodes);

    printf("Shortest path matrix between vertices\n");
    PrintMatrix(M, num_nodes);

//count is used for output number of pairs in each distance
    count = malloc(sizeof(int *) * (num_nodes-1)); //Furthest distance is (num of nodes -1)
    for(i=0;i<num_nodes-1;i++) count[i]=0;

//count number of subgraphs in num_graphs, and number of node-pairs in count[], e.g. node pairs in distance
//TO-DO: assign count[] values, and update sum
    for (i = 0; i < num_nodes; i++){
        for (j = 0; j < num_nodes; j++){
//TO-DO: assign count[] values, and update sum
        if(j>i) {
            count[M[i][j]]++;
        }
    }
}

printf("Number of connected sub-graphs: %d\n",sub_graphs);
printf("%8s | %8s\n","Distance","Number of node-pairs");
for(i=0;i<num_nodes-1;i++)
if(count[i]>0)
printf("%8d | %8d\n", i, count[i]);

return 0;
}

```

