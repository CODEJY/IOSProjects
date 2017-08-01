//
//  AppDelegate.h
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/7/31.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "RegisterViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;

@property (weak, nonatomic) IBOutlet UINavigationItem *item;
@property (strong, nonatomic) IBOutlet UINavigationController *controller;
@property (strong, nonatomic) UIWindow *window;


@end

