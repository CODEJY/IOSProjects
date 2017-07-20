//
//  A.h
//  DelegateTest
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 20/7/2017.
//  Copyright © 2017 GARY WU (MBC-ISD-OOCLL/ZHA). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FuncDelegate.h"
@interface A : NSObject
@property (nonatomic,weak) id<FuncDelegate> delegate;
-(void) callFunc;
@end
