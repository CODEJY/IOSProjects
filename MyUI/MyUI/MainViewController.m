//
//  MainViewController.m
//  MyUI
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/7/26.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import "MainViewController.h"
#import "tableViewController.h"
@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"viewDidLoad");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated
{
    NSLog(@"ViewDidAppear");
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
