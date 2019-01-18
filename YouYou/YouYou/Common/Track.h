//
//  Track.h
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Track : NSObject

@property(nonatomic, strong)NSString * trackId;
@property(nonatomic, strong)NSString * uid;
@property(nonatomic, strong)NSString * playUrl64;
@property(nonatomic, strong)NSString * playUrl32;
@property(nonatomic, strong)NSString * playPathHq;
@property(nonatomic, strong)NSString * playPathAacv164;
@property(nonatomic, strong)NSString * playPathAacv224;
@property(nonatomic, strong)NSString * title;
@property(nonatomic, strong)NSString * duration;
@property(nonatomic, strong)NSString * albumId;
@property(nonatomic, strong)NSString * isPaid;
@property(nonatomic, strong)NSString * isVideo;
@property(nonatomic, strong)NSString * isDraft;
@property(nonatomic, strong)NSString * isRichAudio;
@property(nonatomic, strong)NSString * type;
@property(nonatomic, strong)NSString * relatedId;
@property(nonatomic, strong)NSString * isHoldCopyright;
@property(nonatomic, strong)NSString * processState;
@property(nonatomic, strong)NSString * createdAt;
@property(nonatomic, strong)NSString * coverSmall;
@property(nonatomic, strong)NSString * coverMiddle;
@property(nonatomic, strong)NSString * coverLarge;
@property(nonatomic, strong)NSString * nickname;
@property(nonatomic, strong)NSString * smallLogo;
@property(nonatomic, strong)NSString * userSource;
@property(nonatomic, strong)NSString * opType;
@property(nonatomic, strong)NSString * isPublic;
@property(nonatomic, strong)NSString * likes;
@property(nonatomic, strong)NSString * playtimes;
@property(nonatomic, strong)NSString * comments;
@property(nonatomic, strong)NSString * shares;
@property(nonatomic, strong)NSString * status;

@end

NS_ASSUME_NONNULL_END
