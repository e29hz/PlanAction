//
//  PACommonItem.h
//  PlanAction
//
//  Created by 鄂鸿桢 on 16/3/30.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PACommonItem : NSObject
/**
 *  图标
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  子标题
 */
@property (nonatomic, copy) NSString *subtitle;

/**
 *  是否完成
 */
@property (nonatomic, assign) BOOL isDone;
/**
 *  点击的cell,需要跳转到哪个控制器
 */
@property (nonatomic, assign) Class destVcClass;
/**
 *  封装点击这行cell想做的事情
 */
// block 只能用 copy
@property (nonatomic, copy) void (^operation)();


+ (instancetype)itemWithTitleAndImage:(NSString *)title icon:(NSString *)icon;
+ (instancetype)itemWithTitle:(NSString *)title;

@end
