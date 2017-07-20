//
//  A.m
//  DelegateTest
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 20/7/2017.
//  Copyright © 2017 GARY WU (MBC-ISD-OOCLL/ZHA). All rights reserved.
//

#import "A.h"

@implementation A
@synthesize delegate;
-(void) callFunc
{
    [delegate func1];
}
@end
