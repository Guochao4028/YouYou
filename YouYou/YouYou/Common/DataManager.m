//
//  DataManager.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/16.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+(DataManager*) shareInstance{
    static DataManager * dataManager;
    if (!dataManager) {
        dataManager = [[super allocWithZone:NULL] init];
        AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            // 当网络状态改变时调用
            switch (status) {
                case AFNetworkReachabilityStatusNotReachable:{
                    [[NSNotificationCenter defaultCenter]postNotificationName:NOTHASNETWORKING object:nil];
                }
                    break;
                default:{
                }
                    break;
            }
        }];
        //开始监控
        [manager startMonitoring];
    }
    return dataManager;
};

+(id) allocWithZone:(struct _NSZone *)zone{
    return [DataManager shareInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone{
    return [DataManager shareInstance];
}

@end
