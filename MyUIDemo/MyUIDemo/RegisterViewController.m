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
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
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
    TableViewCell1 * cell1;
    TableViewCell2 * cell2;
    TableViewCell3 * cell3;
    TableViewCell4 * cell4;
    if (indexPath.row == 0) {
        cell1 = [tableView dequeueReusableCellWithIdentifier:identifier1];
        return cell1;
    } else if (indexPath.row == 1) {
        cell2 = [tableView dequeueReusableCellWithIdentifier:identifier2];
        return cell2;
        
    } else if (indexPath.row == 2) {
        cell3 = [tableView dequeueReusableCellWithIdentifier:identifier3];
        return cell3;
        
    } else
    {
        cell4 = [tableView dequeueReusableCellWithIdentifier:identifier4];
        cell4.delegate = self;
        return cell4;
        
    }
    /* if (!cell)
     cell = [[[UINib nibWithNibName:@"MyTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]lastObject];*///不会运行到这里,因为UINib将cell缓存到内存了
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (IBAction)register:(id)sender {
    NSString* username;
    NSString* sex;
    NSDate* date;
    NSString* city;
    NSIndexPath *indexPath;
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    TableViewCell1* cell = [self.tableView cellForRowAtIndexPath:indexPath];
    username = cell.textField.text;
    [userDefaults setObject:username forKey:@"username"];
    
    indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    TableViewCell2* cell2 = [self.tableView cellForRowAtIndexPath:indexPath];
    NSInteger row = [cell2.selectedView selectedRowInComponent:0];
    sex = [cell2.data objectAtIndex:row];
    [userDefaults setObject:sex forKey:@"sex"];
    
    indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
    TableViewCell3* cell3 = [self.tableView cellForRowAtIndexPath:indexPath];
    date = cell3.datePicker.date;
    [userDefaults setObject:date forKey:@"date"];
    
    indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
    TableViewCell4* cell4 = [self.tableView cellForRowAtIndexPath:indexPath];
    city = cell4.cityName.text;
    [userDefaults setObject:city forKey:@"city"];
    //注意将&& ||
    if ([username isEqualToString:@""] || [city isEqualToString:@""])
        NSLog(@"用户名或城市不能为空");
    else
    {
        [self.indicator startAnimating];
        [userDefaults setBool:YES forKey:@"isLogin"];
        __weak typeof (self) weakSelf = self;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0f repeats:NO block:^(NSTimer* timer){
            [weakSelf.indicator stopAnimating];
            //跳转
            MainViewController* main = [[MainViewController alloc] init];
            [weakSelf.navigationController pushViewController:main animated:YES];
        
        }];
    }
}
//cell4的委托
-(void)goSelectCityView
{
    SelectCityViewController* next = [[SelectCityViewController alloc] init];
    next.delegate = self;
    [self.navigationController pushViewController:next animated:YES];
}
//selectcity  search 的委托
-(void)setCity:(NSString *)cityName
{
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
    TableViewCell4* cell4 = [self.tableView cellForRowAtIndexPath:indexPath];
    cell4.cityName.text = cityName;
}
@end