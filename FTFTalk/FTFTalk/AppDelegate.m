//
//  AppDelegate.m
//  FTFTalk
//
//  Created by zhulei on 16/4/28.
//  Copyright © 2016年 oradt. All rights reserved.
//

#import "AppDelegate.h"
#import "FTFFindTeachersHomeViewController.h"
#import "FTFHomeViewController.h"
#import "FTFMessageHomeViewController.h"
#import "FTFMySelfHomeViewController.h"
#import "FTFTabBarViewController.h"
#import "ThirdPartService.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self enterHomeVC];
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

#pragma mark -  private method

- (void)enterHomeVC {
    FTFTabBarViewController *tabBarController = [[FTFTabBarViewController alloc] init];
    self.window.rootViewController = tabBarController;
}

@end
