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
#import "Album.h"
#import "DetailsModel.h"
#import "Track.h"

@implementation DataManager

-(void)getDetails:(Album *)model call:(NSObjectCallBack)call{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
    
    NSDictionary *params = @{@"albumId":model.albumId,@"title":model.title,@"isAsc":@(1),@"device":@"ios"};
    
    NSString *str = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/others/ca/album/track/%@/true/1/200", model.albumId];
    
    [manager GET:str parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = responseObject;
        
        DetailsModel *model = [[DetailsModel alloc]init];
        model.album = [Album mj_objectWithKeyValues:dic[@"album"]];
        model.trackList = [Track mj_objectArrayWithKeyValuesArray:dic[@"tracks"][@"list"]];
        call(model);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        call(nil);
    }];
}

-(void)getCategoryrRecommendsList:(NSDictionary * )pamer call:(NSArrayCallBack)call{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    NSMutableDictionary * parameters = [[NSMutableDictionary alloc] initWithDictionary:pamer];
    
    NSString *str = [NSString stringWithFormat:@"%@%@", HOST, CATEGORYRECOMMENDS];
    
    [manager GET:str parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dic = responseObject;
        
        YYData *data = [YYData shareInstance];
        
        data.tagsList = [Tag mj_objectArrayWithKeyValuesArray:dic[@"tags"][@"list"]];
        
        data.categoryContentsList = [CategoryContent mj_objectArrayWithKeyValuesArray:dic[@"categoryContents"][@"list"]];
        
        [self getRankingListAlbumCall:^(NSObject *object) {
            call(nil);
        }];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        call(nil);
    }];
}

-(void)getRankingListAlbumCall:(NSObjectCallBack)call{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
  
    NSString *str = [NSString stringWithFormat:@"%@%@", HOST, RANKINGLIST];
    
    [manager GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dic = responseObject;
        YYData *data = [YYData shareInstance];
        CategoryContent *mode =  [data.categoryContentsList firstObject];
        
        NSArray *list = [Album mj_objectArrayWithKeyValuesArray:dic[@"list"]];
        mode.list = list;
        
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
