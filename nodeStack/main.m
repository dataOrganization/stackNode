//
//  main.m
//  nodeStack
//
//  Created by mac on 16/5/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int  elemType;

int count = 0;

typedef struct nodeStack{
    elemType data;
    struct nodeStack *next;
}NodeStack;

NodeStack * initNodeStack(NodeStack * s) {
    s = (NodeStack *)malloc(sizeof(NodeStack));
    s->next = NULL;
    return  s;
}

void printfNodeStack(NodeStack *s) {
    while (s->next) {
        printf("%d ",s->data);
        s = s->next;
    }
    printf("\n");
}


NodeStack * insertWithNodeStack(NodeStack *s ,elemType e) {
    NodeStack *node = (NodeStack *)malloc(sizeof(NodeStack));
    node->data = e;
    node->next = s;
    s = node;
    count++;
    return s;
}

NodeStack * deleteStack(NodeStack *s ,elemType e){
    NodeStack * temp = (NodeStack *)malloc(sizeof(NodeStack));
    e = s->data;
    temp = s;
    free(s);
    s = temp->next;
    count--;
    return s;
}

NodeStack * deleteWithNodeStack(NodeStack *s ,int number) {
    if (count >= number) {
        for (int i = 0; i < number; i++) {
           s = deleteStack(s,0);
        }
    }else{
        while (s->next) {
           s = deleteStack(s, 0);
        }
    }
    return s;
}



int main(int argc, const char * argv[]) {
    NodeStack *s;
    s = initNodeStack(s);
    for (int i = 0; i < 10; i++) {
       s = insertWithNodeStack(s, i);
    }
    printfNodeStack(s);
    
    s = deleteWithNodeStack(s, 5);
    printfNodeStack(s);
    return 0;
}
