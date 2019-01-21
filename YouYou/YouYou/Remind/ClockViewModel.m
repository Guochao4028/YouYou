//
//  ClockViewModel.m
//  Alarm_Clock_UserNotifications
//
//  Created by 欧阳荣 on 2017/5/23.
//  Copyright © 2017年 欧阳荣. All rights reserved.
//

#import "ClockViewModel.h"
#import "YYCache.h"
#import "NSObject+YYModel.h"
#import "UNNotificationsManager.h"
#import "ClockModel.h"

@implementation ClockViewModel



- (void)saveData {
    YYCache *cache = [[YYCache alloc] initWithName:@"cache"];
    [cache setObject:self.clockData forKey:[ClockViewModel keyForSaveClockData]];
}

- (void)addClockModel:(ClockModel *)model {
    [self.clockData addObject:model];
    [self saveData];
    [model addUserNotification];
}

- (void)replaceModelAtIndex:(NSUInteger)index withModel:(ClockModel *)model {
    [self.clockData[index] removeUserNotification];
    [self.clockData replaceObjectAtIndex:index withObject:model];
    [self saveData];
//    model.identifer = nil;
    [model addUserNotification];
}

- (void)removeClockModel:(ClockModel *)model {
    [model removeUserNotification];
    [self.clockData removeObject:model];
    [self saveData];
}

- (void)removeClockAtIndex:(NSInteger)index {
    [self removeClockModel:self.clockData[index]];
}

- (void)changeClockSwitchIsOn:(BOOL)isOn WithModel:(ClockModel *)model {
    model.isOn = isOn;
    isOn ? [model addUserNotification] : [model removeUserNotification];
    [self saveData];
}

- (void)reciveNotificationWithIdentifer:(NSString *)identifer {
    [self.clockData enumerateObjectsUsingBlock:^(ClockModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (([identifer hasPrefix:obj.identifer] || [obj.identifer isEqualToString:identifer]) && obj.repeatStr.length == 0) {
            [self changeClockSwitchIsOn:NO WithModel:obj];
        }
        
    }];
}

+ (instancetype)readData {
    YYCache *cache = [[YYCache alloc] initWithName:@"cache"];
    NSArray *datas = [cache objectForKey:[self keyForSaveClockData]];
    
    ClockViewModel *viewModel = [ClockViewModel new];
    
    if (datas.count > 0) {
        viewModel.clockData = datas.mutableCopy;
    }else {
        viewModel.clockData = [NSMutableArray array];
    }
    
    
    
    [UNNotificationsManager getDeliveredNotificationIdentiferBlock:^(NSArray<NSString *> *identifers) {
        [identifers enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [viewModel reciveNotificationWithIdentifer:obj];
        }];
    }];
    
    return viewModel;
}

+ (void)removeClockWithModel:(ClockModel *)model {
    [UNNotificationsManager removeNotificationWithIdentifer:model.identifer];
}

+ (NSString *)keyForSaveClockData {
    return @"SaveClovkDataKey";
}


#pragma mark -- yymodel
- (void)encodeWithCoder:(NSCoder *)aCoder { [self yy_modelEncodeWithCoder:aCoder]; }
- (id)initWithCoder:(NSCoder *)aDecoder { self = [super init]; return [self yy_modelInitWithCoder:aDecoder]; }
- (id)copyWithZone:(NSZone *)zone { return [self yy_modelCopy]; }

@end

