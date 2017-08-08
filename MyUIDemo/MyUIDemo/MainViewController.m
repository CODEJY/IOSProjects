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
        _date_ = [[NSMutableArray alloc] initWithCapacity:15];
        for (int i = 0; i < 10; i++)
            [_date_ addObject:[NSString stringWithFormat:@"%@%d",@"2017-08-",i+1]];
    }
    return _date_;
}

-(NSMutableArray*) title_
{
    if (!_title_)
    {
        _title_ = [[NSMutableArray alloc] initWithCapacity:15];
        for (int i = 0; i < 10; i++)
            [_title_ addObject:[NSString stringWithFormat:@"%@%d",@"title",i]];
    }
    return _title_;
}

-(NSMutableArray*) content_
{
    if (!_content_)
    {
        _content_ = [[NSMutableArray alloc] initWithCapacity:15];
        for (int i = 0; i < 10; i++) {
            if (i == 0)
                [_content_ addObject:[NSString stringWithFormat:@"%@%d",@"contentcontentcontentcontentcontentcontentcontent",i]];
            else if (i == 1)
                [_content_ addObject:[NSString stringWithFormat:@"%@%d",@"contentcontentcontentcontentcontentcontentcontent\ncontent",i]];
            else if (i == 2)
                [_content_ addObject:[NSString stringWithFormat:@"%@%d",@"contentcontentcontentcontentcontentcontentcontent\ncontent\ncontent",i]];
            else if (i == 3)
                [_content_ addObject:[NSString stringWithFormat:@"%@%d",@"contentcontentcontentcontentcontentcontentcontent\ncontent\ncontent\ncontent",i]];
            else
            [_content_ addObject:[NSString stringWithFormat:@"%@%d",@"contentcontentcontentcontentcontentcontentcontent\ncontent\ncontent\ncontent\ncontent\ncontent",i]];
        }
    }
    return _content_;
}
-(NSMutableArray*)state
{
    if (!_state)
    {
        _state = [[NSMutableArray alloc] initWithCapacity:15];
        for (int i = 0; i < 10; i++)
            [_state addObject:@"nonstar"];
    }
    return _state;
}

//下拉刷新数据
-(void) pullDownRefreshData
{
    if ([self.date_ count] >= 15) {
        [self.date_ removeObjectsInRange:NSMakeRange(10, 5)];
        [self.title_ removeObjectsInRange:NSMakeRange(10, 5)];
        [self.content_ removeObjectsInRange:NSMakeRange(10, 5)];
        [self.state removeObjectsInRange:NSMakeRange(10, 5)];
    }
    for (int i = 0; i < 10; i++)
        [self.date_ replaceObjectAtIndex:i withObject: [NSString stringWithFormat:@"%@%d",@"2017-09-",i+1]];
    for (int i = 0; i < 10; i++)
        [self.title_ replaceObjectAtIndex:i withObject: [NSString stringWithFormat:@"%@%@%d",@"pullDown ",@"title",i]];
    for (int i = 0; i < 10; i++)
        [self.content_ replaceObjectAtIndex:i withObject: [NSString stringWithFormat:@"%@%@%d",@"pullDown ",@"content",i]];
    for (int i = 0; i < 10; i++)
        [self.state replaceObjectAtIndex:i withObject:@"nonstar"];
    
     __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0f repeats:NO block:^(NSTimer* timer){
   
        [weakSelf.tableView.mj_header endRefreshing];
        [weakSelf.tableView reloadData];
    }];


}
//上拉加载数据
-(void) pullUpRefreshData
{
   
    for (int i = 0; i < 5; i++)
        [self.date_ addObject:[NSString stringWithFormat:@"%@%d",@"2017-06-",i+1]];
    for (int i = 0; i < 5; i++)
        [self.title_ addObject:[NSString stringWithFormat:@"%@%@%d",@"pullUP ",@"title",i]];
    for (int i = 0; i < 5; i++)
        [self.content_ addObject:[NSString stringWithFormat:@"%@%@%d",@"pullUP ",@"content",i]];
    for (int i = 0; i < 5; i++)
        [self.state replaceObjectAtIndex:i withObject:@"nonstar"];
    for (int i = 0; i < 5; i++)
        [_state addObject:@"nonstar"];
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0f repeats:NO block:^(NSTimer* timer){
        //  [weakSelf.indicator stopAnimating];
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.mj_footer endRefreshing];
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:16/255.0 green:78/255.0 blue:139/255.0 alpha:1.0];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];//字体颜色
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    self.username = [userDefaults objectForKey:@"username"];
    self.navigationItem.title = self.username;
    self.navigationItem.hidesBackButton = YES;
    //cell高度自适应，ios8.0以后可以用这个方法，label必须添加约束，不能重写-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath这个方法
    self.tableView.estimatedRowHeight = 120;//估算高度
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];//将自定义的UITableViewCell从xib加载进内存，利用缓存机制
 /*   //取消由于在scrollview上点击按钮有延迟，长按才可以，在tableView中取消就可以
    for (UIView *subView in self.tableView.subviews) {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView *)subView).delaysContentTouches = false;
            break;
        }
    }*/
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownRefreshData)];
    
    //自动更改透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    //立即进入刷新状态
    //[self.tableView.mj_header beginRefreshing];
 
  //  self.automaticallyAdjustsScrollViewInsets = false;//如果顶部有空白，可以设置这个
     self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(pullUpRefreshData)];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    if ([self.view window] == nil && [self isViewLoaded])
        self.view = nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.date_ count];
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
/*- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return 120;
    UITableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120.f;
}*/
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

@end
