//
//  PAHistoryViewController.m
//  PlanAction
//
//  Created by 鄂鸿桢 on 16/6/7.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import "PAHistoryViewController.h"

@interface PAHistoryViewController ()

@end

@implementation PAHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFontFamily:PAWenyueFont forView:self.view andSubViews:YES];
    
    [self setupNavBar];
    self.view.backgroundColor = PAColor(247, 247, 247, 1);
    
    //    UISearchBar *searchBar = [[UISearchBar alloc] init];
    //    searchBar.frame = CGRectMake(0, 64, self.view.width, 44);
    //
    //    [self.view addSubview:searchBar];
    
}

/**
 *  设置导航栏内容
 */
- (void)setupNavBar
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont fontWithName:PAWenyueFont size:20];
    titleLabel.frame = CGRectMake(0, 0, 50, 35);
    titleLabel.text = @"历史";
    self.navigationItem.titleView = (UIView *)titleLabel;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"后退" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
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
