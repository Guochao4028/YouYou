//
//  Album.h
//  YouYou
//
//  Created by AYLiOS on 2019/1/17.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface Album : NSObject

@property(nonatomic, strong)NSString *albumId;
@property(nonatomic, strong)NSString *uid;
@property(nonatomic, strong)NSString *intro;
@property(nonatomic, strong)NSString *nickname;
@property(nonatomic, strong)NSString *albumCoverUrl290;
@property(nonatomic, strong)NSString *coverSmall;
@property(nonatomic, strong)NSString *coverMiddle;
@property(nonatomic, strong)NSString *coverLarge;
@property(nonatomic, strong)NSString *title;
@property(nonatomic, strong)NSString *tags;
@property(nonatomic, strong)NSString *tracks;
@property(nonatomic, strong)NSString *playsCounts;
@property(nonatomic, strong)NSString *isFinished;
@property(nonatomic, strong)NSString *serialState;
@property(nonatomic, strong)NSString *trackId;
@property(nonatomic, strong)NSString *trackTitle;
@property(nonatomic, strong)NSString *provider;
@property(nonatomic, strong)NSString *isPaid;
@property(nonatomic, strong)NSString *commentsCount;
@property(nonatomic, strong)NSString *priceTypeId;
@property(nonatomic, strong)NSString *refundSupportType;
@property(nonatomic, strong)NSString *isVipFree;
@property(nonatomic, strong)NSString *isDraft;
@property(nonatomic, strong)NSString *customSubTitle;

@end

NS_ASSUME_NONNULL_END
