//
//  PACommonTableViewCell.m
//  PlanAction
//
//  Created by 鄂鸿桢 on 16/3/30.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import "PACommonTableViewCell.h"
#import "PACommonItem.h"
#import "PACommonLabelItem.h"

@interface PACommonTableViewCell ()
/**
 *  标签
 */
@property (nonatomic, strong) UILabel *rightLabel;

@property (nonatomic, strong) UIView *coverView;


@end

@implementation PACommonTableViewCell

#pragma mark - 懒加载
- (UILabel *)rightLabel
{
    if (_rightLabel == nil) {
        self.rightLabel = [[UILabel alloc] init];
        self.rightLabel.textColor = [UIColor lightGrayColor];
        self.rightLabel.font = [UIFont systemFontOfSize:13];
    }
    return _rightLabel;
}

- (UIView *)coverView
{
    if (_coverView == nil) {
        self.coverView = [[UIView alloc] init];
        self.coverView.frame = CGRectMake(0, 0, self.width, self.height);
        self.coverView.backgroundColor = PARandomColor;
    }
    return _coverView;
}

#pragma mark - 初始化
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"common";
    PACommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[PACommonTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 设置标题的字体
        self.textLabel.font = [UIFont boldSystemFontOfSize:15];
        self.detailTextLabel.font = [UIFont systemFontOfSize:12];
        // 去除背景色
        self.backgroundColor = [UIColor clearColor];
        
        // 设置背景View
        self.backgroundView = [[UIImageView alloc] init];
        self.selectedBackgroundView = [[UIImageView alloc] init];
    }
    return self;
}

#pragma mark - 调整子控件的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 调整子标题的x
    self.detailTextLabel.x = CGRectGetMaxX(self.textLabel.frame) + 10;
}


#pragma mark - setter
- (void)setItem:(PACommonItem *)item
{
    _item = item;
    
    // 设置基本数据
    if (item.icon) {
        self.imageView.image = [UIImage imageNamed:item.icon];
    }
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subtitle;
    self.isDone = item.isDone;
    if (self.isDone) {
        self.textLabel.textColor = [UIColor grayColor];
    }
    //设置右侧内容
    if ([item isKindOfClass:[PACommonLabelItem class]]) {
        PACommonLabelItem *labelItem = (PACommonLabelItem *)item;
        self.rightLabel.text = labelItem.text;
        //        @{NSFontAttributeName : [_label font]}
        NSDictionary *dict = @{NSFontAttributeName: self.rightLabel.font};
        self.rightLabel.size = [labelItem.text sizeWithAttributes:dict];
        self.accessoryView = self.rightLabel;
    } else {// 取消右侧内容
        self.accessoryView = nil;
    }
    
}


- (void)setIndexPath:(NSIndexPath *)indexPath rowsInSection:(NSUInteger)rows
{
    //取出背景View
    UIImageView *backgroundImage = (UIImageView *)self.backgroundView;
    UIImageView *selectedBackgroundImage = (UIImageView *)self.selectedBackgroundView;
    
    //设置背景图片
    if (rows == 1) {
        backgroundImage.image = [UIImage resizedImage:@"common_card_background"];
        selectedBackgroundImage.image = [UIImage resizedImage:@"common_card_background_highlighted"];
    } else if (indexPath.row == 0) { // 首行
        backgroundImage.image = [UIImage resizedImage:@"common_card_top_background"];
        selectedBackgroundImage.image = [UIImage resizedImage:@"common_card_top_background_highlighted"];
    } else if (indexPath.row == rows - 1) { // 末行
        backgroundImage.image = [UIImage resizedImage:@"common_card_bottom_background"];
        selectedBackgroundImage.image = [UIImage resizedImage:@"common_card_bottom_background_highlighted"];
    } else { // 中间
        backgroundImage.image = [UIImage resizedImage:@"common_card_middle_background"];
        selectedBackgroundImage.image = [UIImage resizedImage:@"common_card_middle_background_highlighted"];
    }
    
    
}


@end
