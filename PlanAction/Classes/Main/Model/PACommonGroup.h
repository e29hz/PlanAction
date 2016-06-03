//
//  PACommonGroup.h
//  PlanAction
//
//  Created by 鄂鸿桢 on 16/3/30.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PACommonGroup : NSObject
/**
 *  组头
 */
@property (nonatomic, copy) NSString *header;
/**
 *  组尾
 */
@property (nonatomic, copy) NSString *footer;
/**
 *  行模型
 */
@property (nonatomic, strong) NSArray *items;



+ (instancetype)group;
@end
