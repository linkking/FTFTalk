//
//  FTFHomeViewController.m
//  FTFTalk
//
//  Created by zhulei on 16/5/18.
//  Copyright © 2016年 oradt. All rights reserved.
//

#import "FTFHomeViewController.h"
#import "UtilsMacro.h"
#import "FTFTagListView.h"

@interface FTFHomeViewController()

@property (nonatomic,strong) FTFTagListView *tagListView;

@end

@implementation FTFHomeViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    __weak typeof(self) _self = self;
    self.title = tr(@"common_prompt");
    self.tagListView = [[FTFTagListView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 200)];
    self.tagListView.canSelectTags = YES;
    self.tagListView.tagCornerRadius = 5.0f;
    self.tagListView.tagFont = 10.0f;
    [self.tagListView.tags addObjectsFromArray: @[@"有英语教学经验",@"生活",@"旅行",@"骑行",@"会中文"]];
    [self.view addSubview:self.tagListView];
    [self.tagListView setCompletionBlockWithSelected:^(NSInteger index) {
        NSLog(@"____%ld____",index);
        NSLog(@"%@",_self.tagListView.selectedTags);
    }];
    
    
}


@end
