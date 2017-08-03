//
//  MainViewController.m
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/7/31.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import "MainViewController.h"
static NSString * identifier = @"MyCell";
@interface MainViewController ()

@end

@implementation MainViewController

-(NSMutableArray*) date_
{
    if (!_date_)
    {
        _date_ = [[NSMutableArray alloc] initWithCapacity:10];
        [_date_ addObject:@"2017-07-31"];
        [_date_ addObject:@"2017-08-01"];
        [_date_ addObject:@"2017-08-02"];
        [_date_ addObject:@"2017-08-03"];
        [_date_ addObject:@"2017-08-04"];
        [_date_ addObject:@"2017-08-05"];
        [_date_ addObject:@"2017-08-06"];
        [_date_ addObject:@"2017-08-07"];
        [_date_ addObject:@"2017-08-08"];
        [_date_ addObject:@"2017-08-09"];
    }
    return _date_;
}

-(NSMutableArray*) title_
{
    if (!_title_)
    {
        _title_ = [[NSMutableArray alloc] initWithCapacity:10];
        [_title_ addObject:@"title1"];
        [_title_ addObject:@"title2"];
        [_title_ addObject:@"title3"];
        [_title_ addObject:@"title4"];
        [_title_ addObject:@"title5"];
        [_title_ addObject:@"title6"];
        [_title_ addObject:@"title7"];
        [_title_ addObject:@"title8"];
        [_title_ addObject:@"title9"];
        [_title_ addObject:@"title10"];
    }
    return _title_;
}

-(NSMutableArray*) content_
{
    if (!_content_)
    {
        _content_ = [[NSMutableArray alloc] initWithCapacity:10];
        [_content_ addObject:@"content1"];
        [_content_ addObject:@"content2"];
        [_content_ addObject:@"content3"];
        [_content_ addObject:@"content4"];
        [_content_ addObject:@"content5"];
        [_content_ addObject:@"content6"];
        [_content_ addObject:@"content7"];
        [_content_ addObject:@"content8"];
        [_content_ addObject:@"content9"];
        [_content_ addObject:@"content10"];
    }
    return _content_;
}
-(NSMutableArray*)state
{
    if (!_state)
    {
        _state = [[NSMutableArray alloc] initWithCapacity:10];
        for (int i = 0; i < 10; i++)
            [_state addObject:@"nonstar"];
    }
    return _state;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
   
  //  self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:16/255.0 green:78/255.0 blue:139/255.0 alpha:1.0];
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];//字体颜色
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    self.username = [userDefaults objectForKey:@"username"];
    self.navigationItem.hidesBackButton = YES;
    [self.tableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];//将自定义的UITableViewCell从xib加载进内存，利用缓存机制
    self.navigationItem.title = self.username;
    //取消由于在scrollview上点击按钮有延迟，长按才可以，在tableView中取消就可以
    for (UIView *subView in self.tableView.subviews) {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView *)subView).delaysContentTouches = false;
            break;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.selectionStyle =UITableViewCellStyleDefault;
    cell.delegate = self;
    cell.date.text = [self.date_ objectAtIndex:indexPath.row];
    cell.title.text = [self.title_ objectAtIndex:indexPath.row];
    cell.content.text = [self.content_ objectAtIndex:indexPath.row];
    cell.favorate.image = [UIImage imageNamed:self.state[indexPath.row]];
 //   [cell.starBtn setImage:[UIImage imageNamed:self.state[indexPath.row]] forState:UIControlStateNormal]; //button换图片
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
/*
//可选，添加头部条
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Header";
}

//可选，尾部
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"Footer";
}
*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)alertDialog:(MyTableViewCell*)cell
{

    NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];
    NSString* message_;
    if ([self.state[indexPath.row] isEqualToString:@"nonstar"])
        message_ = @"Are you sure to mark as favorite?";
    else
        message_ = @"Are you sure to cancel the mark?";
    //初始化提示框；
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:message_ preferredStyle: UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
        cell.state = self.state;
        [cell changeImg:indexPath.row];
     
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
    }]];
    //弹出提示框；
    [self presentViewController:alert animated:true completion:nil];
    
}

-(void) dealloc
{
    NSLog(@"view dealloc");
}
@end
