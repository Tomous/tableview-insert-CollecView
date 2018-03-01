//
//  CollectionViewCell.m
//  tableView嵌套collectionView
//
//  Created by wenhua on 2018/3/1.
//  Copyright © 2018年 wenhua. All rights reserved.
//

#import "CollectionViewCell.h"
@interface CollectionViewCell ()


@end

@implementation CollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.detailLabel = [[UILabel alloc]init];
        self.detailLabel.textColor = [UIColor whiteColor];
        self.detailLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.detailLabel];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.detailLabel.frame = CGRectMake(10, 10, self.frame.size.width- 20, self.frame.size.height - 20);
}

@end
