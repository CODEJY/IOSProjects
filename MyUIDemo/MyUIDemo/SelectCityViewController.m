//
//  SelectCityViewController.m
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/8/2.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import "SelectCityViewController.h"
 static NSString *cellId = @"mycell";
@interface SelectCityViewController ()

@end

@implementation SelectCityViewController

-(NSArray*)data
{
    if (!_data)
    {
        _data = [[NSArray alloc] initWithObjects:@"上海",@"广州",@"北京",@"深圳",@"珠海",@"香港", nil];
    }
    return _data;
}
-(NSMutableArray*) result
{
    if (!_results) {
        _results = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return _results;
}
- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"City";
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.hidesNavigationBarDuringPresentation = NO;//搜索时不隐藏导航栏
    self.definesPresentationContext = YES;//设置搜索框在当前控制器显示；用于解决跳转回注册界面searchbar不消失的问题，以及第二次进入searchbar必须手动点击cancel才能正常运行searchbar的问题
    //搜索结果是否显示背景，设置为NO会被tableview监听到点击事件，YES不会被监听到
  //  self.searchController.obscuresBackgroundDuringPresentation = YES;//背景模糊
    self.searchController.dimsBackgroundDuringPresentation = NO;//背景颜色
    self.searchController.delegate = self;
    self.searchController.searchResultsUpdater = self;
    //将searchbar设置为tableview的header，避免点击searchbar后tableview 视图显示不正确，导航栏会覆盖tableView
    self.tableView.tableHeaderView = self.searchController.searchBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    if ([self.view window] == nil && [self isViewLoaded])
        self.view = nil;
}
//判断是viewcontroller本身的tableview还是searchDisplayController返回的tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.searchController.active)
        return [self.results count];
    else
        return [self.data count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    if (self.searchController.active) {
        cell.textLabel.text = self.results[indexPath.row];
    }else{
        cell.textLabel.text = self.data[indexPath.row];
    }
    
    return cell;
}
//searchbar内容变化
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchString = [self.searchController.searchBar text];
    NSLog(@"%@",searchString);
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
    if (self.results!= nil) {
        [self.results removeAllObjects];
    }
    //过滤数据
    self.results= [NSMutableArray arrayWithArray:[_data filteredArrayUsingPredicate:preicate]];
    //刷新表格
    [self.tableView reloadData];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString* cityName = cell.textLabel.text;
   // [self.delegate setCity:cityName];
    if (self.myBlock)
        self.myBlock(cityName);
    [self.navigationController popViewControllerAnimated:YES];
}




@end
