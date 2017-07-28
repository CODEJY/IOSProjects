//
//  MyBlock.h
//  BlockTest
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/7/21.
//  Copyright © 2017年 GARY WU (MBC-ISD-OOCLL/ZHA). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B.h"
typedef void (^block)();
@interface MyBlock : NSObject
@property (nonatomic,copy)NSString* string;
@property (nonatomic,copy)block theBlock;//当block不是属性时不会造成循环引用
@property (nonatomic,strong) B* B_;
-(void) stackBlock;
-(void) globalBlock;//NSGlobalBlock
-(block) blockReturn;//block作为返回值,NSMallocBlock
-(void) testBlock;//两个类之间循环引用
-(void) testBlock2;//调用self就会循环引用
@end
