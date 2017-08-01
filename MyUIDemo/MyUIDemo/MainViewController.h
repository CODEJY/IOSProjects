//
//  MainViewController.h
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/7/31.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewCell.h"
@interface MainViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,MyTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic)NSMutableArray* date_,*title_, *content_;
@end
