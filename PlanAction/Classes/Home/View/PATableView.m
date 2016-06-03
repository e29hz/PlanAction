//
//  PATableView.m
//  PlanAction
//
//  Created by 鄂鸿桢 on 16/3/30.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import "PATableView.h"

#define PAfirstView [[UIApplication sharedApplication].windows firstObject]


@implementation PATableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = PARandomColor;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = PAColor(247, 247, 247, 1);
//        self.sectionFooterHeight = PACellMargin;
//        self.sectionHeaderHeight = 0;
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [PAfirstView endEditing:YES];
}

@end
