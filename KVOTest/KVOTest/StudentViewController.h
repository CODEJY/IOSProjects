//
//  StudentViewController.h
//  KVOTest
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 18/7/2017.
//  Copyright © 2017 GARY WU (MBC-ISD-OOCLL/ZHA). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Companny.h"
@interface StudentViewController : NSObject
{
    Student* student;
}
-(id) init: (Student*) initStudent;
-(void) checkup:(NSDictionary*) person;
-(Companny*)findStockCode:(NSString*)company;
@end
