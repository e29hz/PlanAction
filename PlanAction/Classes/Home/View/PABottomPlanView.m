//
//  PABottomPlanView.m
//  PlanAction
//
//  Created by 鄂鸿桢 on 16/3/29.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import "PABottomPlanView.h"

@interface PABottomPlanView()

@property (nonatomic, strong) UIButton *dateButton;
@property (nonatomic, strong) UIButton *sendButton;

@end

@implementation PABottomPlanView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.width = PAScreenW;
        self.height = 49;
        UIButton *dateButton = [[UIButton alloc] init];
        UITextField *textField = [[UITextField alloc] init];
        textField.backgroundColor = PAColor(247, 247, 247, 0.7);
        textField.font = [UIFont fontWithName:PAWenyueFont size:16];
        UIButton *sendButton = [[UIButton alloc] init];
        [dateButton setImage:[UIImage imageNamed:@"home_screen_today"] forState:UIControlStateNormal];
        [sendButton setImage:[UIImage imageNamed:@"home_screen_add_task"] forState:UIControlStateNormal];
        [self addSubview:dateButton];
        [self addSubview:textField];
        [self addSubview:sendButton];
        self.dateButton = dateButton;
        self.textField = textField;
        self.sendButton = sendButton;
    }
    return self;
}

- (void)layoutSubviews
{
    CGFloat Y = 3;
    CGFloat H = 43;
    CGFloat buttonW = H;
    CGFloat margin = Y;
    CGFloat dateButtonX = 3 ;
    CGFloat textFieldX = dateButtonX + buttonW + margin;
    CGFloat sendButtonX = self.width - margin - buttonW;
    CGFloat textFieldW = self.width - textFieldX - (margin * 2) - buttonW;
    self.dateButton.frame = CGRectMake(dateButtonX, Y, buttonW, buttonW);
    self.textField.frame = CGRectMake(textFieldX, Y + 4, textFieldW, buttonW - 8);
    self.sendButton.frame = CGRectMake(sendButtonX, Y, buttonW, buttonW);
//    self.dateButton.backgroundColor = PARandomColor;
//    self.textField.backgroundColor = PARandomColor;
//    self.sendButton.backgroundColor = PARandomColor;
    
}

@end
