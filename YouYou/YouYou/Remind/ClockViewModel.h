//
//  ClockViewModel.h
//  Alarm_Clock_UserNotifications
//
//  Created by 欧阳荣 on 2017/5/23.
//  Copyright © 2017年 欧阳荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ClockModel;

NS_ASSUME_NONNULL_BEGIN

@interface ClockViewModel : NSObject <NSCoding>

@property(nonatomic, strong)NSMutableArray<ClockModel *>*clockData;

- (void)saveData;
+ (instancetype)readData;

//添加模型
- (void)addClockModel:(ClockModel *)model;
//替换模型
- (void)replaceModelAtIndex:(NSUInteger)index withModel:(ClockModel *)model;
//删除模型
- (void)removeClockModel:(ClockModel *)model;
- (void)removeClockAtIndex:(NSInteger)index;

//开关改变
- (void)changeClockSwitchIsOn:(BOOL)isOn WithModel:(ClockModel *)model;

//收到通知
- (void)reciveNotificationWithIdentifer:(NSString *)identifer;
@end

NS_ASSUME_NONNULL_END
