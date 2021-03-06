//
//  StudentViewController.m
//  KVOTest
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 18/7/2017.
//  Copyright © 2017 GARY WU (MBC-ISD-OOCLL/ZHA). All rights reserved.
//

#import "StudentViewController.h"

@implementation StudentViewController

-(id) init:(Student *)initStudent
{
    if (self = [super init]) {
        self->student = initStudent;
        [student addObserver: self forKeyPath:@"name" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context: nil];
        [student addObserver: self forKeyPath:@"university" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context: nil];
    }
    return self;
}
-(void) dealloc
{
    [self->student removeObserver:self forKeyPath:@"name"];
    [self->student removeObserver:self forKeyPath:@"university"];
}
-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"name"] && object == self->student) {
    //    NSLog(@"object是Student类型吗？ %@",[object isKindOfClass: [Student class]]? @"YES":@"NO");
        NSLog(@"name旧值:%@",[change valueForKey:@"old"]);
        NSLog(@"name新值:%@",[change valueForKey:@"new"]);
    }
    
    if ([keyPath isEqualToString:@"university"] && object == self->student) {
      //  NSLog(@"object是Student类型吗？ %@",[object isKindOfClass: [Student class]]? @"YES":@"NO");
        NSLog(@"university旧值:%@",[change valueForKey:@"old"]);
        NSLog(@"university新值:%@",[change valueForKey:@"new"]);
    }
    
}
-(void) checkup:(NSDictionary *)person
{
    NSString* idCard = person[@"id"];
    if (idCard != NULL) {
        NSString* examNumber = person[@"examNumber"];
        if (examNumber != NULL) {
            NSLog(@"您的身份证号为:%@，准考证号为:%@。请进入考场!",idCard,examNumber);
        } else {
            NSLog(@"没有准考证，不能进入考场!");
        }
    }else {
        NSLog(@"没有身份证，不能进入考场!");
    }
}
-(Companny*)findStockCode:(NSString *)company {
    if ([company isEqualToString:@"Apple"]) {
        Companny* apple = [[Companny alloc] init];
        apple.code = @"AAPL";
        apple.price = 90.32;
        return apple;
    } else if ([company isEqualToString:@"Google"]) {
         Companny* goog = [[Companny alloc] init];
        goog.code = @"GOOG";
        goog.price = 556.36;
        return goog;
    }
    return nil;
}
@end
