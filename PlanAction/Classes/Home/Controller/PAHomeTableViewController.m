//
//  PAHomeTableViewController.m
//  PlanAction
//
//  Created by 鄂鸿桢 on 16/3/29.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import "PAHomeTableViewController.h"
#import "PABottomPlanView.h"


@interface PAHomeTableViewController ()

@property (nonatomic, strong) PABottomPlanView *bottomPlanView;


@end

@implementation PAHomeTableViewController

- (void)viewDidLoad
{
    [self setupNavBar];
    
    [self setupBottomPlanView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardWillChangeFrame:(NSNotification *)note
{
    // 工具条平移的距离 == 屏幕高度 - 键盘最终的Y值
    self.bottomPlanView.y = PAScreenH - [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
    
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        CGRect keyboardF = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGFloat keyboardH = keyboardF.size.height;
        self.bottomPlanView.transform = CGAffineTransformMakeTranslation(0,PAScreenH - keyboardH);
    }];
}
/**
 *  设置导航栏内容
 */
- (void)setupNavBar
{
    self.navigationItem.title = @"计∙行";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"日历" style:UIBarButtonItemStyleDone target:self action:@selector(popCalendar)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"搜索" style:UIBarButtonItemStyleDone target:self action:@selector(popSearch)];
}

- (void)popCalendar
{
    PALog(@"点什么点");
}

- (void)popSearch
{
    PALog(@"点什么点");
}
/**
 *  添加底部输入框
 */
- (void)setupBottomPlanView
{
    PABottomPlanView *bottomPlanView = [[PABottomPlanView alloc] init];
    bottomPlanView.x = 0;
    bottomPlanView.y = PAScreenH - bottomPlanView.height;
    bottomPlanView.backgroundColor = PARandomColor;
    [[[UIApplication sharedApplication].windows lastObject] addSubview:bottomPlanView];
    self.bottomPlanView = bottomPlanView;
}

#pragma mark - override view method
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end

