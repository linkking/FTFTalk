//
//  ThirdPartService.m
//  FTFTalk
//
//  Created by zhulei on 16/6/7.
//  Copyright © 2016年 oradt. All rights reserved.
//

#import "ThirdPartService.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "AFNetworkReachabilityManager.h"
#import "SDWebImageManager.h"

@implementation ThirdPartService

+(void)load
{
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
    });
}

@end
