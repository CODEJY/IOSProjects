//
//  Student.m
//  KVOTest
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 18/7/2017.
//  Copyright © 2017 GARY WU (MBC-ISD-OOCLL/ZHA). All rights reserved.
//

#import "Student.h"

@implementation Student
//@synthesize name,university;
-(void) changeName:(NSString *)name_ andUniversity:(NSString *)university_
{
    self.name = name_;
    self.university = university_;
}
@end
