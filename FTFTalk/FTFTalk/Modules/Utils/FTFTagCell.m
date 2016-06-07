//
//  FTFTagCell.m
//  FTFTalk
//
//  Created by zhulei on 16/6/7.
//  Copyright © 2016年 oradt. All rights reserved.
//

#import "FTFTagCell.h"

@implementation FTFTagCell
- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1.0f;
    _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_titleLabel];
  }

  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];

  self.titleLabel.frame = self.bounds;
}

- (void)prepareForReuse {
  [super prepareForReuse];

  self.titleLabel.text = @"";
}

@end
