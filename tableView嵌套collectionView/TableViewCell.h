//
//  TableViewCell.h
//  tableView嵌套collectionView
//
//  Created by wenhua on 2018/3/1.
//  Copyright © 2018年 wenhua. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TableViewCell;
@protocol testTableViewCellDelegate <NSObject>

-(void)uodataTableViewCellHight:(TableViewCell*)cell andHight:(CGFloat)hight andIndexPath:(NSIndexPath *)indexPath;
@end

@interface TableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *lable;
@property(nonatomic,strong)NSArray *dataArr;

@property(nonatomic,strong)NSIndexPath *indexPath;

@property(nonatomic,weak) id<testTableViewCellDelegate>deleget;

@end
