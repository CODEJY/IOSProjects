//
//  MyGCD.h
//  GCDTest
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/7/24.
//  Copyright © 2017年 GARY WU (MBC-ISD-OOCLL/ZHA). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyGCD : NSObject
@property (atomic,strong)dispatch_queue_t globalQueue,mainQueue,manualSerial,manualConcurrent;
@property (atomic,strong)dispatch_group_t group;
@property (nonatomic,copy)NSMutableString* str;
-(void) check1;//同步或异步函数在并行队列
-(void) check2;//同步异步函数在串行队列
-(void) check3;//同步函数用于主队列会死锁
-(void) check4;//同步串行会死锁
-(void) checkGroup;//组任务
-(void) checkApply;
-(void) accessNet;
+(id) getInstance;
-(void) checkBarrier;
-(NSString*) readFile;
@end
