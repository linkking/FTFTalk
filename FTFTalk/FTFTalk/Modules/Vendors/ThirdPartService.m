//
//  ThirdPartService.m
//  FTFTalk
//
//  Created by zhulei on 16/6/7.
//  Copyright © 2016年 oradt. All rights reserved.
//

#import "FTFLogFormatter.h"
#import "SDWebImageManager.h"
#import "ThirdPartService.h"

@implementation ThirdPartService

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        NSLog(@"===============初始化第三方框架!===============");
        //网络
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];

        // SDWebImage加载的数据类型
        [[[SDWebImageManager sharedManager] imageDownloader]
                      setValue:@"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
            forHTTPHeaderField:@"Accept"];

        setenv("XcodeColors", "YES", 1);

        FTFLogFormatter *logFormatter = [[FTFLogFormatter alloc] init];

        [[DDTTYLogger sharedInstance] setLogFormatter:logFormatter];
        [[DDTTYLogger sharedInstance] setColorsEnabled:YES]; // 启用颜色区分
        [[DDTTYLogger sharedInstance] setForegroundColor:DDMakeColor(255, 0, 0)
                                         backgroundColor:nil
                                                 forFlag:DDLogFlagError];
        [[DDTTYLogger sharedInstance] setForegroundColor:DDMakeColor(125, 200, 80)
                                         backgroundColor:nil
                                                 forFlag:DDLogFlagInfo];
        [[DDTTYLogger sharedInstance] setForegroundColor:DDMakeColor(200, 100, 200)
                                         backgroundColor:nil
                                                 forFlag:DDLogFlagDebug];
        [DDLog addLogger:[DDTTYLogger sharedInstance]];

    });
}

@end
