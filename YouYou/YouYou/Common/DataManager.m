//
//  DataManager.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/16.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "DataManager.h"
#import "Tag.h"
#import "CategoryContent.h"

@implementation DataManager


-(void)getCategoryrRecommendsList:(NSDictionary * )pamer call:(NSArrayCallBack)call{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    NSMutableDictionary * parameters = [[NSMutableDictionary alloc] initWithDictionary:pamer];
    
    NSString *str = [NSString stringWithFormat:@"%@%@", HOST, CATEGORYRECOMMENDS];
    
    [manager GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dic = responseObject;
        
        YYData *data = [YYData shareInstance];
        
        data.tagsList = [Tag mj_objectArrayWithKeyValuesArray:dic[@"tags"][@"list"]];
        
        data.categoryContentsList = [CategoryContent mj_objectArrayWithKeyValuesArray:dic[@"categoryContents"][@"list"]];
        
        call(nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        call(nil);
    }];
}

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



@end
