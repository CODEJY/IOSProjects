//
//  RegisterViewController.h
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/8/1.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell1.h"
#import "TableViewCell2.h"
#import "TableViewCell3.h"
#import "TableViewCell4.h"
#import "SelectCityViewController.h"
#import "MainViewController.h"
@interface RegisterViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,TableViewCell4Delegate,SelectCityViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)register:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (strong,nonatomic) IBOutlet NSTimer* timer;
@end
