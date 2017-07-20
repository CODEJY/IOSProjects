//
//  main.m
//  DelegateTest
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 20/7/2017.
//  Copyright © 2017 GARY WU (MBC-ISD-OOCLL/ZHA). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        B* b = [[B alloc] init];
        [b._A callFunc];
    }
    return 0;
}
