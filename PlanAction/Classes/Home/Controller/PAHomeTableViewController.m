//
//  PAHomeTableViewController.m
//  PlanAction
//
//  Created by 鄂鸿桢 on 16/3/29.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import "PAHomeTableViewController.h"
#import "PABottomPlanView.h"
#import "PATableView.h"
#import "PACommonGroup.h"
#import "PACommonItem.h"
#import "PACommonLabelItem.h"
#import "PASearchViewController.h"
#import "PANavigationController.h"
#import "PACalendarViewController.h"

#define PAfirstView [[UIApplication sharedApplication].windows firstObject]

@interface PAHomeTableViewController() <UITextFieldDelegate>

@property (nonatomic, strong) PABottomPlanView *bottomPlanView;
@property (nonatomic, assign) BOOL isDone;

@end

@implementation PAHomeTableViewController

- (void)viewDidLoad
{
    self.tableView = [[PATableView alloc] init];
    
    [self setupNavBar];
    
    [self setupBottomPlanView];
    
//    [self setupTableViewFrame];
    // 初始化模型数据
    [self setupGroups];
    
    // 键盘即将弹出, 就会发出UIKeyboardWillShowNotification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    // 键盘即将隐藏, 就会发出UIKeyboardWillHideNotification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 键盘处理
/**
 *  键盘即将隐藏
 */
- (void)keyboardWillHide:(NSNotification *)note
{
    // 1.键盘弹出需要的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 2.动画
    [UIView animateWithDuration:duration animations:^{
        self.bottomPlanView.transform = CGAffineTransformIdentity;
    }];
}
- (void)keyboardWillShow:(NSNotification *)note
{
    // 1.键盘弹出需要的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 2.动画
    [UIView animateWithDuration:duration animations:^{
        // 取出键盘高度
        CGRect keyboardF = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGFloat keyboardH = keyboardF.size.height;
        self.bottomPlanView.transform = CGAffineTransformMakeTranslation(0, - keyboardH);
    }];
}

#pragma mark - 初始化控件
/**
 *  设置导航栏内容
 */
- (void)setupNavBar
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont fontWithName:PAWenyueFont size:20];
    titleLabel.frame = CGRectMake(0, 0, 50, 35);
    titleLabel.text = @"计·行";
    self.navigationItem.titleView = (UIView *)titleLabel;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"日历" style:UIBarButtonItemStyleDone target:self action:@selector(popCalendar)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"历史" style:UIBarButtonItemStyleDone target:self action:@selector(popSearch)];
}

/**
 *  添加底部输入框
 */
- (void)setupBottomPlanView
{
    PABottomPlanView *bottomPlanView = [[PABottomPlanView alloc] init];
    bottomPlanView.textField.delegate = self;
    [PAfirstView addSubview:bottomPlanView];
    self.bottomPlanView = bottomPlanView;
    self.bottomPlanView.x = 0;
    self.bottomPlanView.y = PAScreenH - bottomPlanView.height;
    self.bottomPlanView.backgroundColor = PAColor(203, 203, 203, 0.5);
}

#pragma mark - 设置数据
/**
 *  初始化模型数据
 */
- (void)setupGroups
{
    [self setupPlanGroup];
    [self setupActionGroup];
}

- (void)setupPlanGroup
{
    // 1.创建组
    PACommonGroup *group = [PACommonGroup group];
    [self.groups addObject:group];
    group.header = @"计";
    // 2.设置组的所有行数据
    PACommonLabelItem *planItem1 = [PACommonLabelItem itemWithTitle:@"撩妹"];
    planItem1.text = @"明天";
    PACommonLabelItem *planItem2 = [PACommonLabelItem itemWithTitle:@"看面试题"];
    planItem2.text = @"四月一日";
    PACommonLabelItem *planItem3 = [PACommonLabelItem itemWithTitle:@"看技术博客"];
    

    
    group.items = @[planItem1, planItem2, planItem3];
}

- (void)setupActionGroup
{
    // 1.创建组
    PACommonGroup *group = [PACommonGroup group];
    [self.groups addObject:group];
    group.header = @"行";
    // 2.设置组的所有行数据
    PACommonLabelItem *planItem1 = [PACommonLabelItem itemWithTitle:@"看开源项目"];
    planItem1.text = @"三月二十八日";
    planItem1.isDone = YES;
    PACommonLabelItem *planItem2 = [PACommonLabelItem itemWithTitle:@"做总结"];
    planItem2.isDone = YES;
    PACommonLabelItem *planItem3 = [PACommonLabelItem itemWithTitle:@"打篮球"];
    planItem3.isDone = YES;
    group.items = @[planItem1, planItem2, planItem3];
}

#pragma mark - override view method

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [PAfirstView endEditing:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.bottomPlanView setHidden:NO];
}

#pragma mark - 私有方法
- (void)popCalendar
{
    [self.bottomPlanView setHidden:YES];
    PACalendarViewController *calendarViewController = [[PACalendarViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:calendarViewController];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)popSearch
{
    [self.bottomPlanView setHidden:YES];
    PASearchViewController *searchViewController = [[PASearchViewController alloc] init];
    
    [self.navigationController pushViewController:searchViewController animated:YES];
}


@end

