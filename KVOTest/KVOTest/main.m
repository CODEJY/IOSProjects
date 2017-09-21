//
//  main.m
//  KVOTest
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 18/7/2017.
//  Copyright © 2017 GARY WU (MBC-ISD-OOCLL/ZHA). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "StudentViewController.h"
#import "Companny.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        StudentViewController* stuControl = [[StudentViewController alloc] init];
     /*   student.name = @"gary";
        student.university = @"sysu";
        StudentViewController* view = [[StudentViewController alloc] init: student];
        student.name = @"gary3";
        student.university = @"sysu3";*/
      //  [student setValue:@"gary22" forKey:@"name"];
        NSDictionary* person = @{@"id":@"123",@"examNumber":@"456"};
        [stuControl checkup:person];
   //optional
        Companny *companny = [stuControl findStockCode:@"Apple"]; // nil is returned
        if (companny != NULL) {
            if (companny.code != NULL)
                NSLog(@"%@",companny.code);
        }
    }
    return 0;
}
