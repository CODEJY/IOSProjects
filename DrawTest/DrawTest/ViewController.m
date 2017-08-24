//
//  ViewController.m
//  DrawTest
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/8/14.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)drawrect:(CGRect) rect
{
 /*   CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //2.描述路径
    UIBezierPath * path = [UIBezierPath bezierPath];
    //起点
    [path moveToPoint:CGPointMake(10, 20)];
    //终点
    [path addLineToPoint:CGPointMake(100, 100)];
    //设置颜色
    [[UIColor redColor]setStroke];
    //3.添加路径
    CGContextAddPath(contextRef, path.CGPath);
    //设置线宽
    CGContextSetLineWidth(contextRef, 20);
    //显示路径
    CGContextStrokePath(contextRef);*/
    //1.获取上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //2.描述路径
    UIBezierPath * path = [UIBezierPath bezierPath];
    //起点
    [path moveToPoint:CGPointMake(10, 10)];
    //第二个点
    [path addLineToPoint:CGPointMake(100, 10)];
    //第三个点
    [path addLineToPoint:CGPointMake(100, 100)];
    //第四个点
    [path addLineToPoint:CGPointMake(10, 100)];
    //闭合路径 也等于 [path addLineToPoint:CGPointMake(10, 10)];
    [path closePath];
    //设置颜色
    [[UIColor greenColor]setStroke];
    //3.添加路径
    CGContextAddPath(contextRef, path.CGPath);
    //显示路径
    CGContextStrokePath(contextRef);

}
@end
