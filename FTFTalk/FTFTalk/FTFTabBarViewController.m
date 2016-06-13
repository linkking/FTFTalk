//
//  FTFTabBarViewController.m
//  FTFTalk
//
//  Created by zhulei on 16/6/8.
//  Copyright © 2016年 oradt. All rights reserved.
//

#import "FTFFindTeachersHomeViewController.h"
#import "FTFMessageHomeViewController.h"
#import "FTFMySelfHomeViewController.h"
#import "FTFTabBarViewController.h"

@interface FTFTabBarViewController ()

@end

@implementation FTFTabBarViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self layoutTabViewControllers];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)layoutTabViewControllers {
    DDLogInfo(@"初始化各个模块Controller");
    FTFFindTeachersHomeViewController *findTeacherVC = [[FTFFindTeachersHomeViewController alloc] init];
    UINavigationController *findNav = [[UINavigationController alloc] initWithRootViewController:findTeacherVC];
    findNav.tabBarItem.title = @"找外教";
    FTFMessageHomeViewController *messageVC = [[FTFMessageHomeViewController alloc] init];
    UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:messageVC];
    messageNav.tabBarItem.title = @"消息";
    FTFMySelfHomeViewController *mySelfVC = [[FTFMySelfHomeViewController alloc] init];
    UINavigationController *mySelfNav = [[UINavigationController alloc] initWithRootViewController:mySelfVC];
    mySelfNav.tabBarItem.title = @"我";
    self.viewControllers = @[ findNav, messageNav, mySelfNav ];
    DDLogInfo(@"info");
}

@end
