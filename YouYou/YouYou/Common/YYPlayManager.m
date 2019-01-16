//
//  YYPlayManager.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/16.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "YYPlayManager.h"


static YYPlayManager *_instance = nil;

@interface YYPlayManager ()

@property (nonatomic, strong) AVPlayer *player;

@end

@implementation YYPlayManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

- (instancetype)init{
    
    self = [super init];
    
    if (self != nil) {
        // 支持后台播放
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        // 激活
        [[AVAudioSession sharedInstance] setActive:YES error:nil];
        // 开始监控
        [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    }
    
    return self;
}

@end
