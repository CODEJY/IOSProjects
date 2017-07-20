//
//  B.h
//  DelegateTest
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 20/7/2017.
//  Copyright © 2017 GARY WU (MBC-ISD-OOCLL/ZHA). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FuncDelegate.h"
#import "A.h"
@interface B : NSObject<FuncDelegate>
@property (nonatomic,strong) A* _A;
@end
