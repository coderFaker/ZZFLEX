//
//  ZZFDMainMenuCell.m
//  ZZFLEXDemo
//
//  Created by 李伯坤 on 2017/11/28.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "ZZFDMainMenuCell.h"
#import "UIView+ZZFLEX.h"

@interface ZZFDMainMenuCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ZZFDMainMenuCell

#pragma mark - # ZZFlexibleLayoutViewProtocol
+ (CGSize)viewSizeByDataModel:(id)dataModel
{
    return CGSizeMake(SCREEN_WIDTH, 46);
}

- (void)setViewDataModel:(id)dataModel
{
    [self.titleLabel setText:dataModel];
}

- (void)viewIndexPath:(NSIndexPath *)indexPath sectionItemCount:(NSInteger)count
{
    if (indexPath.row == 0) {       // 顶部分割线
        self.contentView.addSeparator(TLSeparatorPositionTop);
    }
    else {
        self.contentView.removeSeparator(TLSeparatorPositionTop);
    }
    
    if (indexPath.row == count - 1) {       // 底部分割线
        self.contentView.addSeparator(TLSeparatorPositionBottom);
    }
    else {
        self.contentView.addSeparator(TLSeparatorPositionBottom).beginAt(15);
    }
}

#pragma mark - # Cell Init
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setSelectedBackgrounColor:[UIColor colorGrayLine]];
        
        self.titleLabel = self.contentView.addLabel(1)
        .font([UIFont systemFontOfSize:15])
        .textColor([UIColor blackColor])
        .masonry(^ (MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.centerY.mas_equalTo(0);
            make.right.mas_lessThanOrEqualTo(-35);
        })
        .view;
        
        self.contentView.addImageView(2)
        .image([UIImage imageNamed:@"arrow"])
        .masonry(^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-15);
            make.centerY.mas_equalTo(0);
        });
    }
    return self;
}

@end