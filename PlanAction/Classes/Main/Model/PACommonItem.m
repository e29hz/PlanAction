//
//  PACommonItem.m
//  PlanAction
//
//  Created by 鄂鸿桢 on 16/3/30.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import "PACommonItem.h"

@implementation PACommonItem
+ (instancetype)itemWithTitleAndImage:(NSString *)title icon:(NSString *)icon
{
    PACommonItem *item = [[self alloc] init];
    item.title = title;
    item.icon = icon;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title
{
    PACommonItem *item = [[self alloc] init];
    item.title = title;
    return item;
}
@end
