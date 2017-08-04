//
//  main.m
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/7/31.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        //第三个参数：该参数标识了应用程序的类的名称（该类必须继承自UIApplication类）。是负责运行应用程序的类，它代表着当前iPhone程序本身，这个程序会去读info.plist文件获取配置信息，一般建议为这个参数传nil
        //第四个参数：UIApplication定义了一个delegte变量，这个变量应该遵循UIApplicationDelegate，负责控制程序的运行，
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
