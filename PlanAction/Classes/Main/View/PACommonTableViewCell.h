//
//  PACommonTableViewCell.h
//  PlanAction
//
//  Created by 鄂鸿桢 on 16/3/30.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PACommonItem;

@interface PACommonTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

- (void)setIndexPath:(NSIndexPath *)indexPath rowsInSection:(NSUInteger)rows;

/**
 *  cell对应的item数据
 */
@property (nonatomic, strong) PACommonItem *item;

/**
 *  是否完成
 */
@property (nonatomic, assign) BOOL isDone;
@end
