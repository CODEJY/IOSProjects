//
//  B.m
//  DelegateTest
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 20/7/2017.
//  Copyright © 2017 GARY WU (MBC-ISD-OOCLL/ZHA). All rights reserved.
//

#import "B.h"

@implementation B
@synthesize _A;
-(id)init
{
    if (self = [super init]) {
        _A = [[A alloc] init];
        _A.delegate = self;
    }
    return self;
}
-(void) func1
{
    NSLog(@"代理的方法");
}
@end
