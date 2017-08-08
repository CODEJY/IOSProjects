//
//  AppDelegate.m
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/7/31.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"启动结束");
    MainViewController* mainView;
    RegisterViewController* registerView;
    UINavigationController* nav;
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL isLogin = [userDefaults objectForKey:@"isLogin"];
    if (isLogin) {
         mainView = [[MainViewController alloc] init];
         nav = [[UINavigationController alloc] initWithRootViewController:mainView];
    }
    else
    {
        
        registerView = [[RegisterViewController alloc] init];
        nav = [[UINavigationController alloc] initWithRootViewController:registerView];
    }
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}

//失活，挂起，接电话锁屏,进入后台等
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    NSLog(@"挂起");//写一些中断任务或计时器的代码
   
}

//进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"进入后台");//如果程序支持后台运行，当退出时，那么这个过程将代替applicationWillTerminate
    
}

//即将进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    NSLog(@"即将进入前台");
}

//从挂起到复原
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"即将复原");
}

//即将关闭
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"即将关闭");
    NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
    if ([userdefaults objectForKey:@"isLogin"]) {
        [userdefaults removeObjectForKey:@"isLogin"];
        [userdefaults synchronize];//立即执行
    }
}


@end
