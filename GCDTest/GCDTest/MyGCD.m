//
//  MyGCD.m
//  GCDTest
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/7/24.
//  Copyright © 2017年 GARY WU (MBC-ISD-OOCLL/ZHA). All rights reserved.
//

#import "MyGCD.h"

@implementation MyGCD
@synthesize globalQueue,mainQueue,manualSerial,manualConcurrent,group,str;
-(id) init
{
    if (self = [super init]) {
        globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);//第二个参数flags保留以后使用，一般使用0
        mainQueue = dispatch_get_main_queue();
        manualConcurrent = dispatch_queue_create("gary.manualConcurrent", DISPATCH_QUEUE_CONCURRENT);
        manualSerial = dispatch_queue_create("gary.manualSerial", DISPATCH_QUEUE_SERIAL);
        group = dispatch_group_create();
        str = [NSMutableString stringWithCapacity:8];
    }
    return self;
}
-(void)accessNet
{
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com/"];
    //第二步，通过URL创建网络请求
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //第三步，连接服务器
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *str2 = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str2);
}
-(void) check1
{
    //改成sync测试同步
    dispatch_async(globalQueue, ^{
    [self accessNet];
    });
    dispatch_async(globalQueue, ^{
        NSLog(@"globalQueue");
    });
    NSLog(@"同步异步函数并行队列测试");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), manualSerial, ^{
        NSLog(@"延迟执行");
    });
    while(1);//用于测试异步
}
-(void) check2
{
    dispatch_sync(manualSerial, ^{
        [self accessNet];
    });
    dispatch_sync(manualSerial, ^{
        NSLog(@"manualQueue");
    });
    NSLog(@"同步异步函数串行队列测试");
}
-(void) check3
{
    dispatch_sync(mainQueue, ^{
        [self accessNet];
    });//放在异步队列中就不会
    NSLog(@"同步函数主队列会死锁测试");
}
-(void) check4
{
    //内部改成async可解开死锁,加上while
    dispatch_sync(manualSerial, ^{
        [self accessNet];
        dispatch_async(manualSerial, ^{
            NSLog(@"嵌套同步串行");
        });
       
    });
    //while(1);
}
-(void)checkGroup
{
    dispatch_group_async(group, globalQueue, ^{
        [self accessNet];
    });
    dispatch_group_async(group, globalQueue, ^{
        NSLog(@"Task1");
    });
    dispatch_group_async(group, globalQueue, ^{
        NSLog(@"Task2");
    });
    dispatch_group_notify(group, globalQueue, ^{
        NSLog(@"所有任务执行完毕");
    });
   // dispatch_group_wait(group, dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)));//同步方式
    while(1);
    
}
-(void) checkApply
{
    dispatch_apply(3, globalQueue, ^(size_t i) {
        NSLog(@"%zu",i);
    });
}
+(id) getInstance
{
    static MyGCD* myGCd = nil;
    static dispatch_once_t* onceToken;
    dispatch_once(onceToken, ^{
        myGCd = [[MyGCD alloc] init];
    });
    return myGCd;
}
-(NSString*) readFile
{
    NSString *file1=@"/Users/wuga/music_.txt";
    return [NSString stringWithContentsOfFile:file1 encoding:NSUTF8StringEncoding error:nil];
}
-(void) checkBarrier
{
    dispatch_barrier_async(manualConcurrent, ^{
        NSString* str1 = [self readFile];
        [str appendString:str1];
        NSLog(@"%@",str);
    });//只能对手动创建的并行队列使用
    
    while(1);
}
@end
