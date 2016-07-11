//
//  PACalendarViewController.m
//  PlanAction
//
//  Created by 鄂鸿桢 on 16/4/1.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import "PACalendarViewController.h"

@interface PACalendarViewController ()

@end

@implementation PACalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFontFamily:PAWenyueFont forView:self.view andSubViews:YES];
    
    [self setupNavBar];
    self.view.backgroundColor = PAColor(247, 247, 247, 1);
    
}

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.view = view;
    
    FSCalendar *calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 64, view.frame.size.width, 300)];
    calendar.dataSource = self;
    calendar.delegate = self;
    calendar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:calendar];
    self.calendar = calendar;
}

/**
 *  设置导航栏内容
 */
- (void)setupNavBar
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont fontWithName:PAWenyueFont size:20];
    titleLabel.frame = CGRectMake(0, 0, 50, 35);
    titleLabel.text = @"日历";
    self.navigationItem.titleView = (UIView *)titleLabel;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"后退" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem.tintColor = PAColor(210, 0, 13, 1);
}

- (void)back
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)setFontFamily:(NSString*)fontFamily forView:(UIView*)view andSubViews:(BOOL)isSubViews
{
    if ([view isKindOfClass:[UILabel class]])
    {
        UILabel *lbl = (UILabel *)view;
        [lbl setFont:[UIFont fontWithName:fontFamily size:[[lbl font] pointSize]]];
    }
    if (isSubViews)
    {
        for (UIView *sview in view.subviews)
        {
            [self setFontFamily:fontFamily forView:sview andSubViews:YES];
        }
    }
}



@end
