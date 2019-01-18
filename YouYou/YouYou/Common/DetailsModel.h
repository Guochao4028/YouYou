//
//  DetailsModel.h
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Album, Track;

NS_ASSUME_NONNULL_BEGIN

@interface DetailsModel : NSObject

@property(nonatomic, strong)Album *album;
@property(nonatomic, strong)NSArray <Track *>* trackList;

@end

NS_ASSUME_NONNULL_END
