//
//  main.m
//  GCDTest
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/7/24.
//  Copyright © 2017年 GARY WU (MBC-ISD-OOCLL/ZHA). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyGCD.h"
//死锁,死循环引起
void deadLock()
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^(){
        NSLog(@"1");
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"2");
        });
        NSLog(@"3");
    });
    NSLog(@"4");
    while(1);
}

//同步或异步函数并行队列
void callCheck1()
{
    MyGCD* myGCD = [[MyGCD alloc] init];
    [myGCD check1];
}
//串行队列
void callCheck2()
{
    MyGCD* myGCD = [[MyGCD alloc] init];
    [myGCD check2];
}
//同步主队列死锁
void callCheck3()
{
    MyGCD* myGCD = [[MyGCD alloc] init];
    [myGCD check3];
}
// 嵌套同步串行死锁
void callCheck4()
{
    MyGCD* myGCD = [[MyGCD alloc] init];
    [myGCD check4];
}
//组异步任务
void callCheckGroup()
{
    MyGCD* myGCD = [[MyGCD alloc] init];
    [myGCD checkGroup];
}
//dispat_apply
void callCheckApply()
{
    MyGCD* myGCD = [[MyGCD alloc] init];
    [myGCD checkApply];
}
//写操作线程安全
void callBarrier()
{
    MyGCD* myGCD = [[MyGCD alloc] init];
    [myGCD checkBarrier];
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       // callCheck1();//同步异步函数，并行队列
       // callCheck2();//同步串行
       // callCheck3();//同步主队列死锁
      //  callCheck4();//嵌套同步串行死锁
      //  callCheckGroup();//组任务
     //   callCheckApply();//并发循环
    //    callBarrier();//
    }
    
    return 0;
    
}
