//
//  DataManager.h
//  YouYou
//
//  Created by AYLiOS on 2019/1/16.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Album;

NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject

+(DataManager*) shareInstance;


-(void)getCategoryrRecommendsList:(NSDictionary * )pamer call:(NSArrayCallBack)call;

-(void)getDetails:(Album *)model call:(NSObjectCallBack)call;

-(void)getCateforyAlbum:(NSDictionary * )pamer call:(NSArrayCallBack)call;

@end

NS_ASSUME_NONNULL_END
