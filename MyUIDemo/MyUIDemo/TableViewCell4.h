//
//  TableViewCell4.h
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/8/1.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell4 : UITableViewCell
- (IBAction)goSelectCity:(id)sender;
@property (atomic,weak) IBOutlet UIButton* selectCity;
@property (atomic,weak) IBOutlet UILabel* city;
@end
