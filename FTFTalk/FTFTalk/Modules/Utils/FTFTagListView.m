//
//  FTFTagListView.m
//  FTFTalk
//
//  Created by zhulei on 16/6/7.
//  Copyright © 2016年 oradt. All rights reserved.
//

#import "FTFTagListView.h"
#import "FTFTagCell.h"
#import "FTFTagCollectionViewFlowLayout.h"

@interface FTFTagListView() <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,copy) FTFTagListViewBlock selectedBlock;

@end

static NSString * const reuseIdentifier = @"FTFTagListViewItemId";

@implementation FTFTagListView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup] ;
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.collectionView.frame = self.bounds;
}

- (void)setup
{
    _selectedTags = [NSMutableArray array];
    _tags = [NSMutableArray array];
    
    _tagStrokeColor = [UIColor lightGrayColor];
    _tagBackgroundColor = [UIColor clearColor];
    _tagTextColor = [UIColor darkGrayColor];
    _tagSelectedBackgroundColor = [UIColor colorWithRed:217/255.0f green:217/255.0f blue:217/255.0f alpha:1];
    
    _tagCornerRadius = 10.0f;
    _tagFont = 14.0f;
    
    FTFTagCollectionViewFlowLayout *layout = [[FTFTagCollectionViewFlowLayout alloc] init];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor clearColor];
    [_collectionView registerClass:[FTFTagCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self addSubview:_collectionView];
}

- (void)setCompletionBlockWithSelected:(FTFTagListViewBlock)completionBlock
{
    self.selectedBlock = completionBlock;
}

#pragma mark - UICollectionViewDelegate | UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.tags.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FTFTagCollectionViewFlowLayout *layout = (FTFTagCollectionViewFlowLayout *)collectionView.collectionViewLayout;
    CGSize maxSize = CGSizeMake(collectionView.frame.size.width - layout.sectionInset.left - layout.sectionInset.right, layout.itemSize.height);
    
    CGRect frame = [self.tags[indexPath.item] boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:self.tagFont]} context:nil];
    
    return CGSizeMake(frame.size.width + 20.0f, layout.itemSize.height);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FTFTagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = self.tagBackgroundColor;
    cell.layer.borderColor = self.tagStrokeColor.CGColor;
    cell.layer.cornerRadius = self.tagCornerRadius;
    cell.titleLabel.text = self.tags[indexPath.item];
    cell.titleLabel.textColor = self.tagTextColor;
    cell.titleLabel.font = [UIFont systemFontOfSize:self.tagFont];
    
    if ([self.selectedTags containsObject:self.tags[indexPath.item]]) {
        cell.backgroundColor = self.tagSelectedBackgroundColor;
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.canSelectTags) {
        FTFTagCell *cell = (FTFTagCell *)[collectionView cellForItemAtIndexPath:indexPath];
        
        if ([self.selectedTags containsObject:self.tags[indexPath.item]]) {
            cell.backgroundColor = self.tagBackgroundColor;
            
            [self.selectedTags removeObject:self.tags[indexPath.item]];
        }
        else {
            cell.backgroundColor = self.tagSelectedBackgroundColor;
            
            [self.selectedTags addObject:self.tags[indexPath.item]];
        }
    }
    
    if (self.selectedBlock) {
        self.selectedBlock(indexPath.item);
    }
}


@end
