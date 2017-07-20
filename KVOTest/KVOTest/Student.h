//
//  Student.h
//  KVOTest
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 18/7/2017.
//  Copyright © 2017 GARY WU (MBC-ISD-OOCLL/ZHA). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (nonatomic,copy) NSString *name, *university;
-(void) changeName: (NSString*) name_ andUniversity: (NSString*) university_;
@end
