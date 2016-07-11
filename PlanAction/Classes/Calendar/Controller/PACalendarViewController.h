//
//  PACalendarViewController.h
//  PlanAction
//
//  Created by 鄂鸿桢 on 16/4/1.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSCalendar.h"

@interface PACalendarViewController : UIViewController<FSCalendarDataSource, FSCalendarDelegate>

@property (nonatomic, weak) FSCalendar *calendar;

@end
