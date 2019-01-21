//
//  ClockModel.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/19.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "ClockModel.h"
#import "UNNotificationsManager.h"
#import "YYCache.h"
#import "NSObject+YYModel.h"

@implementation ClockModel

#pragma mark -- private
- (void)setDateForTimeClock {
    NSDateFormatter *format = [self getFormatter];
    NSString *dateString = [format stringFromDate:_date];
    
    if ([dateString containsString:@"上午"] || [dateString containsString:@"下午"]) {
        _timeText = [dateString substringToIndex:2];
        _timeClock = [dateString substringFromIndex:2];
    } else {
        _timeClock = dateString;
        _timeText = @"";
    }
    
    
    
}

- (NSDateFormatter *)getFormatter {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"ah:mm";
    format.AMSymbol = @"上午";
    format.PMSymbol = @"下午";
    return format;
}

- (void)addUserNotification {
    
    if ([self.repeatStr isEqualToString:@"每天"]) {
        [UNNotificationsManager addNotificationWithContent:[UNNotificationsManager contentWithTitle:@"时钟" subTitle:nil body:nil sound:[UNNotificationSound soundNamed:self.music]] dateComponents:[UNNotificationsManager componentsEveryDayWithDate:self.date] identifer:self.identifer isRepeat:self.repeats completionHanler:^(NSError *error) {
            NSLog(@"add error %@", error);
        }];
    }else if (self.repeatStrs.count == 0) {
        [UNNotificationsManager addNotificationWithContent:[UNNotificationsManager contentWithTitle:@"时钟" subTitle:nil body:nil sound:[UNNotificationSound soundNamed:self.music]] dateComponents:[UNNotificationsManager componentsWithDate:self.date] identifer:self.identifer isRepeat:self.repeats completionHanler:^(NSError *error) {
            NSLog(@"add error %@", error);
        }];
    }else {
        [self.repeatStrs enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSInteger week = 0;
            if ([obj containsString:@"周日"]) {
                week = 1;
            }else if([obj containsString:@"周一"]){
                week = 2;
            }else if([obj containsString:@"周二"]){
                week = 3;
            }else if([obj containsString:@"周三"]){
                week = 4;
            }else if([obj containsString:@"周四"]){
                week = 5;
            }else if([obj containsString:@"周五"]){
                week = 6;
            }else if([obj containsString:@"周六"]){
                week = 7;
            }
            [UNNotificationsManager addNotificationWithContent:[UNNotificationsManager contentWithTitle:@"闹钟" subTitle:nil body:nil sound:[UNNotificationSound soundNamed:self.music]] weekDay:week date:self.date identifer:self.identifers[idx] isRepeat:YES completionHanler:^(NSError *error) {
                NSLog(@"add error %@", error);
            }];
        }];
    }
    
    
}

- (void)removeUserNotification {
    [UNNotificationsManager removeNotificationWithIdentifer:self.identifer];
    if (self.identifers.count > 0) {
        [UNNotificationsManager removeNotificationWithIdentifers:self.identifers];
    }
}

#pragma mark -- setter && getter
- (void)setDate:(NSDate *)date {
    _date = date;
    [self setDateForTimeClock];
}

//- (NSDate *)date {
//    if (!_date) {
//        NSDateFormatter *format = [self getFormatter];
//        NSString *dateStr = [NSString stringWithFormat:@"%@%@",_timeText, _timeClock];
//        _date = [format dateFromString:dateStr];
//    }
//    return _date;
//}

- (NSString *)identifer {
    if (!_identifer) {
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        format.dateFormat = @"yyyyMMddhhmmss";
        
        NSString *identifer = [format stringFromDate:[NSDate date]];
        _identifer = self.isLater ? [NSString stringWithFormat:@"isLater%@",identifer] : identifer;
    }
    return _identifer;
}

- (void)setRepeatStrs:(NSArray *)repeatStrs {
    
    _repeatStrs = repeatStrs;
    NSMutableArray *idenArray = [NSMutableArray array];
    NSMutableArray *repeatArray = [NSMutableArray array];//去掉“每“字
    [repeatStrs enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [idenArray addObject:[self.identifer stringByAppendingString:obj]];
        [repeatArray addObject:[obj substringFromIndex:1]];
    }];
    _identifers = [idenArray copy];
    
    if (_repeatStrs.count > 0) {
        NSString *str = [repeatArray componentsJoinedByString:@""];
        _repeatStr = str;
        if (str.length == 14) {
            _repeatStr = @"每天";
        }else if ([str containsString:@"周日"] && [str containsString:@"周六"] && str.length == 4) {
            _repeatStr = @"周末";
        }else if (![str containsString:@"周日"] && ![str containsString:@"周六"] && str.length == 10) {
            _repeatStr = @"工作日";
        }
        
    }else {
        _repeatStr = @"永不";
    }
    
}

- (BOOL)repeats {
    if (self.repeatStrs.count <= 0) {
        return NO;
    }else {
        return YES;
    }
}

#pragma mark -- yymodel
- (void)encodeWithCoder:(NSCoder *)aCoder { [self yy_modelEncodeWithCoder:aCoder]; }
- (id)initWithCoder:(NSCoder *)aDecoder { self = [super init]; return [self yy_modelInitWithCoder:aDecoder]; }
- (id)copyWithZone:(NSZone *)zone { return [self yy_modelCopy]; }


@end
