//
//  FTFTagListView.h
//  FTFTalk
//
//  Created by zhulei on 16/6/7.
//  Copyright © 2016年 oradt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^FTFTagListViewBlock)(NSInteger index);

@interface FTFTagListView : UIView

@property(nonatomic, strong) UIColor *tagStrokeColor; // default: lightGrayColor
@property(nonatomic, strong) UIColor *tagTextColor;   // default: darkGrayColor
@property(nonatomic, strong) UIColor *tagBackgroundColor; // default: clearColor
@property(nonatomic, strong) UIColor *tagSelectedBackgroundColor; // default: rgb(217,217,217)
@property (nonatomic,assign) CGFloat tagFont;  //default:14
@property(nonatomic, assign) CGFloat tagCornerRadius; // default: 10
@property(nonatomic, assign) BOOL canSelectTags;      // default: NO

@property(nonatomic, strong) NSMutableArray *tags;
@property(nonatomic, strong) NSMutableArray *selectedTags;

@property(nonatomic, strong) UICollectionView *collectionView;

- (void)setCompletionBlockWithSelected:(FTFTagListViewBlock)completionBlock;

@end
