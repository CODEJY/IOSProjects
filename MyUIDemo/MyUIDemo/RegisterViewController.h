//
//  RegisterViewController.h
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/8/1.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell1.h"
@interface RegisterViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
