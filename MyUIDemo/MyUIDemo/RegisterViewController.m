//
//  RegisterViewController.m
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/8/1.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import "RegisterViewController.h"
static NSString* identifier1 = @"name";
static NSString* identifier2 = @"sex";
static NSString* identifier3 = @"birthday";
static NSString* identifier4 = @"city";
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //取消由于在scrollview上点击按钮有延迟，长按才可以，在tableView中取消就可以
    for (UIView *subView in self.tableView.subviews) {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView *)subView).delaysContentTouches = false;
            break;
        }
    }
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:1];
    self.navigationItem.title = @"Register";
    self.tableView.tableFooterView = [[UIView alloc] init];

    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell1" bundle:nil] forCellReuseIdentifier:identifier1];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell2" bundle:nil] forCellReuseIdentifier:identifier2];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell3" bundle:nil] forCellReuseIdentifier:identifier3];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell4" bundle:nil] forCellReuseIdentifier:identifier4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell for row");
    TableViewCell1 * cell;
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:identifier1];
    }
    if (indexPath.row == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:identifier2];
    }
    if (indexPath.row == 2) {
        cell = [tableView dequeueReusableCellWithIdentifier:identifier3];
    }
    if (indexPath.row == 3) {
        cell = [tableView dequeueReusableCellWithIdentifier:identifier4];
    }
    /* if (!cell)
     cell = [[[UINib nibWithNibName:@"MyTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]lastObject];*///不会运行到这里,因为UINib将cell缓存到内存了
   
  //  cell.selectionStyle = UITableViewCellSeparatorStyleNone;
  //  cell.selectedBackgroundView = nil;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
