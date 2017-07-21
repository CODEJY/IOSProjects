//
//  main.m
//  BlockTest
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/7/21.
//  Copyright © 2017年 GARY WU (MBC-ISD-OOCLL/ZHA). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyBlock.h"
typedef NSComparisonResult (^NSComparator)(id obj1,id obj2);

int sortGlobal = 0;
//block 基本用法
void checkBasic()
{
    NSArray* array = [NSArray arrayWithObjects:@8,@3,@1,@5,@7, nil];
    __block int sortStack = 0;
    NSComparator sortDescend = ^(id obj1,id obj2) {
        sortStack = 0;//局部变量需要 __block
        sortGlobal = 0;//全局变量可直接修改
        if (sortStack == 0)
            return [obj1 compare:obj2];
        else
            return [obj2 compare:obj1];
    };
    
    NSArray* sortArray = [array sortedArrayUsingComparator:sortDescend];
    NSLog(@"%@",sortArray);

}
//将block当作参数传递
void checkSort(NSComparator comparator) {
    NSArray* a = [NSArray arrayWithObjects:@"cf",@"d",@"b",@"a",nil];
    NSArray* sorta = [a sortedArrayUsingComparator:comparator];
    NSLog(@"%@",sorta);
    NSLog(@"%@",comparator);//作为函数参数是StackBlock
}
//StackBlock
void checkStackBlock()
{
    MyBlock* myBlock = [[MyBlock alloc] init];
    [myBlock stackBlock];
}
//GlobalBlock
void checkglobalBlock()
{
    MyBlock* myBlock = [[MyBlock alloc] init];
    [myBlock globalBlock];
}

//block 作为返回值，会被拷贝到堆上
void asReturnBlock()
{
    MyBlock* myBlock = [[MyBlock alloc] init];
    NSLog(@"%@",[myBlock blockReturn]);
}

//循环引用
void checkReference()
{
    MyBlock* myBlock = [[MyBlock alloc] init];
    [myBlock testBlock];
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //checkBasic();//基本用法
        //checkSort(sortDescend);//将block当作参数传递
     //   checkStackBlock();//StackBlock
       // checkglobalBlock();//GlobalBlock
        //asReturnBlock();//block作为返回值
        checkReference();//循环引用
    }
    return 0;
}
