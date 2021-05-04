//
//  main.cpp
//  二叉树
//
//  Created by 李坤鹏 on 2021/4/28.
//  Copyright © 2021 李坤鹏. All rights reserved.
//

#include <iostream>

typedef char ElemType;

typedef struct BitNode
{
    char data;
    struct BitNode *lchild, *rchild;
} BitNode, *BiTree;

// 创建二叉树
void CreateBiTree(BiTree *T) {
    char c;
    printf("inputting---------");
    scanf("%c", &c);
    if ('\0' == c) {
        *T = NULL;
    } else {
        *T = (BitNode *)malloc(sizeof(BiTree));
        (*T)->data = c;
        CreateBiTree(&(*T)->lchild);
        CreateBiTree(&(*T)->rchild);
    }
}
// 访问二叉树结点的具体操作
void visit(char c, int level) {
    printf("%c ------%d", c,level);
}

// 前序遍历二叉树
void PreOrderTraverse(BiTree T, int level)
{
    if (T) {
        visit(T->data, level);
        PreOrderTraverse(T->lchild, level+1);
        PreOrderTraverse(T->rchild, level+1);
    }
}

int main(int argc, const char * argv[]) {
    int level = 1;
    BiTree T = NULL;
    CreateBiTree(&T);
    PreOrderTraverse(T, level);
    
    // insert code here...
//    std::cout << "Hello, World!\n";
    return 0;
}
