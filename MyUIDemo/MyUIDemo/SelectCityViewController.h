//
//  SelectCityViewController.h
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/8/2.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SelectCityViewControllerDelegate <NSObject>
-(void) setCity:(NSString*) cityName;
@end
@interface SelectCityViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchControllerDelegate,UISearchResultsUpdating>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong,nonatomic) NSArray* data;
@property (strong,nonatomic) NSMutableArray* results;
@property (strong,nonatomic) UISearchController* searchController;
@property (weak,nonatomic) id<SelectCityViewControllerDelegate> delegate;
@end
