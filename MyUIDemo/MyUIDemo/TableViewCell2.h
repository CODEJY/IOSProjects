//
//  TableViewCell2.h
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/8/1.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell2 : UITableViewCell
@property (atomic,weak) IBOutlet UIPickerView* selectedView;
@property (strong,nonatomic)NSArray* data;
@property (atomic,weak) IBOutlet UILabel* label;
@end
