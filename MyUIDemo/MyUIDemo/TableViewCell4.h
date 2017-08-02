//
//  TableViewCell4.h
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/8/1.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TableViewCell4Delegate <NSObject>
-(void)goSelectCityView;
@end
@interface TableViewCell4 : UITableViewCell
@property (atomic,weak) IBOutlet UIButton* selectedCity_btn;
@property (atomic,weak) IBOutlet UILabel* city;
- (IBAction)selectCity:(id)sender;
@property (atomic,weak) IBOutlet UILabel* cityName;
@property (nonatomic,weak) id<TableViewCell4Delegate> delegate;
@end
