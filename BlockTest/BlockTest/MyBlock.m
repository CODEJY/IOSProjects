//
//  MyBlock.m
//  BlockTest
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/7/21.
//  Copyright © 2017年 GARY WU (MBC-ISD-OOCLL/ZHA). All rights reserved.
//

#import "MyBlock.h"
NSString* str = @"global";
@implementation MyBlock
@synthesize string,theBlock,B_;
-(void) stackBlock
{
    NSString* str_ = @"stack";
    NSLog(@"%@",^() {
        NSLog(@"%@",str_);
    });
}
-(void) globalBlock
{

    void (^theblock)() = ^() {
        //string = @"global";
        NSLog(@"%@",str);
    };
    NSLog(@"%@",theblock);
  //  theblock();
}
-(block) blockReturn
{
    NSString *strBlock = @"NSMallocBlock";
    return ^(){
        NSLog(@"返回的block%@",strBlock);
        };
}
-(void) testBlock
{
    B* b = [[B alloc] init];
   // __weak typeof(b) bWeak = b;
    self.theBlock = ^(){
        //[bWeak doSomething];
        [b doSomething];
        
    };
    b.myBlock = self;
}
//在block中调用自身属性或方法造成循环引用
-(void) testBlock2
{
    self.theBlock = ^(){
        NSString* s = string;
       // [self stackBlock];
    };
}


-(void) dealloc
{
    NSLog(@"调用了dealloc");
}
@end
